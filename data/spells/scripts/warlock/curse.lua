local combat2 = Combat()
local combatnodot2 = Combat()

for i, c in ipairs({combat2, combatnodot2}) do
    c:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
    c:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BLUESKULL)
    c:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_BLACKARROW)
    c:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
end

local condition2 = Condition(CONDITION_CURSED, CONDITIONID_COMBAT)
condition2:setTicks(15000)
condition2:setParameter(CONDITION_PARAM_DELAYED, 1)
condition2:setParameter(CONDITION_PARAM_TICKINTERVAL, 1500)

function onGetFormulaValues(player, skill, attack, factor)

	local magic = player:getMagicLevel()
	local power = magic * attack 
	local level = player:getLevel()


	local min = (level / 5) + (power * 0.045) + attack
	local max = (level / 5) + (power * 0.065) + attack * 1.5
	return -min, -max
end

setCombatCallback(combat2, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function CastCurse_wl(cid, var)
    local player = Player(cid)
    local level = player:getLevel()
    local maglevel = player:getMagicLevel()
	
	min = (level / 5) + (maglevel * 1.2) + 2
    max = (level / 5) + (maglevel * 1.8) + 4
	
    condition2:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-min,-max))
    combat2:addCondition(condition2)
end
 
function onCastSpell(creature, var, tar)
    CastCurse_wl(creature:getId(), var)
	
	local targetmonster = creature:getTarget()	
	targetmonster:sendProgressbar(15000, false)
	
    return combat2:execute(creature, var)
end