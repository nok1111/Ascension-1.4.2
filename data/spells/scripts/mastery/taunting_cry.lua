local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 270)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

local speed = Condition(CONDITION_PARALYZE)
speed:setParameter(CONDITION_PARAM_TICKS, 5000)
speed:setFormula(-0.7, 52, -0.7, 52)

function onTargetCreature(creature, target)

local targetPos = target:getPosition()
local creaturePos = creature:getPosition()

if target:getSpeed() > 0 then
target:addCondition(speed)
end


	targetPos:sendMagicEffect(CONST_ME_MAD)
	
	return doChallengeCreature(creature, target)
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

function onCastSpell(creature, variant)

local positionnube = creature:getPosition()
		positionnube.x = creature:getPosition().x + 1
		positionnube.y = creature:getPosition().y + 1
        positionnube:sendMagicEffect(609)
		
	return combat:execute(creature, variant)
end
