local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

local condition = Condition(CONDITION_FIRE)
condition:setParameter(CONDITION_PARAM_DELAYED, true)
condition:addDamage(26, 9000, -10)
combat:addCondition(condition)

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end
