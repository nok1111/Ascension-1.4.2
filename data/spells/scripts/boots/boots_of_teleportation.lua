

function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    -- Check if boots are equipped in feet slot
    local boots = player:getSlotItem(CONST_SLOT_FEET)
    if not boots or boots:getId() ~= 33267 then
        player:sendCancelMessage("You must equip the Boots of Teleportation to use this effect.")
        return false
    end

    local targetPos = variant:getPosition()
    if not targetPos then
        player:sendCancelMessage("No target position.")
        return false
    end

    local tile = Tile(targetPos)
    if not tile or tile:hasFlag(TILESTATE_BLOCKSOLID) or tile:hasFlag(TILESTATE_PROTECTIONZONE) then
        player:sendCancelMessage("You can't teleport there.")
        return false
    end

    local path = player:getPathTo(targetPos)
		if not path then
			player:sendCancelMessage("Theres no path to that position.")
			return false
		end

    -- Teleport effect at source
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    -- Teleport player
    player:teleportTo(targetPos, true)
    -- Teleport effect at destination
    targetPos:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
