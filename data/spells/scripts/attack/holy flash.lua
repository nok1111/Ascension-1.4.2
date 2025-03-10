local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLHOLY)

local condition = Condition(CONDITION_DAZZLED)
condition:setParameter(CONDITION_PARAM_DELAYED, true)
condition:addDamage(25, 7000, -10)
combat:addCondition(condition)

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end
