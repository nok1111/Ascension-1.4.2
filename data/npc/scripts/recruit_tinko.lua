-- Recruitable NPC 6: Tinko Fizzlebang (gnome)
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function greetCallback(cid)
    local player = Player(cid)
    if player:getStorageValue(Mainquest.recruit_tinko) == 1 then
        doSendDialogNpc(cid, getNpcCid(), "*poof* Oh hello again!", "close")
        return true
    end
    doSendDialogNpc(cid, getNpcCid(), "*POOF* Did I scare you? Hehe! Want to see a trick?", "Join Us&Trick First&Not Now")
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end
    local player = Player(cid)

    if msgcontains(msg, "Join Us") then
        player:setStorageValue(Mainquest.recruit_tinko, 1)
        addRecruit(cid)
        doSendDialogNpc(cid, getNpcCid(), "YAY! I'll make ogres see TWENTY of you! *giggles*", "close")
    elseif msgcontains(msg, "Trick First") then
        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_ENERGYAREA)
        doSendDialogNpc(cid, getNpcCid(), "TA-DA! Now... about that war thingy?", "Join Us&Not Now")
        return
    end
    npcHandler:unGreet(cid)
    return true
end

local function addRecruit(cid)
    local player = Player(cid)
    player:setStorageValue(Mainquest.recruit_borgrin, 1)
    local recruits = player:getStorageValue(Mainquest.soldiersrecruited)
    if recruits < 0 then recruits = 0 end
    player:setStorageValue(Mainquest.soldiersrecruited, recruits + 1)
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())