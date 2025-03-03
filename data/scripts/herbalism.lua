local cfg = {
    chance = 100,  
    stage2Regen = 900 * 1000, -- 15 minutes
    stage3Regen = 900 * 1000, -- 15 minutes
    ores = {
        {effect = CONST_ME_SMOKE, ore = 35440, bonusore = 13757, amount = {1, 3}, skillReq = 0,  points = 10, fame = 1, veins = {
                {id = 35730, lv = 8}, -- copper ore
                {id = 40055, lv = 8} -- vein destruida
                
            }
        },
		 {effect = CONST_ME_SMOKE, ore = 35439, bonusore = 13757, amount = {1, 3}, skillReq = 0,  points = 10, fame = 1, veins = {
                {id = 35731, lv = 8}, -- silver ore
                {id = 40055, lv = 8} -- vein destruida
                
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
 
 

local herbalismSystem = Action()

function herbalismSystem.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    print("onuse")
 local row, vein = isInTable(item:getId())
    if (row and vein) then
        local playerPos = player:getPosition()
        local currHerb = cfg.ores[row]
        local currVein = currHerb.veins[vein]
        local skillLevel = ProfessionSystem:getSkillLevel(player, SKILL_HERBALISM)
 
        -- Check player skill level
        if not (skillLevel >= currHerb.skillReq) then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You must have herbalism level '.. currHerb.skillReq ..' to grab this.')			
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return true
        end
         
        -- Check player level
        if not (player:getLevel() >= currVein.lv) then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You must have player level'.. cfg.level ..' to grab this.')
            return true
        end
 
        -- If the vein is at the last stage, tell the player to wait
        if #currHerb.veins == vein then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You must wait for this herb to regen.')
            playerPos:sendMagicEffect(CONST_ME_POFF)
            return true
        end
 
 
        -- If chance is correct, add the item to the player and start regeneration process
        if math.random(100) <= (cfg.chance + skillLevel/2) then
            local nextId = currHerb.veins[vein+1].id



        local customBagId = 30158 
        local oreId = currHerb.ore 
        local oreAmount = math.random(currHerb.amount[1], currHerb.amount[2]) 
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

			
			if currHerb.bonusore and math.random(1, 100) <= 50 then


             local it2
             local bonusore = currHerb.ore 
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
                            local addedItems = bag:addItem(currHerb.ore, 1)
                            if not addedItems then
                                player:addItem(currHerb.ore, 1)
                            end
                        else
                            player:addItem(currHerb.ore, 1)
                        end
                        player:say("Your badge has granted you a bonus " .. ItemType(currHerb.ore):getName() .. ".", TALKTYPE_MONSTER_SAY)
                    end
                end
            end
        --badge Recolección Eficiente code END

             --handles herbalism potion boost
            if player:getStorageValue(2220) >= os.time() then
                  ProfessionSystem:addPoints(player, SKILL_HERBALISM, currHerb.points + 1)
            else
                ProfessionSystem:addPoints(player, SKILL_HERBALISM, currHerb.points)
            end 
			
           
			--FameSystem:addPoints(player, currHerb.fame)
			--player:getPosition():sendMagicEffect(176)
            toPosition:sendMagicEffect(270)
			
            refillHerb(nextId)
            item:transform(nextId)
        else
			--agregar mas logica al fallar despues
            playerPos:sendMagicEffect(CONST_ME_POFF)
        end
 
    end
	
    return true
end

herbalismSystem:id(35730,35731,35732,35733,35734,35735)
herbalismSystem:register()