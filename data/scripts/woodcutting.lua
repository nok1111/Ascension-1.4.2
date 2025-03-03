local cfg = {
    chance = 100,
    skillStr = 'SKILL_RUNE_SEEKER',
    stage2Regen = 900 * 1000, -- 15 minutes
    stage3Regen = 1 * 1000, -- do not change
    logs = {
        common = {39961},
        rare = {39965, 39967},
        epic = {39971},
        ultrarare = {39973}
    },
    skillThresholds = {
        common = 0,
        rare = 2,
        epic = 4,
        ultrarare = 6
    },
    dropChances = {
        common = 70, -- 70% chance for common logs
        rare = 20,   -- 20% chance for rare logs
        epic = 8,    -- 8% chance for epic logs
        ultrarare = 2 -- 2% chance for ultrarare logs
    },
    pointsPerRarity = {
    common = 4,
    rare = 6,
    epic = 8,
    ultrarare = 10
    },

    trees = {
        {effect = 381, amount = {1, 2}, skillReq = 0, veins = {
                {id = 7024}, -- pine
                {id = 8786} -- broken tree
                
            }
        },
         {effect = 381, amount = {1, 2}, skillReq = 0, veins = {
                {id = 2725}, -- palm
                {id = 8792} -- broken tree
                
            }
        },
         {effect = 381, amount = {1, 2}, skillReq = 0, veins = {
                {id = 2726}, -- coconut
                {id = 8792} -- broken tree
                
            }
        },
         {effect = 381, amount = {1, 2}, skillReq = 0, veins = {
                {id = 39943}, -- banana tree
                {id = 8792} -- broken tree
                
            }
        },
        {effect = 381,  amount = {1, 2}, skillReq = 0, veins = {
            {id = 39944}, -- banana tree
            {id = 8792} -- broken tree
            
            }
        },
        {effect = 381, amount = {1, 2}, skillReq = 0, veins = {
            {id = 39945}, -- banana tree
            {id = 8792} -- broken tree
            
            }
        },
        {effect = 381, amount = {1, 2}, skillReq = 0, veins = {
            {id = 39946}, -- banana tree
            {id = 8792} -- broken tree
            
            }
        },
        {effect = 381, amount = {1, 2}, skillReq = 0, veins = {
            {id = 39947}, -- banana tree
            {id = 8792} -- broken tree
            
            }
        },
        {effect = 381, amount = {1, 2}, skillReq = 0, veins = {
            {id = 39948}, -- mango tree
            {id = 8786} -- broken tree
            
            }
        },
        {effect = 381, amount = {1, 2}, skillReq = 0, veins = {
            {id = 39949}, -- mango tree
            {id = 8786} -- broken tree
            
            }
        },
        {effect = 381, amount = {1, 2}, skillReq = 0, veins = {
            {id = 39950}, -- snowy dead tree
            {id = 8786} -- broken tree
            
            }
        },
        {effect = 381,  amount = {1, 2}, skillReq = 0, veins = {
            {id = 39951}, -- snowy tree
            {id = 8786} -- broken tree
            
            }
        },
        {effect = 381,  amount = {1, 2}, skillReq = 0, veins = {
            {id = 39952}, -- heliodor ore
            {id = 8786} -- broken tree
            
            }
        },

        {effect = 381,  amount = {1, 2}, skillReq = 0, veins = {
            {id = 40050}, -- heliodor ore
            {id = 8786} -- broken tree
            
            }
        },
        {effect = 381,  amount = {1, 2}, skillReq = 0, veins = {
            {id = 40051}, -- heliodor ore
            {id = 8786} -- broken tree
            
            }
        },
        {effect = 381,  amount = {1, 2}, skillReq = 0, veins = {
            {id = 40052}, -- heliodor ore
            {id = 8786} -- broken tree
            
            }
        },
       


    }
}

local regenerating = {}

local function regenVein(pos, id, row, index)
    local item = Tile(pos):getItemById(id)
    if not item then return false end
    local currVein = cfg.trees[row].veins
    local transformId = currVein[index].id
    item:transform(transformId)
    if currVein[index - 1] and currVein[index - 1].id then
        regenerating[pos] = addEvent(regenVein, cfg.stage3Regen, pos, transformId, row, index - 1)
    end
end

local function getLogForSkill(skillLevel)
    local logs = {}
    for rarity, threshold in pairs(cfg.skillThresholds) do
        if skillLevel >= threshold then
            for _, logId in ipairs(cfg.logs[rarity]) do
                table.insert(logs, {id = logId, chance = cfg.dropChances[rarity], rarity = rarity})
            end
        end
    end

    if #logs == 0 then
        print("ERROR: No logs available for this skill level: " .. skillLevel)
    end

    return logs
end


