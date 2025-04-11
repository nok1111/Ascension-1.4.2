local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 18)


-- Directions: [dx, dy]
local directionOffsets = {
    [DIRECTION_NORTH] = {x = 0, y = -1},
    [DIRECTION_SOUTH] = {x = 0, y = 1},
    [DIRECTION_EAST]  = {x = 1, y = 0},
    [DIRECTION_WEST]  = {x = -1, y = 0}
}

-- Shoot animated missiles one tile at a time
local function shootBeam(creatureId, positions, index)
    local creature = Creature(creatureId)
    if not creature or index > #positions then return end

    local fromPos = creature:getPosition()
    local toPos = positions[index]
    fromPos:sendDistanceEffect(toPos, 112)
    toPos:sendMagicEffect(435)
    addEvent(shootBeam, 150, creatureId, positions, index + 1)
end

-- After delay, apply damage to all positions
local function triggerBeamDamage(creatureId, positions)
    local creature = Creature(creatureId)
    if not creature then return end

    for _, pos in ipairs(positions) do
        combat:execute(creature, Variant(pos))
        pos:sendMagicEffect(435)
        --Position(pos.x + 1, pos.y + 1, pos.z):sendMagicEffect(434)
    end
end

-- Get straight-line beam positions
local function getBeamPositions(startPos, direction, length)
    local positions = {}
    local offset = directionOffsets[direction]
    local pos = Position(startPos)

    for i = 1, length do
        pos = Position(pos.x + offset.x, pos.y + offset.y, pos.z)
        table.insert(positions, pos)
    end

    return positions
end

function onCastSpell(creature, variant)
    local casterPos = creature:getPosition()
    local direction = creature:getDirection()
    local length = 5

    local beamPositions = getBeamPositions(casterPos, direction, length)

    -- Step 1: Animate missile beam
    shootBeam(creature:getId(), beamPositions, 1)

    -- Step 2: After 1.5s, apply damage to all positions
    addEvent(triggerBeamDamage, 1500, creature:getId(), beamPositions)

    return true
end
