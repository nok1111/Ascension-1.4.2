local config = {
	amount = 40
}


local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 0)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setArea(createCombatArea(AREA_CROSS1X1))

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, 834)

function onGetFormulaValues(player, skill, attack, factor)

	local level = player:getLevel()
	local magic = player:getMagicLevel()
	local power = magic * attack 
	local min = ((level / 5) + (power * 0.085) + (attack * 1.5) + 150) / 2.5
	local max =  ((level / 5) + (power * 0.085) + (attack * 1.5) + 150) / 2.2
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")




local function doDamage_rain_warlock(combat, cid, targetPos, variant)
    local creature = Creature(cid)
    if creature then
        local pos = targetPos
        local x, y, z = pos.x, pos.y, pos.z
        math.randomseed(os.clock()*100000000000)
        local x3 = math.random(-2, 2)
        local y3 = math.random(-2, 2)
        if getTilePzInfo(Position(x+x3, y+y3, z)) == FALSE then
            if Tile(x+x3, y+y3, z) ~= nil then
                variant = positionToVariant(Position(x+x3, y+y3, z))
                combat:execute(creature, variant)
				combat2:execute(creature, variant)
            end
        end
    end
end

function onCastSpell(creature, variant, targetPos)
    local creatureId = creature:getId()
    local target = creature:getTarget()
    if not target then
        return false
    end
    local targetPos = target:getPosition()

    for i=0, config.amount, 1 do
        addEvent(doDamage_rain_warlock, i*200, combat, creatureId, targetPos, variant)
    end

    return true
end