local function chooseLog(logs)
    if not logs or #logs == 0 then
        print("ERROR: Logs table is empty!")
        return nil, nil
    end

    local totalChance = 0
    for _, log in ipairs(logs) do
        totalChance = totalChance + (log.chance or 0)
    end

    if totalChance == 0 then
        print("ERROR: All logs have zero chance!")
        return nil, nil
    end

    local roll = math.random(1, totalChance)
    local cumulativeChance = 0

    for _, log in ipairs(logs) do
        cumulativeChance = cumulativeChance + (log.chance or 0)
        if roll <= cumulativeChance then
            return log.id, log.rarity
        end
    end

    print("ERROR: Log selection failed unexpectedly.")
    return logs[#logs].id, logs[#logs].rarity -- Ensure a fallback log is returned
end


local woodcuttingSystem = Action()

function woodcuttingSystem.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getTile():hasFlag(TILESTATE_PROTECTIONZONE) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot chop trees in a protection zone.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    local row, vein = nil, nil
    local newTarget = nil
    for i, tree in ipairs(cfg.trees) do
        for j, veinData in ipairs(tree.veins) do
            local tile = Tile(toPosition)
            if tile then
                for _, thing in ipairs(tile:getItems() or {}) do
                    if thing:getId() == veinData.id then
                        row, vein = i, j
                        newTarget = thing
                        break
                    end
                end
            end
            if row and vein then break end
        end
        if row and vein then break end
    end

    if newTarget then
        target = newTarget
    end

    print(target:getId())

    if not (row and vein) then 
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'This is not a valid tree to chop.')
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

      -- Check if the tree has an action or unique ID
    if target:getActionId() > 0 or target:getAttribute(ITEM_ATTRIBUTE_UNIQUEID) > 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'This tree cannot be chopped as it is part of a quest.')
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    local skillLevel = ProfessionSystem:getSkillLevel(player, SKILL_RUNE_SEEKER)
    local currTree = cfg.trees[row]
    local currVein = currTree.veins[vein]

    if skillLevel < currTree.skillReq and not (skillLevel == 0 and currTree.skillReq == 0) then
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You must have woodcutting level ' .. currTree.skillReq .. ' to chop this tree.')
    player:getPosition():sendMagicEffect(CONST_ME_POFF)
    return true
    end

    if vein == #currTree.veins then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You must wait for this tree to regenerate.')
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    local logs = getLogForSkill(skillLevel)

if not logs or #logs == 0 then
    print("ERROR: No valid logs for skill level " .. skillLevel)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You do not have the skill to chop this tree.')
    player:getPosition():sendMagicEffect(CONST_ME_POFF)
    return true
end

local logId, logRarity = chooseLog(logs)

if not logId then
    print("ERROR: chooseLog() failed to return a valid logId.")
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You failed to gather any logs.')
    return true
end

--print("SUCCESS: Chosen log ID: " .. logId .. " | Rarity: " .. tostring(logRarity))

    if logId then
        print("log ID: " .. logId)
        local amount = math.random(currTree.amount[1], currTree.amount[2])
        
        local customBagId = 30157 -- woodworker pouc
        local bag = player:getItemById(customBagId, true) -- true to search in all slots and containers

        if bag then
            local addedItems = bag:addItem(logId, amount)
            if not addedItems then
                player:addItem(logId, amount)
            end
        else
            player:addItem(logId, amount)
        end


        player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You have gathered ' .. amount .. ' logs.')

          --badge Recolección Eficiente
            local badgeSlotItem = player:getSlotItem(CONST_SLOT_BADGE)

            if badgeSlotItem then
                local chance = badgeSlotItem:getCustomAttribute("TOOLTIP_ATTRIBUTE_BADGE_THREE") --Recolección Eficiente
                if chance and chance > 0 then
                    -- Generate a random number between 1 and 100
                    local randomValue = math.random(1, 100)
                    if randomValue <= chance then  

                         if bag then
                            local addedItems = bag:addItem(logId, 1)
                            if not addedItems then
                                player:addItem(logId, 1)
                            end
                        else
                            player:addItem(logId, 1)
                        end
                        player:say("Your badge has granted you a bonus " .. ItemType(logId):getName() .. ".", TALKTYPE_MONSTER_SAY)
                    end
                end
            end
        --badge Recolección Eficiente code END


       local points = logRarity and cfg.pointsPerRarity[logRarity]
        if player:getStorageValue(2220) >= os.time() then
            ProfessionSystem:addPoints(player, SKILL_RUNE_SEEKER, points + 1)
        else
            ProfessionSystem:addPoints(player, SKILL_RUNE_SEEKER, points)
        end

        toPosition:sendMagicEffect(currTree.effect)
        toPosition:sendMagicEffect(673)
        regrowTree(target:getId())
        target:transform(currTree.veins[vein + 1].id)
        regenerating[toPosition] = addEvent(regenVein, cfg.stage2Regen, toPosition, target:getId(), row, vein)

    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You failed to gather any logs 2.')
        toPosition:sendMagicEffect(currTree.effect)
        toPosition:sendMagicEffect(673)
        toPosition:sendMagicEffect(CONST_ME_POFF)
        regrowTree(target:getId())
        target:transform(currTree.veins[vein + 1].id)
        regenerating[toPosition] = addEvent(regenVein, cfg.stage2Regen, toPosition, target:getId(), row, vein)
    end

    return true
end


woodcuttingSystem:id(39975)
woodcuttingSystem:register()
