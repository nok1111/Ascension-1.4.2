function onCastSpell(cid, variant)
    local owner = cid:getMaster()
    local target = owner:getTarget()

    -- Adjusted function to calculate average damage
    local function calculateAverage(owner)
        local level = owner:getPetLevel()
        local a = 2.016
        local b = 1.749
        return (level^a + level^b) / 2
    end

    local averageDamage = calculateAverage(owner)
    local minDamage = averageDamage * 0.95  -- Adjust the minimum damage based on average
    local maxDamage = averageDamage * 1.05  -- Adjust the maximum damage based on average

    local specs = Game.getSpectators(target:getPosition(), false, false, 3, 3, 3, 3)
    if #specs > 0 then
        for i = 1, #specs do
            if specs[i]:isMonster() then
                -- Using sendDistanceEffect and sendMagicEffect with adjusted damage calculation
                cid:getPosition():sendDistanceEffect(specs[i]:getPosition(), 127)
                specs[i]:getPosition():sendMagicEffect(219)
                doAreaCombatHealth(owner:getId(), COMBAT_PHYSICALDAMAGE, specs[i]:getPosition(), {1}, -minDamage, -maxDamage, CONST_ME_HITAREA)
            end
        end
    end
		
    cid:say("Gust of wind!", TALKTYPE_SAY)
    
    return true
end
