local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = 'Gems and jewellery! learn alquemy with the hottest girl in town!'} }
npcHandler:addModule(VoiceModule:new(voices))


function greetCallback(cid)
    doSendDialogNpc(cid, getNpcCid(), "Hi adventurer!, are you interested in some of my wares or perhaps you would like to become a alchemist just like me?", "Trade&Alchemy&close")
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
   elseif msgcontains(msg:lower(), "Alchemy") then
	 local message = "The alchemist mixes herbs found by Herbalism and reagents in order to concoct elixirs, potions, oils, flasks and cauldrons with a variety of effects. \nA player can create healing, invisibility, elemental resistance and mana potions; oils to coat weapons; and much more.\n\nDo you want to become an Alchemist?"
	doSendDialogNpc(cid, getNpcCid(), message, "Yes&No")
   elseif msgcontains(msg:lower(), "Yes") then

		local message = "Ok, so be it, welcome to the Alchemist Guild.\nthere is still a long road to master this art.\nGood Luck!."
		ProfessionSystem:setProfessionId(player, SKILL_ALCHEMY)
		ProfessionSystem:sendJobs(player)
		if player:getStorageValue(Mainquest.learncrafting) < 1  then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Introduction to Crafting completed.')
		player:setStorageValue(Mainquest.learncrafting, 1)
		player:sendExtendedOpcode(75, "-Crafting- Are you interested in crafting items to help you on your adventure? Look no further than our crafting system! With four different crafting jobs to choose from Blacksmith, Enchanting, Alchemy, and Cooking you can create a wide variety of useful items. As a Blacksmith, you'll be able to craft weapons and armor using metal ores and other materials. Enchanting allows you to imbue your weapons and armor with magical properties to give you an edge in combat. With Alchemy, you can create potions and other consumable items that provide various benefits. And with Cooking, you can whip up delicious meals that provide temporary buffs to your character's stats. So choose your crafting job wisely and start creating!!-/images/sendmessage/2")
	
		end
	doSendDialogNpc(cid, getNpcCid(), message, "close")
	elseif msgcontains(msg:lower(), "No") then
	doSendDialogNpc(cid, getNpcCid(), "Hi adventurer!, are you interested in some of my wares or perhaps you would like to become a alchemist just like me?", "Trade&Alchemy&close")
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
