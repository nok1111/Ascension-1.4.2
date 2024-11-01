local combat = Combat()
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

local speed = Condition(CONDITION_PARALYZE)
speed:setParameter(CONDITION_PARAM_TICKS, 5000)
speed:setFormula(-0.7, 52, -0.7, 52)

function onTargetCreature(creature, target)

if target:getSpeed() > 0 then
target:addCondition(speed)
end
	if target:isMonster() then
	target:attachEffectById(20, true)
	end
	return doChallengeCreature(creature, target)
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

function onCastSpell(creature, variant)

creature:attachEffectById(21, true)
creature:attachEffectById(22, true)
		
	return combat:execute(creature, variant)
end
