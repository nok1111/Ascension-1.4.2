local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_MANASHIELD)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))


function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
	
end
