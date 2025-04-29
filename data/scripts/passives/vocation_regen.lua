local config = {
    healthThreshold = 50, -- Percentage to activate
    regenInterval = 2000, -- Milliseconds
    effect = CONST_ME_MAGIC_BLUE,
    subId = 1,
    -- Vocation-based regen % (of max HP per interval)
    vocationRegenPercent = {
        [1] = 0.02, -- Sorcerer: 2% max HP
        [2] = 0.03, -- Druid: 3% max HP
        [3] = 0.015, -- Paladin: 1.5% max HP
        [4] = 0.025  -- Knight: 2.5% max HP
    }
}

local function getRegenAmount(player)
    local vocation = player:getVocation():getId()
    local percent = config.vocationRegenPercent[vocation] or 0
    return math.floor(player:getMaxHealth() * percent)
end

local function getHealthPercent(player)
    return (player:getHealth() / player:getMaxHealth()) * 100
end

local function createRegenCondition(player)
    local condition = Condition(CONDITION_REGENERATION)
    condition:setParameter(CONDITION_PARAM_TICKS, -1) -- Infinite duration
    condition:setParameter(CONDITION_PARAM_HEALTHTICKS, config.regenInterval)
    condition:setParameter(CONDITION_PARAM_HEALTHGAIN, getRegenAmount(player))
    condition:setParameter(CONDITION_PARAM_HEALTHGAIN_PERCENT, 0)
    
    return condition
end

local function checkHealth(player)
    if getHealthPercent(player) < config.healthThreshold then
        player:addCondition(createRegenCondition(player))
        player:getPosition():sendMagicEffect(config.effect)
    else
        player:removeCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT, config.subId)
    end
end

local passiveRegen = CreatureEvent("VocationPassiveRegen")
function passiveRegen.onThink(player, interval)
    checkHealth(player)
    return true
end

passiveRegen:register()
