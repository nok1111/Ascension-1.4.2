local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, false)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))


local combatNegative1 = Combat()
combatNegative1:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combatNegative1:setParameter(COMBAT_PARAM_EFFECT, 457)
combatNegative1:setParameter(COMBAT_PARAM_BLOCKSHIELD, false)



local combat0 = Combat()
combat0:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat0:setParameter(COMBAT_PARAM_EFFECT, 54)
combat0:setParameter(COMBAT_PARAM_BLOCKSHIELD, false)

local AREA_RING1X1 = {
	{0, 0, 0, 0, 0},
	{0, 1, 1, 1, 0},
	{0, 1, 3, 1, 0},
	{0, 1, 1, 1, 0},
	{0, 0, 0, 0, 0}
}
combat0:setArea(createCombatArea(AREA_RING1X1))


local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, 54)
combat1:setParameter(COMBAT_PARAM_BLOCKSHIELD, false)

local AREA_RING2X2 = {
	{0, 1, 1, 1, 0},
	{1, 0, 0, 0, 1},
	{1, 0, 2, 0, 1},
	{1, 0, 0, 0, 1},
	{0, 1, 1, 1, 0}
}
combat1:setArea(createCombatArea(AREA_RING2X2))



local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, 54)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, false)

local AREA_RING3X3 = {
	{0, 0, 1, 1, 1, 0, 0},
	{0, 1, 0, 0, 0, 1, 0},
	{1, 0, 0, 0, 0, 0, 1},
	{1, 0, 0, 2, 0, 0, 1},
	{1, 0, 0, 0, 0, 0, 1},
	{0, 1, 0, 0, 0, 1, 0},
	{0, 0, 1, 1, 1, 0, 0}
}
combat2:setArea(createCombatArea(AREA_RING3X3))

local combat3 = Combat()
combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat3:setParameter(COMBAT_PARAM_EFFECT, 54)
combat3:setParameter(COMBAT_PARAM_BLOCKSHIELD, false)

local AREA_RING5X5 = {
    {0, 0, 0, 1, 1, 1, 0, 0, 0},
    {0, 0, 1, 0, 0, 0, 1, 0, 0},
    {0, 1, 0, 0, 0, 0, 0, 1, 0},
    {1, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 2, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 1},
    {0, 1, 0, 0, 0, 0, 0, 1, 0},
    {0, 0, 1, 0, 0, 0, 1, 0, 0},
    {0, 0, 0, 1, 1, 1, 0, 0, 0}
}

combat3:setArea(createCombatArea(AREA_RING5X5))


local function teleportTargets(cid, config, pos)
    local creature = Creature(cid)
    if creature then
        for i = 0, #config do
            local tile = Tile(config[i][1])
            if tile and Position(config[i][1]):isSightClear(pos, true) then
                local creatures = tile:getCreatures()
                if creatures then
                    for _, target in ipairs(creatures) do
                        if target:isPlayer() and not target:isRemoved() then
                           -- print("Pulling target: " .. target:getName())
                            target:teleportTo(config[i][2], true)
                           -- config[i][2]:sendDistanceEffect(pos, 68)
                        end
                    end
                end
            end
        end
    end
end

local function doDamage(combat, cid, variant)
    local creature = Creature(cid)
    if creature then
        combat:execute(creature, variant)
    end
end

function onCastSpell(creature, variant)

	local pos = creature:getPosition()
	local cid = creature:getId()

	local x, y, z = pos.x, pos.y, pos.z

local confi6 = { -- Pushing from an even wider radius to confi4
    [0] = {{x = x+6, y = y, z = z}, {x = x+5, y = y, z = z}},
    [1] = {{x = x+6, y = y+1, z = z}, {x = x+5, y = y+1, z = z}},
    [2] = {{x = x+5, y = y+5, z = z}, {x = x+5, y = y+4, z = z}},
    [3] = {{x = x+4, y = y+6, z = z}, {x = x+4, y = y+5, z = z}},
    [4] = {{x = x, y = y+6, z = z}, {x = x, y = y+5, z = z}},
    [5] = {{x = x-4, y = y+6, z = z}, {x = x-4, y = y+5, z = z}},
    [6] = {{x = x-5, y = y+5, z = z}, {x = x-5, y = y+4, z = z}},
    [7] = {{x = x-6, y = y+1, z = z}, {x = x-5, y = y+1, z = z}},
    [8] = {{x = x-6, y = y, z = z}, {x = x-5, y = y, z = z}},
    [9] = {{x = x-6, y = y-1, z = z}, {x = x-5, y = y-1, z = z}},
    [10] = {{x = x-5, y = y-5, z = z}, {x = x-5, y = y-4, z = z}},
    [11] = {{x = x-4, y = y-6, z = z}, {x = x-4, y = y-5, z = z}},
    [12] = {{x = x, y = y-6, z = z}, {x = x, y = y-5, z = z}},
    [13] = {{x = x+4, y = y-6, z = z}, {x = x+4, y = y-5, z = z}},
    [14] = {{x = x+5, y = y-5, z = z}, {x = x+5, y = y-4, z = z}},
    [15] = {{x = x+6, y = y-1, z = z}, {x = x+5, y = y-1, z = z}},
}

