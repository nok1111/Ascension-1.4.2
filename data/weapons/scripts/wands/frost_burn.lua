
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SHADOWSKULL)
combat:setParameter(COMBAT_PARAM_EFFECT, 230)



function onGetFormulaValues(player, skill, attack, factor)
	local magicfactor = player:getMagicLevel()

    -- Apply WandDamage passive bonus
	local damage = (player:getLevel() / 5) + ((magicfactor * attack) * 0.060) + attack
	local wandLevel = 0
	if player and player.getStorageValue then
		wandLevel = math.max(player:getStorageValue(PassiveSkills.WandDamage) or 0, 0)
	end
	local wandBonus = 1 + (wandLevel / 100)
	damage = damage * wandBonus
	return -damage
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onUseWeapon(player, variant)
    if not combat:execute(player, variant) then
        return false
    end 

    if Creature(variant:getNumber()):isPlayer() then
        local damage = math.floor((player:getMagicLevel() * 0.03) + 5)
		
       player:addDamageCondition(Creature(variant:getNumber()), CONDITION_FREEZING, DAMAGELIST_CONSTANT_PERIOD, damage, 1, 4)
		
        
    else
        local damage = math.floor((player:getMagicLevel() * 0.05) + 8)
		
       player:addDamageCondition(Creature(variant:getNumber()), CONDITION_FREEZING, DAMAGELIST_CONSTANT_PERIOD, damage, 2, 4)
	   
    
    end

    return true
end


