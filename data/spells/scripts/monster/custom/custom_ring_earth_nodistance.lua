local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 255)


local function isValidPosition(pos)
    return pos.x >= 0 and pos.y >= 0 and pos.z >= 0
end

-- Larger ring positions (1 tile away)
local function getRingPositions(center)
    local positions = {}

    local potentialPositions = {
    {x = center.x - 1, y = center.y - 1, z = center.z}, -- top-left
    {x = center.x, y = center.y - 1, z = center.z},     -- top
    {x = center.x + 1, y = center.y - 1, z = center.z}, -- top-right
    {x = center.x + 1, y = center.y, z = center.z},     -- right
    {x = center.x + 1, y = center.y + 1, z = center.z}, -- bottom-right
    {x = center.x, y = center.y + 1, z = center.z},     -- bottom
    {x = center.x - 1, y = center.y + 1, z = center.z}, -- bottom-left
    {x = center.x - 1, y = center.y, z = center.z}      -- left
}


    -- Validate 
    for _, pos in ipairs(potentialPositions) do
        if isValidPosition(pos) then
            table.insert(positions, Position(pos.x, pos.y, pos.z))
        end
    end

    return positions
end


local function castRingSpell(creatureId, positions, index)

    local creature = Creature(creatureId)
    if not creature then
        return
    end

    if index > #positions then
        return 
    end

    local targetPosition = positions[index]
    if Tile(targetPosition) then
        combat:execute(creature, Variant(targetPosition))
    end

    addEvent(castRingSpell, 150, creatureId, positions, index + 1)
end

function onCastSpell(creature, variant)
    local centerPosition = creature:getPosition()
    local positions = getRingPositions(centerPosition)


    castRingSpell(creature:getId(), positions, 1)
    return true
end
