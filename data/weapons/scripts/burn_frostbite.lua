
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ICEARROW)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)


function onGetFormulaValues(player, skill, attack, factor)
	local damage = (player:getLevel() / 5) + ((skill * attack) * 0.085)
	return -damage
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


function onUseWeapon(player, variant)
    if not combat:execute(player, variant) then
        return false
    end 

    local damage = math.floor((player:getLevel() / 5) + (player:getEffectiveSkillLevel(SKILL_DISTANCE) * 0.06) + 14)	
    player:addDamageCondition(Creature(variant:getNumber()), CONDITION_FREEZING, DAMAGELIST_CONSTANT_PERIOD, damage, 2, 4)
	   

    return true
end


