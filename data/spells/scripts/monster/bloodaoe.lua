local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_DRAWBLOOD)
combat:setArea(createCombatArea(AREA_SQUARE1X1))


function onTargetCreature(creature, target)
	creature:addDamageCondition(target, CONDITION_POISON, DAMAGELIST_VARYING_PERIOD, 25, {5, 7}, 3)
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end