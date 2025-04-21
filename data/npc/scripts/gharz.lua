local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

local NPC_STORAGE = Mainquest.gharzsupport
local MAIN_STORAGE = Mainquest.rukksupport

function greetCallback(cid)
    local player = Player(cid)
    if player:getStorageValue(NPC_STORAGE) >= 1 then
        doSendDialogNpc(cid, getNpcCid(), "Gharz still thinking about rebellion...", "close")
    else
        doSendDialogNpc(cid, getNpcCid(), "Hmm... Rukk send you? Gharz not sure about challenging Gor'mhaz...", "consider&gor\'mhaz&close")
    end
    
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)

    if player:getStorageValue(MAIN_STORAGE) == -1 then
        player:setStorageValue(MAIN_STORAGE, 0)
    end
    if player:getStorageValue(NPC_STORAGE) == -1 then
        player:setStorageValue(NPC_STORAGE, 0)
    end

    if msgcontains(msg:lower(), "consider") then
        if player:getStorageValue(NPC_STORAGE) < 1 then
            player:setStorageValue(MAIN_STORAGE, player:getStorageValue(MAIN_STORAGE) + 1)
            player:setStorageValue(NPC_STORAGE, 1)
            doSendDialogNpc(cid, getNpcCid(), "Gharz will... support. For now. [Supporters: "..player:getStorageValue(MAIN_STORAGE).."/2]", "progress&gor\'mhaz&close")
        else
            doSendDialogNpc(cid, getNpcCid(), "Gharz already gave support. [Supporters: "..player:getStorageValue(MAIN_STORAGE).."/2]", "progress&gor\'mhaz&close")
        end
    
    elseif msgcontains(msg:lower(), "progress") then
        doSendDialogNpc(cid, getNpcCid(), "Hmm... "..player:getStorageValue(MAIN_STORAGE).." support change. Need 2", "consider&gor'mhaz&close")
    
    elseif msgcontains(msg:lower(), "gor'mhaz") then
        doSendDialogNpc(cid, getNpcCid(), "Last moon cycle, Gor'mhaz forgot sacred rituals... Maybe not so wise...", "consider&progress&close")
    
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