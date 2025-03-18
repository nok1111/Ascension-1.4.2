local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink()
    npcHandler:onThink()
end

function onCreatureAppear(cid)
    npcHandler:onCreatureAppear(cid)
end

function onCreatureDisappear(cid)
    npcHandler:onCreatureDisappear(cid)
end

function onCreatureSay(cid, type, msg)
    npcHandler:onCreatureSay(cid, type, msg)
end

local greetTextOptions = {
    "Ah! A visitor! I can almost hear your bones rattling with excitement!",
    "The bones whisper to me... but they need more company. Will you help?",
    "You there! Ever wonder what happens to old bones? No? Good! Now give me some!",
    "Ah, another collector of fine skeletal remains! You *are* a collector, yes?",
    "Bones, bones, BONES! I can never have enough. Would you be so kind as to contribute?"
}

local requiredItems = {
    {itemID = 2230, amount = 5}, -- Skeleton Bone
    {itemID = 2231, amount = 3}  -- Skull
}

local rewards = {
    {itemID = 2152, amount = 5, chance = 50},  -- Platinum Coins (50% chance)
    {itemID = 5904, amount = 1, chance = 45}, -- Mysterious Bone Amulet (30% chance)
    {itemID = 11336, amount = 1, chance = 5} -- skeleton baby - clientid 2639
}

local interestedMessage = "Ah, you have an interest in my *collection*, yes? Excellent!\nI need certain... materials. Bring me these, and I shall grant you something in return.\n"
local successMessage = "Ooooh, wonderful! I shall add these to my collection... and for you, a special gift!"
local failureMessage = "No bones, no reward! I must insist on proper payment!"

function greetCallback(cid)
    doSendDialogNpc(cid, getNpcCid(), greetTextOptions[math.random(#greetTextOptions)], "Curious&Close")
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)

    if msgcontains(msg:lower(), "curious") then
        local message = interestedMessage .. "\n"
        for _, itemData in ipairs(requiredItems) do
            local itemName = ItemType(itemData.itemID):getName()
            message = message .. itemData.amount .. " " .. itemName .. "\n"
        end
        message = message .. "\nBring them to me, and I shall see what fate grants you!"
        doSendDialogNpc(cid, getNpcCid(), message, "Yes&Back")
    elseif msgcontains(msg:lower(), "yes") then
        local hasAllItems = true
        for _, itemData in ipairs(requiredItems) do
            if player:getItemCount(itemData.itemID) < itemData.amount then
                hasAllItems = false
                break
            end
        end

        if hasAllItems then
            -- Remove required items
            for _, itemData in ipairs(requiredItems) do
                player:removeItem(itemData.itemID, itemData.amount)
            end

            -- Determine the reward using random chance
            local roll = math.random(1, 100)
            local selectedReward = nil

            for _, rewardData in ipairs(rewards) do
                if roll <= rewardData.chance then
                    selectedReward = rewardData
                    break
                else
                    roll = roll - rewardData.chance
                end
            end

            -- Give the reward
            if selectedReward then
                player:addItem(selectedReward.itemID, selectedReward.amount)
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You have received a mysterious reward.")
            end

            doSendDialogNpc(cid, getNpcCid(), successMessage, "Close")
        else
            doSendDialogNpc(cid, getNpcCid(), failureMessage, "Back")
        end
    elseif msgcontains(msg:lower(), "back") then
        doSendDialogNpc(cid, getNpcCid(), greetTextOptions[math.random(#greetTextOptions)], "Curious&Close")
    elseif msgcontains(msg:lower(), "close") then
        npcHandler:addModule(FocusModule:new())
        doSendDialogNpcClose(cid)
        npcHandler:unGreet(cid)
    end

    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())
