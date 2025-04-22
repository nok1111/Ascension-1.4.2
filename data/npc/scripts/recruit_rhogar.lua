-- Recruitable NPC 5: Rhogar Scaleback (dragonborn)
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function greetCallback(cid)
    local player = Player(cid)
    if player:getStorageValue(Mainquest.recruit_rhogar) == 1 then
        doSendDialogNpc(cid, getNpcCid(), "My blade thirsts for ogre blood.", "close")
        return true
    end
    doSendDialogNpc(cid, getNpcCid(), "*snorts fire* You look like someone who needs a real warrior.", "Join Us&Prove Yourself&Not Now")
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end
    local player = Player(cid)

    if msgcontains(msg, "Join Us") then
        if player:getStorageValue(Storage.KilledOgre) == 1 then
            player:setStorageValue(Mainquest.recruit_rhogar, 1)
            addRecruit(cid)
            doSendDialogNpc(cid, getNpcCid(), "HAH! You've got guts. I'll fight beside you.", "close")
        else
            doSendDialogNpc(cid, getNpcCid(), "Come back when you've slain your first ogre. Then we'll talk.", "close")
        end
    elseif msgcontains(msg, "Prove Yourself") then
        doSendDialogNpc(cid, getNpcCid(), "Bring me an ogre tooth as trophy. Then I'll respect you.", "close")
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