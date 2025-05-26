local action = Action()

-- Constants
local MONSTER_DESPAWN_TIME = 5 * 60 * 1000 -- 5 minutes
local TARGET_TYPES = {
    ITEM = 0,
    MONSTER = 2,
    NPC = 3
}

-- COMPREHENSIVE SAMPLE CONFIGURATION [0000]
local config = {
    [0000] = { -- Sample action demonstrating ALL options
        -- Basic Identification
        type = "monster_interaction", -- or "item_use"
        description = "Demonstration action with all possible options",
        
        -- Global Animated Text
        animatedText = {text = "ACTION USED!", color = TEXTCOLOR_WHITE_EXP},
        
        -- Target Requirements
        target = {
            name = "demon",
            targetType = TARGET_TYPES.MONSTER,
            reqHP = 30, -- HP% or less (<=)
            outfit = {
                lookType = 35
            }
        },
        
        -- Player Requirements
        required_storage = {
            {id = 1000, value = 1},
            {id = 1001, value = 3}
        },
        need_item = {
            {id = 2160, count = 1, remove = true},
            {id = 5903, count = 1, remove = false}
        },
        minLevel = 50,
        vocation = {1, 2, 5},
        
        -- Action Configuration
        chance = 75,
        charges = 3,
        cooldown = 60 * 1000,
        
        -- Messages
        successMessage = "The ritual succeeds!",
        failMessage = "The ritual fails!",
        cooldownMessage = "You must wait before using this again.",
        requirementMessage = "You don't meet the requirements!",
        
        -- Visual/Sound Effects
        effects = {
            success = {
                magicEffects = {CONST_ME_MAGIC_RED, CONST_ME_FIREAREA},
                sound = "OMNIVOZ",
                playerEffect = CONST_ME_MAGIC_GREEN,
                animatedText = {text = "SUCCESS!", color = TEXTCOLOR_GREEN}
            },
            fail = {
                magicEffects = {CONST_ME_POFF},
                sound = "UGH",
                animatedText = {text = "FAILED!", color = TEXTCOLOR_RED}
            }
        },
        
        -- Monster Transformation
        monster_transform = {
            from = "demon",
            to = "fallen angel",
            keep_hp = true,
            respawn = {
                enabled = true,
                delay = 2 * 60 * 1000,
                effect = CONST_ME_TELEPORT
            },
            summonPositions = {
                Position(100, 100, 7),
                Position(101, 100, 7)
            },
            animatedText = {text = "TRANSFORMED!", color = TEXTCOLOR_LIGHTBLUE}
        },
        
        -- Monster to Item Conversion
        monster_into_item = {
            id = 6500,
            count = 1,
            effect = CONST_ME_MORTAREA,
            animatedText = {text = "ESSENCE EXTRACTED!", color = TEXTCOLOR_PURPLE},
            randomItems = {
                {id = 6500, chance = 70},
                {id = 6501, chance = 30}
            }
        },
        
        -- Reward System
        reward = {
            storage = {
                {id = 5000, value = 1, stack = true},
                {id = 5001, value = 5, stack = true}
            },
            items = {
                {id = 2160, count = 1, chance = 100},
                {id = 2152, count = 3, chance = 50}
            },
            experience = 1000,
            stats = {points = 2},
            achievement = "Demon Slayer",
            addon = {type = 1, outfit = 150},
            animatedText = {text = "REWARD!", color = TEXTCOLOR_YELLOW}
        },
        
        -- Additional Effects
        teleportTo = Position(100, 100, 7),
        damagePlayer = {amount = 50, type = COMBAT_FIREDAMAGE},
        areaEffect = {
            radius = 3,
            effect = CONST_ME_FIREAREA,
            damage = {min = 50, max = 100, type = COMBAT_FIREDAMAGE},
            animatedText = {text = "BOOM!", color = TEXTCOLOR_ORANGE}
        },
        
        -- Item Transformation
        transform_item = {
            from = 2160,
            to = 2152,
            time = 30 * 1000,
            effect = CONST_ME_ENERGYHIT,
            animatedText = {text = "TRANSFORMED!", color = TEXTCOLOR_LIGHTGREEN}
        },
        
        -- Special Flags
        removeOnUse = true,
        destroyTarget = true,
        showAnimation = true,
        logAction = true
    },
    
    -- ACTUAL CONFIGURATIONS
    [0001] = {
        type = "monster_interaction",
        target = {
            name = "chicken",
            targetType = TARGET_TYPES.MONSTER,
            reqHP = 50
        },
        monster_into_item = {
            id = 5890,
            count = 3,
            effect = CONST_ME_BLOCKHIT,
            animatedText = {text = "FEATHERS!", color = TEXTCOLOR_WHITE_EXP}
        },
        successMessage = "You plucked feathers from the chicken!"
    },



}

