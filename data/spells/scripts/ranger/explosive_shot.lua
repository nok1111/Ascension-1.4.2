local config = {
	amount = 6
}


local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 6)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setArea(createCombatArea(AREA_CIRCLE1X2))

local combat2 = Combat()

combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setArea(createCombatArea(AREA_CIRCLE1X2))

local conditionburn_shots = Condition(CONDITION_FIRE, CONDITIONID_COMBAT)
conditionburn_shots:setTicks(7500)
conditionburn_shots:setParameter(CONDITION_PARAM_DELAYED, 1)
conditionburn_shots:setParameter(CONDITION_PARAM_TICKINTERVAL, 1500)

function onGetFormulaValues(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = ((level / 5) + (power * 0.045) + (attack * 2.5) + 50) * 0.18
	local max = ((level / 5) + (power * 0.085) + (attack * 3.5) + 65) * 0.19
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onGetFormulaValues2(player, skill, attack, factor)
local magic = player:getMagicLevel()
local level = player:getLevel()
local target = player:getTarget()	
local min = ((player:getLevel() / 5)  + (attack * 0.4) + 35) * 0.22
local max = ((player:getLevel() / 5)  + (attack * 0.5) + 50) * 0.25
	return -min, -max
end

setCombatCallback(combat2, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

local function CastSpellburningshots(creatureId, variant)
    local creature = Creature(creatureId)
	if not creature and creature:getTarget() then
		return
	end
    local level = creature:getLevel()
    local maglevel = creature:getMagicLevel()
	
	min = (level * 0.7)
    max = (level * 1.2)
	
    conditionburn_shots:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-min,-max))
    combat2:addCondition(conditionburn_shots)
	combat2:execute(creature, variant)
end

local function sendRainAnimation(cid, targetPos, variant)
    local creature = Creature(cid)
    if creature then
        local x, y, z = targetPos.x, targetPos.y, targetPos.z
        math.randomseed(os.clock()*100000000000)
        local x2 = math.random(-1, 1)
        local y2 = math.random(-1, 1)
        creature:getPosition():sendDistanceEffect(Position(x+x2, y+y2, z), CONST_ANI_BURSTARROW)
        creature:getPosition():sendDistanceEffect(Position(x+x2, y+y2, z), 4)
    end
    return true
end



local function doDamage(combat, cid, targetPos, variant)
    local creature = Creature(cid)
    if creature then
        local pos = targetPos
        local x, y, z = pos.x, pos.y, pos.z
        math.randomseed(os.clock()*100000000000)
        local x3 = math.random(-1, 1)
        local y3 = math.random(-1, 1)
        if getTilePzInfo(Position(x+x3, y+y3, z)) == FALSE then
            if Tile(x+x3, y+y3, z) ~= nil then
                variant = positionToVariant(Position(x+x3, y+y3, z))
                combat:execute(creature, variant)
				if creature:getTarget() and creature:getTarget():getCondition(CONDITION_DRUNK, 0, 25970) then
				addEvent(CastSpellburningshots, 6*320, creature:getId(), variant)
				end
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
        addEvent(sendRainAnimation, i*320, creatureId, targetPos, variant)
       -- addEvent(rain, i*120, creatureId, targetPos, variant)
        addEvent(doDamage, i*320, combat, creatureId, targetPos, variant)
        creature:sendProgressbar(2500, false)
    end

    return true
end