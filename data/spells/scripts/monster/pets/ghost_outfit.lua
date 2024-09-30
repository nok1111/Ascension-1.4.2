

function onCastSpell(creature, var)
    local master = creature:getMaster()
    local pet = master:getPet()
    local owner = creature:getMaster()

    local level = owner:getPetLevel()  -- Cap pet level at 10
    local t = level * 2000  -- 5 minutes in milliseconds

    -- Choose outfit based on pet level
    local outfitID = 1887  -- Default outfit ID


    -- Apply outfit condition
    local condition = Condition(CONDITION_OUTFIT)
    condition:setOutfit({lookType = outfitID})
    condition:setTicks(t)
    owner:addCondition(condition)
	owner:getPosition():sendMagicEffect(236)
	
	local specterLines = {
    "I wander in the shadows...",
    "Beware, for I am the harbinger of darkness...",
    "Whispers from beyond guide me...",
    "In the realm of the unseen, I reign supreme...",
    "My presence chills the air...",
    "You cannot escape the specter's gaze...",
    "From the depths of gehenna, I emerge...",
    "Feel the chill of the spectral realm...",
    "I am but a shadow, yet I hold great power...",
    "In the darkness, I find my strength...",
    "The darkness's touch is both cold and deadly...",
    "Fear not the shadows, for they are my domain...",
}

-- Select a random line from the specterLines array
local randomLine = specterLines[math.random(#specterLines)]

-- Make the specter pet say the selected line
creature:say(randomLine, TALKTYPE_SAY)



    return true
end