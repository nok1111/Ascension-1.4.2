local combat = Combat()
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)




function onCastSpell(creature, variant)
    local player = Player(creature)
    if not player then
        return false
    end

    local BloodWall = player:getStorageValue(PassiveSkills.BloodWall)
    local shieldpercent = 150
    local maxhitpointpercent = 150

    if BloodWall > 0 then
        shieldpercent = shieldpercent + (BloodWall)
        maxhitpointpercent = maxhitpointpercent + (BloodWall)
    end

 
  
    local condition = Condition(CONDITION_ATTRIBUTES, CONDITIONID_DEFAULT)
    condition:setParameter(CONDITION_PARAM_TICKS, 15000)
    condition:setParameter(CONDITION_PARAM_SKILL_SHIELDPERCENT, shieldpercent)
    condition:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, maxhitpointpercent)
    condition:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.bloodwall) -- Unique sub ID for tracking
    condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

    combat:addCondition(condition)
    combat:execute(creature, variant)
    player:attachEffectById(63, true)
    creature:addHealth(creature:getMaxHealth())
    player:sendAddBuffNotification(104, 15, 'Blood Wall', 5, 0)
	return true
end
