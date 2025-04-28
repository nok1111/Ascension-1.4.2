local config = {
    healthThreshold = 50, -- Percentage to activate
    regenInterval = 2000, -- Milliseconds
    effect = CONST_ME_MAGIC_BLUE,
    subId = 789, -- Unique condition sub ID
    
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

local function createRegenCondition(player)
    local condition = Condition(CONDITION_REGENERATION)
    condition:setParameter(CONDITION_PARAM_TICKS, -1) -- Infinite duration
    condition:setParameter(CONDITION_PARAM_HEALTHTICKS, config.regenInterval)
    condition:setParameter(CONDITION_PARAM_SUBID, config.subId)
    
    condition:addDamageCondition(1, config.regenInterval, -1, {
        healthPercent = config.healthThreshold,
        callback = function(player)
            local regen = getRegenAmount(player)
            if regen > 0 then
                player:getPosition():sendMagicEffect(config.effect)
            end
            return regen
        end
    })
    
    return condition
end

local passiveRegen = CreatureEvent("VocationPassiveRegen")
function passiveRegen.onLogin(player)
    player:addCondition(createRegenCondition(player))
    return true
end

passiveRegen:register()
