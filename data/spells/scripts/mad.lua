local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 200)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:addCondition(condition)
function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end
