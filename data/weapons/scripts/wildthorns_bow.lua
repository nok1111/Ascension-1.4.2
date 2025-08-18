local time_between_hits = 0.2 --seconds
local time_between_hits2 = 0.25 --seconds

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENVENOMSHOOT)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_EARTHBITE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat2:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENVENOMSHOOT)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_EARTHBITE)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

function onGetFormulaValues(player, skill, attack, factor)
	local damage = (player:getLevel() / 5) + ((skill * attack) * 0.085)
	return -damage
end

function onGetFormulaValues2(player, skill, attack, factor)
	local damage = (player:getLevel() / 5) + ((skill * attack) * 0.085)
	return -damage
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")


local function castCombat(playerId, variant)
	local player = Player(playerId)
	if not player then
		return
	end
	
    combat2:execute(player, variant)
end



function onUseWeapon(player, variant, creature)
	if not combat:execute(player, variant) then
		return false
	end
	
	addEvent(castCombat, time_between_hits2 * 1000, player:getId(), variant)


    


	local target = player:getTarget()
	   -- Your auto attacks now have a 50% chance to grant you Momentum, which increases your attack speed
	local momentumLevel = math.max(player:getStorageValue(PassiveSkills.Momentum) or 0, 0)
	local currentattackspeed = player:getSpecialSkill(SPECIALSKILL_ATTACKSPEED)
	local stack = getBuffStack(player, "Momentum") or 1

	if momentumLevel > 0 then
		if math.random(100) <= 20 + momentumLevel then
				if momentumLevel > 0 and currentattackspeed < (100 - momentumLevel) then


				addBuffStack(player, "Momentum", 1, 6000)
				
				local conditionmomentum = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
				conditionmomentum:setParameter(CONDITION_PARAM_TICKS, 6000)
				conditionmomentum:setParameter(CONDITION_PARAM_SPECIALSKILL_ATTACKSPEED, momentumLevel * stack)
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
				
			end
			clearBuffStack(player, "FrostQuiver")
		end
	end
    return true
end



