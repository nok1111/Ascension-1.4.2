

local valvePositions = {
    Position(15387, 11011, 5), --south valve
    Position(15270, 10968, 5), --middle
    Position(15320, 10912, 5) --north
}

local closedValveId = 24161
local openValveId = 30105
local movableItemId = 23426
local movableItemPosition = Position(15289, 11005, 6)
local restoreDelay = 20 * 60 * 1000 -- Time in minutes 

local function areAllValvesOpen()
    for _, pos in ipairs(valvePositions) do
        local tile = Tile(pos)
        if not tile then
            return false
        end

        local valve = tile:getItemById(openValveId)
        if not valve then
            return false
        end
    end
    return true
end

local function restoreItemToOriginalPosition()
    local tile = Tile(Position(movableItemPosition.x, movableItemPosition.y, movableItemPosition.z - 1))
    if tile then
        local itemToRestore = tile:getItemById(movableItemId)
        if itemToRestore then
            itemToRestore:moveTo(movableItemPosition)
        end
    end
end

local valveAction = Action()

function valveAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)


    


    local itemPosition = item:getPosition()
    
    if item.itemid == openValveId then
        -- Close the valve
        item:transform(closedValveId)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You closed a valve.")
    elseif item.itemid == closedValveId then
        -- Open the valve
        --print("open")
        item:transform(openValveId)
        item:decay()

       local positioneffect = toPosition
       positioneffect.x = positioneffect.x + 1
       positioneffect.y = positioneffect.y - 0
       positioneffect:sendMagicEffect(68)

        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You opened a valve.")

        -- Check if all valves are open
        if areAllValvesOpen() then
            -- Perform the action when all valves are open
           

            -- Move the elevator to +1 upper floor
            local tile = Tile(movableItemPosition)
            if tile then
                local itemToMove = tile:getItemById(movableItemId)
                if itemToMove then
                    local newPosition = Position(movableItemPosition.x, movableItemPosition.y, movableItemPosition.z - 1)
                    itemToMove:moveTo(newPosition)
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "All valves are now open! Seems like the elevator is working again.")
                    -- move elevator again to bottom
                    addEvent(restoreItemToOriginalPosition, restoreDelay)
                else
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The the elevator got stuck.")
                end
            else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The tile for the item is missing.")
            end
        end
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This is not a valid valve.")
    end

    return true
end

for _, pos in ipairs(valvePositions) do
    local tile = Tile(pos)
    if tile then
        local valve = tile:getItemById()
        if valve and valve.itemid == closedValveId then
            valveAction:aid(valve:getActionId())
        end
    end
end

valveAction:aid(1243)

valveAction:register()


local moveevent = MoveEvent()

function moveevent.onStepIn(creature, item, position, fromPosition)

local player = creature:getPlayer()

    if not player then
        return true
    end


local tile = Tile(position)
if tile then
    local valve = tile:getItemById(23426) 
    if valve then
        position:sendMagicEffect(56)
        player:teleportTo(Position(15289, 11005, 6))
        local playerpos = player:getPosition()
        playerpos:sendMagicEffect(56)
        return true
        else
            local closedValvesCount = 0
            for _, pos in ipairs(valvePositions) do
                local tile = Tile(pos)
                if tile and not tile:getItemById(openValveId) then
                    closedValvesCount = closedValvesCount + 1
                end
            end
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The elevator is not working at the moment, " .. closedValvesCount .. " pressure valve(s) are still closed.")
            player:teleportTo(fromPosition)
            position:sendMagicEffect(4)
        end
    end

    return false
end

moveevent:aid(1244)
moveevent:register()