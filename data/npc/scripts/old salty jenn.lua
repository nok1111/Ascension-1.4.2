-- Old Salty Jenn NPC
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink() npcHandler:onThink() end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

-- Storage to track how many trash collected
local CLEANUP_STORAGE = 2115 -- Change if needed
local CLEANUP_GOAL = 10 -- How many trash items to clean for reward

function greetCallback(cid)
    local player = Player(cid)
    if not player then return false end

    local greeting = DeadfinRepLib.getGreeting(player)
    local cleaned = player:getStorageValue(CLEANUP_STORAGE) -- if npc tracks something (example: cleaning)

    if cleaned and cleaned >= CLEANUP_GOAL then
        doSendDialogNpc(cid, getNpcCid(), greeting .. " Seems ye did a fine job cleanin'! Ready for yer reward?", "Claim Reward&Close")
    else
        doSendDialogNpc(cid, getNpcCid(), greeting .. " This pier's a mess. Bring me " .. CLEANUP_GOAL .. " bits o' trash and I'll owe ye.", "Close")
    end
    return true
end


function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end
    local player = Player(cid)

    if msgcontains(msg, "Claim Reward") then
        player:setStorageValue(CLEANUP_STORAGE, -1) -- Reset cleanup
        DeadfinRepLib.addReputation(player, 2) -- +2 rep each cleanup completed
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You feel like a real Deadfin citizen now!")
        doSendDialogNpcClose(cid)
        npcHandler:unGreet(cid)

    elseif msgcontains(msg:lower(), "close") then
        doSendDialogNpcClose(cid)
        npcHandler:unGreet(cid)
    end

    return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
