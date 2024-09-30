local storageKeys = {
    DAMAGE_INCREASED = 12345,
    ABSORB_DAMAGE = 12346,
    INCREASE_HEALTH = 12347,
    MOVEMENT_SPEED = 12348,
    NEARBY_DAMAGE = 12349,
    NEARBY_PARALYZE = 12350,
    DAMAGE_IMMUNE = 12351
}

local function addRandomCondition(player, duration)
    local conditions = {
        "damage_increased",
        "absorb_damage",
        "increase_health",
        "movement_speed",
        "nearby_damage",
        "nearby_paralyze",
        "damage_immune"
    }

    local condition = conditions[math.random(#conditions)]
    local currentTime = os.time()

    if condition == "damage_increased" then
        player:setStorageValue(storageKeys.DAMAGE_INCREASED, currentTime + duration)
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You feel stronger!")
    elseif condition == "absorb_damage" then
        player:setStorageValue(storageKeys.ABSORB_DAMAGE, currentTime + duration)
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You can absorb damage!")
    elseif condition == "increase_health" then
        local healthCondition = Condition(CONDITION_ATTRIBUTES)
        healthCondition:setParameter(CONDITION_PARAM_TICKS, duration * 1000)
        healthCondition:setParameter(CONDITION_PARAM_STAT_MAXHEALTHPERCENT, 120) -- Increase health by 20%
        player:addCondition(healthCondition)
        player:setStorageValue(storageKeys.INCREASE_HEALTH, currentTime + duration)
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Your health has increased!")
    elseif condition == "movement_speed" then
        local speedCondition = Condition(CONDITION_HASTE)
        speedCondition:setParameter(CONDITION_PARAM_TICKS, duration * 1000)
        speedCondition:setParameter(CONDITION_PARAM_SPEED, 200) -- Adjust speed as needed
        player:addCondition(speedCondition)
        player:setStorageValue(storageKeys.MOVEMENT_SPEED, currentTime + duration)
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You feel faster!")
    elseif condition == "nearby_damage" then
        player:setStorageValue(storageKeys.NEARBY_DAMAGE, currentTime + duration)
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Enemies around you take damage!")
    elseif condition == "nearby_paralyze" then
        player:setStorageValue(storageKeys.NEARBY_PARALYZE, currentTime + duration)
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Enemies around you are paralyzed!")
    elseif condition == "damage_immune" then
        player:setStorageValue(storageKeys.DAMAGE_IMMUNE, currentTime + duration)
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You are immune to damage!")
    end
end

local onUseAction = Action()

function onUseAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local duration = 60 -- duration in seconds
    addRandomCondition(player, duration)
    return true
end

onUseAction:id(XXXX) -- cambia XXXX con tu item
onUseAction:register()

local healthChangeEvent = CreatureEvent("ConditionHealthChange")

function healthChangeEvent.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if creature:isPlayer() then
        local currentTime = os.time()
        if creature:getStorageValue(storageKeys.ABSORB_DAMAGE) > currentTime then -- Absorb Damage
            primaryDamage = primaryDamage * 0.5 --50% absorsion
        end
        if creature:getStorageValue(storageKeys.DAMAGE_IMMUNE) > currentTime then -- Damage Immune
            primaryDamage = 0
            secondaryDamage = 0
        end
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end

healthChangeEvent:register()

local globalevent  = CreatureEvent("ConditionThink")

function globalevent.onThink(creature)
    if creature:isPlayer() then
        local currentTime = os.time()

        -- Aura Damage
        if creature:getStorageValue(storageKeys.NEARBY_DAMAGE) > currentTime then
            local spectators = Game.getSpectators(creature:getPosition(), false, false, 3, 3, 3, 3)
            for _, spec in ipairs(spectators) do
                if spec:isMonster() then
					doTargetCombatHealth(creature, spec, COMBAT_ENERGYDAMAGE, -900, -999, CONST_ME_FIREAREA) --ajustar daño y efectos aqui
                end
            end
        end

        -- Aura Paralyze
        if creature:getStorageValue(storageKeys.NEARBY_PARALYZE) > currentTime then
            local spectators = Game.getSpectators(creature:getPosition(), false, false, 3, 3, 3, 3)
            for _, spec in ipairs(spectators) do
                if spec:isMonster() then
                    local paralyzeCondition = Condition(CONDITION_PARALYZE)
                    paralyzeCondition:setParameter(CONDITION_PARAM_TICKS, 2000) -- Adjust paralyze duration as needed
                    spec:addCondition(paralyzeCondition)
					spec:getPosition():sendMagicEffect(CONST_ME_SOUND_BLUE) -- efecto magico de Paralyze
                end
            end
        end
    end
    return true
end

globalevent:interval(1000) -- intervalo para daño
globalevent :register()
