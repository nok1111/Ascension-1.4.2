local function calculateAverage(owner)
    local level = owner:getPetLevel()
    local a = 2.016
    local b = 1.749
    return (level^a + level^b) / 2
end

function onCastSpell(creature, var)
    local owner = creature:getMaster()
    if not owner then return false end
    local averageDamage = calculateAverage(owner)

       	local resistl_lines = {
   "Toughening you up, one buff at a time!",
	"Now you're as strong as me, well, almost!",
	"Put on your magic armor, we gave it a boost!",
	"You're extra tough now, go get 'em!",
	"Shields up! You're super protected!",
	"Wrapping you in a cozy, resistant hug!",
	"Buffed and beautiful, ready to rumble!",
	"I've got your back, and your front, all buffed up!",
	"Extra shields, coming right up!",
	"Making sure you're the toughest cookie!",

}

-- Select a random line from the resistl_lines array
local randomLine = resistl_lines[math.random(#resistl_lines)]

-- Make the specter pet say the selected line
creature:say(randomLine, TALKTYPE_SAY)
    
    local t = 10 * 1000  -- Duration for the condition
    local resistanceIncrease = math.floor(averageDamage)  -- Convert average to an integer value

    local condition = Condition(CONDITION_ATTRIBUTES)
    condition:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
    condition:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.petphysicalresist)
    condition:setParameter(CONDITION_PARAM_TICKS, t)
    condition:setParameter(CONDITION_PARAM_SKILL_SHIELD, resistanceIncrease / 3)  -- Assuming physical damage reduction is tied to shielding skill

    owner:removeCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, ConditionsSubIds.petphysicalresist)
    owner:addCondition(condition)
    owner:setStorageValue(5, resistanceIncrease / 3)

    owner:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Physical damage reduction increased by " .. resistanceIncrease .. " for 10 secs.")
    owner:sendAddBuffNotification(22, 10, 'Physical damage resistance by: ' .. resistanceIncrease / 3, 3, 0)
    
    return true
end
