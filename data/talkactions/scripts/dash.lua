local MAX_DISTANCE = 5
function onSay(player, words, param)
	local dir = player:getDirection()
	local pos = player:getPosition()
	local length = 0

	for i = 1, MAX_DISTANCE do
		pos:getNextPosition(dir)

		local tile = Tile(pos)
		if not tile or tile:hasProperty(CONST_PROP_BLOCKSOLID) then
			break
		end

		addEvent(function(playerId, newPos)
			local p = Player(playerId)
			if p then
				p:teleportTo(newPos, false)
			end
		end, 60 * i, player:getId(), Position(pos))

		length = i
	end

	if length > 0 then
		player:dash(length)
	end

	return false
end