-- alchemy_potions.lua
-- RevScript: Applies attribute-based conditions based on potion item id

local potionEffects = {

    --elixirs
    [40221] = { -- small elixir of haste
        subId = 29700,
        duration = 60000, -- 60 seconds
        haste = true,
        message = "You feel a burst of speed!",
        effect = CONST_ME_MAGIC_BLUE
    },
    [40231] = { -- Elixir of Winged Velocity
        subId = 29700,
        duration = 180000, -- 3 minutes
        haste = true,
        message = "You feel a burst of speed!",
        effect = CONST_ME_MAGIC_BLUE
    },
    [40130] = { -- Elixir of Ghosts
        subId = 29700,
        duration = 2500, -- 5 seconds
        invisible = true,
        message = "You feel a burst of speed!",
        effect = CONST_ME_MAGIC_BLUE
    },




    --vials
    [35773] = { -- vial of agility (skill distance)
        subId = 29701,
        duration = 1200000, -- 20 minutes
        attributes = {
            {stat = CONDITION_PARAM_SKILL_DISTANCE, value = 3},
        },
        message = "You feel the effects of the potion!",
        effect = CONST_ME_MAGIC_BLUE
    },
    [35772] = { -- vial of minde flow (max mana)
        subId = 29701,
        duration = 1200000, -- 20 minutes
        attributes = {
            {stat = CONDITION_PARAM_STAT_MAXMANAPOINTS, value = 200},
        },
        message = "You feel the effects of the potion!",
        effect = CONST_ME_MAGIC_BLUE
    },
    [35771] = { -- vial of fortitude (max hp)
        subId = 29701,
        duration = 1200000, -- 20 minutes
        attributes = {
            {stat = CONDITION_PARAM_STAT_MAXHITPOINTS, value = 280}, 
        },
        message = "You feel the effects of the potion!",
        effect = CONST_ME_MAGIC_BLUE
    },
    [35770] = { -- vial of awakening (magic level)
        subId = 29701,
        duration = 1200000, -- 20 minutes
        attributes = {
            {stat = CONDITION_PARAM_STAT_MAGICPOINTS, value = 1}, 
            {stat = CONDITION_PARAM_SKILL_AXE, value = 2}, 

        },
        message = "You feel the effects of the potion!",
        effect = CONST_ME_MAGIC_BLUE
    },
    [35774] = { -- vial of the lion (sword)
        subId = 29701,
        duration = 1200000, -- 20 minutes
        attributes = {
            {stat = CONDITION_PARAM_SKILL_SWORD, value = 3},  
        },
        message = "You feel the effects of the potion!",
        effect = CONST_ME_MAGIC_BLUE
    }, 


    [40237] = { -- vial of Royal Might (sword)
        subId = 29701,
        duration = 1200000, -- 20 minutes
        attributes = {
            {stat = CONDITION_PARAM_SKILL_SWORD, value = 7},  
        },
        message = "You feel the effects of the potion!",
        effect = CONST_ME_MAGIC_BLUE
    }, 
    [40247] = { -- vial of of Mystic Petals
        subId = 29701,
        duration = 1200000, -- 20 minutes
        attributes = {
            {stat = CONDITION_PARAM_STAT_MAGICPOINTS, value = 3}, 
            {stat = CONDITION_PARAM_SKILL_AXE, value = 3}, 

        },
        message = "You feel the effects of the potion!",
        effect = CONST_ME_MAGIC_BLUE
    },
    [40250] = { -- vial of the mushroom (skill distance)
        subId = 29701,
        duration = 1200000, -- 20 minutes
        attributes = {
            {stat = CONDITION_PARAM_SKILL_DISTANCE, value = 7},
        },
        message = "You feel the effects of the potion!",
    effect = CONST_ME_MAGIC_BLUE
    },

    -- Add more potion item ids and effects here






    --Flasks
    [40217] = { -- Starfish Flask (+3 mana regen)
        subId = 29702,
        duration = 600000, -- 10 minutes
        regeneration = {
            {stat = CONDITION_PARAM_MANAGAIN, value = 3},  
        },
        message = "You feel the effects of the potion!",
        effect = CONST_ME_MAGIC_BLUE
    }, 
    [40238] = { -- blooline Flask (+4 health regen)
        subId = 29702,
        duration = 600000, -- 10 minutes
        regeneration = {
            {stat = CONDITION_PARAM_HEALTHGAIN, value = 4},  
        },
        message = "You feel the effects of the potion!",
        effect = CONST_ME_MAGIC_BLUE
    }, 

    [40234] = { -- Flask of the Vital Currents (+8 health regen)
        subId = 29702,
        duration = 600000, -- 10 minutes
        regeneration = {
            {stat = CONDITION_PARAM_HEALTHGAIN, value = 8},  
        },
        message = "You feel the effects of the potion!",
        effect = CONST_ME_MAGIC_BLUE
    }, 

    [40219] = { -- 
    
        subId = 29702,
        duration = 600000, -- 10 minutes
        regeneration = {
            {stat = CONDITION_PARAM_MANAGAIN, value = 6},  
        },
        message = "You feel the effects of the potion!",
        effect = CONST_ME_MAGIC_BLUE
    }, 



    [40232] = { -- Potion of stone (this vial effect can only be removed by similar vial effects) physical damage resistance
        subId = 29703,
        duration = 300000, -- 5 minutes
        callback = true,
        message = "You feel the effects of the potion!",
        effect = CONST_ME_MAGIC_BLUE
    }, 
    [40233] = { -- Potion of nature (this vial effect can only be removed by similar vial effects) elemental damage resistance
        subId = 29704,
        duration = 300000, -- 5 minutes
        callback = true,
        message = "You feel the effects of the potion!",
        effect = CONST_ME_MAGIC_BLUE
    }, 



}

