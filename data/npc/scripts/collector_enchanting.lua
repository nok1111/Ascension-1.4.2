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

local enchanting_items = {
    {name = "Arcane Powder", id = 13215, min = 2, max = 6, pouches = 2},
    {name = "Mystic Powder", id = 13197, min = 2, max = 5, pouches = 3},
    {name = "Crystal Essence", id = 40003, min = 1, max = 4, pouches = 4},
}
local valuable_pouch_id = 9001

function greetCallback(cid)
    doSendDialogNpc(cid, getNpcCid(), "Ah, the shimmer of magic in the air! I trade rare enchanting materials for valuable pouches. Would you like to trade for some mystical power?", "Valuable Pouches&Close")
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    local msg_l = msg:lower()

    if msgcontains(msg_l, "valuable pouches") then
        local dialog = "Which enchanting material do you seek?\n"
        dialog = dialog .. "1. Arcane Powder ("..enchanting_items[1].pouches.." pouches)\n"
        dialog = dialog .. "2. Mystic Powder ("..enchanting_items[2].pouches.." pouches)\n"
        dialog = dialog .. "3. Crystal Essence ("..enchanting_items[3].pouches.." pouches)\n"
        dialog = dialog .. "Type 'arcane', 'mystic', 'crystal' to choose."
        doSendDialogNpc(cid, getNpcCid(), dialog, "arcane&mystic&crystal&No")
    elseif msgcontains(msg_l, "arcane") then
        local item = enchanting_items[1]
        if player:getItemCount(valuable_pouch_id) >= item.pouches then
            player:removeItem(valuable_pouch_id, item.pouches)
            local amount = math.random(item.min, item.max)
            player:addItem(item.id, amount)
            doSendDialogNpc(cid, getNpcCid(), "Arcane Powder! May your runes glow ever brighter.", "arcane&Thanks&Close")
        else
            doSendDialogNpc(cid, getNpcCid(), "You don't have enough valuable pouches for this trade. Come back when you've got more!", "Close")
        end
    elseif msgcontains(msg_l, "mystic") then
        local item = enchanting_items[2]
        if player:getItemCount(valuable_pouch_id) >= item.pouches then
            player:removeItem(valuable_pouch_id, item.pouches)
            local amount = math.random(item.min, item.max)
            player:addItem(item.id, amount)
            doSendDialogNpc(cid, getNpcCid(), "Mystic Powder! Channel the energies wisely.", "mystic&Close")
        else
            doSendDialogNpc(cid, getNpcCid(), "You don't have enough valuable pouches for this trade. Come back when you've got more!", "Close")
        end
    elseif msgcontains(msg_l, "crystal") then
        local item = enchanting_items[3]
        if player:getItemCount(valuable_pouch_id) >= item.pouches then
            player:removeItem(valuable_pouch_id, item.pouches)
            local amount = math.random(item.min, item.max)
            local Crystalvalues = {35788, 33202, 33201, 33203, 35789}
            local randomValue = Crystalvalues[math.random(1, #values)]
            player:addItem(randomValue, amount)
            doSendDialogNpc(cid, getNpcCid(), "Crystal Essence! Fragments of true power.", "crystal&Close")
        else
            doSendDialogNpc(cid, getNpcCid(), "You don't have enough valuable pouches for this trade. Come back when you've got more!", "Close")
        end
    elseif msgcontains(msg_l, "no") then
        doSendDialogNpc(cid, getNpcCid(), "No worries, may the arcane winds guide you!", "Close")
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
