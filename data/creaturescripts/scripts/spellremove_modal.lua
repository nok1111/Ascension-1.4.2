-- Modal window callback
function onModalWindow(player, modalWindowId, buttonId, choiceId)
    if modalWindowId ~= 100 then return false end  -- Ensure the correct modal window ID

    local spellChoices = player:getStorageValue("spellChoices")  -- Retrieve stored spell choices
    if buttonId == 1 then  -- Assuming "Remove" button is buttonId 1
        if choiceId > 0 and choiceId <= #spellChoices then
            local storageIdToRemove = spellChoices[choiceId]
            player:forgetSpell(SpellBooks[storageIdToRemove].spellName)  -- Use the native forgetSpell method
            player:setStorageValue(storageIdToRemove, -1)  -- Reset the storage to -1
            player:sendTextMessage(MESSAGE_INFO_DESCR, "You have removed the spell: " .. SpellBooks[storageIdToRemove].spellName .. "!")
        end
    end

    player:unregisterEvent("spellremove")  -- Unregister the event
    return true
end