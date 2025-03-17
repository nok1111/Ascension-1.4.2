local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local function hasDebtQuest(player)
    return player:getStorageValue(40051) == TASK_START
end

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function greetCallback(cid)
    local player = Player(cid)

    if hasDebtQuest(player) then
        doSendDialogNpc(cid, getNpcCid(), "Oh no, don\'t tell me Garrek sent you! Alright, fine, fine... I technically never said the armor was real. Take the 10 platinum and get out of here before he bursts a vein.", "debt&trade&close")
    else
        doSendDialogNpc(cid, getNpcCid(), "Welcome! Looking for fine goods? We’ve got the best deals in town.", "trade&close")
    end
    return true             
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)

    if msgcontains(msg:lower(), "debt") and hasDebtQuest(player) then
        if player:getStorageValue(40052) < 10 then
            player:addItem(2152, 10) -- Give the player 10 platinum coins
            player:setStorageValue(40052, 10) -- Track that they received the debt
             player:setStorageValue(40051, TASK_COMPLETED) -- Track that they received the debt
            doSendDialogNpc(cid, getNpcCid(), "There! 10 platinum coins. Now, go tell Garrek I\'m broke!", "close")
        else
            doSendDialogNpc(cid, getNpcCid(), "I already gave you the money! Go hand it over to Garrek!", "close")
        end
    elseif msgcontains(msg:lower(), "trade") then
        local message = ""
    doSendDialogNpcClose(cid)
    npcHandler:unGreet(cid) 
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