-- Helper Functions --
----------------------

-- Check storage requirements
local function meetsStorageRequirements(player, storageReqs)
    if not storageReqs then return true end
    
    for _, req in ipairs(storageReqs) do
        if player:getStorageValue(req.id) < req.value then
            return false, req
        end
    end
    return true
end

-- Check item requirements
local function hasRequiredItems(player, items)
    if not items then return true end
    
    for _, itemReq in ipairs(items) do
        if player:getItemCount(itemReq.id) < itemReq.count then
            return false, itemReq
        end
    end
    return true
end

-- Remove required items
local function removeRequiredItems(player, items)
    if not items then return end
    
    for _, itemReq in ipairs(items) do
        if itemReq.remove then
            player:removeItem(itemReq.id, itemReq.count)
        end
    end
end

-- Handle storage changes
local function handleStorage(player, storageConfig)
    if not storageConfig then return end
    
    if storageConfig.id and storageConfig.value then
        local current = math.max(0, player:getStorageValue(storageConfig.id))
        if storageConfig.stack then
            player:setStorageValue(storageConfig.id, current + storageConfig.value)
        else
            player:setStorageValue(storageConfig.id, storageConfig.value)
        end
    end
end

-- Handle rewards
local function handleRewards(player, rewardConfig)
    if not rewardConfig then return end
    
    -- Storage rewards
    if rewardConfig.storage then
        if type(rewardConfig.storage[1]) == "table" then
            for _, storage in ipairs(rewardConfig.storage) do
                handleStorage(player, storage)
            end
        else
            handleStorage(player, rewardConfig.storage)
        end
    end
    
    -- Item rewards
    if rewardConfig.items then
        for _, item in ipairs(rewardConfig.items) do
            if math.random(100) <= (item.chance or 100) then
                player:addItem(item.id, item.count)
            end
        end
    end
    
    -- Experience rewards
    if rewardConfig.experience then
        player:addExperience(rewardConfig.experience)
    end
    
    -- Stat points
    if rewardConfig.stats and rewardConfig.stats.points then
       -- player:addStatsPoints(rewardConfig.stats.points)
        PassiveSkills.addPassivePoints(player, rewardConfig.stats.points)
    end
    
    -- Achievements
    if rewardConfig.achievement then
        player:addAchievement(rewardConfig.achievement)
    end
    
    -- Addons
    if rewardConfig.addon then
        player:addOutfitAddon(rewardConfig.addon.outfit, rewardConfig.addon.type)
    end
end

