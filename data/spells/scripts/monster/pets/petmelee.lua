local function calculateAverage(owner)
    local level = owner:getPetLevel()
    local a = 2.016
    local b = 1.749
    return (level^a + level^b) / 2
end

function onCastSpell(cid, variant)
    local owner = cid:getMaster()
    local target = owner:getTarget()

    if not target then
        -- Handle the case where there is no target
        return false -- Could return false to indicate spell failure or true if you want to ignore silently
    end

    -- Calculate average damage based on the pet's level
    local averageDamage = calculateAverage(owner)
    
    -- Adjust minimum and maximum damage based on the average
    local min = averageDamage * 0.9 -- Assuming min damage to be 90% of average
    local max = averageDamage * 1.1 -- Assuming max damage to be 110% of average
	
    -- Execute the combat function on the target's position
    doAreaCombatHealth(owner:getId(), COMBAT_PHYSICALDAMAGE, target:getPosition(), {1}, -min, -max, CONST_ME_HITAREA)
    return true
end
