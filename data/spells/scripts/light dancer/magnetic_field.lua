local configMasRes = {
	manaPercent = 0.1,
	healPercent = 4,
	timer = 10,
	InitMana = 10,
	InitHealth = 10
}



local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setArea(createCombatArea(AREA_CIRCLE2X2))


local haste = Condition(CONDITION_HASTE)
haste:setParameter(CONDITION_PARAM_TICKS, 1200)
haste:setFormula(-1.0, 0, -1.0, 0)

local static_charge = Condition(CONDITION_ENERGY)
static_charge:setParameter(CONDITION_PARAM_DELAYED, true)
static_charge:addDamage(10, 1000, -1)
static_charge:setParameter(CONDITION_PARAM_SUBID, 25965)
combat:addCondition(static_charge)




function onTargetCreature(creature, target)
	--You can change the formula to be anything from creature (the player that cast) and target
	if target:isMonster() then
		target:addCondition(haste)
		return true
	end
	
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local function removeItemTiles(TileId, posArray)
	for i = 0, #TileId, 1 do
		if Tile(Position(posArray[i])) ~= nil then
			local thereIs = Tile(Position(posArray[i])):getItemById(1504)
			if thereIs ~= nil then
				TileId[i]:remove()
			end
		end
		
	end
end





local function Triggered(combat, pos)
	variant = positionToVariant(pos)
	combat:execute(0, variant)
end

function onCastSpell(creature, variant)
	local cid = creature:getId()
	local pos = Creature(cid):getPosition()
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
							local item = Game.createItem(1504, 1, Position(posArray[i]))
							
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

	addEvent(removeItemTiles, 1000*configMasRes.timer + 1000, TileId, posArray)

	for i = 0, configMasRes.timer, 1 do
		addEvent(Triggered, 1000*i + 500, combat, pos)
	end

    return true
end
