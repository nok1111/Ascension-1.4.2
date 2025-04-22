-- Recruitable NPC 4: Imera the Pure (devout priestess)
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function greetCallback(cid)
    local player = Player(cid)
    if player:getStorageValue(Mainquest.recruit_imera) == 1 then
        doSendDialogNpc(cid, getNpcCid(), "May the Light protect us all.", "close")
        return true
    end
    doSendDialogNpc(cid, getNpcCid(), "You seek a healer for the coming war? The Light compels me to aid...", "Join Us&Bless Me&Not Now")
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end
    local player = Player(cid)

    if msgcontains(msg, "Join Us") then
        player:setStorageValue(Mainquest.recruit_imera, 1)
        addRecruit(cid)
        doSendDialogNpc(cid, getNpcCid(), "I shall tend to the wounded. The Light will guide my hands.", "close")
    elseif msgcontains(msg, "Bless Me") then
        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
        doSendDialogNpc(cid, getNpcCid(), "The Light shines upon you, child. Now, shall we discuss your offer?", "Join Us&Not Now")
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