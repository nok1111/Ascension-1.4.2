local function calculateAverage(owner)
    local level = owner:getPetLevel()
    local a = 2.016
    local b = 1.749
    return (level^a + level^b) / 2
end

function onCastSpell(cid, variant)
    local creature = Creature(cid)
    if not creature then return false end
    
    local owner = creature:getMaster()
    if not owner then return false end

    local averageDamage = calculateAverage(owner)
    local min = averageDamage * 0.9  -- Adjusting to make a range
    local max = averageDamage * 1.1

    local cidPos = creature:getPosition()
    local direction = creature:getDirection()

    local positions = {}
    if direction == NORTH then
        positions = {
            Position(cidPos.x, cidPos.y - 1, cidPos.z),
            Position(cidPos.x, cidPos.y - 2, cidPos.z),
            Position(cidPos.x, cidPos.y - 3, cidPos.z)
        }
    elseif direction == SOUTH then
        positions = {
            Position(cidPos.x, cidPos.y + 1, cidPos.z),
            Position(cidPos.x, cidPos.y + 2, cidPos.z),
            Position(cidPos.x, cidPos.y + 3, cidPos.z)
        }
    elseif direction == WEST then
        positions = {
            Position(cidPos.x - 1, cidPos.y, cidPos.z),
            Position(cidPos.x - 2, cidPos.y, cidPos.z),
            Position(cidPos.x - 3, cidPos.y, cidPos.z)
        }
    elseif direction == EAST then
        positions = {
            Position(cidPos.x + 1, cidPos.y, cidPos.z),
            Position(cidPos.x + 2, cidPos.y, cidPos.z),
            Position(cidPos.x + 3, cidPos.y, cidPos.z)
        }
    end

    for _, pos in ipairs(positions) do
        doAreaCombatHealth(owner:getId(), COMBAT_ENERGYDAMAGE, pos, 0, -min, -max, 5)
    end

    local speechLines = {
        "Beep boop! Analyzing surroundings.",
        "Initiating protocol: Assist Master.",
        "Whirr... Processing commands.",
        "System check: All systems operational.",
        "Executing task: Protect and serve.",
        "Error 404: Emotion module not found.",
        "Optimizing efficiency: 100% operational.",
        "Transmission received: Standing by for orders.",
        "Directive received: Engage target.",
        "Initializing combat mode: Target acquired."
    }

    local randomLine = speechLines[math.random(#speechLines)]
    creature:say(randomLine, TALKTYPE_SAY)

    return true
end
