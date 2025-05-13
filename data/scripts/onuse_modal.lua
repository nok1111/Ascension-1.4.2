-- onuse_modal.lua
-- TFS revscript: Opens a modal window with selectable rewards on item use.
-- Replace ITEM_ID with your actual item ID.

local ITEM_ID = 37763 -- TODO: Replace with your real item ID

local onuseModal = Action()

function onuseModal.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local fameAmount = getFameReward(player, item) -- Replace with your own calculation
    local craftingExpAmount = getCraftingExpReward(player, item) -- Replace with your own calculation
    local goldAmount = 50-- Example value
    local expAmount = 180 -- Example value

    -- Store reward values on player for retrieval in modal handler
    player:setStorageValue(90001, fameAmount)
    player:setStorageValue(90002, craftingExpAmount)
    player:setStorageValue(90003, goldAmount)
    player:setStorageValue(90004, expAmount)

    local modal = ModalWindow(1001, "Select Your Reward", "Choose one of the following rewards:")
    modal:addChoice(1, "+" .. fameAmount .. " fame")
    modal:addChoice(2, "+" .. craftingExpAmount .. " crafting exp")
    modal:addChoice(3, "+" .. goldAmount .. " gold")
    modal:addChoice(4, "+" .. expAmount .. " experience")
    modal:addButton(1, "Select")
    modal:addButton(2, "Cancel")
    modal:setDefaultEnterButton(1)
    modal:setDefaultEscapeButton(2)
    modal:sendToPlayer(player)
    return true
end

onuseModal:id(ITEM_ID)
onuseModal:register()

local creatureevent = CreatureEvent("onuse_modal")

function creatureevent.onModalWindow(player, modalWindowId, buttonId, choiceId)
    if modalWindowId == 1002 then
        if buttonId == 4 then return true end -- Cancel
        local amount = 1
        if buttonId == 2 then amount = 5 elseif buttonId == 3 then amount = 10 end
        local itemId = ITEM_ID
        local itemCount = player:getItemCount(itemId)
        if itemCount < amount then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have enough items (" .. amount .. " required).")
            return true
        end
        addCraftingExp(player, amount, choiceId)
        player:removeItem(itemId, amount)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received " .. amount .. " points in profession " .. choiceId .. "!")
        -- Reset storage values after giving reward
        player:setStorageValue(90001, -1)
        player:setStorageValue(90002, -1)
        player:setStorageValue(90003, -1)
        player:setStorageValue(90004, -1)
        return true
    end
    if modalWindowId ~= 1001 then
        return false
    end
    if buttonId ~= 1 then
        return true
    end
    local fameAmount = player:getStorageValue(90001)
    local craftingExpAmount = player:getStorageValue(90002)
    local goldAmount = player:getStorageValue(90003)
    local expAmount = player:getStorageValue(90004)
    if choiceId == 1 then
        local itemId = ITEM_ID
        local item = player:getItemById(itemId, true)
        if not item then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have the required item.")
            return true
        end
        addFame(player, fameAmount)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received " .. fameAmount .. " fame!")
        item:remove(1)
    elseif choiceId == 2 then
        -- Open second modal for profession selection
        local modal = ModalWindow(1002, "Select Profession", "Choose your profession and amount:")
        modal:addChoice(1, "blacksmith")
        modal:addChoice(2, "alchemy")
        modal:addChoice(3, "cooking")
        modal:addChoice(4, "enchanting")
        modal:addButton(1, "+1")
        modal:addButton(2, "+5")
        modal:addButton(3, "+10")
        modal:addButton(4, "Cancel")
        modal:setDefaultEnterButton(1)
        modal:setDefaultEscapeButton(4)
        modal:sendToPlayer(player)
        return true
    elseif choiceId == 3 then
        local itemId = ITEM_ID
        local item = player:getItemById(itemId, true)
        if not item then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have the required item.")
            return true
        end
        player:addMoney(goldAmount)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received " .. goldAmount .. " gold!")
        item:remove(1)
    elseif choiceId == 4 then
        local itemId = ITEM_ID
        local item = player:getItemById(itemId, true)
        if not item then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have the required item.")
            return true
        end
        player:addExperience(expAmount)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received " .. expAmount .. " experience!")
        item:remove(1)
    end
    -- Optionally, reset storage values here
    player:setStorageValue(90001, -1)
    player:setStorageValue(90002, -1)
    player:setStorageValue(90003, -1)
    player:setStorageValue(90004, -1)
    return true
end

creatureevent:register()

local loginEvent = CreatureEvent("onuse_modal_login")

function loginEvent.onLogin(player)
    player:registerEvent("onuse_modal")
    return true
end

loginEvent:register()

function getFameReward(player, item)
    return 2 -- TODO: Replace with your fame calculation
end

function getCraftingExpReward(player, item)
    return 2 -- TODO: Replace with your crafting exp calculation
end

function addFame(player, amount)
    FameSystem:addPoints(player, amount)
end

function addCraftingExp(player, amount, jobId)
    ProfessionSystem:addPoints(player, jobId, amount)
end
