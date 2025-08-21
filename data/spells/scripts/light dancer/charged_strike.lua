local combat = Combat()
local combat2 = Combat()
local combat3 = Combat()

local time_between_hits2 = 1.75 --seconds
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 320)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, 371)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

combat3:setParameter(COMBAT_PARAM_EFFECT, 413)
--347



function onGetFormulaValues(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()

	local min = ((level / 5) + (power * 0.060) + attack * 1.0) * 0.7
    local max = ((level / 5) + (power * 0.0705) + attack * 1.3) * 0.7

	local jackpot = player:getStorageValue(PassiveSkills.Jackpot) or 0
	local luck = player:getStorageValue(PassiveSkills.GamblerLuck) or 0
	
	if jackpot > 0 then
		max = max + (max * (1 + (jackpot * luck) / 100))
	end
	
	return -min, -max
	
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onGetFormulaValues2(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()

	local min = ((level / 5) + (power * 0.060) + attack * 1.0) * 0.7
    local max = ((level / 5) + (power * 0.0705) + attack * 1.3) * 0.7

	local jackpot = player:getStorageValue(PassiveSkills.Jackpot) or 0
	local luck = player:getStorageValue(PassiveSkills.GamblerLuck) or 0
	
	if jackpot > 0 then
		max = max + (max * (1 + (jackpot * luck) / 100))
	end
	return -min, -max
	
end
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")



local function castSpell2(creatureId, variant, targetId)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combat2:execute(creature, variant)

end


local function castEffect(creatureId, variant, targetId)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	local target = Creature(targetId)
	if target then
		local offsetpos = target:getPosition()
        offsetpos.x = offsetpos.x + 2
        offsetpos.y = offsetpos.y + 0
		offsetpos:sendMagicEffect(347)
	end
end


local function castSpell1(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	combat:execute(creature, variant)
	combat3:execute(creature, variant)
    
end


function onCastSpell(creature, variant)

local target = creature:getTarget()
local sword = target:getPosition()
        sword.x = sword.x + 2
        sword.y = sword.y + 0
		
  
  
   -- Get Gambler's Luck bonus (default to 0 if not set)
   local luck = creature:getStorageValue(PassiveSkills.GamblerLuck) or 0

   if target:getCondition(CONDITION_ENERGY, 0, ConditionsSubIds.static_charge) then
	   -- 2 base procs + luck bonus
	   for i = 1, 2 + (luck * 2) do
		   addEvent(castSpell2, time_between_hits2 * (240 * i), creature:getId(), variant, target:getId())
	   end
	   if luck > 0 then
		   for e = 1, luck do
			   addEvent(castEffect, time_between_hits2 * (400 * e), creature:getId(), variant, target:getId())
		   end
		end
		sword:sendMagicEffect(347)
   else
       -- 1 base proc + luck bonus
	   if luck > 0 then
		   for i = 1, 1 + luck do
			   addEvent(castSpell1, time_between_hits2 * (125 + 100 * i), creature:getId(), variant)
		   end
		end 
		combat:execute(creature, variant) 
   end

   -- Optionally reset Gambler's Luck after use
   creature:setStorageValue(PassiveSkills.GamblerLuck, 0)
  
  return true
end
