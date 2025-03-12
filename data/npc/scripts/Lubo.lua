local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = 'Stop by and rest a while, tired adventurer! Have a look at my wares!'} }
npcHandler:addModule(VoiceModule:new(voices))

function greetCallback(cid)
    doSendDialogNpc(cid, getNpcCid(), "Hi adventurer!, Stop by and rest a while, tired adventurer! Have a look at my wares!", "Trade&close")
  return true             
end


function creatureSayCallback(cid, type, msg)
  if not npcHandler:isFocused(cid) then
    return false
  end
  local player = Player(cid)
		
  if msgcontains(msg:lower(), "Trade") then
    local message = ""
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