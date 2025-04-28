-- Customer NPC: Old Mags
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

local MUG_ITEM_ID = 18305
local COOLDOWN_STORAGE = 51000 -- Unique storage per NPC
local COOLDOWN_TIME = 3600 -- 1 hour cooldown in seconds
local FRIENDLY_REP = 1

local sayingsNeutral = {
    "Deadfin's rough, but it's home.",
    "Mind yer own business, that's my advice.",
    "Strong drink makes strong sailors!"
}

local sayingsFriendly = {
    "Good to see a familiar face!",
    "Watch out for the tide, friend. It eats the careless.",
    "If you need a safe place, Deadfin's got a spot... if you earn it."
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
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Old Mags gratefully accepts the drink. Cheers!")
            doSendDialogNpc(cid, getNpcCid(), "Ahh, that's the stuff! You're alright, kid.", "close")
        else
            player:sendTextMessage(MESSAGE_STATUS_SMALL, "You don't have any beer mugs left.")
            doSendDialogNpc(cid, getNpcCid(), "No mug, no talk. Heh!", "close")
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
