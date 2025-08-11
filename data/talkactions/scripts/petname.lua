function onSay(player, words, param)
    local newName = tostring(param)
    local activePetId = player:getStorageValue(STORAGEVALUE_PET_ID);
    if activePetId > 0 then
        if newName ~= "" then
            if string.len(newName) > 10 then
                player:sendTextMessage(MESSAGE_STATUS_WARNING, "New pet name is too long!")
            else
                player:changePetName(activePetId, newName)
            end
        else
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "You have to provide new name!")
        end
    else
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "You have to summon pet to change its name!")
    end
    return false
end
