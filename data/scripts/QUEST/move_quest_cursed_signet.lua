local onMoveItemquest = EventCallback

-- Define multiple positions where the item can be placed
local cauldron_positions = {

    Position(730, 781, 7),
    Position(730, 780, 7),

    Position(731, 781, 7),
    Position(731, 780, 7),

    Position(732, 781, 7),
    Position(732, 780, 7),

}

function onMoveItemquest.onMoveItem(player, item, count, fromPosition, toPosition, fromCylinder, toCylinder)
    -- Ensure the moved item is the correct one (ID: 7708)
    if item:getId() ~= 7708 then
        return RETURNVALUE_NOERROR
    end

    for _, position in ipairs(cauldron_positions) do
            -- Ensure the player hasn't already completed this quest
            if player:getStorageValue(Mainquest.cursedsignet) ~= 1 then
               
                player:setStorageValue(Mainquest.cursedsignet, 1)
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Quest: You have destroyed the cursed signet.")
                return RETURNVALUE_NOERROR
            end
             item:remove(1)
            toPosition:sendMagicEffect(170)
    end

    return RETURNVALUE_NOERROR
end

onMoveItemquest:register()
