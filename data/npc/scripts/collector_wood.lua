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

local wood_items = {
    {name = "Oak Log", id = 10001, min = 5, max = 10, pouches = 2},
    {name = "Maple Log", id = 10002, min = 3, max = 8, pouches = 3},
    {name = "Pine Log", id = 10003, min = 4, max = 9, pouches = 2},
    {name = "Mahogany Log", id = 10004, min = 2, max = 5, pouches = 4},
}
local valuable_pouch_id = 9001

function greetCallback(cid)
    doSendDialogNpc(cid, getNpcCid(), "Ah, greetings fellow lover of the woods! I trade rare logs for valuable pouches. Care to make a trade and help a fellow woodsman?", "Valuable Pouches&Close")
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    local msg_l = msg:lower()

    if msgcontains(msg_l, "valuable pouches") then
        local dialog = "Which logs are you after?\n"
        dialog = dialog .. "1. Oak Logs ("..wood_items[1].pouches.." pouches)\n"
        dialog = dialog .. "2. Maple Logs ("..wood_items[2].pouches.." pouches)\n"
        dialog = dialog .. "3. Pine Logs ("..wood_items[3].pouches.." pouches)\n"
        dialog = dialog .. "4. Mahogany Logs ("..wood_items[4].pouches.." pouches)\n"
        dialog = dialog .. "Type 'oak', 'maple', 'pine', or 'mahogany' to choose."
        doSendDialogNpc(cid, getNpcCid(), dialog, "Oak&Maple&Pine&Mahogany&No")
    elseif msgcontains(msg_l, "oak") then
        local item = wood_items[1]
        if player:getItemCount(valuable_pouch_id) >= item.pouches then
            player:removeItem(valuable_pouch_id, item.pouches)
            local amount = math.random(item.min, item.max)
            player:addItem(item.id, amount)
            doSendDialogNpc(cid, getNpcCid(), "Here's your Oak Logs! Smell that fresh timber? Take care of the forest, friend.", "oak&Thanks&Close")
        else
            doSendDialogNpc(cid, getNpcCid(), "You don't have enough valuable pouches for this trade. Come back when you've got more!", "Close")
        end
    elseif msgcontains(msg_l, "maple") then
        local item = wood_items[2]
        if player:getItemCount(valuable_pouch_id) >= item.pouches then
            player:removeItem(valuable_pouch_id, item.pouches)
            local amount = math.random(item.min, item.max)
            player:addItem(item.id, amount)
            doSendDialogNpc(cid, getNpcCid(), "Here's your Maple Logs! May your axe stay sharp!", "maple&Close")
        else
            doSendDialogNpc(cid, getNpcCid(), "You don't have enough valuable pouches for this trade. Come back when you've got more!", "Close")
        end
    elseif msgcontains(msg_l, "pine") then
        local item = wood_items[3]
        if player:getItemCount(valuable_pouch_id) >= item.pouches then
            player:removeItem(valuable_pouch_id, item.pouches)
            local amount = math.random(item.min, item.max)
            player:addItem(item.id, amount)
            doSendDialogNpc(cid, getNpcCid(), "Here's your Pine Logs! Nothing like the scent of pine in the morning!", "pine&Close")
        else
            doSendDialogNpc(cid, getNpcCid(), "You don't have enough valuable pouches for this trade. Come back when you've got more!", "Close")
        end
    elseif msgcontains(msg_l, "mahogany") then
        local item = wood_items[4]
        if player:getItemCount(valuable_pouch_id) >= item.pouches then
            player:removeItem(valuable_pouch_id, item.pouches)
            local amount = math.random(item.min, item.max)
            player:addItem(item.id, amount)
            doSendDialogNpc(cid, getNpcCid(), "Here's your Mahogany Logs! Finest wood for the finest crafts!", "mahogany&Close")
        else
            doSendDialogNpc(cid, getNpcCid(), "You don't have enough valuable pouches for this trade. Come back when you've got more!", "Close")
        end
    elseif msgcontains(msg_l, "no") then
        doSendDialogNpc(cid, getNpcCid(), "No worries, wanderer. May the woods shelter you always!", "Close")
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
