
-- Elusive Dance Spell (Rebuilt)
-- Single 3x3 area, executes every 200ms for 4 times, uses combat formula (onGetFormulaValues)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setArea(createCombatArea(AREA_SQUARE2X2))

function onGetFormulaValues(player, skill, attack, factor)
    local power = skill * attack
    local level = player:getLevel()
    local min = (level / 5) + (power * 0.035) + (attack * 1.2) + 75
    local max = (level / 5) + (power * 0.055) + (attack * 1.5) + 85


    local Reverberation = math.max(player:getStorageValue(PassiveSkills.Reverberation) or 0, 0)
    if Reverberation > 0 then
        min = min * (1 + (Reverberation / 100))
        max = max * (1 + (Reverberation / 100))
    end
    return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function repeatCombat(creatureId, var, times, delay, count)
    count = count or 1
    local creature = Creature(creatureId)
    if not creature or not creature:isPlayer() then return end
    combat:execute(creature, var)
    if count < times then
        addEvent(repeatCombat, delay, creatureId, var, times, delay, count + 1)
    end
end

function onCastSpell(creature, var)
    if not creature then return end
    
    local VeilOfEchos = math.max(creature:getStorageValue(PassiveSkills.VeilOfEchos) or 0, 0)
    --If you have 2 or more Elusive Charges
    local ElusiveCharge = math.max(getBuffStack(creature, "ElusiveCharge") or 0, 0)
    if VeilOfEchos > 0 and ElusiveCharge >= 2 then
        repeatCombat(creature:getId(), var, 4, 200)
        creature:attachEffectById(151, true)
        clearAllBuffStacks(creature)
        creature:sendRemoveBuffNotification(35)
    else
        creature:attachEffectById(146, true)
        repeatCombat(creature:getId(), var, 2, 200)
    end

    local LightningWaltzHeal = math.max(creature:getStorageValue(PassiveSkills.LightningWaltzHeal) or 0, 0)
    if LightningWaltzHeal > 0 then
        creature:addHealth(creature:getMaxHealth() * (LightningWaltzHeal / 100))
    end

    local LightningWaltzparry = math.max(creature:getStorageValue(PassiveSkills.LightningWaltzparry) or 0, 0)
    if LightningWaltzparry > 0 then
        --add condition attributes with subid
        local conditionstatsParry = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
        conditionstatsParry:setParameter(CONDITION_PARAM_TICKS, 5000)
        conditionstatsParry:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
        --subid
        conditionstatsParry:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.LightningWaltzparry)
        creature:addCondition(conditionstatsParry)
    end
    return true
end