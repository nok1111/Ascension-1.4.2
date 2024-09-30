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
    local owner = cid:getMaster()
    if not owner then return false end

    local averageDamage = calculateAverage(owner)
    local min = averageDamage * 0.9  -- Adjusting to make a range
    local max = averageDamage * 1.1

    doAreaCombatHealth(owner:getId(), COMBAT_ENERGYDAMAGE, owner:getTarget():getPosition(), area, -min, -max, 298)
    return true
end
