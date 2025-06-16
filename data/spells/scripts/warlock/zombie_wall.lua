local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_NONE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 841)

local area = createCombatArea(AREA_CROSS1X1)
setCombatArea(combat, area)

function onCastSpell(player, var)
	if not player then return false end
	local positions = {
		[0] = {
			Position({x = player:getPosition().x - 1, y = player:getPosition().y - 2, z = player:getPosition().z}),
			Position({x = player:getPosition().x, y = player:getPosition().y - 2, z = player:getPosition().z}),
			Position({x = player:getPosition().x + 1, y = player:getPosition().y - 2, z = player:getPosition().z}),
		},
		[1] = {
			Position({x = player:getPosition().x + 2, y = player:getPosition().y - 1, z = player:getPosition().z}),
			Position({x = player:getPosition().x + 2, y = player:getPosition().y, z = player:getPosition().z}),
			Position({x = player:getPosition().x + 2, y = player:getPosition().y + 1, z = player:getPosition().z}),
		},
		[2] = {
			Position({x = player:getPosition().x - 1, y = player:getPosition().y + 2, z = player:getPosition().z}),
			Position({x = player:getPosition().x, y = player:getPosition().y + 2, z = player:getPosition().z}),
			Position({x = player:getPosition().x + 1, y = player:getPosition().y + 2, z = player:getPosition().z}),
		},
		[3] = {
			Position({x = player:getPosition().x - 2, y = player:getPosition().y - 1, z = player:getPosition().z}),
			Position({x = player:getPosition().x - 2, y = player:getPosition().y, z = player:getPosition().z}),
			Position({x = player:getPosition().x - 2, y = player:getPosition().y + 1, z = player:getPosition().z}),
		},
	}
	
	local lookDirection = player:getDirection()
	for i = 1, #positions[lookDirection] do
		local monster = Game.createMonster("Zombie Wall", positions[lookDirection][i], true)
		if monster then
		monster:setMaster(player)
		monster:setDirection(lookDirection)
		local playerhp = player:getMaxHealth()
		monster:setMaxHealth(playerhp * 0.5)
		monster:addHealth(playerhp * 0.5)
		addEvent(function() if monster then monster:remove() end end, 1 * 100 * 100)
		else
		return false
		end
	end
	player:getPosition():sendMagicEffect(841)
	
    return combat:execute(player, var)
end