-- Monster transformation with HP tracking
local function transformMonster(monster, transformConfig, position)
    if not monster or not transformConfig then return false end
    
    -- Store HP percentage if needed
    local hpPercent
    if transformConfig.keep_hp then
        hpPercent = (monster:getHealth() / monster:getMaxHealth()) * 100
    end
    
    -- Remove original monster
    local monsterName = monster:getName()
    monster:remove()
    
    -- Create new transformed monster(s)
    if transformConfig.to then
        local function createTransformed(pos)
            local newMonster = Game.createMonster(transformConfig.to, pos)
            if newMonster and transformConfig.keep_hp and hpPercent then
                local newHp = (newMonster:getMaxHealth() * hpPercent) / 100
                newMonster:addHealth(-(newMonster:getHealth() - newHp))
            end
            return newMonster
        end

        if transformConfig.summonPositions then
            for _, pos in ipairs(transformConfig.summonPositions) do
                createTransformed(pos)
            end
        else
            createTransformed(position)
        end
    end
    
    -- Respawn original if configured
    if transformConfig.respawn and transformConfig.respawn.enabled then
        addEvent(function()
            Game.createMonster(transformConfig.from, position)
            if transformConfig.respawn.effect then
                position:sendMagicEffect(transformConfig.respawn.effect)
            end
        end, transformConfig.respawn.delay)
    end
    
    return true
end

-- Monster to item conversion
local function convertMonsterToItem(monster, itemConfig, position)
    if not monster or not itemConfig then return false end
    
    -- Remove the monster
    monster:remove()
    
    -- Create the item(s)
    if itemConfig.randomItems then
        local roll = math.random(100)
        local cumulativeChance = 0
        for _, item in ipairs(itemConfig.randomItems) do
            cumulativeChance = cumulativeChance + item.chance
            if roll <= cumulativeChance then
                Game.createItem(item.id, itemConfig.count or 1, position)
                break
            end
        end
    elseif itemConfig.id and itemConfig.count then
        for i = 1, itemConfig.count do
            Game.createItem(itemConfig.id, 1, position)
        end
    end
    
    -- Show effect if specified
    if itemConfig.effect then
        position:sendMagicEffect(itemConfig.effect)
    end
    
    return true
end

-- Unified Animated Text Handler
local function sendAnimatedText(config, position)
    if not config or not position then return end
    
    -- Check all possible locations for animatedText
    local sources = {
        config, -- Root level
        config.effects and config.effects.success,
        config.effects and config.effects.fail,
        config.reward,
        config.monster_transform,
        config.monster_into_item,
        config.areaEffect,
        config.transform_item
    }
    
    for _, source in ipairs(sources) do
        if source and source.animatedText then
            Game.sendAnimatedText(source.animatedText.text, position, source.animatedText.color)
        end
    end
end

-- Effect handler
local function sendEffects(position, effects)
    if not effects then return end
    
    -- Magic effects
    if effects.magicEffects then
        if type(effects.magicEffects) == "table" then
            for _, effect in ipairs(effects.magicEffects) do
                position:sendMagicEffect(effect)
            end
        else
            position:sendMagicEffect(effects.magicEffects)
        end
    end
    
    -- Player effects
    if effects.playerEffect then
        if Player(player) then
            player:getPosition():sendMagicEffect(effects.playerEffect)
        end
    end
end

