local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

local condition = Condition(CONDITION_HASTE, CONDITIONID_COMBAT)
condition:setParameter(CONDITION_PARAM_TICKS, 33000)
condition:setFormula(0.3, -24, 0.3, -24)
condition:setParameter(CONDITION_PARAM_SUBID, 500)
combat:addCondition(condition)


function onCastSpell(creature, variant)
local player = Player(creature)
player:sendAddBuffNotification(85, 33, 'Haste', 4, 0)
	return combat:execute(creature, variant)
	 
end
