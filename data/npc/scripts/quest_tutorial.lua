local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onThink()                     npcHandler:onThink()                     end
function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)	        end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)	    end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg)	end


function greetCallback(cid)
    doSendDialogNpc(cid, getNpcCid(), "Hi adventurer!, Welcome to Garona, I havent seen you here before, lets start with the basics!.", "quests&rewards&close")
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
	player:sendExtendedOpcode(75, "-Quest List- Welcome to the game! To get started on your adventure, be sure to look for the Quest List option. This feature will provide you with a list of available quests for you to complete. Quests are tasks or missions that you can undertake to earn rewards and advance in the game. They can range from simple to complex, and often involve exploring different areas, defeating enemies, or solving puzzles. So be sure to check out the Quest List regularly to see what new challenges await you!-/images/sendmessage/1")
	
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