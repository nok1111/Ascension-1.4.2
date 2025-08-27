local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:setParameter(COMBAT_PARAM_EFFECT, 443)


function onGetFormulaValues(player, skill, attack, factor)
	local power = skill * attack 
    local level = player:getLevel()

    local min = ((level / 5) + (power * 0.060) + attack * 1.0) * 0.5
    local max = ((level / 5) + (power * 0.0705) + attack * 1.3) * 0.55
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")



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


    combat:execute(creature, var)
    

    return true
end



