local stunDuration = 500
local stun = Condition(CONDITION_STUN)
stun:setParameter(CONDITION_PARAM_TICKS, stunDuration)

local config = {
effect = 44,
distanceEffect = 29
}


local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 419)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 31)
combat:setArea(createCombatArea(AREA_CIRCLE2X2))
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:addCondition(stun)




function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 7.2) + 130
	local max = (level / 5) + (magicLevel * 8.3) + 140
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")





function onCastSpell(creature, variant, target)
combat:execute(creature, variant)
	return true
end
