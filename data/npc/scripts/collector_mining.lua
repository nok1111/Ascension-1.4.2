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

local mining_items = {
    {name = "Copper Ore", id = 40034, min = 2, max = 4, pouches = 2},
    {name = "Silver Ore", id = 40035, min = 2, max = 3, pouches = 3},
    {name = "Gold Ore", id = 40041, min = 1, max = 3, pouches = 4},
    {name = "Veridium Ore", id = 40043, min = 1, max = 2, pouches = 6},
    {name = "Aquarite Ore", id = 40036, min = 1, max = 2, pouches = 7},
    {name = "Saladium Ore", id = 40037, min = 1, max = 2, pouches = 12},
}
local valuable_pouch_id = 9001

function greetCallback(cid)
    doSendDialogNpc(cid, getNpcCid(), "Ah, a fellow delver of the deep! I trade precious ores for valuable pouches. Care to make a trade and feel the thrill of the mine?", "Valuable Pouches&Close")
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    local msg_l = msg:lower()

    if msgcontains(msg_l, "valuable pouches") then
        local dialog = "What kind of ore are you after?\n"
        dialog = dialog .. "1. Copper Ore ("..mining_items[1].pouches.." pouches)\n"
        dialog = dialog .. "2. Silver Ore ("..mining_items[2].pouches.." pouches)\n"
        dialog = dialog .. "3. Gold Ore ("..mining_items[3].pouches.." pouches)\n"
        dialog = dialog .. "4. Veridium Ore ("..mining_items[4].pouches.." pouches)\n"
        dialog = dialog .. "5. Aquarite Ore ("..mining_items[5].pouches.." pouches)\n"
        dialog = dialog .. "6. Saladium Ore ("..mining_items[6].pouches.." pouches)\n"
        dialog = dialog .. "Type 'copper', 'silver', 'gold', 'veridium', 'aquarite', or 'saladium' to choose."
        doSendDialogNpc(cid, getNpcCid(), dialog, "copper&silver&gold&veridium&aquarite&saladium&No")
    elseif msgcontains(msg_l, "copper") then
        local item = mining_items[1]
        if player:getItemCount(valuable_pouch_id) >= item.pouches then
            player:removeItem(valuable_pouch_id, item.pouches)
            local amount = math.random(item.min, item.max)
            player:addItem(item.id, amount)
            doSendDialogNpc(cid, getNpcCid(), "Here's your Copper Ore! The lifeblood of any true miner.", "copper&Thanks&Close")
        else
            doSendDialogNpc(cid, getNpcCid(), "You don't have enough valuable pouches for this trade. Come back when you've got more!", "Close")
        end
    elseif msgcontains(msg_l, "silver") then
        local item = mining_items[2]
        if player:getItemCount(valuable_pouch_id) >= item.pouches then
            player:removeItem(valuable_pouch_id, item.pouches)
            local amount = math.random(item.min, item.max)
            player:addItem(item.id, amount)
            doSendDialogNpc(cid, getNpcCid(), "Here's your Silver Ore! Shiny and bright, just like a miner's dream.", "silver&Close")
        else
            doSendDialogNpc(cid, getNpcCid(), "You don't have enough valuable pouches for this trade. Come back when you've got more!", "Close")
        end
    elseif msgcontains(msg_l, "gold") then
        local item = mining_items[3]
        if player:getItemCount(valuable_pouch_id) >= item.pouches then
            player:removeItem(valuable_pouch_id, item.pouches)
            local amount = math.random(item.min, item.max)
            player:addItem(item.id, amount)
            doSendDialogNpc(cid, getNpcCid(), "Here's your Gold Ore! Worth its weight, eh? Spend it wisely.", "gold&Close")
        else
            doSendDialogNpc(cid, getNpcCid(), "You don't have enough valuable pouches for this trade. Come back when you've got more!", "Close")
        end
    elseif msgcontains(msg_l, "veridium") then
        local item = mining_items[4]
        if player:getItemCount(valuable_pouch_id) >= item.pouches then
            player:removeItem(valuable_pouch_id, item.pouches)
            local amount = math.random(item.min, item.max)
            player:addItem(item.id, amount)
            doSendDialogNpc(cid, getNpcCid(), "Here's your Veridium Ore! Only for the most dedicated diggers.", "veridium&Close")
        else
            doSendDialogNpc(cid, getNpcCid(), "You don't have enough valuable pouches for this trade. Come back when you've got more!", "Close")
        end
    elseif msgcontains(msg_l, "aquarite") then
        local item = mining_items[5]
        if player:getItemCount(valuable_pouch_id) >= item.pouches then
            player:removeItem(valuable_pouch_id, item.pouches)
            local amount = math.random(item.min, item.max)
            player:addItem(item.id, amount)
            doSendDialogNpc(cid, getNpcCid(), "Here's your Aquarite Ore! Only for the most dedicated diggers.", "aquarite&Close")
        else
            doSendDialogNpc(cid, getNpcCid(), "You don't have enough valuable pouches for this trade. Come back when you've got more!", "Close")
        end
    elseif msgcontains(msg_l, "saladium") then
        local item = mining_items[6]
        if player:getItemCount(valuable_pouch_id) >= item.pouches then
            player:removeItem(valuable_pouch_id, item.pouches)
            local amount = math.random(item.min, item.max)
            player:addItem(item.id, amount)
            doSendDialogNpc(cid, getNpcCid(), "Here's your Saladium Ore! Only for the most dedicated diggers.", "saladium&Close")
        else
            doSendDialogNpc(cid, getNpcCid(), "You don't have enough valuable pouches for this trade. Come back when you've got more!", "Close")
        end
    elseif msgcontains(msg_l, "no") then
        doSendDialogNpc(cid, getNpcCid(), "No worries, the mines are always waiting for brave souls!", "Close")
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
