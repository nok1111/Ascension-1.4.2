-- Recruitable NPC 1: Borgrin Ironbelly (drunken dwarf)
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function greetCallback(cid)
    local player = Player(cid)
    if player:getStorageValue(Mainquest.recruit_borgrin) == 1 then
        doSendDialogNpc(cid, getNpcCid(), "*hic* Ready to smash some ogre skulls!", "close")
        return true
    end
    doSendDialogNpc(cid, getNpcCid(), "*burp* You lookin' at Borgrin's ale? Wait... you recruiting? *hic*", "Join Us&Not Now&Buy Me Ale")
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end
    local player = Player(cid)

    if msgcontains(msg, "Join Us") then
        if player:getItemCount(18448) >= 1 then -- Check for ale
            player:removeItem(18448, 1)
            player:setStorageValue(Mainquest.recruit_borgrin, 1)
            addRecruit(cid)
            doSendDialogNpc(cid, getNpcCid(), "FOR ALE AND GLORY! *chugs* I'll fight anything that moves!", "close")
        else
            doSendDialogNpc(cid, getNpcCid(), "No ale? No deal! *hic*", "close")
        end
    elseif msgcontains(msg, "Buy Me Ale") then
        doSendDialogNpc(cid, getNpcCid(), "Bring me 1 ale first! *hic* Then we talk!", "close")
    elseif msgcontains(msg, "Not Now") then
        doSendDialogNpc(cid, getNpcCid(), "Pfft. Come back when you're serious! *burp*", "close")
    elseif msgcontains(msg:lower(), "close") then
        npcHandler:addModule(FocusModule:new())
        doSendDialogNpcClose(cid)
        npcHandler:unGreet(cid)
    end
    return true
end

local function addRecruit(cid)
    local player = Player(cid)
    
    local recruits = player:getStorageValue(Mainquest.soldiersrecruited)
    if recruits < 0 then recruits = 0 end
    player:setStorageValue(Mainquest.soldiersrecruited, recruits + 1)

    player:setStorageValue(Mainquest.recruit_borgrin, 1)
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())