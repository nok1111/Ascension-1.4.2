

-- Function to check how many common spells a player has learned
function Player:getLearnedCommonSpellCount()
    local count = 0
    for i = 20001, 20001 + commonSpellLimit - 1 do
        if self:getStorageValue(i) >= 0 then
            count = count + 1
        end
    end
    return count
end

-- Function to check if a player has learned a spell
function Player:hasLearnedSpell(spellName)
    for _, spell in pairs(SpellBooks) do
        if spell.spellName == spellName and self:getStorageValue(spell.storageId) >= 0 then
            return true
        end
    end
    return false
end

-- Talkaction to remove a spell
function onSay(player, message)
    local learnedSpells = {}
    local spellChoices = {}

    -- Gather learned spells
    for _, spell in pairs(SpellBooks) do
        if player:getStorageValue(spell.storageId) >= 0 then
            table.insert(learnedSpells, spell.spellName)  -- Store the spell name
            table.insert(spellChoices, spell.storageId)    -- Store the storage ID for removal
        end
    end

    if #learnedSpells == 0 then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You have no spells to remove.")
        return true
    end

    -- Register the event for the modal window
    player:registerEvent("spellremove")
    
    -- Serialize the spell choices as a comma-separated string
    player:setStorageValue("spellChoices", table.concat(spellChoices, ","))


    -- Display the modal window with spell choices directly here
    local modal = ModalWindow(100, "Active Spells", "You can have up to " .. commonSpellLimit .. " spells active.")
    for i, spellName in ipairs(learnedSpells) do
        modal:addChoice(i, spellName)  -- Use actual spell names as choices
    end
    modal:addButton(1, "Remove")  -- Button ID for "Remove"
    modal:addButton(2, "Close")    -- Button ID for "Close"
    modal:sendToPlayer(player)

    return false
end