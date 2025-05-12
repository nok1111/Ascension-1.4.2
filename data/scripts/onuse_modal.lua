-- onuse_modal.lua
-- TFS revscript: Opens a modal window with selectable rewards on item use.
-- Replace ITEM_ID with your actual item ID.

local ITEM_ID = 12345 -- TODO: Replace with your real item ID

local onuseModal = Action()

function onuseModal.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local fameAmount = getFameReward(player, item) -- Replace with your own calculation
    local craftingExpAmount = getCraftingExpReward(player, item) -- Replace with your own calculation
    local goldAmount = 10000 -- Example value
    local expAmount = 5000 -- Example value

    local modal = ModalWindow(1001, "Select Your Reward", "Choose one of the following rewards:")
    modal:addChoice(1, "+" .. fameAmount .. " fame")
    modal:addChoice(2, "+" .. craftingExpAmount .. " crafting exp")
    modal:addChoice(3, "+" .. goldAmount .. " gold")
    modal:addChoice(4, "+" .. expAmount .. " experience")
    modal:addButton(1, "Select")
    modal:addButton(2, "Cancel")
    modal:setDefaultEnterButton(1)
    modal:setDefaultEscapeButton(2)

    function modal:onSelect(player, buttonId, choiceId)
        if buttonId ~= 1 then
            return true
        end
        if choiceId == 1 then
            addFame(player, fameAmount) -- Implement your fame logic
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received " .. fameAmount .. " fame!")
        elseif choiceId == 2 then
            addCraftingExp(player, craftingExpAmount) -- Implement your crafting exp logic
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received " .. craftingExpAmount .. " crafting exp!")
        elseif choiceId == 3 then
            player:addMoney(goldAmount)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received " .. goldAmount .. " gold!")
        elseif choiceId == 4 then
            player:addExperience(expAmount)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received " .. expAmount .. " experience!")
        end
        item:remove(1)
        return true
    end

    modal:sendToPlayer(player)
    return true
end

onuseModal:id(ITEM_ID)
onuseModal:register()

-- Placeholder reward logic. Replace with your own implementations.
function getFameReward(player, item)
    return 100 -- TODO: Replace with your fame calculation
end

function getCraftingExpReward(player, item)
    return 200 -- TODO: Replace with your crafting exp calculation
end

function addFame(player, amount)
    -- TODO: Implement fame addition logic
end

function addCraftingExp(player, amount)
    -- TODO: Implement crafting exp addition logic
end
