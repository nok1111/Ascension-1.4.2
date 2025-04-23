-- Recruitable NPC 4: Imera the Pure (devout priestess)
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- Blessing configuration
local BLESSING_DURATION = 10 * 60 -- 10 minutes in seconds
local HP_BOOST_PERCENT = 110 -- 10% max HP increase
local BLESSING_CONDITION = createConditionObject(CONDITION_ATTRIBUTES)

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function greetCallback(cid)
    local player = Player(cid)
    if player:getStorageValue(Mainquest.recruit_imera) == 1 then
        doSendDialogNpc(cid, getNpcCid(), "May the Light protect us all.", "Bless Me&close")
        return true
    end
    doSendDialogNpc(cid, getNpcCid(), "You seek a healer for the coming war? The Light compels me to aid...", "Join Us&Bless Me&Not Now")
    return true
end

local function addRecruit(cid)
    local player = Player(cid)
    
    local recruits = player:getStorageValue(Mainquest.soldiersrecruited)
    if recruits < 0 then recruits = 0 end
    player:setStorageValue(Mainquest.soldiersrecruited, recruits + 1)

    player:setStorageValue(Mainquest.recruit_imera, 1)
end

local function applyBlessing(cid)
    local player = Player(cid)
    if not player then return false end
    
    -- Check if player already has blessing
    if player:getCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, BLESSING_CONDITION.subId) then
        player:say("You are already blessed by the Light!", TALKTYPE_MONSTER_SAY)
        return false
    end
    
    local originalMaxHealth = player:getMaxHealth()
    local boostAmount = math.max(1, math.floor(originalMaxHealth * (HP_BOOST_PERCENT / 100)))
    
    -- Configure the condition
    setConditionParam(BLESSING_CONDITION, CONDITION_PARAM_TICKS, BLESSING_DURATION * 1000)
    setConditionParam(BLESSING_CONDITION, CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, HP_BOOST_PERCENT) -- Needs to be *100 for percentage
    setConditionParam(BLESSING_CONDITION, CONDITION_PARAM_BUFF_SPELL, true)
    setConditionParam(BLESSING_CONDITION, CONDITION_PARAM_SUBID, 12345) -- Unique subId for this blessing
    
    -- Apply condition
    player:addCondition(BLESSING_CONDITION)
    
    -- Full heal
    player:addHealth(player:getMaxHealth())
    
    -- Visual and audio feedback
    doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
    player:say("RECEIVED BLESSING: +".. HP_BOOST_PERCENT .."% max HP for 10 minutes!", TALKTYPE_MONSTER_SAY)
    player:getPosition():sendMagicEffect(CONST_ME_SOUND_GREEN)
    
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
        if applyBlessing(cid) then
            doSendDialogNpc(cid, getNpcCid(), "By the Light's grace, you are blessed! (+"..HP_BOOST_PERCENT - 100 .."% max HP)", "close")
        else
            doSendDialogNpc(cid, getNpcCid(), "The Light cannot bless you at this time.", "close")
        end
    elseif msgcontains(msg, "Not Now") then
        doSendDialogNpc(cid, getNpcCid(), "Let the light be with you!", "Join Us&close")

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