local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

local NPC_STORAGE = Mainquest.morgasupport
local MAIN_STORAGE = Mainquest.rukksupport

function greetCallback(cid)
    local player = Player(cid)
    if player:getStorageValue(NPC_STORAGE) >= 1 then
        doSendDialogNpc(cid, getNpcCid(), "Morga still thinks this foolish...", "progress&gor'mhaz&close")
       else
         doSendDialogNpc(cid, getNpcCid(), "You! Rukk's lackey! Morga hears rebellion talk! Gor'mhaz has led since before your birth!", "challenge&gor\'mhaz&close")
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

    if msgcontains(msg:lower(), "challenge") then
        if player:getStorageValue(NPC_STORAGE) < 1 then
            if player:getStorageValue(MAIN_STORAGE) >= 1 then
                player:setStorageValue(MAIN_STORAGE, player:getStorageValue(MAIN_STORAGE) + 1)
                player:setStorageValue(NPC_STORAGE, 1)
                doSendDialogNpc(cid, getNpcCid(), "GRUNT! If Gharz and whole tribe agrees... [REBELLION READY! 2/2]", "progress&gor\'mhaz&close")
            else
                doSendDialogNpc(cid, getNpcCid(), "Gharz haven't joined? Then Morga WON'T support!", "progress&gor\'mhaz&close")
            end
        else
            doSendDialogNpc(cid, getNpcCid(), "Morga already gave support! [Supporters: "..player:getStorageValue(MAIN_STORAGE).."/2]", "progress&gor'mhaz&close")
        end
    
    elseif msgcontains(msg:lower(), "progress") then
        doSendDialogNpc(cid, getNpcCid(), "Pah! "..player:getStorageValue(MAIN_STORAGE).." support change. Need 2", "challenge&gor'mhaz&close")
    
    elseif msgcontains(msg:lower(), "gor'mhaz") then
        doSendDialogNpc(cid, getNpcCid(), "Gor'mhaz saved tribe during Great Frost!", "challenge&progress&close")
    
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