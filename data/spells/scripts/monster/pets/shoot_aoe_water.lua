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
    
    local jellyLines = {
        "I wobble and jiggle!",
        "I'm the wiggliest pet around!",
        "Watch me bounce and squish!",
        "I'm a wibbly-wobbly jelly!",
        "I'm full of wiggly fun!",
        "Squish, squish, squish!",
        "Let's jiggle together!",
        "I'm a wobbly wonder!",
        "Jelly jiggles for everyone!",
        "I wibble and wobble with joy!",
        "Bounce with me, master!",
        "Squishy hugs for everyone!",
    }

    -- Select a random line from the jellyLines array
    local randomLine = jellyLines[math.random(#jellyLines)]
    
    -- Define the chance for the pet to say the line (30%)
    local chanceToSay = math.random(1, 100)
    if chanceToSay <= 30 then
    -- Make the jelly pet say the selected line
        creature:say(randomLine, TALKTYPE_SAY)
    end
    
    return true
end
