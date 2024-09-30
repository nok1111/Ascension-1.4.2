local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 7)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_HUNTINGSPEAR)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)

function onGetFormulaValues(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1.0
	local power = (sword * attack) * 0.5
	local level = player:getLevel()

	local min = (level / 5) + (power * 0.030) + 5
	local max = (level / 5) + (power * 0.035) + 18
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


function onTargetCreature(creature, target)
local targetPos = target:getPosition()

	targetPos:sendMagicEffect(CONST_ME_MAD)
	target:addCondition(speed)
	
	return doChallengeCreature(creature, target)
end

local combat2 = Combat()
combat2:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")




function onCastSpell(creature, variant)
combat2:execute(creature, variant)
	return combat:execute(creature, variant)
end
