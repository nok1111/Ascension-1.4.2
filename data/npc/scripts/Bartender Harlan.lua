-- Bartender NPC: Harlan Deadfin
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

local BARTENDER_ITEM_ID = 18305 -- Beer Mug
local FRIENDLY_REP = 1 -- Storage where friendly starts

function greetCallback(cid)
    local player = Player(cid)
    local rep = player:getStorageValue(Mainquest.reachedFriendlyDeadfin)

    if rep >= FRIENDLY_REP then
        doSendDialogNpc(cid, getNpcCid(), "Busy day, friend! Need a hand passing these mugs around? Good folk always welcome!", "Borrow Mugs&Close")
    else
        doSendDialogNpc(cid, getNpcCid(), "A stranger, eh? We don't hand mugs to just anyone. But... if you're willing to help, maybe we'll see.", "Borrow Mugs&Close")
    end
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end
    local player = Player(cid)

    if msgcontains(msg:lower(), "borrow mug") then
        player:addItem(BARTENDER_ITEM_ID, 1, true)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You borrowed 1 beer mug to serve around Deadfin Tavern.")
        doSendDialogNpc(cid, getNpcCid(), "Good luck! Mind you don't spill — or drink 'em yourself!", "close")
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
