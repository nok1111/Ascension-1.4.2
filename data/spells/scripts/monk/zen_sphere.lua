local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 6.3) + 45
	local max = (level / 5) + (magicLevel * 14.4) + 90
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local zen_sphere = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
zen_sphere:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
zen_sphere:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.zen_sphere)
zen_sphere:setParameter(CONDITION_PARAM_TICKS, 8000)

combat:addCondition(zen_sphere)

function onCastSpell(creature, variant)
	if not creature then return end
	creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	--attach effect
	creature:attachEffectById(98, true)
	return combat:execute(creature, variant)
end