-- Main Action Handler --
-------------------------
function action.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local config = config[item.itemid]
    if not config then return false end

    -- 1. Process all animated texts
    sendAnimatedText(config, toPosition)

    -- 2. Check storage requirements
    if config.required_storage then
        local meetsReq, missingReq = meetsStorageRequirements(player, config.required_storage)
        if not meetsReq then
            player:sendTextMessage(MESSAGE_FAILURE, config.requirementMessage or 
                string.format("Requirement not met (Storage %d >= %d)!", missingReq.id, missingReq.value))
            return true
        end
    end

    -- 3. Check item requirements
    if config.need_item then
        local hasItems, missingItem = hasRequiredItems(player, config.need_item)
        if not hasItems then
            player:sendTextMessage(MESSAGE_FAILURE, config.requirementMessage or 
                string.format("You need %d of item ID %d!", missingItem.count, missingItem.id))
            return true
        end
    end

    -- 4. Check level and vocation
    if config.minLevel and player:getLevel() < config.minLevel then
        player:sendTextMessage(MESSAGE_FAILURE, config.requirementMessage or "Your level is too low!")
        return true
    end
    
    if config.vocation then
        local hasVocation = false
        for _, voc in ipairs(config.vocation) do
            if player:getVocation():getId() == voc then
                hasVocation = true
                break
            end
        end
        if not hasVocation then
            player:sendTextMessage(MESSAGE_FAILURE, config.requirementMessage or "Your vocation cannot use this!")
            return true
        end
    end

    -- 5. Target validation
    if config.type == "monster_interaction" then
        if not target or target:getType() ~= config.target.targetType then
            return false
        end

        if config.target.name and target:getName():lower() ~= config.target.name:lower() then
            return false
        end

        if target:isMonster() and target:getMaster() then
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Can't use on summoned creatures!")
            return true
        end

        -- HP check (<= reqHP)
        if config.target.reqHP then
            local monster = Monster(target:getId())
            if monster then
                local hpPercent = (monster:getHealth() / monster:getMaxHealth()) * 100
                if hpPercent > config.target.reqHP then
                    player:sendTextMessage(MESSAGE_INFO_DESCR, config.failMessage or "Target's HP is too high!")
                    if config.effects and config.effects.fail then
                        sendEffects(toPosition, config.effects.fail)
                    end
                    return true
                end
            end
        end
        
        -- Outfit check
        if config.target.outfit then
            local outfit = target:getOutfit()
            if outfit.lookType ~= config.target.outfit.lookType then
                return false
            end
        end
    end

    -- 6. Success chance roll
    if config.chance and math.random(100) > config.chance then
        player:sendTextMessage(MESSAGE_INFO_DESCR, config.failMessage or "Action failed!")
        if config.effects and config.effects.fail then
            sendEffects(toPosition, config.effects.fail)
            if config.effects.fail.sound then
                player:say(config.effects.fail.sound, TALKTYPE_MONSTER_YELL)
            end
        end
        return true
    end

    -- 7. Remove required items
    if config.need_item then
        removeRequiredItems(player, config.need_item)
    end

    -- 8. Handle monster transformations
    if config.monster_transform and target and target:isMonster() then
        transformMonster(Monster(target:getId()), config.monster_transform, toPosition)
    end

    -- 9. Handle monster to item conversion
    if config.monster_into_item and target and target:isMonster() then
        convertMonsterToItem(Monster(target:getId()), config.monster_into_item, toPosition)
    end

    -- 10. Handle item transformations
    if config.transform_item and target and target:isItem() then
        local transformItem = config.transform_item
        if target:getId() == transformItem.from then
            local oldActionId = target:getActionId()
            target:transform(transformItem.to)
            target:setActionId(0)
            addEvent(function()
                local tile = Tile(toPosition)
                if tile then
                    local item = tile:getItemById(transformItem.to)
                    if item then
                        item:transform(transformItem.from)
                        item:setActionId(oldActionId)
                    end
                end
            end, transformItem.time)
        end
    end

    -- 11. Success effects
    if config.successMessage then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.successMessage)
    end

    if config.effects and config.effects.success then
        sendEffects(toPosition, config.effects.success)
        if config.effects.success.sound then
            player:say(config.effects.success.sound, TALKTYPE_MONSTER_YELL)
        end
    end

    -- 12. Give rewards
    if config.reward then
        handleRewards(player, config.reward)
    end

    -- 13. Additional effects
    if config.teleportTo then
        player:teleportTo(config.teleportTo)
    end
    
    if config.damagePlayer then
        player:addHealth(-config.damagePlayer.amount)
    end
    
    if config.areaEffect then
        local centerPos = player:getPosition()
        sendEffects(centerPos, config.areaEffect)
        
        if config.areaEffect.damage then
            player:addHealth(-math.random(
                config.areaEffect.damage.min, 
                config.areaEffect.damage.max
            ))
        end
    end

    -- 14. Cleanup
    if config.removeOnUse then
        item:remove(1)
    end
    
    if config.destroyTarget and target then
        target:remove()
    end

    return true
end

-- Register all configured items
for itemId, _ in pairs(config) do
    if itemId ~= 0000 then -- Skip sample config
        action:id(itemId)
    end
end
action:register()