local confi5 = { -- Pushing from confi5 to confi4
    [0] = {{x = x+5, y = y, z = z}, {x = x+4, y = y, z = z}},
    [1] = {{x = x+5, y = y+1, z = z}, {x = x+4, y = y+1, z = z}},
    [2] = {{x = x+4, y = y+4, z = z}, {x = x+4, y = y+3, z = z}},
    [3] = {{x = x+3, y = y+5, z = z}, {x = x+3, y = y+4, z = z}},
    [4] = {{x = x, y = y+5, z = z}, {x = x, y = y+4, z = z}},
    [5] = {{x = x-3, y = y+5, z = z}, {x = x-3, y = y+4, z = z}},
    [6] = {{x = x-4, y = y+4, z = z}, {x = x-4, y = y+3, z = z}},
    [7] = {{x = x-5, y = y+1, z = z}, {x = x-4, y = y+1, z = z}},
    [8] = {{x = x-5, y = y, z = z}, {x = x-4, y = y, z = z}},
    [9] = {{x = x-5, y = y-1, z = z}, {x = x-4, y = y-1, z = z}},
    [10] = {{x = x-4, y = y-4, z = z}, {x = x-4, y = y-3, z = z}},
    [11] = {{x = x-3, y = y-5, z = z}, {x = x-3, y = y-4, z = z}},
    [12] = {{x = x, y = y-5, z = z}, {x = x, y = y-4, z = z}},
    [13] = {{x = x+3, y = y-5, z = z}, {x = x+3, y = y-4, z = z}},
    [14] = {{x = x+4, y = y-4, z = z}, {x = x+4, y = y-3, z = z}},
    [15] = {{x = x+5, y = y-1, z = z}, {x = x+4, y = y-1, z = z}},
}



local confi4 = { -- Pushing from an even larger radius to confi1
    [0] = {{x = x+4, y = y, z = z}, {x = x+3, y = y, z = z}},
    [1] = {{x = x+4, y = y+1, z = z}, {x = x+3, y = y+1, z = z}},
    [2] = {{x = x+3, y = y+3, z = z}, {x = x+3, y = y+2, z = z}},
    [3] = {{x = x+2, y = y+4, z = z}, {x = x+2, y = y+3, z = z}},
    [4] = {{x = x, y = y+4, z = z}, {x = x, y = y+3, z = z}},
    [5] = {{x = x-2, y = y+4, z = z}, {x = x-2, y = y+3, z = z}},
    [6] = {{x = x-3, y = y+3, z = z}, {x = x-3, y = y+2, z = z}},
    [7] = {{x = x-4, y = y+1, z = z}, {x = x-3, y = y+1, z = z}},
    [8] = {{x = x-4, y = y, z = z}, {x = x-3, y = y, z = z}},
    [9] = {{x = x-4, y = y-1, z = z}, {x = x-3, y = y-1, z = z}},
    [10] = {{x = x-3, y = y-3, z = z}, {x = x-3, y = y-2, z = z}},
    [11] = {{x = x-2, y = y-4, z = z}, {x = x-2, y = y-3, z = z}},
    [12] = {{x = x, y = y-4, z = z}, {x = x, y = y-3, z = z}},
    [13] = {{x = x+2, y = y-4, z = z}, {x = x+2, y = y-3, z = z}},
    [14] = {{x = x+3, y = y-3, z = z}, {x = x+3, y = y-2, z = z}},
    [15] = {{x = x+4, y = y-1, z = z}, {x = x+3, y = y-1, z = z}},
}

