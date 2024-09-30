local area = createCombatArea{
    {1, 1, 1},
    {1, 3, 1},
    {1, 1, 1}
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

    local averageDamage = calculateAverage(owner)
    local min = averageDamage * 0.9  -- Adjusting to make a range
    local max = averageDamage * 1.1

    local position = creature:getPosition()
    position:sendMagicEffect(301)
    doAreaCombatHealth(owner:getId(), COMBAT_ENERGYDAMAGE, creature:getPosition(), area, -min, -max, 0)
    return true
end
