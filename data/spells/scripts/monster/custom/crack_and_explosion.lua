local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE) -- Initial rupture damage
combat:setParameter(COMBAT_PARAM_EFFECT, 10)

local fireCombat = Combat()
fireCombat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE) -- Secondary explosion damage
fireCombat:setParameter(COMBAT_PARAM_EFFECT, 7)

-- Function to generate a natural, spaced-out crack pattern
local function getCrackPositions(center, maxLength, branches)
    local positions = {}
    local usedPositions = {}

    local directions = {
        {-2, 0}, {2, 0}, {0, -2}, {0, 2}, -- espacio Left, Right, Up, Down
        {-2, -2}, {2, 2}, {-2, 2}, {2, -2} -- espacio diagonal directions
    }

    for b = 1, branches do
        local pos = Position(center.x, center.y, center.z)
        for i = 1, maxLength do
            local dir = directions[math.random(#directions)]
            local newPos = Position(pos.x + dir[1], pos.y + dir[2], pos.z)

            
            local tooClose = false
            for _, existingPos in ipairs(positions) do
                if math.abs(existingPos.x - newPos.x) < 2 and math.abs(existingPos.y - newPos.y) < 2 then
                    tooClose = true
                    break
                end
            end

            if not tooClose and not usedPositions[newPos.x .. "," .. newPos.y] then
                table.insert(positions, newPos)
                usedPositions[newPos.x .. "," .. newPos.y] = true
                pos = newPos -- Move forward to next step
            end

            if math.random(1, 5) == 1 then break end
        end
    end

    return positions
end

local function triggerEruption(creatureId, crackPositions)
    local creature = Creature(creatureId)
    if not creature then return end

    for _, pos in ipairs(crackPositions) do
        fireCombat:execute(creature, Variant(pos)) -- Fire erupts
    end
end

function onCastSpell(creature, variant)
    local casterPos = creature:getPosition()
    local maxLength = 10 -- Maximum spread distance
    local branches = 5 -- More chaotic branching
    local crackPositions = getCrackPositions(casterPos, maxLength, branches)

        
    for _, pos in ipairs(crackPositions) do
        combat:execute(creature, Variant(pos))
       -- pos:sendMagicEffect(575)

    end


    addEvent(triggerEruption, 1000, creature:getId(), crackPositions)

    return true
end




