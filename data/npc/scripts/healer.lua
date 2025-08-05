-- Customer NPC: Old Mags
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

local sayingsFriendly = {
    "May the light bless your path, child.",
    "If your soul is weary, I can offer healing.",
    "Faith and hope will guide you through darkness."
}

function greetCallback(cid)
    local player = Player(cid)
    local rep = player:getStorageValue(Mainquest.reachedFriendlyDeadfin)
    local text = sayingsFriendly[math.random(#sayingsFriendly)]
    doSendDialogNpc(cid, getNpcCid(), text, "Heal Me&Bless Me&Close")
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end
    local player = Player(cid)
    local playerpos = player:getPosition()

    if msgcontains(msg:lower(), "Heal Me")  then
        --heal full
        player:addHealth(player:getMaxHealth())
        --magic effect
        playerpos:sendMagicEffect(605)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You have been healed.")
        doSendDialogNpc(cid, getNpcCid(), "The light mends your wounds. You are healed.", "Bless Me&Close")
    elseif msgcontains(msg:lower(), "Bless Me") then
        --add maxhp and max mana condition
        local blessedCondition = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
        blessedCondition:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
        blessedCondition:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.blessed)
        blessedCondition:setParameter(CONDITION_PARAM_STAT_MAXHEALTHPOINTSPERCENT, 120)
        blessedCondition:setParameter(CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, 120)
        blessedCondition:setParameter(CONDITION_PARAM_TICKS, 1200000) --20 minutes
        player:addCondition(blessedCondition)

        --magic effect
        playerpos:sendMagicEffect(594)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You have been blessed.")
        doSendDialogNpc(cid, getNpcCid(), "A sacred blessing envelops you. May your strength endure. \n\n(20% max health and max mana for 20 minutes)", "Heal Me&Close")
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
