dofile("data/aura.lua")

	
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 438)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)


function onGetFormulaValues(player, skill, attack, factor)
      -- Damage formula
local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.0045) + (attack * 1.2) + 9
	local max = (level / 5) + (power * 0.0050) + (attack * 1.3) + 18 
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")




function onCastSpell(creature, var)

local cid = creature:getId()
local storagevalue = creature:getStorageValue(aura_counter)

if storagevalue == -1 then
storagevalue = 0
end

 local target = Creature(cid):getTarget()
 local position = target:getPosition()
 local positioneffect = position
   positioneffect.x = position.x + 1
   positioneffect.y = position.y + 1
   positioneffect:sendMagicEffect(436)
   local maxHealth = creature:getMaxHealth() / 100
	
   combat:execute(creature, var)
   -- Apply initial burst heal using combat:execute
   creature:addHealth(maxHealth * 8)
   creature:getPosition():sendMagicEffect(701)

	if creature:getStorageValue(aura_counter) < 10  then
		local targetpos = target:getPosition()
		local playerpos = creature:getPosition()
			creature:setStorageValue(storage_time, os.time() + 300)
			creature:setStorageValue(aura_counter, storagevalue + 1)
			creature:sendRemoveBuffNotification(42)
			creature:sendAddBuffNotification(42, 300, 'Soul Harvester', 5, storagevalue + 1)
			creature:setStorageValue(aura_storage, 2)
			targetpos:sendDistanceEffect(playerpos, 156)
			AuraEffect(1, time_loop/8, creature.uid)
	end
		
  return true
end


