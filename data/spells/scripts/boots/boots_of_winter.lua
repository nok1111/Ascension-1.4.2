local interval = 200 -- Interval to place new ice patches in milliseconds
local ITEM_GLAICAL_ICE_PATCH = 39942

function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    -- Check if boots are equipped in feet slot
    local boots = player:getSlotItem(CONST_SLOT_FEET)
    if not boots or boots:getId() ~= 2642 then
        player:sendCancelMessage("You must equip the Boots of Winter to use this effect.")
        return false
    end

    local position = player:getPosition()
    -- Check if the spell is being cast in a protection or non-PvP zone
    if Tile(position):hasFlag(TILESTATE_PROTECTIONZONE) or Tile(position):hasFlag(TILESTATE_NOPVP) then
        player:sendCancelMessage("You cannot cast Glacial Step in a protected area.")
        return false
    end
    
    -- Set up repeated function to place ice patches
    local function placeIcePatch()
        if not player then return false end
        local position = player:getPosition()
		if not Tile(position):hasFlag(TILESTATE_PROTECTIONZONE) and not Tile(position):hasFlag(TILESTATE_NOPVP) then
			position:sendMagicEffect(CONST_ME_ICEAREA)
			Game.createItem(ITEM_GLAICAL_ICE_PATCH, 1, position)
		else
			player:sendCancelMessage("You cannot cast Glacial Step in a protected area.")
		end
    end

    -- Repeatedly place ice patches for 5 seconds while moving
    for i = 0, 10 do
        addEvent(placeIcePatch, interval * i)
    end


    return true
end
