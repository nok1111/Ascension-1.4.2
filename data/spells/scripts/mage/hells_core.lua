if not PassiveSkills then
    dofile('data/scripts/PassiveTree/0_PassiveSkillsDataConfig.lua')
end

local config = {
	meteor_effect = 632,
	explosion_effect = 633,
}




local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat1:setParameter(COMBAT_PARAM_BLOCKSHIELD, false)
local area = createCombatArea({
    {0, 0, 1, 0, 0},
    {0, 1, 1, 1, 0},
    {1, 1, 3, 1, 1},
    {0, 1, 1, 1, 0},
    {0, 0, 1, 0, 0}
    })
combat1:setArea(area)

function onGetFormulaValues(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = magic * attack 
    local level = player:getLevel()


    local min = ((level / 5) + (power * 0.10) + (attack * 4.0) + 300) / 3.25
    local max = ((level / 5) + (power * 0.11) + (attack * 4.5) + 400) / 3.15
	return -min, -max
end
combat1:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, false)
local area = createCombatArea({
    {0, 0, 1, 0, 0},
    {0, 1, 1, 1, 0},
    {1, 1, 3, 1, 1},
    {0, 1, 1, 1, 0},
    {0, 0, 1, 0, 0}
})
combat2:setArea(area)

function onGetFormulaValues2(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = magic * attack 
    local level = player:getLevel()


    local min = ((level / 5) + (power * 0.10) + (attack * 4.0) + 300) / 3.25
    local max = ((level / 5) + (power * 0.11) + (attack * 4.5) + 400) / 3.15
	return -min, -max
end
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

local combat3 = Combat()
combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat3:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat3:setParameter(COMBAT_PARAM_BLOCKSHIELD, false)

local area = createCombatArea({
    {0, 0, 1, 0, 0},
    {0, 1, 1, 1, 0},
    {1, 1, 3, 1, 1},
    {0, 1, 1, 1, 0},
    {0, 0, 1, 0, 0}
})
combat3:setArea(area)

function onGetFormulaValues3(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = magic * attack 
    local level = player:getLevel()

    local min = ((level / 5) + (power * 0.10) + (attack * 4.0) + 300) / 3.25
    local max = ((level / 5) + (power * 0.11) + (attack * 4.5) + 400) / 3.15
	return -min, -max
end
combat3:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues3")

local function doDamage(cid, variant, combat)
	local creature = Creature(cid)
	if creature then
		combat:execute(creature, variant)

	end
end

local function area_explosion(cid, modpos)
	local creature = Creature(cid)
	if creature then
		
		local positionnube = modpos
		positionnube.x = modpos.x + 2
		positionnube.y = modpos.y + 2
	
		positionnube:sendMagicEffect(config.explosion_effect)
	end
end

local function getFinalTiles(cid, x, y, z, posArrayFinal, variant)
	local creature = Creature(cid)
	if creature then
		if getTilePzInfo(Position(x+posArrayFinal.x, y+posArrayFinal.y, z)) == FALSE then
			if Tile(x+posArrayFinal.x, y+posArrayFinal.y, z) ~= nil then
				modpos = Position(x+posArrayFinal.x, y+posArrayFinal.y, z)
				variant = positionToVariant(Position(x+posArrayFinal.x, y+posArrayFinal.y, z))
				
				addEvent(doDamage, 400, cid, variant, combat1, modpos)
				addEvent(doDamage, 500, cid, variant, combat2, modpos)
				addEvent(doDamage, 600, cid, variant, combat3, modpos)
				
				addEvent(area_explosion, 0, cid, modpos)
				addEvent(area_explosion, 0, cid, modpos)
				addEvent(area_explosion, 0, cid, modpos)
			end
		end
	end
end

local function getStartingTiles(cid, x, y, z, posArrayFinal, posArrayInicio, variant)
	local creature = Creature(cid)
	if creature then
		if creature:getPosition():isSightClear(Position(x+posArrayFinal.x, y+posArrayFinal.y, z), true) then
			if Tile(x+posArrayFinal.x, y+posArrayFinal.y, z) ~= nil then
				Position(x+posArrayFinal.x, y+posArrayFinal.y, z):sendMagicEffect(config.meteor_effect)
			end
			addEvent(getFinalTiles, 100, cid, x, y, z, posArrayFinal, variant)
		end
	end
end


function onCastSpell(creature, variant)


	local cid = creature:getId()
	local pos = creature:getTarget():getPosition()
	local x, y, z = pos.x, pos.y, pos.z

	math.randomseed(os.clock()*100000000000)

	local posArrayFinal = {
		[0] = {x = math.random(0, 1), y =math.random(-2, -1), flag = true},
		[1] = {x = math.random(-2, -1), y =math.random(0, 1), flag = true},
		[2] = {x = math.random(1, 2), y =math.random(1, 2), flag = true}
	}

	local contador = 0
	while (posArrayFinal[0].flag or posArrayFinal[1].flag or posArrayFinal[2].flag) and contador <= 50 do
		for l = 0, #posArrayFinal, 1 do
			if getTilePzInfo(Position(x+posArrayFinal[l].x, y+posArrayFinal[l].y, z)) == FALSE then
				if Tile(x+posArrayFinal[l].x, y+posArrayFinal[l].y, z) ~= nil then
					if Creature(cid):getPosition():isSightClear(Position(x+posArrayFinal[l].x, y+posArrayFinal[l].y, z), true) then
						posArrayFinal[l].flag = false
					end
				end
			end
		end
		for l = 0, #posArrayFinal, 1 do
			if posArrayFinal[l].flag then
				if l == 0 then
					posArrayFinal[0].x = math.random(0, 1)
					posArrayFinal[0].y =math.random(-2, -1)
				elseif l == 1 then 
					posArrayFinal[1].x = math.random(-2, -1)
					posArrayFinal[1].y =math.random(0, 1)
				elseif l == 2 then
					posArrayFinal[2].x = math.random(1, 2)
					posArrayFinal[2].y =math.random(1, 2)
				end
			end
		end
		contador = contador + 1
	end

	local posArrayInicio = {
		[0] = {x = posArrayFinal[0].x-6, y = posArrayFinal[0].y-7},
		[1] = {x = posArrayFinal[1].x-6, y = posArrayFinal[1].y-7},
		[2] = {x = posArrayFinal[2].x-6, y = posArrayFinal[2].y-7}
	}

	local variants = {
		[0] = nil,
		[0] = nil,
		[0] = nil
	}

	for i=0, #posArrayFinal, 1 do
		addEvent(getStartingTiles, 150*i, cid, x, y, z, posArrayFinal[i], posArrayInicio[i], variants[i])
	end

    return true
end