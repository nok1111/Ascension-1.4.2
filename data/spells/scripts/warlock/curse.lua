local combat2 = Combat()
local combatnodot2 = Combat()

for i, c in ipairs({combat2, combatnodot2}) do
    c:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
    c:setParameter(COMBAT_PARAM_EFFECT, 230)
    c:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 110)
    c:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
end

local condition2 = Condition(CONDITION_CURSED, CONDITIONID_COMBAT)
condition2:setTicks(6000)
condition2:setParameter(CONDITION_PARAM_DELAYED, 1)
condition2:setParameter(CONDITION_PARAM_TICKINTERVAL, 1000)
condition2:setParameter(CONDITION_PARAM_SUBID, 259314)

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
	
    return combat2:execute(creature, var)
end