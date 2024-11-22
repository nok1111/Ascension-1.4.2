local combat = Combat()
local poisondot = Combat()
local proc = Combat()
local time_between_hits = 1.0 --seconds

for i, c in ipairs({proc, poisondot}) do
    c:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
    c:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BLUESKULL)
   
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISONARROW)

combat:setFormula(COMBAT_FORMULA_SKILL, 0, 0, 1, 0)

function onGetFormulaValues(player, skill, attack, factor)
	local min = (player:getLevel() / 10) + (player:getDexterity() * 0.085) 
	local max = (player:getLevel() / 10) + (player:getDexterity() * 0.085) 
	return -min, -max
end
proc:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")





function onUseWeapon(player, variant, creature)
	if not combat:execute(player, variant) then
		return false
	end
	
	addEvent(function()  proc:execute(player, variant) end, time_between_hits * 1000)
	player:addDamageCondition(Creature(variant:getNumber()), CONDITION_POISON, DAMAGELIST_LOGARITHMIC_DAMAGE, 3)
    return true
end



