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




function shootArrow(cid, target, variant)
    local creature = Creature(cid)
    local target = Creature(target)
    if creature and target then

        

        local skill = creature:getSkillLevel(SKILL_DISTANCE)
        local attack = getDistanceAttack(creature:getId())
        local level = creature:getLevel()
        local power = skill * attack 

        local min = ((level / 5) + (power * 0.0550) + attack * 1.0) * 1.3
        local max = ((level / 5) + (power * 0.0675) + attack * 1.3) * 1.4
 

        local hunterMercy = creature:getStorageValue(PassiveSkills.HunterMercy) or 0
        if hunterMercy > 0 and target:getHealth() < target:getMaxHealth() * 0.5 then
           -- creature:say("Hunter's Mercy", TALKTYPE_MONSTER_SAY)
            min = min + (min * (hunterMercy / 100))
            max = max + (max * (hunterMercy / 100))
        end

        local focusedFire = math.max(creature:getStorageValue(PassiveSkills.FocusedFire) or 0, 0)
        if focusedFire > 0 then
            min = min + (min * (focusedFire / 100))
            max = max + (max * (focusedFire / 100))
        end

        combat:setFormula(COMBAT_FORMULA_SKILL, 0, min, 0, max)
        
        combat:execute(creature, variant)
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

        creature:getPosition():sendDistanceEffect(target:getPosition(), config.arrowEffectId)
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
    aimshotslow:setFormula(-1, 120, -1, 120)
    local exhaust = Condition(CONDITION_EXHAUST_COMBAT)
    exhaust:setParameter(CONDITION_PARAM_TICKS, config.stunDuration)
    creature:addCondition(exhaust)
    creature:addCondition(aimshotslow)

    creature:attachEffectById(168, true)
    target:attachEffectById(170, true)
    addEvent(shootArrow, config.stunDuration, creature:getId(), target:getId(), variant)
    addEvent(sendEffect, config.stunDuration * 0.95, creature:getId(), target:getId())
    return true
end
