
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink()                     npcHandler:onThink()                     end
function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)	        end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)	    end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg)	end


function greetCallback(cid)
    local player = Player(cid)
    if player:getStorageValue(40123) == TASK_COMPLETED then
        doSendDialogNpc(cid, getNpcCid(), "You're not the first to come through the Scorched Dunes... but most don't return. East of here, by the broken caravan, something watches. Find it.", "quests&rewards&close")
    elseif player:getStorageValue(40121) == TASK_COMPLETED then
        doSendDialogNpc(cid, getNpcCid(), "You're not the first to come through the Scorched Dunes... but most don't return. East of here, by the broken caravan, something watches. Find it.", "quests&rewards&close")
     elseif player:getStorageValue(40119) == TASK_COMPLETED then
        doSendDialogNpc(cid, getNpcCid(), "You're not the first to come through the Scorched Dunes... but most don't return. East of here, by the broken caravan, something watches. Find it.", "quests&rewards&close")
    else
        doSendDialogNpc(cid, getNpcCid(), "You hear them, don’t you? Beneath the sands. The wyrms have begun to stir... and they do not stir without reason.", "quests&rewards&close")
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