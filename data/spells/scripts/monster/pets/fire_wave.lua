function onCastSpell(cid, variant)
    local owner = cid:getMaster()
    local target = owner:getTarget()
    local pettarget = cid:getTarget()

    if not (owner and target and pettarget) then
        return false
    end

    local function calculateAverage(owner)
        local level = owner:getPetLevel()
        local a = 2.016
        local b = 1.749
        return (level^a + level^b) / 2
    end

    local averageDamage = calculateAverage(owner)
    local minDamage = averageDamage * 0.9 -- 90% of average as minimum
    local maxDamage = averageDamage * 1.4 -- 110% of average as maximum

    -- Get the position and direction the creature is facing
    local cidPos = cid:getPosition()
    local direction = cid:getDirection()
    
    -- Calculate the positions for the T-form areas
    local positions = {}
    if direction == NORTH then
        positions = {
            Position(cidPos.x - 1, cidPos.y - 1, cidPos.z),
            Position(cidPos.x, cidPos.y - 1, cidPos.z),
            Position(cidPos.x + 1, cidPos.y - 1, cidPos.z),
            Position(cidPos.x, cidPos.y - 2, cidPos.z)
        }
    elseif direction == SOUTH then
        positions = {
            Position(cidPos.x - 1, cidPos.y + 1, cidPos.z),
            Position(cidPos.x, cidPos.y + 1, cidPos.z),
            Position(cidPos.x + 1, cidPos.y + 1, cidPos.z),
            Position(cidPos.x, cidPos.y + 2, cidPos.z)
        }
    elseif direction == WEST then
        positions = {
            Position(cidPos.x - 1, cidPos.y - 1, cidPos.z),
            Position(cidPos.x - 1, cidPos.y, cidPos.z),
            Position(cidPos.x - 1, cidPos.y + 1, cidPos.z),
            Position(cidPos.x - 2, cidPos.y, cidPos.z)
        }
    elseif direction == EAST then
        positions = {
            Position(cidPos.x + 1, cidPos.y - 1, cidPos.z),
            Position(cidPos.x + 1, cidPos.y, cidPos.z),
            Position(cidPos.x + 1, cidPos.y + 1, cidPos.z),
            Position(cidPos.x + 2, cidPos.y, cidPos.z)
        }
    end

    -- Perform area combat in the calculated positions
    for _, pos in ipairs(positions) do
        doAreaCombatHealth(owner:getId(), COMBAT_ENERGYDAMAGE, pos, 0, -minDamage, -maxDamage, 480)
    end
    
    return true
end
