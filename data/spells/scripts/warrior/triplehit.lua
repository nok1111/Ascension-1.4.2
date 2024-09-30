local combat = Combat()
local time_between_hits = 0.6 --seconds
local time_between_hits2 = 1.2 --seconds

combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 172)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)

function onGetFormulaValues(player, skill, attack, factor)
	local min = (player:getLevel() / 5) + (skill * attack * 0.02) + 4
	local max = (player:getLevel() / 5) + (skill * attack * 0.04) + 9
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(creature, var)
   combat:execute(creature, var)
  addEvent(function()  combat:execute(creature, var) end, time_between_hits * 1000)
  addEvent(function()  combat:execute(creature, var) end, time_between_hits2 * 1000)
  return true
end

