function onLogout(player)
	local playerId = player:getId()
	if nextUseStaminaTime[playerId] then
		nextUseStaminaTime[playerId] = nil
	end
	player:setStorageValue(STORAGEVALUE_PET_ID, 0);
	return true
end
