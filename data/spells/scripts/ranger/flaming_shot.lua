local combat2 = Combat()
local combatnodot2 = Combat()

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 7)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 7)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

for i, c in ipairs({combat2, combatnodot2}) do
    c:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
    c:setParameter(COMBAT_PARAM_EFFECT, 6)
    c:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 7)
    c:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
end

local conditionburn = Condition(CONDITION_FIRE, CONDITIONID_COMBAT)
conditionburn:setTicks(7500)
conditionburn:setParameter(CONDITION_PARAM_DELAYED, 1)
conditionburn:setParameter(CONDITION_PARAM_TICKINTERVAL, 1500)


function onGetFormulaValues(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_DISTANCE) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.040) + attack
	local max = (level / 5) + (power * 0.055) +  attack
	return -min, -max
end

setCombatCallback(combat2, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


function onGetFormulaValues2(player, skill, attack, factor)
local magic = player:getMagicLevel()
local level = player:getLevel()
local target = player:getTarget()	
local min = (player:getLevel() / 5)  + (magic * 8)
local max = (player:getLevel() / 5)  + (magic * 8)
	return -min, -max
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

local function CastSpellburningarrow(cid, var)
    local player = Player(cid)
    local level = player:getLevel()
    local maglevel = player:getMagicLevel()
	
	min = (maglevel * 6)
    max = (maglevel * 6)
	
    conditionburn:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-min,-max))
    combat2:addCondition(conditionburn)
end
 
function onCastSpell(creature, var, tar)
    CastSpellburningarrow(creature:getId(), var)
	local targetmonster = creature:getTarget()	
	--targetmonster:sendProgressbar(16500, false)
	
	if targetmonster:getCondition(CONDITION_DRUNK, 0, ConditionsSubIds.beerbarrel) and creature then
	combat:execute(creature, var)
	end
	
	
    return combat2:execute(creature, var)
end
