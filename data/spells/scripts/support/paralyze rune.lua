local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

local condition = Condition(CONDITION_PARALYZE, CONDITIONID_COMBAT)
condition:setParameter(CONDITION_PARAM_TICKS, 20000)
condition:setFormula(-0.9, 0, -0.9, 0)
combat:addCondition(condition)

function onCastSpell(creature, variant, isHotkey)
	if not combat:execute(creature, variant) then
		return false
	end

	creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	return true
end
