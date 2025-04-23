-- Recruitable NPC 3: Faelin Gearspark (mad goblin)
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function greetCallback(cid)
    local player = Player(cid)
    if player:getStorageValue(Mainquest.recruit_faelin) == 1 then
        doSendDialogNpc(cid, getNpcCid(), "BOOM! Hahaha! New ideas coming!", "close")
        return true
    end
    doSendDialogNpc(cid, getNpcCid(), "Faelin make BIG bombs! You want see? BOOM! Haha!", "Join Us&Show Boom&Not Now")
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end
    local player = Player(cid)

    if msgcontains(msg, "Join Us") then
        player:setStorageValue(Mainquest.recruit_faelin, 1)
        addRecruit(cid)
        doSendDialogNpc(cid, getNpcCid(), "YAY! Faelin make ogres go BOOM BOOM! *dances*", "close")
    elseif msgcontains(msg, "Show Boom") then
        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
        doSendDialogNpc(cid, getNpcCid(), "SEE?! BIG FIRE! Now you want Faelin fight, yes?", "Join Us&Not Now")
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