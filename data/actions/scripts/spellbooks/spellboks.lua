

-- Function to count how many common spells a player has learned
function Player:getLearnedCommonSpellCount()
    local count = 0
    for i = 20001, 20001 + commonSpellLimit - 1 do
        if self:getStorageValue(i) >= 0 then
            count = count + 1
        end
    end
    return count
end

-- Function to check if a player has already learned an ultimate spell
function Player:hasLearnedUltimateSpell()
    return self:getStorageValue(30001) >= 0
end

-- Function to increment the common spell counter
function Player:incrementCommonSpellCounter()
    local count = self:getLearnedCommonSpellCount()
    if count < commonSpellLimit then
        self:setStorageValue(20001 + count, 1)  -- Set storage for the learned spell
    end
end

-- Function to check if a player can learn an ultimate spell
function Player:canLearnUltimateSpell()
    return not self:hasLearnedUltimateSpell()
end

-- onUse function to handle spell learning from a spellbook
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local book = SpellBooks[item.itemid]
    if not book then
        player:sendCancelMessage("This book has no spell associated with it.")
        return true
    end

    local spellName = book.spellName
    local spellType = book.spellType
    local storageId = book.storageId

    -- Check if the player has already learned the spell
    if player:getStorageValue(storageId) >= 0 then
        player:sendCancelMessage("You have already learned this spell.")
        return true
    end

    -- Handling common spells
    if spellType == "common" then
        if player:getLearnedCommonSpellCount() < commonSpellLimit then
            if player:learnSpell(spellName) then
                player:incrementCommonSpellCounter()
                player:sendTextMessage(MESSAGE_INFO_DESCR, "You have learned the common spell: " .. spellName .. "!")
                item:remove(1)  
            else
                player:sendCancelMessage("Failed to learn the spell.")
            end
        else
            player:sendCancelMessage("You cannot learn more than 7 common spells.")
        end

    -- Handling ultimate spell
    elseif spellType == "ultimate" then
        if player:canLearnUltimateSpell() then
            if player:learnSpell(spellName) then
                player:setStorageValue(storageId, 1)  -- Mark the ultimate spell as learned
                player:sendTextMessage(MESSAGE_INFO_DESCR, "You have learned the ultimate spell: " .. spellName .. "!")
                item:remove(1)
            else
                player:sendCancelMessage("Failed to learn the ultimate spell.")
            end
        else
            player:sendCancelMessage("You can only learn one ultimate spell.")
        end
    end

    return true
end
