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

 -- Your auto attacks now have a 50% chance to grant you Momentum, which increases your attack speed
 local momentumLevel = math.max(player:getStorageValue(PassiveSkills.Momentum) or 0, 0)
 local currentattackspeed = player:getSpecialSkill(SPECIALSKILL_ATTACKSPEED)
 if momentumLevel > 0 then
	 if math.random(100) <= 20 + momentumLevel then
			 if momentumLevel > 0 and currentattackspeed < 200 then
			 local conditionmomentum = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
			 conditionmomentum:setParameter(CONDITION_PARAM_TICKS, 6000)
			 conditionmomentum:setParameter(CONDITION_PARAM_SPECIALSKILL_ATTACKSPEED, currentattackspeed + momentumLevel)
			 conditionmomentum:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.momentum)
			 player:addCondition(conditionmomentum)
			 player:detachEffectById(210, true)
			 player:attachEffectById(210, true)
			 end
	 end
 end

 local FrostQuiverStorage = math.max(player:getStorageValue(PassiveSkills.FrostQuiver) or 0, 0)
 if FrostQuiverStorage > 0 then
	 addBuffStack(player, "FrostQuiver", 1)
	 if getBuffStack(player, "FrostQuiver") >= 4 then
	 local level = math.max(player:getStorageValue(PassiveSkills.FrostQuiver) or 0, 0)
	 local chance = level -- 5% per level
		 if math.random(100) <= chance then
			 -- Trigger the Frost Quiver effect here
			 --send distance effect from player to target
			 local playerlevel = player:getLevel()
			 local playerSkill = player:getSkillLevel(SKILL_DISTANCE)
			 local playerBonus = (playerlevel * 0.8) + (playerSkill * 1.0) + 20
			 local totalDamage = playerBonus
			 doSendDistanceShoot(player:getPosition(), target:getPosition(), 106)
			 target:attachEffectById(209, true)
			 doTargetCombatHealth(player, target, COMBAT_ICEDAMAGE, -math.floor(totalDamage), -math.floor(totalDamage), CONST_ME_NONE)
			 clearBuffStack(player, "FrostQuiver")
		 end
	 end
 end
    return true
end



