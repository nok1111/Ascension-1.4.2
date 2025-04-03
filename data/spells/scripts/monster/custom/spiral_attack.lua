local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)

local function getCurvedSpiralPositions(center, maxRadius)
    local positions = {}
    local angleStep = math.pi / 4  
    local currentRadius = 0
    local angle = 0

    while currentRadius <= maxRadius do
        local x = math.floor(center.x + currentRadius * math.cos(angle) + 0.5)
        local y = math.floor(center.y + currentRadius * math.sin(angle) + 0.5)

        local pos = Position(x, y, center.z)
        if not positions[#positions] or (positions[#positions].x ~= pos.x or positions[#positions].y ~= pos.y) then
            table.insert(positions, pos)
        end

        angle = angle + angleStep
        if angle >= 2 * math.pi then
            angle = 0
            currentRadius = currentRadius + 1
        end
    end

    return positions
end

local function castSpiral(creatureId, positions, index)
    local creature = Creature(creatureId)
    if not creature or index > #positions then
        return
    end

    local pos = positions[index]
    if Tile(pos) then
        combat:execute(creature, Variant(pos))
    end

    addEvent(castSpiral, 50, creatureId, positions, index + 1)
end

function onCastSpell(creature, variant)
    local center = creature:getPosition()
    local maxRadius = 4  -- Adjust spiral size
    local positions = getCurvedSpiralPositions(center, maxRadius)

    castSpiral(creature:getId(), positions, 1)
    return true
end
