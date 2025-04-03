local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 396)

local paralyze = Condition(CONDITION_PARALYZE)
paralyze:setParameter(CONDITION_PARAM_TICKS, 8000)
paralyze:setParameter(CONDITION_PARAM_SPEED, -10000) -- Set to a high negative value to ensure immobilization

local function getCirclePositions(center, radius)
    local positions = {}

    for x = -radius, radius do
        for y = -radius, radius do
            if (x * x + y * y) <= (radius * radius) then -- circle formula
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

    local positions = getCirclePositions(center, radius)

    -- Send magic effect first
    for _, pos in ipairs(positions) do
        pos:sendMagicEffect(572)
    end

    -- Apply damage after a slight delay to ensure effects are seen first
    addEvent(function()
        for _, pos in ipairs(positions) do
            if Tile(pos) then
                combat:execute(creature, Variant(pos))
            end
        end
    end, 1000) -- 100ms delay to show effects first

    -- Schedule the next wave
    addEvent(castWave, 2000, creatureId, center, radius + 1, maxRadius)
end

function onCastSpell(creature, variant)
    creature:say("Gorathh vor ulka!", TALKTYPE_MONSTER_SAY)
    creature:addCondition(paralyze) -- Apply the paralyze effect
    local center = creature:getPosition()
    local maxRadius = 4
    castWave(creature:getId(), center, 1, maxRadius)
    return true
end

