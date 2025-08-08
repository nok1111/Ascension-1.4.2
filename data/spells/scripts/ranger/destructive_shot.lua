local config = {
    stunDuration = 2000, -- duration in milliseconds
    effectDelay = 500, -- delay between magic effects in milliseconds
    effectId = 238, -- magic effect ID 518
	effectId2 = 518, -- magic effect ID 518
    arrowEffectId = 68, -- arrow effect ID
    damageElement = COMBAT_PHYSICALDAMAGE
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, config.damageElement)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)


function onGetFormulaValues(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = skill * attack 
    local level = player:getLevel()

    local min = (level / 5) + (power * 0.10) + (attack * 4.0) + 300
    local max = (level / 5) + (power * 0.11) + (attack * 4.1) + 350
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function shootArrow(cid, target)
    local creature = Creature(cid)
    local target = Creature(target)
    if creature and target then
        
        combat:execute(creature, Variant(target:getPosition()))
		--target:getPosition():sendMagicEffect(522)
    end
end

function sendEffect(cid, target)
    local creature = Creature(cid)
    local target = Creature(target)
    if creature and target then
        local creatureposition = target:getPosition()
        local positioneffect = creatureposition
        positioneffect.x = creatureposition.x + 2
        positioneffect.y = creatureposition.y + 1
        positioneffect:sendMagicEffect(1054)
    end
end

function onCastSpell(creature, variant)
	
    if not creature then
        return
    end

	local target = creature:getTarget()
    if not target then
        return
    end

    local aimshotslow = Condition(CONDITION_HASTE)
    aimshotslow:setParameter(CONDITION_PARAM_TICKS, config.stunDuration)
    aimshotslow:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.aimshotslow)
    aimshotslow:setFormula(-0.90, 0, -0.92, 0)
    local exhaust = Condition(CONDITION_EXHAUST_COMBAT)
    exhaust:setParameter(CONDITION_PARAM_TICKS, config.stunDuration)
    creature:addCondition(exhaust)
    creature:addCondition(aimshotslow)

    creature:attachEffectById(168, true)
    target:attachEffectById(170, true)
    addEvent(function()
        if target then
            shootArrow(creature:getId(), target:getId())
        end
    end, config.stunDuration)

    addEvent(function()
        if target then
            creature:getPosition():sendDistanceEffect(target:getPosition(), config.arrowEffectId)
            sendEffect(creature:getId(), target:getId())
        end
    end, config.stunDuration * 0.85)

    return true
end
