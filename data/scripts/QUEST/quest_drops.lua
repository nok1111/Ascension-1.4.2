-- Mapping of monsters to task numbers, including item drop details
local monsterTaskMap = {
    ["witch"] = {
        tasks = {2, 4}, -- Related tasks
        drops = {
            {itemId = 2148, amount = 10, chance = 50}, -- Gold Coins, 50% chance
            {itemId = 12345, amount = 1, chance = 30}  -- Witch's Essence, 30% chance
        }
    },
    ["Elf"] = {
        tasks = {13},
        drops = {
            {itemId = 27632, amount = 1, chance = 6}, -- Ancient Corrupted Relic, 40% chance
        }
    },
    ["Elf Scout"] = {
        tasks = {13},
        drops = {
            {itemId = 27632, amount = 1, chance = 7}, -- Ancient Corrupted Relic, 40% chance
        }
    },
    ["Elf Arcanist"] = {
        tasks = {13},
        drops = {
            {itemId = 27632, amount = 1, chance = 10}, -- Ancient Corrupted Relic, 40% chance
        }
    },

    ["Fungus"] = {
        tasks = {36},
        drops = {
            {itemId = 7251, amount = 1, chance = 7}, -- Ancient Corrupted Relic, 40% chance
        }
    },
    ["Sporecrawler"] = {
        tasks = {36},
        drops = {
            {itemId = 7251, amount = 1, chance = 7}, -- Ancient Corrupted Relic, 40% chance
        }
    },
    ["Fungal Shambler"] = {
        tasks = {26},
        drops = {
            {itemId = 7251, amount = 1, chance = 7}, -- Ancient Corrupted Relic, 40% chance
        }
    },

    ["Murlok"] = {
        tasks = {66},
        drops = {
            {itemId = 7632, amount = 1, chance = 5}, -- luminous pearl
        }
    },
    ["Murlok Axeman"] = {
        tasks = {66},
        drops = {
            {itemId = 7632, amount = 1, chance = 5}, -- luminous pearl
        }
    },
    ["Murlok Piercer"] = {
        tasks = {66},
        drops = {
            {itemId = 7632, amount = 2, chance = 5}, -- luminous pearl
        }
    },
    ["Murlok Champion"] = {
        tasks = {66},
        drops = {
            {itemId = 7632, amount = 2, chance = 5}, -- luminous pearl
        }
    },
    ["Murlok Shellthorn"] = {
        tasks = {66},
        drops = {
            {itemId = 7632, amount = 2, chance = 5}, -- luminous pearl
        }
    },
    ["Murlok Shaman"] = {
        tasks = {66},
        drops = {
            {itemId = 7632, amount = 2, chance = 5}, -- luminous pearl
        }
    },








}

-- Function to get killers of a target (players who dealt damage within fight time)
local function getKillers(creature)
    local killers = {}
    local timeNow = os.mtime()
    local inFightTicks = configManager.getNumber(configKeys.PZ_LOCKED)

    for uid, cb in pairs(creature:getDamageMap()) do
        local attacker = Player(uid)
        if attacker and attacker ~= creature and timeNow - cb.ticks <= inFightTicks then
            table.insert(killers, attacker)
        end
    end
    return killers
end

local function getTasksForMonster(player, monsterName)
    local activeTasks = {}

    -- Check if the monster exists in the map
    if monsterTaskMap[monsterName] then
        for _, taskId in ipairs(monsterTaskMap[monsterName].tasks) do
            local taskData = getTaskById(taskId)

            if taskData then
                print(">>>>>>>>>>  found taskData")
                local taskStatus = player:getStorageValue(taskData.taskStorageId)

                if taskStatus == TASK_START then
                    table.insert(activeTasks, taskData)
                end
            end
        end
    end

    return activeTasks
end



local questdrops = CreatureEvent("quests_kill_drops")

function questdrops.onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)
    print(">>>>>>>>>  onDeath")
    local monster = Monster(creature:getId())
    if not monster or not corpse then
        return true
    end

    local corpsePosition = corpse:getPosition() -- Get the corpse's position
    local monsterData = monsterTaskMap[monster:getName()]
    if not monsterData then
        print(">>>>>>>>>>  not monster data")
        return true -- No tasks related to this monster
    end

    local killers = getKillers(monster) -- Get all players involved in the kill

    for _, player in ipairs(killers) do
        -- Get all active tasks for the killed monster
        local activeTasks = getTasksForMonster(player, monster:getName())

        for _, task in ipairs(activeTasks) do
            local questName = task.taskName -- Get the quest name for message

            -- Handle item drops based on defined drop rates
            for _, drop in ipairs(monsterData.drops) do
                if math.random(100) <= drop.chance then -- Chance check
                    print(">>>>>>> item added to corpse")
                    
                    -- Add the item directly to the monster's corpse
                    corpse:addItem(drop.itemId, drop.amount)

                    -- Send effect at the corpse's position
                    corpsePosition:sendMagicEffect(205)

                    -- Notify the player
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, 
                        "QUEST [" .. questName .. "]: A " .. ItemType(drop.itemId):getName() .. 
                        " has appeared in the corpse of " .. monster:getName() .. "."
                    )
                end
            end
        end
    end
    return true
end

questdrops:register()