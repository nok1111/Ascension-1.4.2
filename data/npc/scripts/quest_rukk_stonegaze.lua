
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink()                     npcHandler:onThink()                     end
function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)         end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)      end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end


function greetCallback(cid)
    local player = Player(cid)
    if player:getStorageValue(40129) >= TASK_COMPLETED then
        doSendDialogNpc(cid, getNpcCid(), "Gor'mhaz is gone. Throne is empty no more. You did what was needed. Tribe strong again. No more hiding, no more fear... Now, we face what comes with open eyes and closed fists.", "quests&rewards&close")
     elseif player:getStorageValue(40127) >= TASK_COMPLETED then
        doSendDialogNpc(cid, getNpcCid(), "Good. The weak voices are silenced. Those still clinging to old ways now sleep under the sand. You proved yourself... and paved way for change.", "quests&rewards&close")
    else
        doSendDialogNpc(cid, getNpcCid(), "Outsider. You seek purpose in the desert? We have one for you. Old leader weak. We need new blood.", "quests&rewards&close")
    end
    return true
end

function creatureSayCallback(cid, type, msg)
  if not npcHandler:isFocused(cid) then
    return false
  end
 
  local npcName = npcHandler:getNpcName()
  local player = Player(cid)
    updateStateTaskListByNpcName(npcName, player)
    local taskList = getTaskListByNpcName(npcName, player)
    local completeTask = getCompleteForPrizeTaskList(npcName, player)
    

    if player:getStorageValue(40121) == TASK_START then
     player:setStorageValue(Mainquest.speakrukk, 1)
   end

  if msgcontains(msg:lower(), "quests") then
    local message = ""
    
     sendTaskList(player, taskList, true, false)
    doSendDialogNpcClose(cid)
    npcHandler:unGreet(cid) 
    
  elseif msgcontains(msg:lower(), "rewards") then
     sendTaskList(player, completeTask, true, true)
    doSendDialogNpcClose(cid)
    npcHandler:unGreet(cid)
    elseif msgcontains(msg:lower(), "close") then
    npcHandler:addModule(FocusModule:new())
    doSendDialogNpcClose(cid)
    npcHandler:unGreet(cid) 
  end

  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())