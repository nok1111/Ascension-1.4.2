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
	

	return true
end
