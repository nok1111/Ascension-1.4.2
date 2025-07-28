local function calculateAverage(owner)
    local level = owner:getPetLevel()
    local a = 2.016
    local b = 1.749
    return (level^a + level^b) / 2
end

function onCastSpell(creature, var)
    local owner = creature:getMaster()
    if not owner then return false end
    local averageDamageReduction = calculateAverage(owner)

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
    
    local t = 7 * 1000  -- Duration for the condition
    local resistanceIncrease = math.floor(averageDamageReduction)  -- Convert average to an integer value

    local condition = Condition(CONDITION_ATTRIBUTES)
    condition:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
    condition:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.petfireresist)
    condition:setParameter(CONDITION_PARAM_TICKS, t)
    -- Assuming elemental damage reduction is tied to a specific skill or attribute; this line needs to be adjusted accordingly
    condition:setParameter(CONDITION_PARAM_ELEMENTALDAMAGEREDUCTION, resistanceIncrease)  

    owner:removeCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, ConditionsSubIds.petfireresist)
    owner:addCondition(condition)
    owner:setStorageValue(5, resistanceIncrease)

    owner:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Elemental damage reduction increased by " .. resistanceIncrease .. " for 7 secs.")
    owner:sendAddBuffNotification(2, 7, 'Elemental damage reduction by: ' .. resistanceIncrease, 3, 0)
    
    return true
end
