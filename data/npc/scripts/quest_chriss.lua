local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- Constants
local STORAGE_QUEST = 40103 -- Same as Phil's quest storage

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function greetCallback(cid)
    local player = Player(cid)
    if not player then return false end
    
    if player:getStorageValue(STORAGE_QUEST) >= TASK_COMPLETED then
        doSendDialogNpc(cid, getNpcCid(), 
            "You're a saint for humoring Phil! ...Literally. "..
            "He's doing open-mic nights at the tavern now. Gods help us all.", 
            "rewards&close")
    else
        doSendDialogNpc(cid, getNpcCid(), 
            "Psst, " .. player:getName() .. "! My buddy Phil's having... "..
            "*a crisis*. He thinks he's a comedian now. "..
            "Could you pretend to laugh at his jokes? Just 5 times? "..
            "I'll pay you in homemade pumpkin bread!", 
            "help&why&close")
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

    if msgcontains(msg, "help") then
        doSendDialogNpc(cid, getNpcCid(), 
            "Great! Just say 'haha' after each joke - even if your soul leaves your body. "..
            "If you bail mid-show, he'll cry actual tears. Like, straw-turning-damp crying. "..
            "You'll find him practicing near the cornfield.", 
            "gotit&rewards&close")
            
    elseif msgcontains(msg, "why") then
        doSendDialogNpc(cid, getNpcCid(), 
            "*sigh* It started when crows started MOCKING his scare tactics. "..
            "Now he thinks puns are his 'true calling'. "..
            "Last week he bombed so hard even the TULIPS walked out.", 
            "help&close")
            
    elseif msgcontains(msg, "gotit") then
        player:setStorageValue(STORAGE_QUEST, 0) -- Initialize quest
        doSendDialogNpc(cid, getNpcCid(), 
            "Bless you. Here's some bread in advance - you'll need the carbs. "..
            "Remember: Fake smiles, real suffering.", 
            "quests&rewards&close")

        if player:getStorageValue(Mainquest.chrissbread) < 1 then
            player:addItem(2689,10)
            player:setStorageValue(Mainquest.chrissbread, 1)
        end

     elseif msgcontains(msg, "quests") then
        sendTaskList(player, taskList, true, false)
    elseif msgcontains(msg, "rewards") then
        sendTaskList(player, completeTask, true, true)
            
    elseif msgcontains(msg, "close") then
        npcHandler:unGreet(cid)
        doSendDialogNpcClose(cid)
    end
    
    return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())