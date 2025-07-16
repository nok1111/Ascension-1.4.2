local config = {
	Duration = 11,
	Ticks_Between = 500,
	Ticks_Effect = 500,
	Effect = 560,
	Effect2 = 561
}
local configMasRes = {
	manaPercent = 4,
	healPercent = 4,
	timer = 10,
	InitMana = 10,
	InitHealth = 10
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setArea(createCombatArea(AREA_CIRCLE2X2))


local function healtargets(player, target)
    -- Check if player is valid
    if not player then
        return false
    end

    -- Check if the target is the player or is nil (indicating a self-heal)
    if target == player or target == nil then
        return true
    end

    -- Check if the target is a player
    if target:isPlayer() then
        -- Check if the target is in the same party as the player's leader
        if target:getParty() and target:getParty():getLeader() == player then
            return true
        end

        -- Check if the player has secure mode enabled (always heal)
        if player:hasSecureMode() then
            return true
        end

        -- Check if the target is in the same guild as the player's guild leader
        if target:getGuild() and target:getGuild():getLeader() == player then
            return true
        end
    end

    -- Check if the target has a master (summoned creature)
    if target:getMaster()  and target:getMaster():isPlayer() then -- Check if the target has a master (summon) then
        -- Check if the target is the player's master (heal own summons)
        if target:getMaster() == player then
            return true
        end

        -- Check if the target's master is a player and is in the same party as the player
        if target:getMaster():isPlayer() and player:getParty() and player:getParty() == target:getMaster():getParty() then
            -- Heal friendly party summoned creature
            return true
        end

        -- Check if the player has secure mode enabled (always heal non-friendly summons)
        if player:hasSecureMode() then
            return true
        end
    end

    -- If none of the conditions are met, the target is not a valid heal target
    return false
end


local function Triggered(combat, pos)
	variant = positionToVariant(pos)
	combat:execute(0, variant)
end

local function apply_floor(creatureId, positionnube)  	
local creature = Creature(creatureId)
	if not creature then
		return
	end
	positionnube:sendMagicEffect(667)
end

local function removeTiles(TileId, posArray)
	for i = 0, #TileId, 1 do
		if Tile(Position(posArray[i])) ~= nil then
			local thereIs = Tile(Position(posArray[i])):getItemById(26718)
			if thereIs ~= nil then
				TileId[i]:remove()
			end
		end
		
	end

end

local function removeTiles2(TileId2, posArray)
for i = 0, #TileId2, 1 do
		if Tile(Position(posArray[i])) ~= nil then
			local thereIs = Tile(Position(posArray[i])):getItemById(28768)
			if thereIs ~= nil then
				TileId2[i]:remove()
			end
		end
	end
end

function onCastSpell(creature, variant)
	local player = Player(creature)
	local cid = creature:getId()
	local pos = creature:getPosition()
	local positionnube = creature:getPosition()
	positionnube.x = creature:getPosition().x + 3
	positionnube.y = creature:getPosition().y + 3
	
function doHeal_living_ground(creature, target)
    if not player then
        stopEvent(event)
        return
    end

    if healtargets(player, target) then
		--print target name
		print("heal target name", target:getName())
	local min = (player:getLevel() / 5) +  (player:getMagicLevel() * 4.0) + 35
    local max = (player:getLevel() / 5) +  (player:getMagicLevel() * 4.5) + 45
    local FinalHealth = math.random(min, max)

    target:addHealth(FinalHealth)
    target:getPosition():sendMagicEffect(CONST_ME_HPUP)
		return true
	elseif not healtargets(player, target) and not target:isNpc() then
		print("damage target name", target:getName())
		--PassiveSkills.ThornedSanctuary as % of players max hp as damage
		local thornedSanctuary = player:getStorageValue(PassiveSkills.ThornedSanctuary) or 0
		local damage = player:getMaxHealth() * (thornedSanctuary / 100)
		print("damage", damage)
		doTargetCombatHealth(player:getId(), target:getId(), COMBAT_EARTHDAMAGE, -damage, -damage, 17)
		target:getPosition():sendMagicEffect(CONST_ME_HPMANA)
		return true
	else
		return false
	end
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "doHeal_living_ground")


	for i = 0, configMasRes.timer, 1 do
		addEvent(Triggered, 1000*i + 500, combat, pos)
	end
	
	
	for i = 1, config.Duration * 1000 / 100 do
	addEvent(apply_floor, 100 * i, creature:getId(), positionnube)
	end
	apply_floor(creature:getId(), positionnube)
	
	local x, y, z = pos.x, pos.y, pos.z

	local posArray = {
		[0] = {x = x , y = y, z = z},
		[1] = {x = x + 1, y = y, z = z},
		[2] = {x = x + 1, y = y + 1, z = z},
		[3] = {x = x, y = y + 1, z = z},
		[4] = {x = x - 1, y = y + 1, z = z},
		[5] = {x = x - 1, y = y, z = z},
		[6] = {x = x - 1, y = y - 1, z = z},
		[7] = {x = x, y = y - 1, z = z},
		[8] = {x = x + 1, y = y - 1, z = z},
		[9] = {x = x + 2, y = y - 1, z = z},
		[10] = {x = x + 2, y = y, z = z},
		[11] = {x = x + 2, y = y + 1, z = z},
		[12] = {x = x + 1, y = y + 2, z = z},
		[13] = {x = x, y = y + 2, z = z},
		[14] = {x = x - 1, y = y + 2, z = z},
		[15] = {x = x - 2, y = y + 1, z = z},
		[16] = {x = x - 2, y = y, z = z},
		[17] = {x = x - 2, y = y - 1, z = z},
		[18] = {x = x - 1, y = y - 2, z = z},
		[19] = {x = x, y = y - 2, z = z},
		[20] = {x = x + 1, y = y - 2, z = z}
	}
		local posArray2 = {
		[0] = {x = x , y = y, z = z}
	
	}

	local TileId = {
		[0] = 0,
		[1] = 0,
		[2] = 0,
		[3] = 0,
		[4] = 0,
		[5] = 0,
		[6] = 0,
		[7] = 0,
		[8] = 0,
		[9] = 0,
		[10] = 0,
		[11] = 0,
		[12] = 0,
		[13] = 0,
		[14] = 0,
		[15] = 0,
		[16] = 0,
		[17] = 0,
		[18] = 0,
		[19] = 0,
		[20] = 0
	}
		local TileId2 = {
		[0] = 0
	
	}

	for i = 0, #posArray, 1 do
		if pos:isSightClear(Position(posArray[i]), true) then
			if getTilePzInfo(Position(posArray[i])) == FALSE then
				if Tile(posArray[i]) ~= nil then
					local floorchange = false
					if Tile(posArray[i]):hasFlag(TILESTATE_FLOORCHANGE) then
						floorchange = true
					end
					local Need = Tile(posArray[i]):getCreatures()
					if queryTileAddThing(Creature(cid), posArray[i]) == RETURNVALUE_NOERROR or Tile(posArray[i]):getCreatures() ~= nil then
						if not floorchange then
							local item = Game.createItem(26718, 1, Position(posArray[i]))
							local item2 = Game.createItem(28768, 1, Position(posArray2[i]))
							TileId[i] = item
							TileId2[i] = item2
						else
							posArray[i] = 0
						end
					else
						posArray[i] = 0
					end
				else
					posArray[i] = 0
				end
			else
				posArray[i] = 0
			end
		else
			posArray[i] = 0
		end
	end

	addEvent(removeTiles, 1000*configMasRes.timer + 1000, TileId, posArray)
	addEvent(removeTiles2, 1000*configMasRes.timer + 1000, TileId2, posArray)

	return true
end