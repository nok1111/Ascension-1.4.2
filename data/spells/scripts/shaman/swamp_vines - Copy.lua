local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMALLPLANTS)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

local AREA_RING1X1 = {
	{0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0},
	{0, 0, 3, 0, 0},
	{0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0}
}
combat:setArea(createCombatArea(AREA_RING1X1))

function onGetFormulaValues(player, level, magicLevel)--Formula for 1sqm
	local min = 100
	local max = 100
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICFORMULA, "onGetFormulaValues")

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
    local DistEffect = {
        [1] = CONST_ANI_EARTH,
        [2] = CONST_ANI_SMALLEARTH
    }
    if creature then
        if getTilePzInfo(Position(addPosition(pos, direction, time))) == FALSE then
            if pos:isSightClear(Position(addPosition(pos, direction, time))) then
                if queryTileAddThing(creature, addPosition(pos, direction, time)) == RETURNVALUE_NOERROR then
                    local Dist = math.random(1, 2)
                    Position(addPosition(pos, direction, time-1)):sendDistanceEffect(Position(addPosition(pos, direction, time)), DistEffect[Dist])
                    Position(addPosition(pos, direction, time-1)):sendDistanceEffect(Position(addPosition(pos, direction, time)), CONST_ANI_EXPLOSION)
                    combat:execute(creature, positionToVariant(addPosition(pos, direction, time)))
                end
            end
        end
    end
end


function onCastSpell(creature, variant)
    local direction = creature:getDirection()
    local pos = creature:getPosition()
	local cid = creature:getId()
	local effect = {
    [DIRECTION_NORTH] = CONST_ME_PURPLENEW5,
    [DIRECTION_EAST] = CONST_ME_PURPLENEW4,
    [DIRECTION_SOUTH] = CONST_ME_PURPLENEW3,
    [DIRECTION_WEST] = CONST_ME_PURPLENEW6
}
    creature:getPosition():sendMagicEffect(effect[creature:getDirection()])
	addEvent(doDamage, 0, cid, combat, pos, 1, direction)
	addEvent(doDamage, 150, cid, combat, pos, 2, direction)
	addEvent(doDamage, 300, cid, combat, pos, 3, direction)
	addEvent(doDamage, 450, cid, combat, pos, 4, direction)
	addEvent(doDamage, 600, cid, combat, pos, 5, direction)
	addEvent(doDamage, 750, cid, combat, pos, 6, direction)

    return true
end
