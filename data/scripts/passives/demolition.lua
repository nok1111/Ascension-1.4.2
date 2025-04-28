local ASPECT_MODE = 50010 -- Adjust the storage value as needed
local COOLDOWN_TIME = 1.1 -- Cooldown time in seconds (1 second)
local lastAbilityUse = {} -- Keep track of the last time the ability was used for each player
local MANA_DEDUCTION_PERCENTAGE = 3 -- Percentage of max mana to deduct

local creatures = {} -- my addition
local area = createCombatArea{
    {1, 1, 1},
    {1, 3, 1},
    {1, 1, 1}
}

local areamode = createCombatArea{
    {0, 0, 1, 0, 0},
    {0, 1, 1, 1, 0},
    {1, 1, 3, 1, 1},
    {0, 1, 1, 1, 0},
    {0, 0, 1, 0, 0}
}

local function applyDemolitionDamage(playerId, creatureId, damage)
   local creature = Creature(creatureId)
  local attacker = Player(playerId)    
  if creature and attacker then
  
  -- my addition
            if creatures[creature] and creatures[cid] == 1 then
                creatures[creature] = 0
                return true
            end
            creatures[creature] = 1
            -- my addition
  
    doTargetCombatHealth(attacker, creature, COMBAT_ENERGYDAMAGE, -damage, -damage, CONST_ME_NONE)
	
	
	
		local level = attacker:getLevel()
		local magic = attacker:getMagicLevel()
		local vit = creature:getMaxHealth() / 100
		local min = (level/5)  + (magic * 5) + 10
		local max = (level/5)  + (magic * 9) + 15
        doAreaCombatHealth(attacker, COMBAT_ENERGYDAMAGE, creature:getPosition(), area, -min, -max, CONST_ME_NONE)
	
	
	
	
    attacker:say("Demolition!", TALKTYPE_MONSTER_SAY)
	 local explo = creature:getPosition()
       explo.x = explo.x + 3
       explo.y = explo.y + 3
    explo:sendMagicEffect(631)

  end
end



function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if creature and attacker then
      if attacker:isPlayer() then
        local player = attacker:getPlayer()
		local currentMode = player:getStorageValue(ASPECT_MODE)
		local currentTime = os.time()
        if player and player:getVocation():getId() == 10 then 
		 -- my addition
		 
		 if origin == ORIGIN_MELEE or origin == ORIGIN_RANGED or origin == ORIGIN_SPELL then
            if creatures[creature] and creatures[cid] == 1 then
                creatures[creature] = 0
                return true
            end
            creatures[creature] = 1
            -- my addition
		
		
			local chance = math.random(35)
          if chance == 25 then
				-- Formula, can be modified.
				          
				--player:setHitCount(0)
				addEvent(applyDemolitionDamage, 200, attacker:getId(), creature:getId(), primaryDamage)
			end
          --player:setHitCount(player:getHitCount() + 1) 
		  end
		  
		 
        end
      end
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end
