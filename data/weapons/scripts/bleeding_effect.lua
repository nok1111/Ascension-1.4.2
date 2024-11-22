local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)


combat:setFormula(COMBAT_FORMULA_SKILL, 0, 0, 1, 0)

function onUseWeapon(player, variant)
    if not combat:execute(player, variant) then
        return false
    end

    if math.random(1, 100) <= 25 then
	Creature(variant:getNumber()):getPosition():sendMagicEffect(CONST_ME_CRITICAL_DAMAGE)
        return false
    end

    if Creature(variant:getNumber()):isPlayer() then
        local damage = math.floor((player:getEffectiveSkillLevel(SKILL_STRENGHT) * 0.01) + 1)
		
       player:addDamageCondition(Creature(variant:getNumber()), CONDITION_BLEEDING, DAMAGELIST_CONSTANT_PERIOD, damage, 1, 4)
		
        
    else
        local damage = math.floor((player:getEffectiveSkillLevel(SKILL_STRENGHT) * 0.02) + 1)
		
       player:addDamageCondition(Creature(variant:getNumber()), CONDITION_BLEEDING, DAMAGELIST_CONSTANT_PERIOD, damage, 2, 4)
		
    
    end
    return true
end