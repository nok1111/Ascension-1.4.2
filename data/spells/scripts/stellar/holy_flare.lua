local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat1:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 164)
combat1:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat1:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat1:setArea(createCombatArea(AREA_CIRCLE2X2))

--condition fear
local conditionFear = Condition(CONDITION_FEAR)
conditionFear:setTicks(1200)
combat1:addCondition(conditionFear)

function onGetFormulaValues(player, skill, attack, factor)

	local magic = player:getMagicLevel()
	local power = skill * attack 
	local level = player:getLevel()


	local min = (level / 5) + (power * 0.145) + magic * 1.2
	local max = (level / 5) + (power * 0.165) + magic * 2.2
	return -min, -max
end

setCombatCallback(combat1, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")



local function CastHolyFlare(cid, var)
    local player = Player(cid)
    local level = player:getLevel()
    local maglevel = player:getMagicLevel()
    local target = player:getTarget()
    local pos = target:getPosition()
	
	min = (level / 5) + (maglevel * 1.2) + 2
    max = (level / 5) + (maglevel * 1.8) + 4

   

    local sword = target:getPosition()
        sword.x = sword.x + 1
        sword.y = sword.y + 1
    sword:sendMagicEffect(662)	

end
 
function onCastSpell(creature, var, tar)
    CastHolyFlare(creature:getId(), var)
	
    return combat1:execute(creature, var)
end