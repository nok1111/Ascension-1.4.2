-- Customer NPC: Grumpy Garrek
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

local MUG_ITEM_ID = 18305
local COOLDOWN_STORAGE = 51001 -- Unique storage per NPC
local COOLDOWN_TIME = 3600
local FRIENDLY_REP = 1

local sayingsNeutral = {
    "I don't trust greenhorns. Get lost before I lose me patience.",
    "Hrmph. Talk is cheap. Loyalty ain't.",
    "What's a landlubber doing here anyway?"
}

local sayingsFriendly = {
    "Heh, you've earned some respect, kid.",
    "Deadfin's waters run deep... like old grudges.",
    "Grab a seat and listen to tales older than this city."
}

function greetCallback(cid)
    local player = Player(cid)
    local rep = player:getStorageValue(Mainquest.reachedFriendlyDeadfin)
    local text = ""

    if rep >= FRIENDLY_REP then
        text = sayingsFriendly[math.random(#sayingsFriendly)]
    else
        text = sayingsNeutral[math.random(#sayingsNeutral)]
    end

    if player:getStorageValue(COOLDOWN_STORAGE) < os.time() then
        doSendDialogNpc(cid, getNpcCid(), text, "Give Beer Mug&Close")
    else
        doSendDialogNpc(cid, getNpcCid(), text, "Close")
    end
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end
    local player = Player(cid)

    if msgcontains(msg:lower(), "give beer mug") and player:getStorageValue(COOLDOWN_STORAGE) < os.time() then
        if player:getItemCount(MUG_ITEM_ID) >= 1 then
            player:removeItem(MUG_ITEM_ID, 1)
            player:setStorageValue(COOLDOWN_STORAGE, os.time() + COOLDOWN_TIME)
            DeadfinRepLib.addReputation(player, FRIENDLY_REP)
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Garrek accepts the mug with a grumble (or was it a chuckle?)")
            doSendDialogNpc(cid, getNpcCid(), "Hrmph. Good enough. Cheers.", "close")
        else
            player:sendTextMessage(MESSAGE_STATUS_SMALL, "You don't have any beer mugs left.")
            doSendDialogNpc(cid, getNpcCid(), "Bah, come back when you bring a proper offering!", "close")
        end

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
