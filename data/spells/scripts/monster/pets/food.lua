

function onCastSpell(creature, var)
local master = creature:getMaster()
local pet = master:getPet()
local owner = creature:getMaster()

	Game.sendAnimatedText(tostring(pet.name)..': food share!', creature:getPosition(), TEXTCOLOR_YELLOW)
	local min = owner:getPetLevel()
	
local t = min 
local condition = owner:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
	if condition and math.floor(condition:getTicks() / 1000 + (t * 12)) >= 1200 then
		local fedtime = math.floor(condition:getTicks() / 1000 + (t * 12))
		owner:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are full.')
		owner:sendAddBuffNotification(14, 20, 'Fed state: ' .. fedtime .. ' / 1200', 3, 0)
		return true
	end

	owner:feed(t * 12)
	owner:say("yum yum.", TALKTYPE_MONSTER_SAY)
	local fedtime = math.floor(condition:getTicks() / 1000 + (t * 12))
	 -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    owner:sendAddBuffNotification(14, 20, 'Fed state: ' .. fedtime .. ' / 1200', 3, 0)
	return true
end