

function onCastSpell(creature, var)
    local master = creature:getMaster()
    local pet = master:getPet()
    local owner = creature:getMaster()



	 local fairyLines = {
        "Hey, master! Look at me!",
        "Guess what, dad? I learned a new trick!",
        "Daddy, watch this!",
        "Hey, pops! Check out my magic!",
        "Master, look how fast I can fly!",
        "Daddy-o, wanna play fetch?",
        "Dad, let's go on an adventure!"
    }

    -- Select a random line from the fairyLines array
    local randomLine = fairyLines[math.random(#fairyLines)]

    -- Make the fairy pet say the selected line
    creature:say(randomLine, TALKTYPE_SAY)
   -- Game.sendAnimatedText(tostring(pet.name) .. ":" .. randomLine, creature:getPosition(), TEXTCOLOR_YELLOW)


    local level = owner:getPetLevel()  -- Cap pet level at 10
    local t = 5 * 60 * 1000  -- 5 minutes in milliseconds

    -- Choose outfit based on pet level
    local outfitID = 62  -- Default outfit ID
    -- Modify this condition as needed to select the appropriate outfit
    if level < 3 then
        outfitID = 62  -- Outfit ID for condition 1
    elseif level >= 3 and level < 7 then
        outfitID = 980  -- Outfit ID for condition 2
    else
        outfitID = 423  -- Outfit ID for condition 3
    end

    -- Apply outfit condition
    local condition = Condition(CONDITION_OUTFIT)
    condition:setOutfit({lookType = outfitID})
    condition:setTicks(t)
    owner:addCondition(condition)
	owner:getPosition():sendMagicEffect(13)


    return true
end