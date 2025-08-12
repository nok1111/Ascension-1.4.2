
local minRange = 2
local maxRange = 8

local varTable = {}


local function runecharge(playerId, targetId)
	local player = Player(playerId)
	local target = Creature(targetId)

	if not player or not target then return true end
	if Position(player:getPosition()):getDistance(target:getPosition()) >= minRange then
		local path = player:getPathTo(target:getPosition())
		if path then
			player:getPosition():sendMagicEffect(7)
			local playerSpeed = player:getSpeed()
			player:changeSpeed(5000)
			--print(playerSpeed)
			player:move(path[1])
            player:changeSpeed(-5000)
			addEvent(runecharge, 0, player:getId(), target:getId())
		end
	end
return true
end


function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    -- Check if boots are equipped in feet slot
    local boots = player:getSlotItem(CONST_SLOT_FEET)
    if not boots or boots:getId() ~= 33348 then
        player:sendCancelMessage("You must equip the Boots of the Wild to use this effect.")
        return false
    end

    local targetPos = variant:getPosition()
    if not targetPos then
        player:sendCancelMessage("No target position.")
        return false
    end

    local tile = Tile(targetPos)
    if not tile or tile:hasFlag(TILESTATE_BLOCKSOLID) or tile:hasFlag(TILESTATE_PROTECTIONZONE) then
        player:sendCancelMessage("You can't do this here.")
        return false
    end

    if isPlayer(creature) then
		local target = Creature(variantToNumber(variant))
		if target then
			if Position(creature:getPosition()):getDistance(target:getPosition()) >= minRange and Position(creature:getPosition()):getDistance(target:getPosition()) <= maxRange then
				varTable[1] = variant
				addEvent(runecharge, 0, creature:getId(), target:getId())
			end
		end
	end
    return true
end
