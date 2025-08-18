local config = {
	amount = 6
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGYBALL)
combat:setParameter(COMBAT_PARAM_CREATEITEM, 8753)


local function expandWall(cid, combatParam, pos)
	local creature = Creature(cid)
	if creature then
		creature:say("You cast grow.", TALKTYPE_MONSTER_SAY)
		local dir = creature:getDirection()
		if dir == 0 then
			pos.y = pos.y - 1
		elseif dir == 1 then
			pos.x = pos.x + 1
		elseif dir == 2 then
			pos.y = pos.y + 1
		elseif dir == 3 then
			pos.x = pos.x - 1
		end
		local tile = Tile(pos)
		if tile and not tile:hasFlag(TILESTATE_BLOCKSOLID) then
			local isPzNearby = false
			for dx = -1, 1 do
				for dy = -1, 1 do
					if not (dx == 0 and dy == 0) then
						local checkPos = Position(pos.x + dx, pos.y + dy, pos.z)
						if getTilePzInfo(checkPos) == TRUE then
							isPzNearby = true
							break
						end
					end
				end
				if isPzNearby then break end
			end
			if not isPzNearby and getTilePzInfo(pos) == FALSE then
				if creature:getPathTo(pos) ~= false then
					variant = positionToVariant(pos)
					combat:execute(creature, variant)
				else
					creature:say("You can't move there.", TALKTYPE_MONSTER_SAY)
				end
			end
		end
	end
end

function onCastSpell(creature, variant, isHotkey)

	local cid = creature:getId()
	
	local pos = Creature(cid):getPosition()
	for i = 0, config.amount, 1 do
		addEvent(expandWall, i*500, cid, combat, pos)
	end
	return true
end
