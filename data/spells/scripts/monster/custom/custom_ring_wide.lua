local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)


local function isValidPosition(pos)
    return pos.x >= 0 and pos.y >= 0 and pos.z >= 0
end

-- Larger ring positions (2 tiles away)
local function getRingPositions(center)
    local positions = {}

    -- Manually calculate each position for clarity and debug
    local potentialPositions = {
        {x = center.x - 2, y = center.y - 2, z = center.z}, -- top-left
        {x = center.x - 1, y = center.y - 2, z = center.z}, -- top-left mid
        {x = center.x, y = center.y - 2, z = center.z},     -- top
        {x = center.x + 1, y = center.y - 2, z = center.z}, -- top-right mid
        {x = center.x + 2, y = center.y - 2, z = center.z}, -- top-right
        {x = center.x + 2, y = center.y - 1, z = center.z}, -- right-top mid
        {x = center.x + 2, y = center.y, z = center.z},     -- right
        {x = center.x + 2, y = center.y + 1, z = center.z}, -- right-bottom mid
        {x = center.x + 2, y = center.y + 2, z = center.z}, -- bottom-right
        {x = center.x + 1, y = center.y + 2, z = center.z}, -- bottom-right mid
        {x = center.x, y = center.y + 2, z = center.z},     -- bottom
        {x = center.x - 1, y = center.y + 2, z = center.z}, -- bottom-left mid
        {x = center.x - 2, y = center.y + 2, z = center.z}, -- bottom-left
        {x = center.x - 2, y = center.y + 1, z = center.z}, -- left-bottom mid
        {x = center.x - 2, y = center.y, z = center.z},     -- left
        {x = center.x - 2, y = center.y - 1, z = center.z}  -- left-top mid
    }

    -- Validate positions
    for _, pos in ipairs(potentialPositions) do
        if isValidPosition(pos) then
            table.insert(positions, Position(pos.x, pos.y, pos.z))
        end
    end

    return positions
end

-- Delayed spell cast for each position
local function castRingSpell(creatureId, positions, index)

    local creature = Creature(creatureId)
    if not creature then
        return
    end

    if index > #positions then
        return -- Finish the loop
    end

    local targetPosition = positions[index]
    if Tile(targetPosition) then
        combat:execute(creature, Variant(targetPosition))
    end

    -- Schedule the next cast
    addEvent(castRingSpell, 150, creatureId, positions, index + 1)
end

function onCastSpell(creature, variant)
    local centerPosition = creature:getPosition()
    local positions = getRingPositions(centerPosition)


    castRingSpell(creature:getId(), positions, 1)
    return true
end
