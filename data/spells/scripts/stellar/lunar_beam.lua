local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 259)--286
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

local combat2 = Combat()

combat2:setParameter(COMBAT_PARAM_EFFECT, 231)--286

local AREA_RING1X1 = {
	{0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0},
	{0, 0, 3, 0, 0},
	{0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0}
}

combat:setArea(createCombatArea(AREA_RING1X1))

function onGetFormulaValues(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = magic * attack 
    local level = player:getLevel()


    local min = ((level / 5) + (power * 0.08) + (attack * 3) + 185)
    local max = ((level / 5) + (power * 0.09) + (attack * 3.5) + 200)
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function addPosition(position, direction, add)
    if(direction == NORTH) then
        return {x=position.x, y=position.y-add, z=position.z}
    elseif(direction == EAST) then
        return {x=position.x+add, y=position.y, z=position.z}
    elseif(direction == SOUTH) then
        return {x=position.x, y=position.y+add, z=position.z}
    elseif(direction == WEST) then
        return {x=position.x-add, y=position.y, z=position.z}
    end
end

local function doDamage(cid, combat, pos, time, direction)
    local creature = Creature(cid)
	if not creature then
	return
	end
    local DistEffect = {
        [1] = 73,
        [2] = 74
    }
    if creature then
        if getTilePzInfo(Position(addPosition(pos, direction, time))) == FALSE then
            if pos:isSightClear(Position(addPosition(pos, direction, time))) then
               
                    local Dist = math.random(1, 2)
                    Position(addPosition(pos, direction, time-1)):sendDistanceEffect(Position(addPosition(pos, direction, time)), DistEffect[Dist])
                    Position(addPosition(pos, direction, time-1)):sendDistanceEffect(Position(addPosition(pos, direction, time)), CONST_ANI_EXPLOSION)
                    combat2:execute(creature, positionToVariant(addPosition(pos, direction, time)))
					combat:execute(creature, positionToVariant(addPosition(pos, direction, time)))
            end
        end
    end
end

function onCastSpell(creature, variant)
    local direction = creature:getDirection()
    local pos = creature:getPosition()
	local cid = creature:getId()
	addEvent(doDamage, 0, cid, combat, pos, 1, direction)
	addEvent(doDamage, 150, cid, combat, pos, 2, direction)
	addEvent(doDamage, 300, cid, combat, pos, 3, direction)
	addEvent(doDamage, 450, cid, combat, pos, 4, direction)
	addEvent(doDamage, 600, cid, combat, pos, 5, direction)
	addEvent(doDamage, 750, cid, combat, pos, 6, direction)
    return true
end