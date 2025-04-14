-- Zigzag Wave Spell

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 6)

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
    fromPos:sendDistanceEffect(toPos, 118)
    toPos:sendMagicEffect(270)
    combat:execute(creature, Variant(toPos))
    toPos:sendMagicEffect(256)

    addEvent(shootBeam, 100, creatureId, positions, index + 1)
end


-- Generate zigzag pattern for beam
local function getZigzagPositions(startPos, direction, length)
    local positions = {}
    local offset = directionOffsets[direction]
    local dirX, dirY = offset.x, offset.y
    local zigzagDir = true -- true: left-up, false: right-down

    local currentPos = Position(startPos)

    for i = 1, length do
        currentPos = Position(currentPos.x + dirX, currentPos.y + dirY, currentPos.z)
        table.insert(positions, currentPos)

        local side1, side2
        if direction == DIRECTION_EAST or direction == DIRECTION_WEST then
            side1 = Position(currentPos.x, currentPos.y - 1, currentPos.z)
            side2 = Position(currentPos.x, currentPos.y + 1, currentPos.z)
        else
            side1 = Position(currentPos.x - 1, currentPos.y, currentPos.z)
            side2 = Position(currentPos.x + 1, currentPos.y, currentPos.z)
        end

        if zigzagDir then
            table.insert(positions, side1)
        else
            table.insert(positions, side2)
        end

        zigzagDir = not zigzagDir
    end

    return positions
end

function onCastSpell(creature, variant)
    local casterPos = creature:getPosition()
    local direction = creature:getDirection()
    local length = 6

    local beamPositions = getZigzagPositions(casterPos, direction, length)

    -- Step 1: Animate missile beam
    shootBeam(creature:getId(), beamPositions, 1)

    

    return true
end