local function applyPotionCondition(player, itemId)
    local effect = potionEffects[itemId]
    if not effect then return false end
    -- Attribute boosts
    if effect.attributes then
        local condition = Condition(CONDITION_ATTRIBUTES, effect.subId)
        condition:setParameter(CONDITION_PARAM_TICKS, effect.duration)
        for _, attr in ipairs(effect.attributes) do
            condition:setParameter(attr.stat, attr.value)
        end
        player:addCondition(condition)
    end
    -- Regeneration
    if effect.regeneration then
        local regen = Condition(CONDITION_REGENERATION)
        regen:setParameter(CONDITION_PARAM_TICKS, effect.duration)
        regen:setParameter(CONDITION_PARAM_SUBID, effect.subId)
        regen:setParameter(CONDITION_PARAM_HEALTHTICKS, 2000) -- 1 second interval for regen
        for _, attr in ipairs(effect.regeneration) do
            regen:setParameter(attr.stat, attr.value)
        end


        player:addCondition(regen)
    end
    -- Haste
    if effect.haste then
        local haste = Condition(CONDITION_HASTE)
        haste:setParameter(CONDITION_PARAM_TICKS, effect.duration)
        haste:setFormula(0.8, -70, 0.8, -70)
        haste:setParameter(CONDITION_PARAM_SUBID, effect.subId)
        player:addCondition(haste)
    end
    if effect.callback then --used on unified passives script
        local conditionCallback = Condition(CONDITION_ATTRIBUTES, effect.subId) 
        conditionCallback:setParameter(CONDITION_PARAM_TICKS, effect.duration)
        player:addCondition(conditionCallback)
    end

    if effect.invisible then --used on unified passives script
        --effect.duration)
        
        local playerId = player:getId()
        player:setGhostMode(true)
        -- player:setGroup(Group(X))
        local baseDuration = effect.duration/1000
        addEvent(function()
            player = Player(playerId)
            if player == nil then return false end
            player:setGhostMode(false)
            -- player:setGroup(Group(1))
        end, baseDuration * 1000)
        player:attachEffectById(156, true)
        player:sendAddBuffNotification(1, baseDuration, 'Stealth', 5, 0)



    end
    return true
end

local alchemyPotion = Action()

function alchemyPotion.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local effectData = potionEffects[item:getId()]
    if applyPotionCondition(player, item:getId()) then
        item:remove(1)
        local msg = effectData and effectData.message or "You feel the effects of the potion!"
        local eff = effectData and effectData.effect or CONST_ME_MAGIC_BLUE
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, msg)
        player:getPosition():sendMagicEffect(eff)
        return true
    end
    return false
end

for itemId, _ in pairs(potionEffects) do
    alchemyPotion:id(itemId)
end

alchemyPotion:register()

-- Usage: Add your potion item ids and their effects to the potionEffects table above.
-- Each entry can have its own subId and set of attribute boosts (skills, stats, etc).
-- Example attributes: CONDITION_PARAM_SKILL_SWORD, CONDITION_PARAM_SKILL_AXE, CONDITION_PARAM_STAT_MAXHITPOINTS, CONDITION_PARAM_STAT_MAXMANAPOINTS, CONDITION_PARAM_STAT_MAGICPOINTS, etc.
