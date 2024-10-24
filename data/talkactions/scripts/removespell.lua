local SpellBooks = {
    [36835] = {spellName = "Rend", spellType = "common", storageId = 20001},  
    [1964] = {spellName = "spell_name_here_2", spellType = "common", storageId = 20002},    
    [1955] = {spellName = "spell_name_here_3", spellType = "ultimate", storageId = 30001}
}

local commonSpellLimit = 7
local ultimateSpellLimit = 1

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
            table.insert(learnedSpells, spell.spellName)
            table.insert(spellChoices, spell.storageId)  -- Store the storage ID for removal
        end
    end

    if #learnedSpells == 0 then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You have no spells to remove.")
        return true
    end

    -- Display the modal window with spell choices
    player:onModalWindow(learnedSpells, spellChoices)

    return true
end

-- Modal window function
function Player:onModalWindow(spellList, spellChoices)
    local modal = ModalWindow(100, "Remove Spell", "Choose a spell to remove:")
    for i, spellName in ipairs(spellList) do
        modal:addChoice(spellName, i)
    end
    modal:addButton("Remove", function(selectedIndex)
        if selectedIndex > 0 and selectedIndex <= #spellChoices then
            local storageIdToRemove = spellChoices[selectedIndex]
            self:forgetSpell(SpellBooks[storageIdToRemove].spellName)  -- Use the native forgetSpell method
            self:setStorageValue(storageIdToRemove, -1)  -- Reset the storage to -1
            self:sendTextMessage(MESSAGE_INFO_DESCR, "You have removed the spell: " .. spellList[selectedIndex] .. "!")
        end
    end)
    modal:addButton("Close", function()
        modal:close()
    end)
    modal:sendToPlayer(self)
end