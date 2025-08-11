petEvents = {}

function updatePlayerStamina(cid, extraStamina)
    local player = Creature(cid)
    if player then
        player:setStamina(player:getStamina() + extraStamina)
        stopEvent(petEvents[player:getId()])
        petEvents[player:getId()] = addEvent(updatePlayerStamina, 5 * 60 * 1000, cid, 10)
    end

end

function onLogin(player)
	local activePet = player:getPet()
	local activePetId = player:getStorageValue(STORAGEVALUE_PET_ID);
    if activePet then
	local petlevel = player:getStorageValue(STORAGEVALUE_PET_LVL)
    player:setStorageValue(STORAGEVALUE_PET_LVL, activePet.level)
    player:setStorageValue(STORAGEVALUE_PET_EXP, activePet.exp)
	 petEvents[player:getId()] = addEvent(updatePlayerStamina, 5 * 60 * 1000, player:getId(), 10)
	 
	 if petlevel > 9 then
	 player:setStorageValue(STORAGEVALUE_PET_LVL, 10)
	 end
    end
	  -- Restoring companion onLogin
	if player:getVocation():getId() == 6 and player:getLevel() >= 15 then
    
      -- Magic level increase
      local magicLevelCondition = Condition(CONDITION_ATTRIBUTES, player:getGuid())
      magicLevelCondition:setParameter(CONDITION_PARAM_TICKS, -1)
      magicLevelCondition:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 2)
      player:addCondition(magicLevelCondition)
      -- Companion
      local playerPosition = player:getPosition()
      local companion = Game.createMonster(CONST_SHADOW_DRAINER, Position(playerPosition.x + 1, playerPosition.y, playerPosition.z), false, true)
      player:addSummon(companion)
	  --companion:registerEvent("TeleportToMaster")
      companion:say("READY!", TALKTYPE_MONSTER_SAY)
      companion:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

  end
	player:registerEvent("PetsDeath")
	player:registerEvent("PetsKill")
	return true
end

function onLogout(player)
	local activePet = player:getPet()
	local activePetId = player:getStorageValue(STORAGEVALUE_PET_ID);
    if activePet then
   player:setStorageValue(STORAGEVALUE_PET_ID, 0);
   local petLvl = player:getStorageValue(STORAGEVALUE_PET_LVL)
   local petExp = player:getStorageValue(STORAGEVALUE_PET_EXP)
   player:updatePet(activePetId, petLvl, petExp)
   player:hidePet(activePetId)
   stopEvent(petEvents[player:getId()])
    end
	return true
end

function onDeath(player, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local activePet = player:getPet()
	local activePetId = player:getStorageValue(STORAGEVALUE_PET_ID);
    if activePet then
   player:setStorageValue(STORAGEVALUE_PET_ID, 0);
   local petLvl = player:getStorageValue(STORAGEVALUE_PET_LVL)
   local petExp = player:getStorageValue(STORAGEVALUE_PET_EXP)
   player:updatePet(activePetId, petLvl, petExp)
   player:hidePet(activePetId)
   stopEvent(petEvents[player:getId()])
    end
	return true
end

function onKill(player, target, lastHit)
	local activePet = player:getPet()
	local activePetId = player:getStorageValue(STORAGEVALUE_PET_ID);
    if activePet then
-- get the pet object
	local pet = player:getPet()

-- get the monsterId of the pet
	local monsterId = pet.monsterId

-- get the Monster object using the monsterId
	local monster = Monster(monsterId)



	
	    if target:isMonster() and target:getMonsterLevel() > 1 and not target:getMaster() then
            local monsterexp = target:getType():getExperience()
			local monsterlevel = target:getMonsterLevel()
			--print(monsterlevel)
	        local currentExp = player:getStorageValue(STORAGEVALUE_PET_EXP)
	        local petlevel = player:getStorageValue(STORAGEVALUE_PET_LVL)
            local pet_exp = (monsterexp * (monsterlevel * 0.01)) + 1
	        local finalexp = currentExp + pet_exp
	        
	        if petlevel < 10 then -- allow pet level to go beyond 10
                player:setStorageValue(STORAGEVALUE_PET_EXP, finalexp)
				if monster and monster:getPosition() then
	            Game.sendAnimatedText("+" .. pet_exp .. " Exp", monster:getPosition(), TEXTCOLOR_LIGHTGREEN)
				end
	            local petExp = player:getStorageValue(STORAGEVALUE_PET_EXP)
  				 player:updatePet(activePetId, petlevel, petExp)
	        end
	        
	        local maxExp = getPetMaxExpByLevel(petlevel)
	        local nextMaxExp = getPetMaxExpByLevel(petlevel + 1)
	        
	        if currentExp >= maxExp and currentExp < nextMaxExp then
		        player:setStorageValue(STORAGEVALUE_PET_LVL, petlevel + 1)
		        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your pet has reached level " .. (petlevel + 1) .. "!")
	        end
	    end

	    petEvents[player:getId()] = addEvent(updatePlayerStamina, 5 * 60 * 1000, player:getId(), 10)
    end
    
    return true
end
