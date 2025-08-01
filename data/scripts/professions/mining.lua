local cfg = {
    chance = 100,  
    skillStr = ' mining',      -- string for skill name | note: add a space before skill name
    stage2Regen = 900 * 1000, -- 15 minutes
    stage3Regen = 900 * 1000, -- 15 minutes
    ores = {
        {effect = CONST_ME_SMOKE, ore = 40034, bonusore = 13757, amount = {2, 3}, skillReq = 0,  points = 4, fame = 1, veins = {
                {id = 39985, lv = 8}, -- copper ore
                {id = 40024, lv = 8} -- vein destruida
                
            }
        },
		{effect = CONST_ME_SMOKE, ore = 40035, bonusore = 13757, amount = {2, 3}, skillReq = 3,  points = 8, fame = 1, veins = {
                {id = 39981, lv = 8}, -- silver ore
                {id = 40024, lv = 8} -- vein destruida
                
            }
        },
		{effect = CONST_ME_SMOKE, ore = 40041, bonusore = 13757, amount = {2, 3}, skillReq = 6,  points = 12, fame = 1, veins = {
                {id = 40010, lv = 8}, -- gold mine
                {id = 40028, lv = 8} -- vein destruida
                
            }
        },
		{effect = CONST_ME_SMOKE, ore = 40043, bonusore = 13757, amount = {2, 3}, skillReq = 10,  points = 15, fame = 1, veins = {
                {id = 40017, lv = 8}, -- silver ore
                {id = 40026, lv = 8} -- vein destruida
                
            }
        },
		{effect = CONST_ME_SMOKE, ore = 40036, bonusore = 13757, amount = {2, 3}, skillReq = 15,  points = 20, fame = 1, veins = {
                {id = 39989, lv = 8}, -- silver ore
                {id = 40026, lv = 8} -- vein destruida
                
            }
        },
        {effect = CONST_ME_SMOKE, ore = 40037, bonusore = 13757, amount = {2, 3}, skillReq = 20,  points = 25, fame = 1, veins = {
            {id = 39993, lv = 8}, -- silver ore
            {id = 40026, lv = 8} -- vein destruida
            
        }
    },

        
       
    }
}
 
local function isInTable(value)
    for i = 1, #cfg.ores do
        for j = 1, #cfg.ores[i].veins do
            if cfg.ores[i].veins[j].id == value then
                return i, j -- Return ore row and vein index
            end
        end
    end
    return false
end
 
 

local miningSystem = Action()

function miningSystem.onUse(player, item, fromPosition, target, toPosition, isHotkey)


--print("target", target.itemid)


local row, vein = nil, nil
local newTarget = nil
for i, tree in ipairs(cfg.ores) do
    for j, veinData in ipairs(cfg.ores[i].veins) do
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
    
 local row, vein = isInTable(target.itemid)
    if (row and vein) then
        local playerPos = player:getPosition()
        local currOre = cfg.ores[row]
        local currVein = currOre.veins[vein]
        local skillLevel = ProfessionSystem:getSkillLevel(player, SKILL_MINING)
 
        -- Check player skill level
        if not (skillLevel >= currOre.skillReq) then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You must have mining level '.. currOre.skillReq ..' to mine this.')			
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return true
        end
         
        -- Check player level
        if not (player:getLevel() >= currVein.lv) then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You must have player level'.. cfg.level ..' to mine this.')
            return true
        end
 
        -- If the vein is at the last stage, tell the player to wait
        if #currOre.veins == vein then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You must wait for this vein to regen.')
            playerPos:sendMagicEffect(CONST_ME_POFF)
            return true
        end
 
 
        -- If chance is correct, add the item to the player and start regeneration process
        if math.random(100) <= (cfg.chance + skillLevel/2) then
            local nextId = currOre.veins[vein+1].id



        local customBagId = 30158 
        local oreId = currOre.ore 
        local oreAmount = math.random(currOre.amount[1], currOre.amount[2]) 
        local it 

        local bag = player:getItemById(customBagId, true) 

        if bag then
            it = bag:addItem(oreId, oreAmount)
            if not it then
                it = player:addItem(oreId, oreAmount)
            end
        else
            it = player:addItem(oreId, oreAmount)
        end

        -- Check if the item was successfully added
        if it then
            local count = it:getCount()
            local name = count > 1 and it:getPluralName() or it:getName()
            player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You have mined ' .. count .. ' ' .. name)
        else
            player:sendTextMessage(MESSAGE_STATUS_SMALL, 'Unable to add the mined ore to your inventory or bag.')
        end

			
			if currOre.bonusore and math.random(1, 100) <= 50 then


             local it2
             local bonusore = currOre.ore 
             local bonusamount = math.random(1,3)

                if bag then
                    it2 = bag:addItem(bonusore, bonusamount)
                    if not it2 then
                        it2 = player:addItem(bonusore, bonusamount)
                    end
                else
                    it2 = player:addItem(bonusore, bonusamount)
                end

			end

             --badge Recolección Eficiente
            local badgeSlotItem = player:getSlotItem(CONST_SLOT_BADGE)

            if badgeSlotItem then
                local chance = badgeSlotItem:getCustomAttribute("TOOLTIP_ATTRIBUTE_BADGE_THREE") --Recolección Eficiente
                if chance and chance > 0 then
                    -- Generate a random number between 1 and 100
                    local randomValue = math.random(1, 100)        
                    if randomValue <= chance then  

                         if bag then
                            local addedItems = bag:addItem(currOre.ore, 1)
                            if not addedItems then
                                player:addItem(currOre.ore, 1)
                            end
                        else
                            player:addItem(currOre.ore, 1)
                        end
                        player:say("Your badge has granted you a bonus " .. ItemType(currOre.ore):getName() .. ".", TALKTYPE_MONSTER_SAY)
                    end
                end
            end
        --badge Recolección Eficiente code END

             --handles mining potion boost
            if player:getStorageValue(2220) >= os.time() then
                  ProfessionSystem:addPoints(player, SKILL_MINING, currOre.points + 1)
            else
                ProfessionSystem:addPoints(player, SKILL_MINING, currOre.points)
            end 
			
           
			--FameSystem:addPoints(player, currOre.fame)
			--player:getPosition():sendMagicEffect(176.onUse            toPosition:sendMagicEffect(670)
			
            refillVein(nextId)
            target:transform(nextId)
        else
			--agregar mas logica al fallar despues
            playerPos:sendMagicEffect(CONST_ME_POFF)
        end
 
    end
	
    return true
end

miningSystem:id(2553)
miningSystem:register()