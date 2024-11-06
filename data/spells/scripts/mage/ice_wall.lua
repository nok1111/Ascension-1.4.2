local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)

local area = createCombatArea(AREA_CROSS1X1)
setCombatArea(combat, area)

local ICE_WALL_ITEM_ID = 1492  -- Replace with the actual item ID for the ice wall
local ICE_WALL_DURATION = 3000 -- Duration in milliseconds (e.g., 3 seconds)




function onCastSpell(player, var)
    if not player then return false end
    
	local positions = {
    [0] = {
        Position(player:getPosition().x - 3, player:getPosition().y - 2, player:getPosition().z),
        Position(player:getPosition().x - 2, player:getPosition().y - 2, player:getPosition().z),
        Position(player:getPosition().x - 1, player:getPosition().y - 2, player:getPosition().z),
        Position(player:getPosition().x, player:getPosition().y - 2, player:getPosition().z),
        Position(player:getPosition().x + 1, player:getPosition().y - 2, player:getPosition().z),
        Position(player:getPosition().x + 2, player:getPosition().y - 2, player:getPosition().z),
        Position(player:getPosition().x + 3, player:getPosition().y - 2, player:getPosition().z),
    },
    [1] = {
        Position(player:getPosition().x + 2, player:getPosition().y - 3, player:getPosition().z),
        Position(player:getPosition().x + 2, player:getPosition().y - 2, player:getPosition().z),
        Position(player:getPosition().x + 2, player:getPosition().y - 1, player:getPosition().z),
        Position(player:getPosition().x + 2, player:getPosition().y, player:getPosition().z),
        Position(player:getPosition().x + 2, player:getPosition().y + 1, player:getPosition().z),
        Position(player:getPosition().x + 2, player:getPosition().y + 2, player:getPosition().z),
        Position(player:getPosition().x + 2, player:getPosition().y + 3, player:getPosition().z),
    },
    [2] = {
        Position(player:getPosition().x - 3, player:getPosition().y + 2, player:getPosition().z),
        Position(player:getPosition().x - 2, player:getPosition().y + 2, player:getPosition().z),
        Position(player:getPosition().x - 1, player:getPosition().y + 2, player:getPosition().z),
        Position(player:getPosition().x, player:getPosition().y + 2, player:getPosition().z),
        Position(player:getPosition().x + 1, player:getPosition().y + 2, player:getPosition().z),
        Position(player:getPosition().x + 2, player:getPosition().y + 2, player:getPosition().z),
        Position(player:getPosition().x + 3, player:getPosition().y + 2, player:getPosition().z),
    },
    [3] = {
        Position(player:getPosition().x - 2, player:getPosition().y - 3, player:getPosition().z),
        Position(player:getPosition().x - 2, player:getPosition().y - 2, player:getPosition().z),
        Position(player:getPosition().x - 2, player:getPosition().y - 1, player:getPosition().z),
        Position(player:getPosition().x - 2, player:getPosition().y, player:getPosition().z),
        Position(player:getPosition().x - 2, player:getPosition().y + 1, player:getPosition().z),
        Position(player:getPosition().x - 2, player:getPosition().y + 2, player:getPosition().z),
        Position(player:getPosition().x - 2, player:getPosition().y + 3, player:getPosition().z),
    },
}

	local lookDirection = player:getDirection()
	for _, pos in ipairs(positions[lookDirection]) do
		local item = Game.createItem(ICE_WALL_ITEM_ID, 1, pos)
		if item then
			pos:sendMagicEffect(CONST_ME_ICEAREA)  -- Magic effect on item creation
			addEvent(function()
				if item then 
					item:remove()
					pos:sendMagicEffect(CONST_ME_POFF)  -- Magic effect on item removal
				end
			end, ICE_WALL_DURATION)
		end
	end

    player:getPosition():sendMagicEffect(CONST_ME_ICEAREA)

    return combat:execute(player, var)
end
