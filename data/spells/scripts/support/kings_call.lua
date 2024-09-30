
function onCastSpell(creature, variant)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    -- Example: Assuming you have a method 'getHomeTownPosition(player)' that returns the Position object of the player's hometown temple
    local townId = player:getTown()
	local homeTownPosition = townId:getTemplePosition()
    if homeTownPosition then
        player:teleportTo(homeTownPosition)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You have been teleported to your hometown.")
        return true
    else
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "Could not determine your hometown.")
        return false
    end
end
