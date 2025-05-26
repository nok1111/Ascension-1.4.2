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

local herb_items = {
    {name = "Crimson Rose", id = 35440, min = 2, max = 6, pouches = 3},
    {name = "Morning Iris", id = 35439, min = 2, max = 5, pouches = 4},
    {name = "Sweet Pea", id = 35442, min = 1, max = 4, pouches = 5},
    {name = "Delphinium", id = 35443, min = 1, max = 2, pouches = 6},
}
local valuable_pouch_id = 9001

function greetCallback(cid)
    doSendDialogNpc(cid, getNpcCid(), "Ah, the scent of fresh herbs! I trade rare botanicals for valuable pouches. Interested in a fragrant exchange?", "Valuable Pouches&Close")
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    local msg_l = msg:lower()

    if msgcontains(msg_l, "valuable pouches") then
        local dialog = "Which herb are you seeking?\n"
        dialog = dialog .. "1. Crimson Rose ("..herb_items[1].pouches.." pouches)\n"
        dialog = dialog .. "2. Morning Iris ("..herb_items[2].pouches.." pouches)\n"
        dialog = dialog .. "3. Sweet Pea ("..herb_items[3].pouches.." pouches)\n"
        dialog = dialog .. "4. Delphinium ("..herb_items[4].pouches.." pouches)\n"
        dialog = dialog .. "Type 'crimson', 'morning', 'sweet', or 'delphinium' to choose."
        doSendDialogNpc(cid, getNpcCid(), dialog, "crimson&morning&sweet&delphinium&No")
    elseif msgcontains(msg_l, "crimson") then
        local item = herb_items[1]
        if player:getItemCount(valuable_pouch_id) >= item.pouches then
            player:removeItem(valuable_pouch_id, item.pouches)
            local amount = math.random(item.min, item.max)
            player:addItem(item.id, amount)
            doSendDialogNpc(cid, getNpcCid(), "Crimson Rose! Potent and peculiar—use it wisely.", "crimson&Thanks&Close")
        else
            doSendDialogNpc(cid, getNpcCid(), "You don't have enough valuable pouches for this trade. Come back when you've got more!", "Close")
        end
    elseif msgcontains(msg_l, "morning") then
        local item = herb_items[2]
        if player:getItemCount(valuable_pouch_id) >= item.pouches then
            player:removeItem(valuable_pouch_id, item.pouches)
            local amount = math.random(item.min, item.max)
            player:addItem(item.id, amount)
            doSendDialogNpc(cid, getNpcCid(), "Morning Iris! Handle with care—deadly but useful.", "morning&Close")
        else
            doSendDialogNpc(cid, getNpcCid(), "You don't have enough valuable pouches for this trade. Come back when you've got more!", "Close")
        end
    elseif msgcontains(msg_l, "sweet") then
        local item = herb_items[3]
        if player:getItemCount(valuable_pouch_id) >= item.pouches then
            player:removeItem(valuable_pouch_id, item.pouches)
            local amount = math.random(item.min, item.max)
            player:addItem(item.id, amount)
            doSendDialogNpc(cid, getNpcCid(), "Sweet Pea! Bright as the midday sun.", "sweet&Close")
        else
            doSendDialogNpc(cid, getNpcCid(), "You don't have enough valuable pouches for this trade. Come back when you've got more!", "Close")
        end
    elseif msgcontains(msg_l, "delphinium") then
        local item = herb_items[4]
        if player:getItemCount(valuable_pouch_id) >= item.pouches then
            player:removeItem(valuable_pouch_id, item.pouches)
            local amount = math.random(item.min, item.max)
            player:addItem(item.id, amount)
            doSendDialogNpc(cid, getNpcCid(), "Delphinium! Rare and prized by alchemists.", "delphinium&Close")
        else
            doSendDialogNpc(cid, getNpcCid(), "You don't have enough valuable pouches for this trade. Come back when you've got more!", "Close")
        end
    elseif msgcontains(msg_l, "no") then
        doSendDialogNpc(cid, getNpcCid(), "No worries, may your path be fragrant and safe!", "Close")
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
