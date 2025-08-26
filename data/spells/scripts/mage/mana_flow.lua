

local config = {
    rounds = 8, -- amount of ticks
    timer = 1000, -- time between ticks (ms)
    effect = CONST_ME_SKULLHORIZONTAL -- visual effect
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)


function onCastSpell(creature, variant)
    local player = Player(creature)
    if not player then return false end

    if player:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT, ConditionsSubIds.manaflowtick) then
        player:sendCancelMessage("Spell is already active.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    local base = (player:getMaxMana() * 0.03) + 1
    local surgeLevel = math.max(player:getStorageValue(PassiveSkills.SurgeRecovery) or 0, 0)
    local bonus = 1 + (surgeLevel / 100)
    local manaAmount = base * bonus

	
    local manaFlowCondition = Condition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
    manaFlowCondition:setTicks(config.timer * config.rounds)
    manaFlowCondition:setParameter(CONDITION_PARAM_MANAGAIN, manaAmount)
    manaFlowCondition:setParameter(CONDITION_PARAM_MANATICKS, config.timer)
    manaFlowCondition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
    manaFlowCondition:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.manaflowtick)
    
    -- Initial tick
    combat:addCondition(manaFlowCondition)
    player:attachEffectById(18, true)
    player:sendAddBuffNotification(17, ((config.timer * config.rounds) / 1000), 'Mana Flow', 5, 0)

    return combat:execute(player, variant)
end

