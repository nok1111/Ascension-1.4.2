local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- Constants
local STORAGE_QUEST = Mainquest.SheepHerding -- Matches your quest storage ID
local SHEEP_NEEDED = 4      -- From your quest config

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function greetCallback(cid)
    local player = Player(cid)
    if not player then return false end
    
    local progress = player:getStorageValue(STORAGE_QUEST)
    
    if progress < 1 then
        -- Before quest acceptance
        doSendDialogNpc(cid, getNpcCid(), 
            "Psst, " .. player:getName() .. ". You look like someone who appreciates... *creative livestock acquisition*. "..
            "How'd you like to 'rehome' some 'stray' sheep? No shepherds, no problems. *Wink*.", 
            "details&notrust&close")
            
    elseif progress >= 1 and progress < SHEEP_NEEDED then
        -- During quest
        doSendDialogNpc(cid, getNpcCid(), 
            "You've 'persuaded' " .. progress .. "/" .. SHEEP_NEEDED .. " sheep so far. "..
            "Remember: If anyone asks, they FOLLOWED you willingly.", 
            "reminder&close")
            
    else
        -- Quest complete
        doSendDialogNpc(cid, getNpcCid(), 
            "Beautiful work! Those woolly idiots are already forgetting their old farm. "..
            "Here's your pay - and this *totally legitimate* sheep ownership permit. *Cough*.", 
            "close")
    end
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end
    
    local player = Player(cid)
    if not player then return false end

    local npcName = npcHandler:getNpcName()
    updateStateTaskListByNpcName(npcName, player)
    local taskList = getTaskListByNpcName(npcName, player)
    local completeTask = getCompleteForPrizeTaskList(npcName, player)
    
    if msgcontains(msg, "details") then
    doSendDialogNpc(cid, getNpcCid(), 
        "Baaartholomew's sheep 'escaped' into the northern fields. *Convenient, right?* "..
        "Just push 4 of those woolly idiots into our camp. "..
        "Pro tip: They move faster if you pretend to be a wolf. Or Baaartholomew with treats. "..
        "*Not that I'm suggesting impersonation...*", 
            "quests&rewards&close")
            
    elseif msgcontains(msg, "notrust") then
        doSendDialogNpc(cid, getNpcCid(), 
            "Smart. You're right not to trust me. But trust THIS - "..
            "I pay better than farmers, and there's zero moral dilemmas if you don't think about it.", 
            "details&close")
            
    elseif msgcontains(msg, "quests") then
        sendTaskList(player, taskList, true, false)
    elseif msgcontains(msg, "rewards") then
        sendTaskList(player, completeTask, true, true)
            
    elseif msgcontains(msg, "reminder") then
        doSendDialogNpc(cid, getNpcCid(), 
            "Pro tip: Sheep hate water. Use the creek to herd them toward camp. "..
            "Also, Baaartholomew wears earplugs - shouting distance is safe.", 
            "quests&rewards&close")
            
    elseif msgcontains(msg, "close") then
        npcHandler:unGreet(cid)
        doSendDialogNpcClose(cid)
    end
    
    return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())