function onLogin(player)
	local serverName = configManager.getString(configKeys.SERVER_NAME)
	local loginStr = "Welcome to " .. serverName .. "!"
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. " Please choose your outfit."
		player:sendOutfitWindow()
	else
		if loginStr ~= "" then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end

		loginStr = string.format("Your last visit in %s: %s.", serverName, os.date("%d %b %Y %X", player:getLastLoginSaved()))
	end
	player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)

	-- Promotion
	local vocation = player:getVocation()
	local promotion = vocation:getPromotion()
	if player:isPremium() then
		local value = player:getStorageValue(PlayerStorageKeys.promotion)
		if value == 1 then
			player:setVocation(promotion)
		end
	elseif not promotion then
		player:setVocation(vocation:getDemotion())
	end

	player:setStorageValue(STORAGEVALUE_PET_ID, 0);

	-- Events
	player:registerEvent("PlayerDeath")
	player:registerEvent("DropLoot")
	player:registerEvent("spellremove")
	player:registerEvent("loginzones")
	player:registerEvent("logoutzones")
	player:registerEvent("PassiveTree")
	player:registerEvent("ancestralTask")
	player:registerEvent("PlayerKill_quests")
	player:registerEvent("VocationPassiveRegen")
	player:registerEvent("RegisterPassives")
	player:registerEvent("PartyOpcode")

	--character stats
	player:registerEvent("CharacterStatsExtended")
    player:registerEvent("CharacterStatsAdvance")
	
	-- Check login in profession system
	player:registerEvent("ProfessionPackets")
   	player:registerEvent("CraftingPackets")
	ProfessionSystem:onPlayerLogin(player)
	-- update jobs
	ProfessionSystem:sendJobs(player)
	-- Send Fame Info
	FameSystem:sendUpdateFame(player)

	--if vocation is id 6 then summon aery if doesnt exist
	if player:getVocation():getId() == 6 then
		local hasAery = false
		for _, summon in ipairs(player:getSummons()) do
			if summon:getName() == "Aery" then
				hasAery = true
				break
			end
		end
		if not hasAery then
			local playerPos = player:getPosition()
			local aery = Game.createMonster("Aery", playerPos, false, true)
			if aery then
				player:addSummon(aery)
			end
		end
	end


	--add speed based on vocation id from 1 to 10
	local vocationSpeeds = {
		[1] = 250,   -- Magician
		[2] = 280,   -- Templar
		[3] = 300,   -- Nightblade
		[4] = 280,   -- Dragon Knight
		[5] = 250,   -- Warlock
		[6] = 250,   -- Stellar
		[7] = 290,   -- Monk
		[8] = 250,   -- Druid
		[9] = 300,   -- Light Dancer
		[10] = 260,  -- Archer
	}
	local vocId = player:getVocation():getId()
	-- Ignore GMs (group id >= 2)
	if player:getGroup():getId() < 2 and vocationSpeeds[vocId] then
		print("base speed: " .. player:getBaseSpeed())
		print("vocation speed: " .. vocationSpeeds[vocId])
		--player:changeSpeed(vocationSpeeds[vocId] - player:getBaseSpeed())
	end

	return true
end
