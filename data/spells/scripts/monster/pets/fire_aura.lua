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
    local owner = cid:getMaster()
    if not owner then return false end
    
    local averageDamage = calculateAverage(owner)
    local minDamage = averageDamage * 0.9 -- 90% of average as minimum
    local maxDamage = averageDamage * 1.1 -- 110% of average as maximum

    doAreaCombatHealth(owner:getId(), COMBAT_ENERGYDAMAGE, cid:getPosition(), area, -minDamage, -maxDamage, 16)
    return true
end
