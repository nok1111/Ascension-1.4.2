-- Recruitable NPC 2: Kaela Swiftwind (serious elf)
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function greetCallback(cid)
    local player = Player(cid)
    if player:getStorageValue(Mainquest.recruit_kaela) == 1 then
        doSendDialogNpc(cid, getNpcCid(), "My arrows await your command.", "close")
        return true
    end
    doSendDialogNpc(cid, getNpcCid(), "You approach an elf of the Silverwood? Speak quickly, human.", "Join Us&Why Fight&Not Now")
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end
    local player = Player(cid)

    if msgcontains(msg, "Join Us") then
        player:setStorageValue(Mainquest.recruit_kaela, 1)
        addRecruit(cid)
        doSendDialogNpc(cid, getNpcCid(), "Very well. My arrows will find their marks. For the Silverwood!", "close")
    elseif msgcontains(msg, "Why Fight") then
        doSendDialogNpc(cid, getNpcCid(), "The ogres burn our forests. This is personal.", "Join Us&Not Now")
    elseif msgcontains(msg, "Not Now") then
        doSendDialogNpc(cid, getNpcCid(), "Do not waste my time again.", "close")
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