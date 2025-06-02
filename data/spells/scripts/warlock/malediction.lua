local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, 230)
combat1:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 110)
combat1:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat1:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

local condition2 = Condition(CONDITION_CURSED, CONDITIONID_COMBAT)
condition2:setTicks(6000)
condition2:setParameter(CONDITION_PARAM_DELAYED, 1)
condition2:setParameter(CONDITION_PARAM_TICKINTERVAL, 1000)
condition2:setParameter(CONDITION_PARAM_SUBID, 259315)

function onGetFormulaValues(player, skill, attack, factor)

	local magic = player:getMagicLevel()
	local power = skill * attack 
	local level = player:getLevel()


	local min = (level / 5) + (power * 0.145) + magic * 1.2
	local max = (level / 5) + (power * 0.165) + magic * 2.2
	return -min, -max
end

setCombatCallback(combat1, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function CastCurse_wl(cid, var)
    local player = Player(cid)
    local level = player:getLevel()
    local maglevel = player:getMagicLevel()
    local target = player:getTarget()
	
	min = (level / 5) + (maglevel * 1.2) + 2
    max = (level / 5) + (maglevel * 1.8) + 4
	
    condition2:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-min,-max))
    combat1:addCondition(condition2)

    local sword = target:getPosition()
        sword.x = sword.x + 1
        sword.y = sword.y + 1
    sword:sendMagicEffect(833, "turn into bones!")	
end
 
function onCastSpell(creature, var, tar)
    CastCurse_wl(creature:getId(), var)
	
    return combat1:execute(creature, var)
end