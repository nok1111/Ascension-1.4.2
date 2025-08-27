local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)


function onGetFormulaValues(player, level, maglevel)
    local maxHealth = player:getMaxHealth() / 100
    local min = (level / 5) + (maxHealth * 20) + (maglevel * 8.4) + 50
    local max = (level / 5) + (maxHealth * 20) + (maglevel * 9.8) + 75
    return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
    local level = creature:getLevel()
    local maglevel = creature:getMagicLevel()
    local maxHealth = creature:getMaxHealth()

    local totalDuration = 8000 -- Total duration in milliseconds
    local tickInterval = 1000 -- Interval in milliseconds

    -- Periodic heal formula
    local min = (level / 5) + (maglevel * 1.4) + (maxHealth * 0.03)
    local max = (level / 5) + (maglevel * 1.8) + (maxHealth * 0.03)
 
	local extrahealing = creature:getSpecialSkill(SPECIALSKILL_EXTRAHEALING)
    if extrahealing > 0 then
        min = min * (1 + (extrahealing / 100))
        max = max * (1 + (extrahealing / 100))
    end

    local healthGainPerTick = math.random(min, max)

    local manaFlowCondition = Condition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
    manaFlowCondition:setTicks(totalDuration)
    manaFlowCondition:setParameter(CONDITION_PARAM_HEALTHGAIN, healthGainPerTick)
    manaFlowCondition:setParameter(CONDITION_PARAM_HEALTHTICKS, tickInterval)
    manaFlowCondition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
    manaFlowCondition:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.rejuvenation)
    
    -- Initial tick
    combat:addCondition(manaFlowCondition)
    combat:execute(creature, variant)

    local sword = creature:getPosition()
    sword.x = sword.x + 1
    sword.y = sword.y + 1
    sword:sendMagicEffect(444)
    
    creature:sendAddBuffNotification(10, 8, 'Rejuvenation healing for: ' .. healthGainPerTick, 5, 0)

    return true
end
