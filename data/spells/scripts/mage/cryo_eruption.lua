local ICE_ITEM_ID = 7284  -- Replace with your specific ice item ID
local SPLASH_EFFECT = CONST_ME_ICEAREA
local ICICLE_DURATION = 3500  -- Duration in ms before explosion
local BASE_DAMAGE = 50
local SLOW_DURATION = 5000

local slowCondition = Condition(CONDITION_PARALYZE)
slowCondition:setParameter(CONDITION_PARAM_SPEED, -50)
slowCondition:setParameter(CONDITION_PARAM_TICKS, SLOW_DURATION)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, SPLASH_EFFECT)
combat:setArea(createCombatArea(AREA_WAVEZ4))

function onGetFormulaValues(player, level, maglevel)
    local min = (level / 5) + (maglevel * 1.5) + BASE_DAMAGE
    local max = (level / 5) + (maglevel * 2.5) + (BASE_DAMAGE * 1.5)
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onTargetCreature(creature, target)
    target:addCondition(slowCondition)
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local function explodeIcicles(creatureId, positions)
    for _, pos in pairs(positions) do
        local tile = Tile(pos)
        if tile then
            local item = tile:getItemById(ICE_ITEM_ID)
            if item then
                pos:sendMagicEffect(SPLASH_EFFECT)
                combat:execute(creatureId, positionToVariant(pos)) -- Assuming you're using this combat object
                item:remove()
                print("Icicle exploded and removed at position:", pos.x, pos.y, pos.z)
            else
                print("No icicle item found at position:", pos.x, pos.y, pos.z)
            end
        else
            print("Invalid tile at position:", pos.x, pos.y, pos.z)
        end
    end
end


function onCastSpell(creature, var)
    local startPos = creature:getPosition()
    local direction = creature:getDirection()
    local positions = {}

 -- Debug logging
print("Starting Cryo Eruption spell cast")

-- Creating a line of icicles
for i = 1, 6 do
    local pos = Position(startPos.x, startPos.y, startPos.z)
    if direction == DIRECTION_NORTH then
        pos.y = pos.y - i
    elseif direction == DIRECTION_SOUTH then
        pos.y = pos.y + i
    elseif direction == DIRECTION_EAST then
        pos.x = pos.x + i
    elseif direction == DIRECTION_WEST then
        pos.x = pos.x - i
    end

    if pos and Tile(pos) then
        print("Icicle created at position:", pos.x, pos.y, pos.z)
        table.insert(positions, pos)
        Game.createItem(ICE_ITEM_ID, 1, pos)
        pos:sendMagicEffect(CONST_ME_ICEATTACK)
    else
        print("Failed to create tile at position:", pos.x, pos.y, pos.z)
    end
end

    -- Schedule the explosion
    addEvent(explodeIcicles, ICICLE_DURATION, creature:getId(), positions)
    return true
end
