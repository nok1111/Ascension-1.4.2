local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

local condition = Condition(CONDITION_HASTE)
condition:setParameter(CONDITION_PARAM_TICKS, 22000)
condition:setFormula(0.8, -70, 0.8, -70)
combat:setCondition(condition)

function onCastSpell(creature, variant)
creature:sendAddBuffNotification(85, 22, 'Strong Haste', 4, 0)
	return combat:execute(creature, variant)
end
