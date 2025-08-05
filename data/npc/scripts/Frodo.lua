local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = 'Come and taste our best dishes! learn Cooking with the best chef in town!'} }
npcHandler:addModule(VoiceModule:new(voices))


function greetCallback(cid)
    doSendDialogNpc(cid, getNpcCid(), "Hi adventurer!, are you interested in some of my wares?", "Trade&close")
  return true             
end


function creatureSayCallback(cid, type, msg)
  if not npcHandler:isFocused(cid) then
    return false
  end
  local player = Player(cid)
		
  if msgcontains(msg:lower(), "Trade") then
    npcHandler:addModule(FocusModule:new())
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
-------------********-----------------------********************--------------
