-- Customer NPC: Daya Swiftwind
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

local MUG_ITEM_ID = 18305
local COOLDOWN_STORAGE = 51002 -- Unique storage per NPC
local COOLDOWN_TIME = 3600
local FRIENDLY_REP = 1



local sayingsNeutral = {
    "Are you new? You smell new.",
    "Best mind your pockets in Deadfin, stranger.",
    "One wink doesn't mean friendship here."
}

local sayingsFriendly = {
    "Well hello again, sunshine. Bringing me something sweet?",
    "Careful, flirt too much and I'll rob you blind!",
    "Deadfin's prettier with you around... but don't let it go to your head."
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
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Daya winks and snatches the mug playfully.")
            doSendDialogNpc(cid, getNpcCid(), "You're spoiling me, darling. Keep it up!", "close")
        else
            player:sendTextMessage(MESSAGE_STATUS_SMALL, "You don't have any beer mugs left.")
            doSendDialogNpc(cid, getNpcCid(), "A gift without a gift? Tsk-tsk.", "close")
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
