local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
-- combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE) --can comment this line if dont like the missile effect
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)



local function getWavePositions(center, radius)
    local positions = {}

    for x = -radius, radius do
        for y = -radius, radius do
            if math.abs(x) == radius or math.abs(y) == radius then
                table.insert(positions, Position(center.x + x, center.y + y, center.z))
            end
        end
    end

    return positions
end


local function castWave(creatureId, center, radius, maxRadius)
    local creature = Creature(creatureId)
    if not creature or radius > maxRadius then
        return 
    end

    local positions = getWavePositions(center, radius)
    for _, pos in ipairs(positions) do
        if Tile(pos) then
            combat:execute(creature, Variant(pos))
        end
    end

    addEvent(castWave, 200, creatureId, center, radius + 1, maxRadius)
end

function onCastSpell(creature, variant)
    local center = creature:getPosition()
    local maxRadius = 3 -- Maximum radius of the radial waves
    castWave(creature:getId(), center, 1, maxRadius)
    return true
end
