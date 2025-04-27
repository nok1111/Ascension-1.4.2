local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local ITEMS = {
    rum = { id = 38136, amount = 20, rep = 4 },         -- Rum barrel
    gunpowder = { id = 38131, amount = 15, rep = 3 },   -- Gunpowder keg
    cloth = { id = 39133, amount = 30, rep = 4 }         -- Fine cloth
}

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function greetCallback(cid)
    local player = Player(cid)
    local greeting = DeadfinRepLib.getGreeting(player)
    doSendDialogNpc(cid, getNpcCid(), greeting, "supplies&close")
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end

    local player = Player(cid)
    local lowerMsg = msg:lower()

    if lowerMsg == "supplies" then
        doSendDialogNpc(cid, getNpcCid(), "Always need more around 'ere. Bring me {rum}, {gunpowder}, or {cloth}. What did ye bring?", "rum&gunpowder&cloth&nothing")

    elseif lowerMsg == "rum" then
        local info = ITEMS.rum
        if player:getItemCount(info.id) >= info.amount then
            player:removeItem(info.id, info.amount)
            DeadfinRepLib.addReputation(player, info.rep)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You delivered " .. info.amount .. " barrels of rum!")
        else
            doSendDialogNpc(cid, getNpcCid(), "Bah, that's not enough rum! Bring me " .. info.amount .. " barrels at least.", "close")
        end

    elseif lowerMsg == "gunpowder" then
        local info = ITEMS.gunpowder
        if player:getItemCount(info.id) >= info.amount then
            player:removeItem(info.id, info.amount)
            DeadfinRepLib.addReputation(player, info.rep)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You delivered " .. info.amount .. " kegs of gunpowder!")
        else
            doSendDialogNpc(cid, getNpcCid(), "Takes guts to carry gunpowder! Bring me " .. info.amount .. " kegs if you dare.", "close")
        end

    elseif lowerMsg == "cloth" then
        local info = ITEMS.cloth
        if player:getItemCount(info.id) >= info.amount then
            player:removeItem(info.id, info.amount)
            DeadfinRepLib.addReputation(player, info.rep)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You delivered " .. info.amount .. " rolls of cloth!")
        else
            doSendDialogNpc(cid, getNpcCid(), "That's barely a rag! I need at least " .. info.amount .. " cloth rolls.", "close")
        end

    elseif lowerMsg == "nothing" then
        doSendDialogNpc(cid, getNpcCid(), "Then quit wasting my time, landlubber.", "close")

    elseif msgcontains(msg:lower(), "close") then
        npcHandler:addModule(FocusModule:new())
        doSendDialogNpcClose(cid)
        npcHandler:unGreet(cid)
    end

    return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
