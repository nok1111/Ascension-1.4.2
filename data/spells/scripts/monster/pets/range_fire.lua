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

    -- Adjusting min and max to be more closely tied to the average calculated damage
    local minDamage = averageDamage * 0.9 -- 10% less than the average for minimum damage
    local maxDamage = averageDamage * 1.1 -- 10% more than the average for maximum damage

    -- Perform area combat with the calculated min and max damage values
    doAreaCombatHealth(owner:getId(), COMBAT_ENERGYDAMAGE, owner:getPosition(), area, -minDamage, -maxDamage, 480)
    
    return true
end
