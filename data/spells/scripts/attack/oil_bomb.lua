local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_BOTTLEBOMB)
combat:setArea(createCombatArea(AREA_SQUARE1X1))



function onGetFormulaValues(player, level, magicLevel)

local alchemylvl = ProfessionSystem:getSkillLevel(player, SKILL_ALCHEMY)

	local min = (level / 5) + (alchemylvl * 10) + 7
	local max = (level / 5) + (alchemylvl * 10) + 16
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end
