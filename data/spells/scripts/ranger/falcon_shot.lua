local config = {
	amount = 6
}


local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 119)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

--setarea
combat:setArea(createCombatArea(AREA_CIRCLE2X2))


local conditionSlowfalcon= Condition(CONDITION_PARALYZE)
conditionSlowfalcon:setParameter(CONDITION_PARAM_TICKS, 3000)
conditionSlowfalcon:setFormula(-0.55, 0, -0.75, 0)

combat:addCondition(conditionSlowfalcon)


function onGetFormulaValues(player, skill, attack, factor)

	local power = skill * attack 
    local level = player:getLevel()

    local min = ((level / 5) + (power * 0.0550) + attack * 1.0) * 1.0
    local max = ((level / 5) + (power * 0.0675) + attack * 1.3) * 1.1

    local focusedFire = math.max(player:getStorageValue(PassiveSkills.FocusedFire) or 0, 0)
    if focusedFire > 0 then
        min = min + (min * (focusedFire / 100))
        max = max + (max * (focusedFire / 100))
    end
    
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


local function doDamage(cid, targetPos, variant)
    local creature = Creature(cid)
    if not creature then
        return
    end
    combat:execute(creature, variant)
end

function onCastSpell(creature, variant, targetPos)
    local creatureId = creature:getId()
    local target = creature:getTarget()
    local playerPos = creature:getPosition()
    if not target then
        return
    end
    local targetPos = target:getPosition()

    
    --local positionSniperExplosion = Position(targetPos.x + 2, targetPos.y + 1, targetPos.z)
    --positionSniperExplosion:sendMagicEffect(885) 

    combat:execute(creature, variant)
    target:attachEffectById(211, true)
    creature:attachEffectById(212, true)
    --addEvent(doDamage, 320,creatureId, targetPos, variant)

    return true
end