function onCastSpell(cid, variant)
    local fromPos = cid:getPosition()
    local owner = cid:getMaster()
    local target = owner:getTarget()
    local targetposition = target:getPosition()

    -- Use the new formula for calculating average damage
    local function calculateAverage(owner)
        local level = owner:getPetLevel()
        local a = 2.016
        local b = 1.749
        return (level^a + level^b) / 2
    end

    local averageDamage = calculateAverage(owner)
    local minDamage = averageDamage * 0.95  -- Adjust the minimum damage based on average
    local maxDamage = averageDamage * 1.05  -- Adjust the maximum damage based on average

    fromPos:sendDistanceEffect(targetposition, 154)  -- Keeping the original distance effect
    doAreaCombatHealth(owner:getId(), COMBAT_ENERGYDAMAGE, target:getPosition(), {1}, -minDamage, -maxDamage, 222)  -- Applying the calculated damage range
    return true
end
