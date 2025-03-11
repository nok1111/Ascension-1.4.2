local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = 'Hello there, adventurer! Would you like to become a blacksmith just like me?!'} }
npcHandler:addModule(VoiceModule:new(voices))

function greetCallback(cid)
    doSendDialogNpc(cid, getNpcCid(), "Hi adventurer!, are you interested in some of my wares or perhaps you would like to become a blacksmith just like me?", "Trade&Blacksmith&close")
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
   elseif msgcontains(msg:lower(), "Blacksmith") then
	 local message = "Blacksmithing is a profession and is the art of forging items out of metals, minerals, and other trade goods.\nBlacksmiths utilize bars of metal unearthed and smelted by the mining professionalong with various trade and magical goods to produce their wares.\n\nDo you want to become a Blacksmith?"
	doSendDialogNpc(cid, getNpcCid(), message, "Yes&No")
   elseif msgcontains(msg:lower(), "Yes") then

		local message = "Ok, so be it, welcome to the Blacksmiths Guild.\nthere is still a long road to master this art.\nGood Luck!."
		ProfessionSystem:setProfessionId(player, SKILL_BLACKSMITH)
		ProfessionSystem:sendJobs(player)
		player:addItem(2553, 1)	
		
		if player:getStorageValue(Mainquest.learncrafting) ~= 1  then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Introduction to Crafting completed.')
		player:setStorageValue(Mainquest.learncrafting, 1)
		player:sendExtendedOpcode(75, "-Crafting- Are you interested in crafting items to help you on your adventure? Look no further than our crafting system! With four different crafting jobs to choose from Blacksmith, Enchanting, Alchemy, and Cooking you can create a wide variety of useful items. As a Blacksmith, you'll be able to craft weapons and armor using metal ores and other materials. Enchanting allows you to imbue your weapons and armor with magical properties to give you an edge in combat. With Alchemy, you can create potions and other consumable items that provide various benefits. And with Cooking, you can whip up delicious meals that provide temporary buffs to your character's stats. So choose your crafting job wisely and start creating!!-/images/sendmessage/2")
	
		end
		
		
	doSendDialogNpc(cid, getNpcCid(), message, "close")
	elseif msgcontains(msg:lower(), "No") then
	doSendDialogNpc(cid, getNpcCid(), "Hi adventurer!, are you interested in some of my wares or perhaps you would like to become a blacksmith just like me?", "Trade&Blacksmith&close")
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


