local SpellBooks = {
    [36835] = {spellName = "Rend", spellType = "common", storageId = 20001},  
    [1964] = {spellName = "spell_name_here_2", spellType = "common", storageId = 20002},    
    [1955] = {spellName = "spell_name_here_3", spellType = "ultimate", storageId = 30001}
}

local commonSpellLimit = 7
local ultimateSpellLimit = 1

function onModalWindow(player, modalWindowId, buttonId, choiceId)
    if modalWindowId ~= 100 then return false end  -- Ensure the correct modal window ID

    if buttonId == 1 then  -- Assuming "Remove" button is buttonId 1
        -- Retrieve the learned spells directly from the player's storage
        local learnedSpells = {}
        for _, spell in pairs(SpellBooks) do
            if player:getStorageValue(spell.storageId) >= 0 then
                table.insert(learnedSpells, spell.spellName)  -- Store the spell names for display
            end
        end

        -- Check if the choiceId is valid
        if choiceId > 0 and choiceId <= #learnedSpells then
            local spellNameToRemove = learnedSpells[choiceId]  -- Get the selected spell name

            -- Find the corresponding storageId in SpellBooks
            for storageId, spell in pairs(SpellBooks) do
                if spell.spellName == spellNameToRemove then
                    player:forgetSpell(spellNameToRemove)  -- Use the native forgetSpell method
					print("stor remove: " .. spell.storageId)
                    player:setStorageValue(spell.storageId, -1)  -- Reset the storage to -1
                    player:sendTextMessage(MESSAGE_INFO_DESCR, "You have removed the spell: " .. spellNameToRemove .. "!")
					player:unregisterEvent("spellremove")  -- Unregister the event
                    break
                end
            end
        end
    end

    
    return true
end
