local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- Constants
local STORAGE_PROGRESS = Mainquest.chickenscaught
local STORAGE_COMPLETION = 40100
local BROOM_ID = 2324

-- Dialog states
local DIALOG_STATE = {
    MAIN = 0,
    TREATS = 1,
    BROOM = 2,
    UNION = 3
}

-- Basic NPC handlers
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

-- Store dialog state per player
local dialogState = {}

function greetCallback(cid)
    local player = Player(cid)
    if not player then return false end
    
    dialogState[cid] = DIALOG_STATE.MAIN
    
    local message, options
    if player:getStorageValue(STORAGE_COMPLETION) == 1 then
        message = "Cluck you for completing the quest! *ahem* I mean... thank you!"
        options = "close"
    elseif player:getStorageValue(STORAGE_PROGRESS) >= 1 then
        message = string.format("Still clucking around? You\'ve caught %d/10 chickens!", 
                              math.min(player:getStorageValue(STORAGE_PROGRESS), 10))
        options = "treats&quests&rewards&close"
    else
        message = "CLUCK-CLUCK-CLUCK! *clears throat* Sorry... the chickens unionized!"
        options = "treats&quests&rewards&close"
    end
    
    doSendDialogNpc(cid, getNpcCid(), message, options)
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
    
    -- Handle back button
    if msgcontains(msg, "back") then
        if dialogState[cid] == DIALOG_STATE.TREATS then
            greetCallback(cid)
        elseif dialogState[cid] == DIALOG_STATE.BROOM then
            dialogState[cid] = DIALOG_STATE.TREATS
            doSendDialogNpc(cid, getNpcCid(),
                "They want organic corn feed! I\'ll give you some if you help...\n"..
                "Use the broom to gently herd them. But careful - they'll spit if angry!",
                "broom&back&close")
        elseif dialogState[cid] == DIALOG_STATE.UNION then
            dialogState[cid] = DIALOG_STATE.BROOM
            if player:getItemCount(BROOM_ID) == 0 then
                doSendDialogNpc(cid, getNpcCid(),
                    "Here\'s my spare broom. Don\'t whack them - just gentle sweeps!\n"..
                    "Remember: 1. Approach slowly 2. Use broom 3. Offer treats",
                    "union&back&close")
            else
                doSendDialogNpc(cid, getNpcCid(),
                    "You already have a broom! Use it on those cluckers!\n"..
                    "The union chickens are the ones with red bandanas.",
                    "union&back&close")
            end
        end
        return true
    end
    
    -- Handle options progression
    if msgcontains(msg, "treats") then
        dialogState[cid] = DIALOG_STATE.TREATS
        doSendDialogNpc(cid, getNpcCid(),
            "They want organic corn feed! I'll give you some if you help...\n"..
            "Use the broom to gently herd them. But careful - they'll spit if angry!",
            "broom&back&close")
            
    elseif msgcontains(msg, "broom") then
        dialogState[cid] = DIALOG_STATE.BROOM
        if player:getItemCount(BROOM_ID) == 0 then
            player:addItem(BROOM_ID, 1)
            doSendDialogNpc(cid, getNpcCid(),
                "Here's my spare broom. Don't whack them - just gentle sweeps!\n"..
                "Remember: 1. Approach slowly 2. Use broom 3. Offer treats",
                "union&back&close")
        else
            doSendDialogNpc(cid, getNpcCid(),
                "You already have a broom! Use it on those cluckers!\n"..
                "The union chickens are the ones with red bandanas.",
                "union&back&close")
        end
        
    elseif msgcontains(msg, "union") then
        dialogState[cid] = DIALOG_STATE.UNION
        doSendDialogNpc(cid, getNpcCid(),
            "They formed the 'United Poultry Workers Local 42'...\n"..
            "Demands:\n- 8 hour work days\n- Free-range benefits\n- Worm bonuses\n"..
            "Just catch 10 and I'll handle negotiations!",
            "back&close")
            
    elseif msgcontains(msg, "quests") then
        sendTaskList(player, taskList, true, false)
    elseif msgcontains(msg, "rewards") then
        sendTaskList(player, completeTask, true, true)
            
    elseif msgcontains(msg, "close") then
        dialogState[cid] = nil
        npcHandler:unGreet(cid)
        doSendDialogNpcClose(cid)
    end
    
    return true
end

-- Configure NPC
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())