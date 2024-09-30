local time_between_hits2 = 1.75 --seconds
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setArea(createCombatArea(AREA_CIRCLE6X6))

function onGetFormulaValues(player, skill, attack, factor)
	local min = (player:getLevel() * 2.5) +  (player:getMagicLevel() * 4.0) + 20
	local max = (player:getLevel() * 2.5) +  (player:getMagicLevel() * 4.5) + 30
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_EFFECT, 299)
combat2:setArea(createCombatArea(AREA_CIRCLE6X6))

function onCastSpell(creature, var)
combat2:execute(creature, var)
addEvent(function()  combat:execute(creature, var) end, time_between_hits2 * 1000)
	return true
end
