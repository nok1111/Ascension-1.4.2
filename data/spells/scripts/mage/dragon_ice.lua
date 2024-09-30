local combat = Combat()
local time_between_hits = 0.2 --seconds
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ICE)

local combat2 = Combat()
local time_between_hits2 = 0.6 --seconds

combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)


function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 1) + 5
	local max = (level / 5) + (magicLevel * 10) + 15
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onGetFormulaValues2(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 1) + 5
	local max = (level / 5) + (magicLevel * 10) + 15
	return -min, -max
end
combat2:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues2")


function onCastSpell(creature, var)
   combat:execute(creature, var)
   combat2:execute(creature, var)
   addEvent(function()  combat:execute(creature, var) end, time_between_hits * 1000)
  addEvent(function()  combat2:execute(creature, var) end, time_between_hits2 * 1000)
  return true
end