local confi3 = { -- Pushing from confi1 into confi2
    [0] = {{x = x+3, y = y, z = z}, {x = x+2, y = y, z = z}},
    [1] = {{x = x+3, y = y+1, z = z}, {x = x+2, y = y+1, z = z}},
    [2] = {{x = x+2, y = y+2, z = z}, {x = x+2, y = y+1, z = z}},
    [3] = {{x = x+1, y = y+3, z = z}, {x = x+1, y = y+2, z = z}},
    [4] = {{x = x, y = y+3, z = z}, {x = x, y = y+2, z = z}},
    [5] = {{x = x-1, y = y+3, z = z}, {x = x-1, y = y+2, z = z}},
    [6] = {{x = x-2, y = y+2, z = z}, {x = x-2, y = y+1, z = z}},
    [7] = {{x = x-3, y = y+1, z = z}, {x = x-2, y = y+1, z = z}},
    [8] = {{x = x-3, y = y, z = z}, {x = x-2, y = y, z = z}},
    [9] = {{x = x-3, y = y-1, z = z}, {x = x-2, y = y-1, z = z}},
    [10] = {{x = x-2, y = y-2, z = z}, {x = x-2, y = y-1, z = z}},
    [11] = {{x = x-1, y = y-3, z = z}, {x = x-1, y = y-2, z = z}},
    [12] = {{x = x, y = y-3, z = z}, {x = x, y = y-2, z = z}},
    [13] = {{x = x+1, y = y-3, z = z}, {x = x+1, y = y-2, z = z}},
    [14] = {{x = x+2, y = y-2, z = z}, {x = x+2, y = y-1, z = z}},
    [15] = {{x = x+3, y = y-1, z = z}, {x = x+2, y = y-1, z = z}},
}


	local confi2={	--Pushing from end to middle
		[0] = {{x = x+3, y = y, z=z}, {x = x+2, y = y, z = z}},
		[1] = {{x = x+3, y = y+1, z=z}, {x = x+2, y = y+1, z = z}},
		[2] = {{x = x+2, y = y+2, z=z}, {x = x+2, y = y+2, z = z}},
		[3] = {{x = x+1, y = y+3, z=z}, {x = x+1, y = y+2, z = z}},
		[4] = {{x = x, y = y+3, z=z}, {x = x, y = y+2, z = z}},
		[5] = {{x = x-1, y = y+3, z=z}, {x = x-1, y = y+2, z = z}},
		[6] = {{x = x-2, y = y+2, z=z}, {x = x-2, y = y+2, z = z}},
		[7] = {{x = x-3, y = y+1, z=z}, {x = x-2, y = y+1, z = z}},
		[8] = {{x = x-3, y = y, z=z}, {x = x-2, y = y, z = z}},
		[9] = {{x = x-3, y = y-1, z=z}, {x = x-2, y = y-1, z = z}},
		[10] = {{x = x-2, y = y-2, z=z}, {x = x-2, y = y-2, z = z}},
		[11] = {{x = x-1, y = y-3, z=z}, {x = x-1, y = y-2, z = z}},
		[12] = {{x = x, y = y-3, z=z}, {x = x, y = y-2, z = z}},
		[13] = {{x = x+1, y = y-3, z=z}, {x = x+1, y = y-2, z = z}},
		[14] = {{x = x+2, y = y-2, z=z}, {x = x+2, y = y-2, z = z}},
		[15] = {{x = x+3, y = y-1, z=z}, {x = x+2, y = y-1, z = z}},
	}

	local confi1={  --Pushing from middle to center
		[0] = {{x = x+2, y = y, z = z}, {x = x+1, y = y, z = z}},
		[1] = {{x = x+2, y = y+1, z = z}, {x = x+1, y = y+1, z = z}},
		[2] = {{x = x+2, y = y+2, z = z}, {x = x+1, y = y+1, z = z}},
		[3] = {{x = x+1, y = y+2, z = z}, {x = x+1, y = y+1, z = z}},
		[4] = {{x = x, y = y+2, z = z}, {x = x, y = y+1, z = z}},
		[5] = {{x = x-1, y = y+2, z = z}, {x = x-1, y = y+1, z = z}},
		[6] = {{x = x-2, y = y+2, z = z}, {x = x-1, y = y+1, z = z}},
		[7] = {{x = x-2, y = y+1, z = z}, {x = x-1, y = y+1, z = z}},
		[8] = {{x = x-2, y = y, z = z}, {x = x-1, y = y, z = z}},
		[9] = {{x = x-2, y = y-1, z = z}, {x = x-1, y = y-1, z = z}},
		[10] = {{x = x-2, y = y-2, z = z}, {x = x-1, y = y-1, z = z}},
		[11] = {{x = x-1, y = y-2, z = z}, {x = x-1, y = y-1, z = z}},
		[12] = {{x = x, y = y-2, z = z}, {x = x, y = y-1, z = z}},
		[13] = {{x = x+1, y = y-2, z = z}, {x = x+1, y = y-1, z = z}},
		[14] = {{x = x+2, y = y-2, z = z}, {x = x+1, y = y-1, z = z}},
		[15] = {{x = x+2, y = y-1, z = z}, {x = x+1, y = y-1, z = z}},
	}

	combat3:execute(creature, variant)	--Executing combat 2 (outside)

	local warningeffect = creature:getPosition()
        warningeffect.x = warningeffect.x + 1
        warningeffect.y = warningeffect.y + 1
        warningeffect:sendMagicEffect(459)

	addEvent(teleportTargets, 100, cid, confi6, pos)
	addEvent(teleportTargets, 300, cid, confi5, pos)
	addEvent(teleportTargets, 500, cid, confi4, pos)
	addEvent(teleportTargets, 700, cid, confi3, pos)
	addEvent(teleportTargets, 900, cid, confi2, pos)
	addEvent(teleportTargets, 1100, cid, confi1, pos)


	addEvent(doDamage, 100, combat2, cid, variant)
	addEvent(doDamage, 400, combat1, cid, variant)
	addEvent(doDamage, 700, combat0, cid, variant)
	addEvent(doDamage, 1000, combatNegative1, cid, variant)
	
    return true
end
