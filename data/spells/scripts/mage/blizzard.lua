local config = {
	amount = 70,
	amount2 = 10
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setArea(createCombatArea(AREA_CROSS1X1))

local slowCombat = Combat()
slowCombat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
slowCombat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
slowCombat:setParameter(COMBAT_PARAM_AGGRESSIVE, true)

local slowCondition = Condition(CONDITION_PARALYZE)
slowCondition:setParameter(CONDITION_PARAM_TICKS, 1200) -- Duration in milliseconds
slowCondition:setFormula(-0.7, 0, -0.7, 0) -- Adjust the values to set the speed reduction

slowCombat:addCondition(slowCondition)

function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()
	local magic = player:getMagicLevel()
	local power = magic * attack 
	local min = ((level / 5) + (power * 0.085) + (attack * 1.5) + 150) / 8
	local max =  ((level / 5) + (power * 0.085) + (attack * 1.5) + 150) / 7
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function sendRainAnimation(cid)
    local creature = Creature(cid)
    if creature then
        local pos = creature:getPosition()
        local x, y, z = pos.x, pos.y, pos.z
        math.randomseed(os.clock()*100000000000)
        local x2 = math.random(-6, -4)
        local y2 = math.random(-6, -4)
        creature:getPosition():sendDistanceEffect(Position(x+x2, y+y2, z), 37)
        creature:getPosition():sendDistanceEffect(Position(x+x2, y+y2, z), 163)
    end
    return true
end

local function doDamage(combat, slowCombat, cid, targetPos, variant)
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
                slowCombat:execute(creature, variant)
				
				local sword = Position(x+x3, y+y3, z)
				sword:sendMagicEffect(514)
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
	
	 for i=0, config.amount2, 1 do
	 addEvent(sendRainAnimation, i*50, creatureId)
	end
    for i=0, config.amount, 1 do
        addEvent(doDamage, i*50, combat, slowCombat, creatureId, targetPos, variant)
        creature:sendProgressbar(2500, false)
    end

    return true
end
