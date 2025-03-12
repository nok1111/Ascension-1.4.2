local itemmovedquest = EventCallback

function itemmovedquest.onItemMoved(player, item, count, fromPosition, toPosition, fromCylinder, toCylinder)
    -- Ensure the moved item is the correct one (ID: 24323)
    if item:getId() ~= 24323 then
        return RETURNVALUE_NOERROR
    end

    local rose_floor = Position(695, 817, 7)
    local roseItem = Tile(rose_floor):getItemById(24323)

    -- Check if the rose exists on the designated tile before proceeding
    if not roseItem then
        return RETURNVALUE_NOERROR
    end

    -- Ensure the player hasn't already completed this quest
    if player:getStorageValue(Mainquest.eternallove) ~= 1 then
        roseItem:remove()
        rose_floor:sendMagicEffect(CONST_ME_MAGIC_BLUE)
        player:setStorageValue(Mainquest.eternallove, 1)
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Quest: You have paid your respects.")
    end

    return RETURNVALUE_NOERROR
end

itemmovedquest:register()
