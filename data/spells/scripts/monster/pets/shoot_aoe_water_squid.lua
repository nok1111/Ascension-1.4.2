local area = createCombatArea{
    {0, 1, 0},
    {1, 3, 1},
    {0, 1, 0}
}

local function calculateAverage(owner)
    local level = owner:getPetLevel()
    local a = 2.016
    local b = 1.749
    return (level^a + level^b) / 2
end

function onCastSpell(cid, variant)
    local creature = Creature(cid)
    if not creature then return false end

    local owner = creature:getMaster()
    if not owner then return false end

    local target = owner:getTarget()
    if not target then return false end

    local averageDamage = calculateAverage(owner)
    local min = averageDamage * 0.9  -- Adjusting to make a range
    local max = averageDamage * 1.1

    creature:getPosition():sendDistanceEffect(target:getPosition(), 113)
    doAreaCombatHealth(owner:getId(), COMBAT_ENERGYDAMAGE, target:getPosition(), area, -min, -max, 241)
    
    local squidLines = {
        "Let's go for a swim!",
        "I'm a cute little squid!",
        "Watch me squirt ink!",
        "I'm an ink-credible pet!",
        "Swim with me, master!",
        "I'm a squid-tastic friend!",
        "Look at my squiggly tentacles!",
        "I'll squirt away any troubles!",
        "Squid hugs for everyone!",
        "I'm a master of ink and inkling!",
        "Catch me if you can!",
        "I'm as happy as a squid in water!",
    }

    -- Select a random line from the squidLines array
    local randomLine = squidLines[math.random(#squidLines)]
    
    -- Define the chance for the pet to say the line (30%)
    local chanceToSay = math.random(1, 100)
    if chanceToSay <= 30 then
        -- Make the squid pet say the selected line
        creature:say(randomLine, TALKTYPE_SAY)
    end
    
    return true
end
