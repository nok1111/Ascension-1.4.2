local config = {
    stunDuration = 2000, -- duration in milliseconds
    effectDelay = 500, -- delay between magic effects in milliseconds
    effectId = 238, -- magic effect ID 518
	effectId2 = 518, -- magic effect ID 518
    arrowEffectId = 184, -- arrow effect ID
    damageElement = COMBAT_ENERGYDAMAGE
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, config.damageElement)
combat:setParameter(COMBAT_PARAM_EFFECT, config.effectId)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)


function onGetFormulaValues(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = magic * attack 
    local level = player:getLevel()

    local min = (level / 5) + (power * 0.10) + (attack * 4.0) + 300
    local max = (level / 5) + (power * 0.11) + (attack * 4.1) + 350
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function applyMagicEffect(position)
   
	

    position:sendMagicEffect(config.effectId2)
end

function shootArrow(cid, target)
    local creature = Creature(cid)
    if creature and creature:getTarget() then
        creature:getPosition():sendDistanceEffect(creature:getTarget():getPosition(), config.arrowEffectId)
        combat:execute(creature, Variant(creature:getTarget():getPosition()))
		creature:getTarget():getPosition():sendMagicEffect(522)
    end
end

function immobilizeTarget(cid, target)
local creature = Creature(cid)
    if target and creature then
        local position = creature:getPosition()
          position.x = creature:getPosition().x + 1
		  position.y = creature:getPosition().y + 1
		  
		  applyMagicEffect(position)
		  
        for i = 1, config.stunDuration / config.effectDelay do
            addEvent(applyMagicEffect, config.effectDelay * i, position)
        end
        addEvent(function()
            if target then
                shootArrow(cid, target)
            end
        end, config.stunDuration)
    end
end

function onCastSpell(creature, variant)
	
    if not creature then
        return false
    end
	local target = creature:getTarget()

    local stun = Condition(CONDITION_STUN)
    stun:setParameter(CONDITION_PARAM_TICKS, config.stunDuration)
    creature:addCondition(stun)
    addEvent(immobilizeTarget, 0, creature:getId(), target:getId())

    return true
end
