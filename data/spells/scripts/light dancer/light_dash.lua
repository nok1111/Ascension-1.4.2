local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:setParameter(COMBAT_PARAM_EFFECT, 443)

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat2:setParameter(COMBAT_PARAM_EFFECT, 443)

function onGetFormulaValues(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()

	local min = (level / 5) + (power * 0.045) + (attack * 1.5) + 50
	local max = (level / 5) + (power * 0.085) + (attack * 2.0) + 65
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onGetFormulaValues2(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()

	local min = (level / 5) + (power * 0.045) + (attack * 2.0) + 50
	local max = (level / 5) + (power * 0.085) + (attack * 2.5) + 65
	return -min, -max
end
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")


function onCastSpell(creature, var)
    local target = creature:getTarget()
    if not target then
        creature:sendCancelMessage("You need to select a target.")
        return false
    end

    local targetUid = target:getId()  -- Get the unique identifier of the target
    local targetPosition = target:getPosition()
    local direction = creature:getDirection()
	local creaturePosition = creature:getPosition()

    if direction == DIRECTION_NORTH then
        targetPosition.y = targetPosition.y - 1
    elseif direction == DIRECTION_SOUTH then
        targetPosition.y = targetPosition.y + 1
    elseif direction == DIRECTION_EAST then
        targetPosition.x = targetPosition.x + 1
    else  -- DIRECTION_WEST
        targetPosition.x = targetPosition.x - 1
    end


	creaturePosition:sendDistanceEffect(targetPosition, 104)  
    creature:teleportTo(targetPosition)
    creature:setDirection(enemyDirection)
    creaturePosition:sendMagicEffect(225)
    creaturePosition = creature:getPosition()
    creaturePosition:sendMagicEffect(463)
	
    creature:teleportTo(targetPosition, true)
    targetPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
    creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

    if target:getCondition(CONDITION_ENERGY, 0, 25965) then
        local stunDuration = 1800
        local adjustedStunDuration = target:isPlayer() and (stunDuration / 3) or stunDuration
        local stun = Condition(CONDITION_STUN)
        stun:setParameter(CONDITION_PARAM_TICKS, adjustedStunDuration)

        target:addCondition(stun)
        combat2:execute(creature, var)
        target:getPosition():sendMagicEffect(CONST_ME_STUN)
        addEvent(lightdashanimation, 0, targetUid, target:getPosition(), adjustedStunDuration)
        target:sendProgressbar(adjustedStunDuration, false)
    else
        combat:execute(creature, var)
    end

    return true
end


function lightdashanimation(targetUid, targetPos, remainingTime)
    if remainingTime > 0 then
        local target = Creature(targetUid)  -- Retrieve the target creature using its UID
        if target then  -- Check if the creature still exists
            targetPos:sendMagicEffect(CONST_ME_STUN)
            -- Schedule the next animation frame after 500 milliseconds if the target still exists
            addEvent(lightdashanimation, 500, targetUid, targetPos, remainingTime - 500)
        end
    end
end

