local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_DRAWBLOOD)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)

local condition = Condition(CONDITION_BLEEDING)
condition:setParameter(CONDITION_PARAM_DELAYED, true)
condition:addDamage(5, 2000, -3)
combat:setCondition(condition)

function onGetFormulaValues(player, skill, attack, factor, target)
	local min = (player:getLevel() / 5) + (skill * 0.3) + 2
	local max = (player:getLevel() / 5) + (skill * 0.3) + 2
	local damage = math.random(math.floor(min) * 1000, math.floor(max) * 1000) / 1000		
	
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, target)
	return combat:execute(creature, variant)
end
