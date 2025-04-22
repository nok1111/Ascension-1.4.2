local SPELL_NAME = "Sarandel Wave"
local MIN_WAVE_DAMAGE = 700 
local MAX_WAVE_DAMAGE = 1000 
local PUSH_DISTANCE = 1 
local WAVE_WIDTH = 10 
local WAVE_LENGTH = 20  -- 6 behind + 8 ahead
local WAVE_EFFECT = 590 
local DANGER_PREVIEW_EFFECT = 391
local PREVIEW_DELAY = 2500
local WAVE_INTERVAL = 180  -- ms between waves

-- Store wave data for each caster
local waveData = {} -- {casterId = {offsets = {x,y}, direction = dir, draggedCreatures = {}}}

-- All possible directions
local DIRECTIONS = {NORTH, SOUTH, EAST, WEST}

local function calculateForwardPos(startPos, direction, step)
    if direction == NORTH then
        return Position(startPos.x, startPos.y - step, startPos.z)
    elseif direction == SOUTH then
        return Position(startPos.x, startPos.y + step, startPos.z)
    elseif direction == EAST then
        return Position(startPos.x + step, startPos.y, startPos.z)
    elseif direction == WEST then
        return Position(startPos.x - step, startPos.y, startPos.z)
    end
    return nil
end

local function getTwoRandomOffsets(width)
    local offset1 = math.random(-math.floor(width/2), math.floor(width/2))
    local offset2
    repeat
        offset2 = math.random(-math.floor(width/2), math.floor(width/2))
    until offset2 ~= offset1
    return {offset1, offset2}
end

local function showDangerPreview(casterPos, direction, width, safeOffsets, casterId)
    for step = -6, 8 do
        local forwardPos = calculateForwardPos(casterPos, direction, step)
        if forwardPos then
            for offset = -math.floor(width / 2), math.floor(width / 2) do
                if not (offset == safeOffsets[1] or offset == safeOffsets[2]) then
                    addEvent(function()
                        local dangerPos
                        if direction == NORTH or direction == SOUTH then
                            dangerPos = Position(forwardPos.x + offset, forwardPos.y, forwardPos.z)
                        else
                            dangerPos = Position(forwardPos.x, forwardPos.y + offset, forwardPos.z)
                        end
                        
                        if dangerPos then
                            local tile = Tile(dangerPos)
                            if tile and tile:isWalkable() then
                                dangerPos:sendMagicEffect(DANGER_PREVIEW_EFFECT)
                            end
                        end
                    end, (step + 6) * 60)
                end
            end
        end
    end
end

local function getWavePositions(startPos, direction, step, width, casterId)
    local wavePositions = {}
    local actualStep = step - 7
    if step == 14 then actualStep = 8 end

    local forwardPos = calculateForwardPos(startPos, direction, actualStep)
    if not forwardPos then return wavePositions end

    local safeOffsets = waveData[casterId].offsets

    for offset = -math.floor(width / 2), math.floor(width / 2) do
        if not (offset == safeOffsets[1] or offset == safeOffsets[2]) then
            local sidePos
            if direction == NORTH or direction == SOUTH then
                sidePos = Position(forwardPos.x + offset, forwardPos.y, forwardPos.z)
            else
                sidePos = Position(forwardPos.x, forwardPos.y + offset, forwardPos.z)
            end

            if sidePos then
                local tile = Tile(sidePos)
                if tile and tile:isWalkable() then             
                    table.insert(wavePositions, sidePos)
                end
            end
        end
    end

    return wavePositions
end

local function dragCreature(creature, direction, casterId)
    if not creature or not creature:isPlayer() then return end
    
    local currentPos = creature:getPosition()
    local newPos = calculateForwardPos(currentPos, direction, 1)
    
    if newPos and Tile(newPos):isWalkable() then
        creature:teleportTo(newPos)
        -- Schedule next drag if still in wave
        if waveData[casterId] and waveData[casterId].draggedCreatures[creature:getId()] then
            addEvent(function()
                dragCreature(creature, direction, casterId)
            end, WAVE_INTERVAL)
        end
    end
end

local function createWave(casterId, direction, step)
    local caster = Creature(casterId) 
    if not caster then return end

    local casterPos = caster:getPosition()
    local wavePositions = getWavePositions(casterPos, direction, step, WAVE_WIDTH, casterId)

    for _, pos in ipairs(wavePositions) do
        pos:sendMagicEffect(WAVE_EFFECT)

        local tile = Tile(pos)
        if tile then
            for _, creature in ipairs(tile:getCreatures()) do
                if creature and creature:isPlayer() then
                    -- Apply damage
                    doTargetCombatHealth(caster, creature, COMBAT_ICEDAMAGE, -MIN_WAVE_DAMAGE, -MAX_WAVE_DAMAGE, CONST_ME_NONE)

                    -- Start continuous dragging if not already being dragged
                    if not waveData[casterId].draggedCreatures[creature:getId()] then
                        waveData[casterId].draggedCreatures[creature:getId()] = true
                        dragCreature(creature, direction, casterId)
                    end
                end
            end
        end
    end
end

function onCastSpell(caster, variant)
    local casterId = caster:getId() 
    local casterPos = caster:getPosition()

    -- Generate random direction and two safe spots for this cast
    local randomDirection = DIRECTIONS[math.random(#DIRECTIONS)]
    local randomOffsets = getTwoRandomOffsets(WAVE_WIDTH)
    
    waveData[casterId] = {
        offsets = randomOffsets,
        direction = randomDirection,
        draggedCreatures = {}
    }

    -- Show preview of dangerous areas
    showDangerPreview(casterPos, randomDirection, WAVE_WIDTH, randomOffsets, casterId)

    -- Start damage waves after preview delay
    addEvent(function()
        for step = 1, 14 do
            addEvent(function()
                createWave(casterId, randomDirection, step)
            end, step * WAVE_INTERVAL)
        end
        
        -- Clear dragged creatures data after wave completes
        addEvent(function()
            if waveData[casterId] then
                waveData[casterId].draggedCreatures = {}
            end
        end, 14 * WAVE_INTERVAL + 100)
    end, PREVIEW_DELAY)

    -- Show direction in message
    local dirNames = {
        [NORTH] = "north", 
        [SOUTH] = "south",
        [EAST] = "east",
        [WEST] = "west"
    }
    caster:say(SPELL_NAME .. " coming from the " .. dirNames[randomDirection] .. "! Two safe paths available!", TALKTYPE_MONSTER_SAY)
    return true
end