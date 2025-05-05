local SPELL_NAME = "Tsunami Wave"
local MIN_WAVE_DAMAGE = 80 
local MAX_WAVE_DAMAGE = 150 
local PUSH_DISTANCE = 1 
local WAVE_WIDTH = 8 
local WAVE_LENGTH = 8 
local WAVE_EFFECT = CONST_ME_WATERSPLASH 

local function calculateForwardPos(startPos, direction, step)
    if direction == NORTH then
        return Position(startPos.x, startPos.y - step, startPos.z)
    elseif direction == SOUTH then
        return Position(startPos.x, startPos.y + step, startPos.z)
    elseif direction == EAST then
        return Position(startPos.x + step, startPos.y, startPos.z)
    elseif direction == WEST then
        return Position(startPos.x - step, startPos.y, startPos.z)
    else
        print("Invalid direction:", direction)
        return nil
    end
end


local function getWavePositions(startPos, direction, step, width)
    local wavePositions = {}

    -- Validate startPos
    if not startPos then
        print("Error: startPos is nil")
        return wavePositions
    end


    -- Calculate the forward position
    local forwardPos = calculateForwardPos(startPos, direction, step)
    if not forwardPos then
        print("Error: Failed to calculate forwardPos for step:", step)
        return wavePositions
    end


    for offset = -math.floor(width / 2), math.floor(width / 2) do
        local sidePos
        if direction == NORTH or direction == SOUTH then
            sidePos = Position(forwardPos.x + offset, forwardPos.y, forwardPos.z)
        elseif direction == EAST or direction == WEST then
            sidePos = Position(forwardPos.x, forwardPos.y + offset, forwardPos.z)
        end

        if sidePos then
            
            local tile = Tile(sidePos)
            if tile and tile:isWalkable() then             
                table.insert(wavePositions, sidePos)
            end
        else
            print("sidePos is nil for offset:", offset)
        end
    end

    return wavePositions
end


local function createWave(casterId, direction, step)
    local caster = Creature(casterId) 
    if not caster then
        print("Error: Caster with ID", casterId, "not found.")
        return
    end

	if not direction then
		return
	end

	if not step then
		return
	end

    local casterPos = caster:getPosition()
    local wavePositions = getWavePositions(casterPos, direction, step, WAVE_WIDTH)

    for _, pos in ipairs(wavePositions) do
        pos:sendMagicEffect(WAVE_EFFECT)

		local tile = Tile(pos)
		if tile then
		    for _, creature in ipairs(tile:getCreatures()) do
		        if creature and creature:isPlayer() then

		            doTargetCombatHealth(caster, creature, COMBAT_ICEDAMAGE, -MIN_WAVE_DAMAGE, -MAX_WAVE_DAMAGE, CONST_ME_NONE)

		            local pushPos = calculateForwardPos(creature:getPosition(), direction, PUSH_DISTANCE)
		            if pushPos and Tile(pushPos):isWalkable() then
		                creature:teleportTo(pushPos)
		                --pushPos:sendMagicEffect(CONST_ME_TELEPORT)
		            else
		                print("Failed to push creature at:", creature:getPosition().x, creature:getPosition().y, creature:getPosition().z)
		            end
		        end
		    end
		end

    end
end


function onCastSpell(caster, variant)
    local direction = caster:getDirection()
    local casterId = caster:getId() 

    for step = 1, WAVE_LENGTH do
        addEvent(function()
            createWave(casterId, direction, step)
        end, step * 200) 
    end

    caster:say(SPELL_NAME .. " surges forward!", TALKTYPE_MONSTER_SAY)
    return true
end
