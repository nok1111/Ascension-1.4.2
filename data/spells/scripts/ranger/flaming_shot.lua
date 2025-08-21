
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 7)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 7)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

local conditionburn = Condition(CONDITION_FIRE, CONDITIONID_COMBAT)
conditionburn:setTicks(7500)
conditionburn:setParameter(CONDITION_PARAM_DELAYED, 1)
conditionburn:setParameter(CONDITION_PARAM_TICKINTERVAL, 1500)


function onGetFormulaValues(player, skill, attack, factor)
	local power = skill * attack 
    local level = player:getLevel()

    local min = ((level / 5) + (power * 0.0550) + attack * 1.0) * 0.7
    local max = ((level / 5) + (power * 0.0675) + attack * 1.3) * 0.7
	return -min, -max
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")



local function CastSpellburningarrow(cid, var)
    local player = Player(cid)
    local level = player:getLevel()
    local skill = player:getEffectiveSkillLevel(SKILL_DISTANCE)
    local attack = getDistanceAttack(cid)
	
    local power = skill * attack 

    local min = ((level / 8) + (power * 0.015))
    local max = ((level / 8) + (power * 0.0275))
	
    conditionburn:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-min,-max))
    combat:addCondition(conditionburn)
end
 
function onCastSpell(creature, var, tar)
    CastSpellburningarrow(creature:getId(), var)
	local targetmonster = creature:getTarget()	
	
    return combat:execute(creature, var)
end
