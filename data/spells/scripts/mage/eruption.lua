local WAVE_SHAPE = {
    {0, 1, 1, 1, 0},
    {0, 1, 1, 1, 0},
    {0, 1, 1, 1, 0},
    {0, 1, 1, 1, 0},
    {0, 0, 3, 0, 0},
}
local WARNINGEFFECT_ID = 6 -- You can change this to any effect you want
local EFFECT_ID = 7 -- You can change this to any effect you want
local DAMAGE_DELAY = 1500 -- ms

local function getWavePositions(center, dir)
    local positions = {}
    -- Find the center (3) in the shape
    local cx, cy
    for y, row in ipairs(WAVE_SHAPE) do
        for x, val in ipairs(row) do
            if val == 3 then
                cx, cy = x, y
            end
        end
    end
    -- Compute relative positions for each 1 in the shape
    for y, row in ipairs(WAVE_SHAPE) do
        for x, val in ipairs(row) do
            if val == 1 then
                local dx, dy = x - cx, y - cy
                -- Rotate based on player direction
                if dir == DIRECTION_NORTH then
                    -- dx, dy stay
                elseif dir == DIRECTION_EAST then
                    dx, dy = -dy, dx
                elseif dir == DIRECTION_SOUTH then
                    dx, dy = -dx, -dy
                elseif dir == DIRECTION_WEST then
                    dx, dy = dy, -dx
                end
                table.insert(positions, {dx = dx, dy = dy, row = y})
            end
        end
    end
    return positions, cx, cy
end

local function sendWaveEffects(playerId, center, dir)
    local player = Player(playerId)
    if not player then return end
    local positions, cx, cy = getWavePositions(center, dir)
    -- Group by row for sequential animation
    local rowMap = {}
    for _, pos in ipairs(positions) do
        rowMap[pos.row] = rowMap[pos.row] or {}
        table.insert(rowMap[pos.row], pos)
    end
    local function animateRow(rowIdx)
        local row = rowMap[rowIdx]
        if not row then return end
        for _, pos in ipairs(row) do
            local tilePos = Position(center.x + pos.dx, center.y + pos.dy, center.z)
            tilePos:sendMagicEffect(WARNINGEFFECT_ID)
        end
    end
    -- Animate each row with a delay, starting from the row closest to the player (center) and moving outward
    for rowIdx = #WAVE_SHAPE, 1, -1 do
        addEvent(animateRow, (#WAVE_SHAPE-rowIdx)*150, rowIdx)
    end
end



local function applyWaveDamage(playerId, center, dir)
    local player = Player(playerId)
    if not player then return end
    local positions, cx, cy = getWavePositions(center, dir)
    local min, max = 0, 0
    local level = player:getLevel()
    local magic = player:getMagicLevel()
    local skill = player:getEffectiveSkillLevel(SKILL_AXE)
    local attack = getWandAttack(player:getId())
    local power = skill * attack
    local magicpower = magic * attack
    

    local min = ((level / 5) + (power * 0.045) + (magicpower * 0.12) + 15) * 1.55
    local max = ((level / 5) + (power * 0.055) + (magicpower * 0.14) + 20) * 1.65
    -- Group by row for sequential animation
    local rowMap = {}
    for _, pos in ipairs(positions) do
        rowMap[pos.row] = rowMap[pos.row] or {}
        table.insert(rowMap[pos.row], pos)
    end
    local function damageRow(rowIdx)
        local row = rowMap[rowIdx]
        if not row then return end
        for _, pos in ipairs(row) do
            local tilePos = Position(center.x + pos.dx, center.y + pos.dy, center.z)
            doAreaCombatHealth(player, COMBAT_FIREDAMAGE, tilePos, 0, -min, -max, CONST_ME_FIREAREA)
        end
    end
    for rowIdx = #WAVE_SHAPE, 1, -1 do
        addEvent(damageRow, (#WAVE_SHAPE-rowIdx)*150, rowIdx)
    end
end

function onCastSpell(player, variant)
    local castPos = player:getPosition()
    local castDir = player:getDirection()
    sendWaveEffects(player:getId(), castPos, castDir)
    addEvent(applyWaveDamage, DAMAGE_DELAY, player:getId(), castPos, castDir)
    return true
end
