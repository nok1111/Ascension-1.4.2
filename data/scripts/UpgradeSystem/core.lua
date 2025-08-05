local UPGRADE_SYSTEM_VERSION = "3.0.3"
print(">> Loaded Upgrade System v" .. UPGRADE_SYSTEM_VERSION)

US_CONDITIONS = {}
US_BUFFS = {}

local US_SUBID = {}

local TargetCombatEventUpgrade = EventCallback
TargetCombatEventUpgrade.onTargetCombat = function(creature, target)
    target:registerEvent("UpgradeSystemHealth")
    target:registerEvent("UpgradeSystemDeath")
    return RETURNVALUE_NOERROR
end
TargetCombatEventUpgrade:register()

local LoginEvent = CreatureEvent("UpgradeSystemLogin")

function LoginEvent.onLogin(player)
    us_onLogin(player)
    return true
end

local HealthChangeEvent = CreatureEvent("UpgradeSystemHealth")
local ManaChangeEvent = CreatureEvent("UpgradeSystemMana")
local DeathEvent = CreatureEvent("UpgradeSystemDeath")
local KillEvent = CreatureEvent("UpgradeSystemKill")
local PrepareDeathEvent = CreatureEvent("UpgradeSystemPD")

function us_onEquip(cid, iuid, slot)
    print("us_onEquip1")
    local player = Player(cid)
    if not player:getSlotItem(slot) then
      print("not player:getSlotItem(slot)")
        return
    end
    print(iuid)
    
  
    local item = Item(iuid)
    -- Restrict: item must be in its correct slottype

    if player and item then
        local maxHP = player:getMaxHealth()
        local maxMP = player:getMaxMana()
        local newBonuses = item:getBonusAttributes()
        if not newBonuses then
            return
        end

        for i = 1, #newBonuses do
            local value = newBonuses[i]
            local bonusId = value[1]
            local bonusValue = value[2]
            local attr = US_ENCHANTMENTS[bonusId]
            
            if attr then
              print("attr")
                if attr.combatType == US_TYPES.CONDITION then
                    if not US_CONDITIONS[bonusId] then
                        US_CONDITIONS[bonusId] = {}
                    end
                    
                    local itemId = item:getId()
                    if not US_CONDITIONS[bonusId][bonusValue] then
                        US_CONDITIONS[bonusId][bonusValue] = {}
                    end
                    
                    if not US_CONDITIONS[bonusId][bonusValue][itemId] then
                        US_CONDITIONS[bonusId][bonusValue][itemId] = Condition(attr.condition)
                        if attr.condition ~= CONDITION_MANASHIELD then
                            US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(CONDITION_PARAM_SUBID, 1000 + player:getNextSubId(slot, i))
                            US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(attr.param, attr.percentage == true and 100 + bonusValue or bonusValue)
                            US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(CONDITION_PARAM_TICKS, -1)
                        else
                            US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(CONDITION_PARAM_TICKS, 86400000)
                        end
                        
                        US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
                        player:addCondition(US_CONDITIONS[bonusId][bonusValue][itemId])
                        
                        if attr.param == CONDITION_PARAM_STAT_MAXHITPOINTS then
                          print("MaxHP")
                            if player:getHealth() == maxHP then
                                player:addHealth(player:getMaxHealth())
                            end
                        end
                        
                        if attr.param == CONDITION_PARAM_STAT_MAXMANAPOINTS then
                          print("MaxMP")
                            if player:getMana() == maxMP then
                                player:addMana(player:getMaxMana())
                            end
                        end
                    else
                        player:addCondition(US_CONDITIONS[bonusId][bonusValue][itemId])
                        if attr.param == CONDITION_PARAM_STAT_MAXHITPOINTS then
                          print("MaxHP2")
                            if player:getHealth() == maxHP then
                                player:addHealth(player:getMaxHealth())
                            end
                        end
                        
                        if attr.param == CONDITION_PARAM_STAT_MAXMANAPOINTS then
                          print("MaxMP2")
                            if player:getMana() == maxMP then
                                player:addMana(player:getMaxMana())
                            end
                        end
                    end
                end
            end
        end
    end
end

function us_onLogin(player)
    player:registerEvent("UpgradeSystemKill")
    player:registerEvent("UpgradeSystemHealth")
    player:registerEvent("UpgradeSystemMana")
    player:registerEvent("UpgradeSystemPD")

    local maxHP = player:getMaxHealth()
    local maxMP = player:getMaxMana()
    for slot = CONST_SLOT_HEAD, CONST_SLOT_RUNE3 do
        local item = player:getSlotItem(slot)
        if item then
            local newBonuses = item:getBonusAttributes()
            if newBonuses then
                local itemId = item:getId()
                for i = 1, #newBonuses do
                    local value = newBonuses[i]
                    local bonusId = value[1]
                    local bonusValue = value[2]
                    local attr = US_ENCHANTMENTS[bonusId]
                    if attr then
                        if attr.combatType == US_TYPES.CONDITION then
                            if not US_CONDITIONS[bonusId] then
                                US_CONDITIONS[bonusId] = {}
                            end
                            if not US_CONDITIONS[bonusId][bonusValue] then
                                US_CONDITIONS[bonusId][bonusValue] = {}
                            end
                            if not US_CONDITIONS[bonusId][bonusValue][itemId] then
                                US_CONDITIONS[bonusId][bonusValue][itemId] = Condition(attr.condition)
                                if attr.condition ~= CONDITION_MANASHIELD then
                                    US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(CONDITION_PARAM_SUBID, 1000 + player:getNextSubId(slot, i))
                                    US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(
                                        attr.param,
                                        attr.percentage == true and 100 + bonusValue or bonusValue
                                    )
                                    US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(CONDITION_PARAM_TICKS, -1)
                                else
                                    US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(CONDITION_PARAM_TICKS, 86400000)
                                end
                                US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
                                player:addCondition(US_CONDITIONS[bonusId][bonusValue][itemId])
                                if attr == BONUS_TYPE_MAXHP then
                                    if player:getHealth() == maxHP then
                                        player:addHealth(player:getMaxHealth())
                                    end
                                end
                                if attr == BONUS_TYPE_MAXMP then
                                    if player:getMana() == maxMP then
                                        player:addMana(player:getMaxMana())
                                    end
                                end
                            else
                                player:addCondition(US_CONDITIONS[bonusId][bonusValue][itemId])
                                if attr.param == CONDITION_PARAM_STAT_MAXHITPOINTS then
                                    if player:getHealth() == maxHP then
                                        player:addHealth(player:getMaxHealth())
                                    end
                                end
                                if attr.param == CONDITION_PARAM_STAT_MAXMANAPOINTS then
                                    if player:getMana() == maxMP then
                                        player:addMana(player:getMaxMana())
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function ManaChangeEvent.onManaChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if not creature or not attacker then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    if creature:isPlayer() and creature:getParty() and attacker:isPlayer() and attacker:getParty() then
        if creature:getParty() == attacker:getParty() then
            return primaryDamage, primaryType, secondaryDamage, secondaryType
        end
    end

    if primaryType == COMBAT_LIFEDRAIN or secondaryType == COMBAT_LIFEDRAIN then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    if primaryType == COMBAT_MANADRAIN or secondaryType == COMBAT_MANADRAIN then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    if creature == attacker and primaryType ~= COMBAT_HEALING then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    if origin == ORIGIN_CONDITION then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    return us_onDamaged(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
end

function HealthChangeEvent.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if not creature or not attacker then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    if creature:isPlayer() and creature:getParty() and attacker:isPlayer() and attacker:getParty() then
        if creature:getParty() == attacker:getParty() then
            return primaryDamage, primaryType, secondaryDamage, secondaryType
        end
    end

    if primaryType == COMBAT_LIFEDRAIN or secondaryType == COMBAT_LIFEDRAIN then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    if creature == attacker and primaryType ~= COMBAT_HEALING then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    if origin == ORIGIN_CONDITION then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    return us_onDamaged(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
end

function us_onDamaged(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if primaryType == COMBAT_HEALING or secondaryType == COMBAT_HEALING then
        if attacker:isPlayer() then
            local primaryTotal = 0
            local secondaryTotal = 0
            for slot = CONST_SLOT_HEAD, CONST_SLOT_RUNE3 do
                local item = attacker:getSlotItem(slot)
                if item then
                    if item:getType():usesSlot(slot) then
                        local values = item:getBonusAttributes()
                        if values then
                            for key, value in pairs(values) do
                                local attr = US_ENCHANTMENTS[value[1]]
                                if attr then
                                    if attr.name == "Increased Healing" then
                                        if primaryType == COMBAT_HEALING then
                                            primaryTotal = primaryTotal + value[2]
                                        end
                                        if secondaryType == COMBAT_HEALING then
                                            secondaryTotal = secondaryTotal + value[2]
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if primaryType == COMBAT_HEALING then
                primaryDamage = math.floor(primaryDamage + (primaryDamage * primaryTotal / 100))
            end
            if secondaryType == COMBAT_HEALING then
                secondaryDamage = math.floor(secondaryDamage + (secondaryDamage * secondaryTotal / 100))
            end
        end
        if creature:isPlayer() then
            local primaryTotal = 0
            local secondaryTotal = 0
            for slot = CONST_SLOT_HEAD, CONST_SLOT_RUNE3 do
                local item = creature:getSlotItem(slot)
                if item then
                    if item:getType():usesSlot(slot) then
                        local values = item:getBonusAttributes()
                        if values then
                            for key, value in pairs(values) do
                                local attr = US_ENCHANTMENTS[value[1]]
                                if attr then
                                    if attr.name == "Increased Healing" then
                                        if primaryDamage > 0 then
                                            primaryTotal = primaryTotal + value[2]
                                        end
                                        if secondaryDamage > 0 then
                                            secondaryTotal = secondaryTotal + value[2]
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end

            if primaryTotal > 0 then
                primaryDamage = math.floor(primaryDamage + (primaryDamage * primaryTotal / 100))
            end
            if secondaryTotal > 0 then
                secondaryDamage = math.floor(secondaryDamage + (secondaryDamage * secondaryTotal / 100))
            end
        end
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    if attacker:isPlayer() then
        local pid = attacker:getId()
        if US_BUFFS[pid] then
            if US_BUFFS[pid][1] then
                if primaryDamage ~= 0 then
                    primaryDamage = primaryDamage + (primaryDamage * US_BUFFS[pid][1].value / 100)
                end
                if secondaryDamage ~= 0 then
                    secondaryDamage = secondaryDamage + (secondaryDamage * US_BUFFS[pid][1].value / 100)
                end
            end
        end
        local doubleDamageTotal = 0
        local primaryDamageTotal = 0
        local secondaryDamageTotal = 0
        local lifeStealTotal = 0
        local manaStealTotal = 0
        for slot = CONST_SLOT_HEAD, CONST_SLOT_RUNE3 do
      local item = attacker:getSlotItem(slot)
      if item then
        if item:getType():usesSlot(slot) then
          local values = item:getBonusAttributes()
          if values then
            for key, value in pairs(values) do
              local attr = US_ENCHANTMENTS[value[1]]
              if attr then
                if attr.combatType then
                  if attr.combatType == US_TYPES.TRIGGER then
                    if attr.triggerType == US_TRIGGERS.ATTACK then
						if attr.cooldown ~= nil and attacker:getStorageValue(value[1]) > os.time() then
									-- Attribute has a cooldown and it hasn't expired yet, do nothing
									--print(tostring("off cooldown"))
								else
									-- Execute the attribute and set the cooldown if applicable
									attr.execute(attacker, creature, value[2])
									if attr.cooldown ~= nil then
										attacker:setStorageValue(value[1], os.time() + attr.cooldown)
										attacker:sendAddBuffNotification(16, attr.cooldown, 'Power Rune Internal Cooldown', 1, 0)
									--	print(tostring("on cooldown"))
									end
								end
						 
						
                    end
                  elseif attr.name == "Double Damage" then
                    doubleDamageTotal = doubleDamageTotal + value[2]
                  else
                    if attr.combatDamage then
                      if (attr.combatDamage % (primaryType + primaryType) >= primaryType) == true then
                        if attr.combatType == US_TYPES.OFFENSIVE then
                          primaryDamageTotal = primaryDamageTotal + value[2]
                        end
                      end
                      if (attr.combatDamage % (secondaryType + secondaryType) >= secondaryType) == true then
                        if attr.combatType == US_TYPES.OFFENSIVE then
                          secondaryDamageTotal = secondaryDamageTotal + value[2]
                        end
                      end
                    end

                    if attr.name == "Life Steal" then
                      lifeStealTotal = lifeStealTotal + value[2]
                    end

                    if attr.name == "Mana Steal" then
                      manaStealTotal = manaStealTotal + value[2]
                    end
                  end
                end
              end
            end
          end
        end
      end
    end

        if doubleDamageTotal > 0 then
            if math.random(100) < doubleDamageTotal then
                primaryDamage = primaryDamage * 2
                secondaryDamage = secondaryDamage * 2
            end
        end

        if primaryDamageTotal > 0 then
            primaryDamage = math.floor(primaryDamage + (primaryDamage * primaryDamageTotal / 100))
        end

        if secondaryDamageTotal > 0 then
            secondaryDamage = math.floor(secondaryDamage + (secondaryDamage * secondaryDamageTotal / 100))
        end

        local damage = (primaryDamage + secondaryDamage)
        if damage < 0 then
            damage = damage * -1
        end

        if lifeStealTotal > 0 then
            local lifeSteal = math.floor((damage * (lifeStealTotal / 100)))
            if lifeSteal > 0 then
                attacker:addHealth(lifeSteal)
            end
        end

        if manaStealTotal > 0 then
            local manaSteal = math.floor((damage * (manaStealTotal / 100)))
            if manaSteal > 0 then
                attacker:addMana(manaSteal)
            end
        end
    end

   if creature:isPlayer() then
    local primaryDamageTotal = 0
    local secondaryDamageTotal = 0
    for slot = CONST_SLOT_HEAD, CONST_SLOT_RUNE3 do
      local item = creature:getSlotItem(slot)
      if item then
        if item:getType():usesSlot(slot) then
          local values = item:getBonusAttributes()
          if values then
            for key, value in pairs(values) do
              local attr = US_ENCHANTMENTS[value[1]]
              if attr then
                if attr.combatType and attr.combatType ~= US_TYPES.CONDITION then
                  if attr.combatType == US_TYPES.TRIGGER then
                    if attr.triggerType == US_TRIGGERS.HIT then
					
						if attr.cooldown ~= nil and creature:getStorageValue(value[1]) > os.time() then
									-- Attribute has a cooldown and it hasn't expired yet, do nothing
									--print(tostring("off cooldown"))
								else
									-- Execute the attribute and set the cooldown if applicable
									attr.execute(creature, attacker, value[2])
									if attr.cooldown ~= nil then
										attacker:setStorageValue(value[1], os.time() + attr.cooldown)
										attacker:sendAddBuffNotification(16, attr.cooldown, 'Power Rune Internal Cooldown', 1, 0)
									--	print(tostring("on cooldown"))
									end
								end
					
                      
                    end
                  else
                    if attr.combatDamage then
                      if (attr.combatDamage % (primaryType + primaryType) >= primaryType) == true then
                        if attr.combatType == US_TYPES.DEFENSIVE and creature:isPlayer() then
                          primaryDamageTotal = primaryDamageTotal + value[2]
                        end
                      end
                      if (attr.combatDamage % (secondaryType + secondaryType) >= secondaryType) == true then
                        if attr.combatType == US_TYPES.DEFENSIVE and creature:isPlayer() then
                          secondaryDamageTotal = secondaryDamageTotal + value[2]
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
        if primaryDamageTotal > 0 then
            primaryDamage = math.floor(primaryDamage - (primaryDamage * primaryDamageTotal / 100))
        end
        if secondaryDamageTotal > 0 then
            secondaryDamage = math.floor(secondaryDamage - (secondaryDamage * secondaryDamageTotal / 100))
        end
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end

function DeathEvent.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
    if not lasthitkiller or not creature:isMonster() or not corpse or corpse.itemid == 0 or not corpse:isContainer() then
        return true
    end
    if not lasthitkiller:isPlayer() and not lasthitkiller:getMaster() then
        return true
    end
    addEvent(
        us_CheckCorpse,
        10,
        creature:getType(),
        corpse:getPosition(),
        lasthitkiller:getMaster() and lasthitkiller:getMaster():getId() or lasthitkiller:getId()
    )
    return true
end

function KillEvent.onKill(player, target, lastHit)
    if not player or not player:isPlayer() or not target or not target:isMonster() then
        return
    end
    local center = target:getPosition()
    for slot = CONST_SLOT_HEAD, CONST_SLOT_RUNE3 do
        local item = player:getSlotItem(slot)
        if item then
            local values = item:getBonusAttributes()
            if values then
                for key, value in pairs(values) do
                    local attr = US_ENCHANTMENTS[value[1]]
                    if attr then
                        if attr.triggerType == US_TRIGGERS.KILL then
                            attr.execute(player, value[2], center, target)
                        end
                    end
                end
            end
        end
    end
end

function PrepareDeathEvent.onPrepareDeath(creature, killer)
    if creature:isPlayer() then
        for slot = CONST_SLOT_HEAD, CONST_SLOT_RUNE3 do
            local item = creature:getSlotItem(slot)
            if item then
                local values = item:getBonusAttributes()
                if values then
                    for key, value in pairs(values) do
                        local attr = US_ENCHANTMENTS[value[1]]
                        if attr then
                            if attr.name == "Revive on death" then
                                if math.random(100) < value[2] then
                                                     creature:addHealth(creature:getMaxHealth())
													  creature:addMana(creature:getMaxMana())
													  local reviveeffect = creature:getPosition()
														reviveeffect.x = reviveeffect.x + 1
														reviveeffect.y = reviveeffect.y + 1
														reviveeffect:sendMagicEffect(366)
													  creature:sendTextMessage(MESSAGE_INFO_DESCR, "You have been revived!")
                                    return false
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return true
end

local GainExperienceEvent = EventCallback
GainExperienceEvent.onGainExperience = function(player, source, exp, rawExp)
    for slot = CONST_SLOT_HEAD, CONST_SLOT_RUNE3 do
        local item = player:getSlotItem(slot)
        if item then
            local values = item:getBonusAttributes()
            if values then
                for key, value in pairs(values) do
                    local attr = US_ENCHANTMENTS[value[1]]
                    if attr then
                        if attr.name == "Experience" then
                            exp = exp + math.ceil(exp * value[2] / 100)
                        end
                    end
                end
            end
        end
    end
    return exp
end
GainExperienceEvent:register()



local function effectLoop(position, effect)
    local bagIds = {37129, 37131, 37132, 37133}
    local active = false
    for _, bag in ipairs(bagIds) do
        local lootBag = Tile(position):getItemById(bag)
        if lootBag then
            active = true
            break
        end
    end
    if active then
        position:sendMagicEffect(effect)
        addEvent(effectLoop, 480, position, effect)
    end
end

local rarityList = {
    {bag = 37129, effect = 13, tier = "", textcolor = TEXTCOLOR_NONE},
    {bag = 37131, effect = 372, tier = "RARE", textcolor = TEXTCOLOR_LIGHTGREEN},
    {bag = 37132, effect = 373, tier = "EPIC", textcolor = TEXTCOLOR_ELECTRICPURPLE},
    {bag = 37133, effect = 374, tier = "LEGENDARY", textcolor = TEXTCOLOR_ORANGE},
    {bag = 37133, effect = 374, tier = "CORRUPTED", textcolor = TEXTCOLOR_LIGHTGREEN},
}

local function classifyLoot(position)
    local corpse = Tile(position):getTopDownItem()
    if not corpse or not corpse:getType():isContainer() then
        return false
    end
    -- Found max rarity
    local foundRarity = 1
    for i = corpse:getSize() - 1, 0, -1 do
        local item = corpse:getItem(i)
        if item then
            local rarityIndex = item:getRarityId() or 1
             if rarityIndex > foundRarity then
                foundRarity = rarityIndex
			       end
        			if item:getId() > 38146 and item:getId() < 38207 then			
        				foundRarity = 2
              end
          if item:isUnique() then     
            foundRarity = 5
          end
        end
    end
    -- Transforming corpse
    local transformation = rarityList[foundRarity]
    if transformation then
		local itemowner = corpse:getAttribute(ITEM_ATTRIBUTE_CORPSEOWNER)
		corpse:transform(transformation.bag)
		corpse:setAttribute(ITEM_ATTRIBUTE_CORPSEOWNER, itemowner)
        position:sendMagicEffect(transformation.effect)
		effectLoop(position, transformation.effect)
        local spectators = Game.getSpectators(position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
           -- spectators[1]:say(transformation.tier, TALKTYPE_MONSTER_SAY, false, nil, position)
			Game.sendAnimatedText(transformation.tier, position, transformation.textcolor)
        end
    end
end

local baseChance = 1000

local enchantitems = {
	[1] = {itemid = 38149, chance = 2},  --trash
	[2] = {itemid = 38151, chance = 3},  --trash
	[3] = {itemid = 38152, chance = 4},  --trash
	[4] = {itemid = 38153, chance = 5},  --trash
	[5] = {itemid = 38154, chance = 6},  --item loots
	[6] = {itemid = 38155, chance = 7},  --item loots(fame)
	[7] = {itemid = 38156, chance = 8},  --item loots(fame)
	[8] = {itemid = 38157, chance = 9},  --item loots
	[9] = {itemid = 38159, chance = 10},  --item loots
	[10] = {itemid = 38160, chance = 11},  --item loots
	[11] = {itemid = 38161, chance = 12},  --item loots
	[12] = {itemid = 38162, chance = 13},  --item loots
	[13] = {itemid = 38163, chance = 14},  --item loots
	[14] = {itemid = 38165, chance = 15},  --item loots
	[15] = {itemid = 38166, chance = 16},  --item loots
	[16] = {itemid = 38167, chance = 17},  --item loots
	[17] = {itemid = 38170, chance = 18},  --item loots
	[18] = {itemid = 38171, chance = 19},  --item loots
	[19] = {itemid = 38172, chance = 20},  --item loots
	[20] = {itemid = 38173, chance = 21},  --item loots
	[21] = {itemid = 38176, chance = 22},  --item loots
	[22] = {itemid = 38177, chance = 23},  --item loots
	[23] = {itemid = 38179, chance = 25},  --item loots
	[24] = {itemid = 38180, chance = 26},  --item loots
	[25] = {itemid = 38181, chance = 27},  --item loots
	[26] = {itemid = 38182, chance = 28},  --item loots
	[27] = {itemid = 38183, chance = 29},  --item loots
	[28] = {itemid = 38184, chance = 30},  --item loots
	[29] = {itemid = 38185, chance = 31},  --item loots
	[30] = {itemid = 38186, chance = 32},  --item loots
	[31] = {itemid = 38187, chance = 33}  --item loots
}

function us_CheckCorpse(monsterType, corpsePosition, killerId)
   local killer = Player(killerId)
  local corpse = Tile(corpsePosition):getTopDownItem()
  if killer and killer:isPlayer() and corpse and corpse:isContainer() then
  

  for i = 1, #enchantitems do
        if math.random(1, baseChance) == enchantitems[i].chance then
            corpse:addItem(enchantitems[i].itemid, 1)
			
        end
    end	
	
  
  
    for slot = CONST_SLOT_HEAD, CONST_SLOT_RUNE3 do
      local item = killer:getSlotItem(slot)
      if item then
        local values = item:getBonusAttributes()
        if values then
          for key, value in pairs(values) do
            local attr = US_ENCHANTMENTS[value[1]]
            if attr then
              if attr.name == "Additonal Gold" then
                local cc, plat, gold = 0, 0, 0
                for i = 0, corpse:getSize() do
                  local item = corpse:getItem(i)
                  if item then
                    if item.itemid == 2160 then
                      gold = gold + (item:getCount() * 10000)
                    elseif item.itemid == 2152 then
                      gold = gold + (item:getCount() * 100)
                    elseif item.itemid == 2148 then
                      gold = gold + item:getCount()
                    end
                  end
                end

                gold = math.floor(gold * value[2] / 100)

                while gold >= 10000 do
                  gold = gold / 10000
                  cc = cc + 1
                end

                if cc > 0 then
                  local crystalCoin = Game.createItem(2160, cc)
                  corpse:addItemEx(crystalCoin)
                end

                while gold >= 100 do
                  gold = gold / 100
                  plat = plat + 1
                end

                if plat > 0 then
                  local platinumCoin = Game.createItem(2152, plat)
                  corpse:addItemEx(platinumCoin)
                end

                if gold > 0 then
                  local goldCoin = Game.createItem(2148, gold)
                  corpse:addItemEx(goldCoin)
                end
              end
            end
          end
        end
      end
    end
	local killerlvl = killer:getLevel() / 2
    local iLvl = killerlvl

    for i = 0, corpse:getCapacity() do
      local item = corpse:getItem(i)
      if item then
        local itemType = item:getType()
        if itemType then
          if itemType:canHaveItemLevel() then
            item:setItemLevel(math.min(US_CONFIG.MAX_ITEM_LEVEL, 1), true)
          end
          if itemType:isUpgradable() then
            if math.random(US_CONFIG.UNIDENTIFIED_DROP_CHANCE) == 1 then
                 item:unidentify()
               elseif math.random(1, US_CONFIG.UNIQUE_DROP_CHANCE) == 1 then
                  item:RollUnique(killer, itemType, weaponType)
                  addEvent(classifyLoot, 1, corpsePosition)
                 else
                  -- Roll rarity
                 item:rollRarity()
                 addEvent(classifyLoot, 1, corpsePosition)
             end
          end
        end
		if item:getId() > 38146 and item:getId() < 38207 then
		 addEvent(classifyLoot, 1, corpsePosition)
		end
      end
    end
  end
end

function us_RemoveBuff(pid, buffId, buffName)
    if US_BUFFS[pid] then
        US_BUFFS[pid][buffId] = nil
        local player = Player(pid)
        if player then
            player:sendTextMessage(MESSAGE_STATUS_WARNING, buffName .. " ended!")
        end
    end
end

local LookEvent = EventCallback
LookEvent.onLook = function(player, thing, position, distance, description)
   if thing:isItem() and thing.itemid == US_CONFIG.ITEM_MIND_CRYSTAL and thing:hasMemory() then
    for i = 4, 1, -1 do
      local enchant = thing:getBonusAttribute(i)
      if enchant then
        local attr = US_ENCHANTMENTS[enchant[1]]
        description = description:gsub(thing:getName() .. "%.", "%1\n" .. attr.format(enchant[2]))
		
      end
    end
  elseif thing:isItem() then
    if thing:getType():isUpgradable() then
      local upgrade = thing:getUpgradeLevel()
      local itemLevel = thing:getItemLevel()
	  local itemType = thing:getType() -- Assuming getType() returns an instance of the ItemType class
	  
	  
	  
	  	if itemType:isHelmet() or itemType:isLegs() then
			itemLevelforequip = math.floor((math.pow(thing:getItemLevel(), 1.27) * 6)) 
		elseif itemType:isArmor() then
			itemLevelforequip = math.floor((math.pow(thing:getItemLevel(), 1.2) * 4)) 
		elseif itemType:isShield() then        
         itemLevelforequip = math.floor((math.pow(thing:getItemLevel(), 1.2) * 2.8)) 

		elseif itemType:isWeapon() and not itemType:isTwoHanded() then        
         itemLevelforequip = math.floor((math.pow(thing:getItemLevel(), 1.2) * 3.5)) 

		elseif itemType:isTwoHanded() then        
         itemLevelforequip = math.floor((math.pow(thing:getItemLevel(), 1.25) * 2))  
       
			
			
		elseif itemType:isRing() or itemType:isNecklace() or itemType:isBoots() then  
		itemLevelforequip = math.floor(math.pow(thing:getItemLevel(), 2.18)) 
		else
			itemLevelforequip = math.floor(math.pow(thing:getItemLevel(), 1.2)) 
		end
	  
	  
	
      
		
	
		
	--[=====[ 
	if itemType:isShield() then        
         itemLevelforequip = math.floor(math.pow(thing:getItemLevel(), 1.50)) 
        end
		if itemType:isWeapon() and not itemType:isTwoHanded() then        
         itemLevelforequip = math.floor(math.pow(thing:getItemLevel(), 1.52)) 
        end
		if itemType:isTwoHanded() then        
         itemLevelforequip = math.floor(math.pow(thing:getItemLevel(), 1.30)) 
        end
	--]=====]
	
      if upgrade > 0 then
        description = description:gsub(thing:getName(), "%1 +" .. upgrade)
		
      end
      if description:find("(%)%.?)") then
        description = description:gsub("(%)%.?)", "%1\nItem Level: " .. itemLevel)
      else
        if upgrade > 0 then
          description = description:gsub("+" .. upgrade .. "%.", "%1\nItem Level: " .. itemLevel)
        else
          description = description:gsub(thing:getName(), "%1\nItem Level: " .. itemLevel)
        end
      end
      if thing:isUnidentified() then
        description = description:gsub(thing:getName(), "unidentified %1")
        if thing:getArticle():len() > 0 and thing:getArticle() ~= "an" then
          description = description:gsub("You see (" .. thing:getArticle() .. "%S?)", "You see an")
        end
      else
        description = description:gsub(thing:getName(), thing:getRarity().name .. " %1")
        if thing:getArticle():len() > 0 and thing:getRarity().name == "epic" and thing:getArticle() ~= "an" then
          description = description:gsub("You see (" .. thing:getArticle() .. "%S?)", "You see an")
        end
        if thing:isUnique() then
          description = description:gsub("Item Level: " .. itemLevel, thing:getUniqueName() .. "\n%1")
        end
		
        for i = thing:getMaxAttributes(), 1, -1 do
          local enchant = thing:getBonusAttribute(i)
          if enchant then
            local attr = US_ENCHANTMENTS[enchant[1]]
            description = description:gsub("Item Level: " .. itemLevel, "%1\n" .. attr.format(enchant[2]))
          end
        end
      end
      if US_CONFIG.REQUIRE_LEVEL then
        if thing:isLimitless() then
          if description:find("It can only be wielded properly by") then
            description = description:gsub("It can only be wielded properly by (.-)%.", "Removed required Item Level to wear.")
          else
            description = description:gsub("It weighs", "Removed required Item Level to wear.\nIt weighs")
          end
        else
          if description:find("of level (%d+) or higher") then
            for match in description:gmatch("of level (%d+) or higher") do
              if tonumber(match) < itemLevelforequip then
                description = description:gsub("of level (%d+) or higher", "of level " .. itemLevelforequip .. " or higher")
              end
            end
          elseif description:find("It can only be wielded properly by") then
            description =
              description:gsub("It can only be wielded properly by (.+).\n", "It can only be wielded properly by %1 of level " .. itemLevelforequip .. " or higher.\n")
          else
            if description:find("It weighs") then
              description = description:gsub("It weighs", "It can only be wielded properly by players of level " .. itemLevelforequip .. " or higher.\nIt weighs")
            else
              description = description .. "\nIt can only be wielded properly by players of level " .. itemLevelforequip .. " or higher."
            end
          end
        end
      end
      if thing:isMirrored() then
        if description:find("It weighs") then
          description = description:gsub("oz.(.+)", "oz.%1\nMirrored")
        else
          description = description .. "\nMirrored"
        end
      end
    elseif thing:getType():canHaveItemLevel() then
      local itemLevel = thing:getItemLevel()
      if description:find("(%)%.?)") then
        description = description:gsub("(%)%.?)", "%1\nItem Level: " .. itemLevel)
      end
    end
    elseif thing:isPlayer() then
    local iLvl = 0
    for slot = CONST_SLOT_HEAD, CONST_SLOT_RUNE3 do
      local item = thing:getSlotItem(slot)
      if item then
        iLvl = iLvl + item:getItemLevel()
      end
    end
    description = description .. "\nTotal Item LeveL: " .. iLvl
  end
  return description
end
LookEvent:register(10)


local slotNames = {
  [CONST_SLOT_HEAD] = "Head",
  [CONST_SLOT_NECKLACE] = "Necklace",
  [CONST_SLOT_BACKPACK] = "Backpack",
  [CONST_SLOT_ARMOR] = "Armor",
  [CONST_SLOT_RIGHT] = "Right Hand",
  [CONST_SLOT_LEFT] = "Left Hand",
  [CONST_SLOT_LEGS] = "Legs",
  [CONST_SLOT_FEET] = "Feet",
  [CONST_SLOT_RING] = "Ring",
  [CONST_SLOT_AMMO] = "Ammo",
  [CONST_SLOT_RUNE1] = "Rune1",
  [CONST_SLOT_RUNE2] = "Rune2",
  [CONST_SLOT_RUNE3] = "Rune3"
}

-- Function to get readable slot names for an item
local function getItemExpectedSlots(itemType)
  local slots = {}
  for slotConst, slotName in pairs(slotNames) do
      if itemType:usesSlot(slotConst) then
          table.insert(slots, slotName)
      end
  end
  return table.concat(slots, ", ")
end


function USonInventoryUpdate(player, item, slot, equip)
    -- Skip non-equipment slots
    if slot > CONST_SLOT_RUNE3 then
        return true
    end

    -- Debug logging
    print(string.format(
        "[UpgradeSystem] %s - Slot: %d, Item: %s",
        equip and "EQUIP" or "UNEQUIP",
        slot,
        item and item:getName() or "none"
    ))

    -- Handle equip
    if equip then
        -- Validate item
        if not item or not item:getType() or not item:getType():isUpgradable() then
            return true
        end

        -- Check unidentified
        if item:isUnidentified() then
          player:sendTextMessage(MESSAGE_STATUS_SMALL, "You can't wear unidentified items.")
            return false
        end

        -- Check level requirements
        if US_CONFIG.REQUIRE_LEVEL and player:getLevel() < item:getItemLevel() and not item:isLimitless() then
            player:sendTextMessage(MESSAGE_STATUS_SMALL, "You need higher level to equip that item.")
            return false
        end

        -- Usage example in your equip check:
        local expectedSlots = getItemExpectedSlots(item:getType())
        print(string.format("[UpgradeSystem] %s (id:%d) expected slot(s): %s", item:getName(), item:getId(), expectedSlots))

        -- Individual check for runes
        if item:getType():isRune() then
          print("rune")
            if slot == 12 or slot == 13 or slot == 14 then
                 print(string.format("[UpgradeSystem1] Blocked: Rune %s (id:%d) cannot be equipped in slot %d", item:getName(), item:getId(), slot))
                return us_onEquip(player:getId(), item:getUniqueId(), slot)
            else
              player:sendTextMessage(MESSAGE_STATUS_SMALL, "Runes can only be equipped in rune slots.")
               
            end
        elseif item:getType():isShield() or item:getType():isWeapon() then
            if slot == 5 or slot == 6  then
                   return us_onEquip(player:getId(), item:getUniqueId(), slot)
            else
              player:sendTextMessage(MESSAGE_STATUS_SMALL, "Shields and weapons can only be equipped in shield and weapon slots.")
            end
          else
            -- Check if item is in the correct slot using parameter slot as slot number
            if item:getType():usesSlot(slot) and not item:getType():isRune() then
                player:sendTextMessage(MESSAGE_STATUS_SMALL, "You can't equip this item in that slot.")
                print(string.format("[UpgradeSystem2] Blocked: %s (id:%d) cannot be equipped in slot %d", item:getName(), item:getId(), slot))
                return us_onEquip(player:getId(), item:getUniqueId(), slot)
            end
        end

        -- Process equip
        
    else
      print("unequip")
      local bonuses = item:getBonusAttributes()
      if bonuses then
        local itemId = item:getId()
        for i = 1, #bonuses do
            local value = bonuses[i]
            local bonusId = value[1]
            local bonusValue = value[2]
            local attr = US_ENCHANTMENTS[bonusId]
            if attr then
                if attr.combatType == US_TYPES.CONDITION then
                    if US_CONDITIONS[bonusId] and US_CONDITIONS[bonusId][bonusValue] and US_CONDITIONS[bonusId][bonusValue][itemId] then
                        if US_CONDITIONS[bonusId][bonusValue][itemId]:getType() ~= CONDITION_MANASHIELD then
                            player:removeCondition(
                                US_CONDITIONS[bonusId][bonusValue][itemId]:getType(),
                                CONDITIONID_COMBAT,
                                US_CONDITIONS[bonusId][bonusValue][itemId]:getSubId()
                            )
                        else
                            player:removeCondition(US_CONDITIONS[bonusId][bonusValue][itemId]:getType(), CONDITIONID_COMBAT)
                        end
                    end
                end
            end
        end
    end
    end

    return true
end

function Item.rollAttribute(self, player, itemType, weaponType, unidentify)
 if not itemType:isUpgradable() or self:isUnique() then
    return false
  end
  local attrIds = {}
  local item_level = self:getItemLevel()
  if unidentify then
    if US_CONFIG.IDENTIFY_UPGRADE_LEVEL then
      local upgrade_level = 1
      for i = US_CONFIG.MAX_UPGRADE_LEVEL, 1, -1 do
        if i >= US_CONFIG.UPGRADE_LEVEL_DESTROY then
          if math.random(100) <= US_CONFIG.UPGRADE_DESTROY_CHANCE[i] then
            upgrade_level = i
            break
          end
        else
          if math.random(100) <= US_CONFIG.UPGRADE_SUCCESS_CHANCE[i] then
            upgrade_level = i
            break
          end
        end
      end
      self:setUpgradeLevel(upgrade_level)
    end
    local slots = math.random(1, self:getMaxAttributes())
    local usItemType = self:getItemType()
    for i = 1, slots do
      local attrId = math.random(1, #US_ENCHANTMENTS)
      local attr = US_ENCHANTMENTS[attrId]
      while isInArray(attrIds, attrId) or attr.minLevel and item_level < attr.minLevel or bit.band(usItemType, attr.itemType) == 0 or
        attr.chance and math.random(100) >= attr.chance do
        attrId = math.random(1, #US_ENCHANTMENTS)
        attr = US_ENCHANTMENTS[attrId]
      end
      table.insert(attrIds, attrId)
      local value = attr.VALUES_PER_LEVEL and math.random(1, math.ceil(item_level * attr.VALUES_PER_LEVEL)) or 1
      self:setCustomAttribute("Slot" .. i, attrId .. "|" .. value)
    end
    return true
  else
    local bonuses = self:getBonusAttributes()
    if bonuses then
      if #bonuses >= self:getMaxAttributes() then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Max number of bonuses reached!")
        return false
      end
      for v, k in pairs(bonuses) do
        table.insert(attrIds, k[1])
      end
    end
    local usItemType = self:getItemType()
    local attrId = math.random(1, #US_ENCHANTMENTS)
    local attr = US_ENCHANTMENTS[attrId]
    while isInArray(attrIds, attrId) or attr.minLevel and item_level < attr.minLevel or bit.band(usItemType, attr.itemType) == 0 or
      attr.chance and math.random(100) >= attr.chance do
      attrId = math.random(1, #US_ENCHANTMENTS)
      attr = US_ENCHANTMENTS[attrId]
    end
    local value = attr.VALUES_PER_LEVEL and math.random(1, math.ceil(item_level * attr.VALUES_PER_LEVEL)) or 1
    self:setCustomAttribute("Slot" .. self:getLastSlot() + 1, attrId .. "|" .. value)
    return true
  end
  return false
end

function Item.addAttribute(self, slot, attr, value)
    self:setCustomAttribute("Slot" .. slot, attr .. "|" .. value)
end

function Item.setAttributeValue(self, slot, value)
    self:setCustomAttribute("Slot" .. slot, value)
end

function Item.getBonusAttribute(self, slot)
    local bonuses = self:getCustomAttribute("Slot" .. slot)
    if bonuses then
        local data = {}
        for bonus in bonuses:gmatch("([^|]+)") do
            data[#data + 1] = tonumber(bonus)
        end
        return data
    end

    return nil
end

function Item.getBonusAttributes(self)
    local data = {}
    for i = 1, self:getMaxAttributes() do
        local bonuses = self:getCustomAttribute("Slot" .. i)
        if bonuses then
            local t = {}
            for bonus in bonuses:gmatch("([^|]+)") do
                t[#t + 1] = tonumber(bonus)
            end
            data[#data + 1] = t
        end
    end

    return #data > 0 and data or nil
end

function Item.getLastSlot(self)
    local last = 0
    for i = 1, self:getMaxAttributes() do
        if self:getCustomAttribute("Slot" .. i) then
            last = i
        end
    end
    return last
end

function Item.setItemLevel(self, level, first)
  local oldLevel = self:getItemLevel()
 local itemType = ItemType(self.itemid)
 local finalValue = 0
 local value = 0
 if oldLevel < level then
   value = (level - oldLevel)
 else
   value = (oldLevel - level)
 end
 if itemType:getAttack() > 0 then
   if value >= US_CONFIG.ATTACK_PER_ITEM_LEVEL then
     finalValue = math.floor((value / US_CONFIG.ATTACK_PER_ITEM_LEVEL) * US_CONFIG.ATTACK_FROM_ITEM_LEVEL)
   else
     finalValue = 0
   end
   if oldLevel < level then
     self:setAttribute(
       ITEM_ATTRIBUTE_ATTACK,
       (self:getAttribute(ITEM_ATTRIBUTE_ATTACK) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_ATTACK) + finalValue) or (itemType:getAttack() + finalValue)
     )
   else
     self:setAttribute(
       ITEM_ATTRIBUTE_ATTACK,
       (self:getAttribute(ITEM_ATTRIBUTE_ATTACK) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_ATTACK) - finalValue) or (itemType:getAttack() - finalValue)
     )
   end
 end
 if itemType:getDefense() > 0 then
   if value >= US_CONFIG.DEFENSE_PER_ITEM_LEVEL then
     finalValue = math.floor((value / US_CONFIG.DEFENSE_PER_ITEM_LEVEL) * US_CONFIG.DEFENSE_FROM_ITEM_LEVEL)
   else
     finalValue = 0
   end
   if oldLevel < level then
     self:setAttribute(
       ITEM_ATTRIBUTE_DEFENSE,
       (self:getAttribute(ITEM_ATTRIBUTE_DEFENSE) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_DEFENSE) + finalValue) or (itemType:getDefense() + finalValue)
     )
   else
     self:setAttribute(
       ITEM_ATTRIBUTE_DEFENSE,
       (self:getAttribute(ITEM_ATTRIBUTE_DEFENSE) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_DEFENSE) - finalValue) or (itemType:getDefense() - finalValue)
     )
   end
 end
 if itemType:getArmor() > 0 then
   if value >= US_CONFIG.ARMOR_PER_ITEM_LEVEL then
     finalValue = math.floor((value / US_CONFIG.ARMOR_PER_ITEM_LEVEL) * US_CONFIG.ARMOR_FROM_ITEM_LEVEL)
   else
     finalValue = 0
   end
   if oldLevel < level then
     self:setAttribute(
       ITEM_ATTRIBUTE_ARMOR,
       (self:getAttribute(ITEM_ATTRIBUTE_ARMOR) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_ARMOR) + finalValue) or (itemType:getArmor() + finalValue)
     )
   else
     self:setAttribute(
       ITEM_ATTRIBUTE_ARMOR,
       (self:getAttribute(ITEM_ATTRIBUTE_ARMOR) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_ARMOR) - finalValue) or (itemType:getArmor() - finalValue)
     )
   end
 end
 

 if itemType:getHitChance() > 0 then
   if value >= US_CONFIG.HITCHANCE_PER_ITEM_LEVEL then
     finalValue = math.floor((value / US_CONFIG.HITCHANCE_PER_ITEM_LEVEL) * US_CONFIG.HITCHANCE_FROM_ITEM_LEVEL)
   else
     finalValue = 0
   end
   if oldLevel < level then
     self:setAttribute(ITEM_ATTRIBUTE_HITCHANCE, (self:getAttribute(ITEM_ATTRIBUTE_HITCHANCE) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_HITCHANCE) + finalValue) or (itemType:getHitChance() + finalValue))
   else
     self:setAttribute(ITEM_ATTRIBUTE_HITCHANCE, (self:getAttribute(ITEM_ATTRIBUTE_HITCHANCE) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_HITCHANCE) - finalValue) or (itemType:getHitChance() - finalValue))
   end
 end
 -- Additional stat and special skill logic (do NOT remove old logic, only add below)

 
   if first then
       if itemType:getAttack() > 0 then
           level = level + math.floor(itemType:getAttack() / US_CONFIG.ITEM_LEVEL_PER_ATTACK)
       end
       if itemType:getDefense() > 0 then
           level = level + math.floor(itemType:getDefense() / US_CONFIG.ITEM_LEVEL_PER_DEFENSE)
       end
       if itemType:getArmor() > 0 then
           level = level + math.floor((itemType:getArmor() * 4.0) / US_CONFIG.ITEM_LEVEL_PER_ARMOR )
       end
 
       if itemType:getHitChance() > 0 then
           level = level + math.floor(itemType:getHitChance() / US_CONFIG.ITEM_LEVEL_PER_HITCHANCE)
       end

       if itemType:getStat(STAT_MAGICPOINTS) > 0 then
           level = level + math.floor(((itemType:getStat(STAT_MAGICPOINTS) * 3) * US_CONFIG.ITEM_LEVEL_PER_MAGICLEVEL_MULTIPLIER) / US_CONFIG.ITEM_LEVEL_PER_MAGICLEVEL)
       end

       if itemType:getStat(STAT_MAXHITPOINTS) > 0 then
           level = level + math.floor(itemType:getStat(STAT_MAXHITPOINTS) / US_CONFIG.ITEM_LEVEL_PER_MAXHP)
       end

       if itemType:getStat(STAT_MAXMANAPOINTS) > 0 then
           level = level + math.floor(itemType:getStat(STAT_MAXMANAPOINTS) / US_CONFIG.ITEM_LEVEL_PER_MAXMP)
       end

       if itemType:getSpecialSkill(SPECIALSKILL_CRITICALHITCHANCE) > 0 then
           level = level + math.floor((itemType:getSpecialSkill(SPECIALSKILL_CRITICALHITCHANCE) * 3) / US_CONFIG.ITEM_LEVEL_PER_CRITCHANCE)
       end

       if itemType:getSpecialSkill(SPECIALSKILL_LIFLEECHCHANCE) > 0 then
           level = level + math.floor((itemType:getSpecialSkill(SPECIALSKILL_LIFLEECHCHANCE) * 3) / US_CONFIG.ITEM_LEVEL_PER_LIFELEECHCHANCE)
       end

       if itemType:getSpecialSkill(SPECIALSKILL_LIFLEECHAMOUNT) > 0 then
           level = level + math.floor((itemType:getSpecialSkill(SPECIALSKILL_LIFLEECHAMOUNT) * 3) / US_CONFIG.ITEM_LEVEL_PER_LIFELEECHAMOUNT)
       end

       if itemType:getSpecialSkill(SPECIALSKILL_MANALEECHCHANCE) > 0 then
           level = level + math.floor((itemType:getSpecialSkill(SPECIALSKILL_MANALEECHCHANCE) * 3) / US_CONFIG.ITEM_LEVEL_PER_MANALEECHCHANCE)
       end

       if itemType:getSpecialSkill(SPECIALSKILL_MANALEECHAMOUNT) > 0 then
           level = level + math.floor((itemType:getSpecialSkill(SPECIALSKILL_MANALEECHAMOUNT) * 3) / US_CONFIG.ITEM_LEVEL_PER_MANALEECHAMOUNT)
       end

       if itemType:getSpecialSkill(SPECIALSKILL_ATTACKSPEED) > 0 then
           level = level + math.floor((itemType:getSpecialSkill(SPECIALSKILL_ATTACKSPEED) * 3)/ US_CONFIG.ITEM_LEVEL_PER_ATTACKSPEED)
       end

       if itemType:getSkill(SKILL_CLUB) > 0 then
         level = level + math.floor((itemType:getSkill(SKILL_CLUB) * 5)/ US_CONFIG.ITEM_LEVEL_PER_SKILL)
       end

       if itemType:getSkill(SKILL_SWORD) > 0 then
         level = level + math.floor((itemType:getSkill(SKILL_SWORD) * 5)/ US_CONFIG.ITEM_LEVEL_PER_SKILL)
       end

       if itemType:getSkill(SKILL_AXE) > 0 then
         level = level + math.floor((itemType:getSkill(SKILL_AXE) * 5)/ US_CONFIG.ITEM_LEVEL_PER_SKILL)
       end

       if itemType:getSkill(SKILL_DISTANCE) > 0 then
         level = level + math.floor((itemType:getSkill(SKILL_DISTANCE) * 5)/ US_CONFIG.ITEM_LEVEL_PER_SKILL)
       end

       if itemType:getSkill(SKILL_SHIELD) > 0 then
         level = level + math.floor((itemType:getSkill(SKILL_SHIELD) * 5)/ US_CONFIG.ITEM_LEVEL_PER_SKILL)
       end

       if itemType:getHealthGain() > 0 then
         level = level + math.floor(itemType:getHealthGain() / US_CONFIG.ITEM_LEVEL_PER_HEALTHGAIN)
       end

       if itemType:getManaGain() > 0 then
         level = level + math.floor(itemType:getManaGain() / US_CONFIG.ITEM_LEVEL_PER_MANAGAIN)
       end

       

       

   end
   return self:setCustomAttribute("item_level", level)
end

function Item.getItemLevel(self)
    return self:getCustomAttribute("item_level") and self:getCustomAttribute("item_level") or 0
end

function Item.setUpgradeLevel(self, level)
    local itemType = ItemType(self.itemid)
  local oldLevel = self:getUpgradeLevel()
  print("setUpgradeLevel")
  if itemType:getAttack() > 0 then
    if oldLevel < level then
      self:setAttribute(ITEM_ATTRIBUTE_ATTACK, self:getAttribute(ITEM_ATTRIBUTE_ATTACK) + (level - oldLevel) * US_CONFIG.ATTACK_PER_UPGRADE)
    else
      self:setAttribute(ITEM_ATTRIBUTE_ATTACK, self:getAttribute(ITEM_ATTRIBUTE_ATTACK) - (oldLevel - level) * US_CONFIG.ATTACK_PER_UPGRADE)
    end
  end
  if itemType:getDefense() > 0 then
    if oldLevel < level then
      self:setAttribute(ITEM_ATTRIBUTE_DEFENSE, self:getAttribute(ITEM_ATTRIBUTE_DEFENSE) + (level - oldLevel) * US_CONFIG.DEFENSE_PER_UPGRADE)
    else
      self:setAttribute(ITEM_ATTRIBUTE_DEFENSE, self:getAttribute(ITEM_ATTRIBUTE_DEFENSE) - (oldLevel - level) * US_CONFIG.DEFENSE_PER_UPGRADE)
    end
  end
  if itemType:getExtraDefense() > 0 then
    if oldLevel < level then
      self:setAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE, itemType:getExtraDefense() + (level - oldLevel) * US_CONFIG.EXTRADEFENSE_PER_UPGRADE)
    else
      self:setAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE, self:getAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE) - (oldLevel - level) * US_CONFIG.EXTRADEFENSE_PER_UPGRADE)
    end
  end
  if itemType:getArmor() > 0 then
    if oldLevel < level then
      self:setAttribute(ITEM_ATTRIBUTE_ARMOR, self:getAttribute(ITEM_ATTRIBUTE_ARMOR) + (level - oldLevel) * US_CONFIG.ARMOR_PER_UPGRADE)
    else
      self:setAttribute(ITEM_ATTRIBUTE_ARMOR, self:getAttribute(ITEM_ATTRIBUTE_ARMOR) - (oldLevel - level) * US_CONFIG.ARMOR_PER_UPGRADE)
    end
  end
  if itemType:getHitChance() > 0 then
    if oldLevel < level then
      self:setAttribute(ITEM_ATTRIBUTE_HITCHANCE, self:getAttribute(ITEM_ATTRIBUTE_HITCHANCE) + (level - oldLevel) * US_CONFIG.HITCHANCE_PER_UPGRADE)
    else
      self:setAttribute(ITEM_ATTRIBUTE_HITCHANCE, self:getAttribute(ITEM_ATTRIBUTE_HITCHANCE) - (oldLevel - level) * US_CONFIG.HITCHANCE_PER_UPGRADE)
    end
  end
  
  self:setCustomAttribute("upgrade", level)
  if oldLevel < level then
    self:setItemLevel(self:getItemLevel() + (US_CONFIG.ITEM_LEVEL_PER_UPGRADE * (level - oldLevel)))
  end
end

function Item.getUpgradeLevel(self)
    return self:getCustomAttribute("upgrade") and self:getCustomAttribute("upgrade") or 0
end

function Item.reduceUpgradeLevel(self)
    self:setUpgradeLevel(self:getUpgradeLevel() - 1)
    self:setItemLevel(self:getItemLevel() - US_CONFIG.ITEM_LEVEL_PER_UPGRADE)
end

function Item.unidentify(self)
    self:setCustomAttribute("unidentified", true)
end

function Item.isUnidentified(self)
    return self:getCustomAttribute("unidentified")
end

function Item.identify(self, player, itemType, weaponType)
    self:removeCustomAttribute("unidentified")
  local usItemType = self:getItemType()
  local canUnique = false
  for i = 1, #US_UNIQUES do
    if US_UNIQUES[i].minLevel <= self:getItemLevel() and bit.band(usItemType, US_UNIQUES[i].itemType) ~= 0 then
      canUnique = true
      break
    end
  end
  self:rollRarity()
  if canUnique and math.random(US_CONFIG.UNIQUE_CHANCE) == 1 then
    local unique = math.random(#US_UNIQUES)
    while US_UNIQUES[unique].minLevel > self:getItemLevel() or bit.band(usItemType, US_UNIQUES[unique].itemType) == 0 or
      US_UNIQUES[unique].chance and math.random(100) >= US_UNIQUES[unique].chance do
      unique = math.random(#US_UNIQUES)
    end
    self:setUnique(unique)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Corrupted item " .. self:getUniqueName() .. " discovered!")
  else
    self:rollAttribute(player, itemType, weaponType, true)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Item successfully identified!")
  end
  return true
end

function Item.RollUnique(self, player, itemType, weaponType)
  local usItemType = self:getItemType()
  local canUnique = false
  for i = 1, #US_UNIQUES do
    if US_UNIQUES[i].minLevel <= self:getItemLevel() and bit.band(usItemType, US_UNIQUES[i].itemType) ~= 0 then
      canUnique = true
      break
    end
  end
  self:rollRarity()
  if canUnique then
    local unique = math.random(#US_UNIQUES)
    while US_UNIQUES[unique].minLevel > self:getItemLevel() or bit.band(usItemType, US_UNIQUES[unique].itemType) == 0 or
      US_UNIQUES[unique].chance and math.random(100) >= US_UNIQUES[unique].chance do
      unique = math.random(#US_UNIQUES)
    end
    self:setUnique(unique)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Corrupted item " .. self:getUniqueName() .. " discovered!")
  else
    self:rollAttribute(player, itemType, weaponType, true)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Item successfully identified!")
  end
  return true
end

function Item.setUnique(self, uniqueId)
    self:setCustomAttribute("unique", uniqueId)
    local unique = US_UNIQUES[uniqueId]
    if unique then
        for i = 1, #unique.attributes do
            local attrId = unique.attributes[i]
            local attr = US_ENCHANTMENTS[attrId]
            local value = attr.VALUES_PER_LEVEL and math.random(1, math.ceil(self:getItemLevel() * attr.VALUES_PER_LEVEL)) or 1
            self:setCustomAttribute("Slot" .. self:getLastSlot() + 1, attrId .. "|" .. value)
        end
    end
    self:setShader("Corrupted")
end


function Item.getEnchanted(self)
  return self:getCustomAttribute("Enchanted") and self:getCustomAttribute("Enchanted") or nil
end

function Item.setEnchant(self, player, itemType, weaponType, enchantId)
  if self:isUnique() then
    return false
  end
  
  
  local attrIds = {}
  local item_level = self:getItemLevel()
  local bonuses = self:getBonusAttributes()
    if bonuses then
      if #bonuses >= self:getMaxAttributes() then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Max number of bonuses reached!")
        return false
      end
      for v, k in pairs(bonuses) do
        table.insert(attrIds, k[1])
      end
    end
    local usItemType = self:getItemType()
    local attrId = enchantId
    local attr = US_ENCHANTMENTS[attrId]
	
	if attr.minLevel and  self:getItemLevel() < attr.minLevel    then
     player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item Level should be " .. attr.minLevel .. " or higher for this Power Rune!")
        return false
    end
	if bit.band(usItemType, attr.itemType) == 0 then
	 player:sendTextMessage(MESSAGE_STATUS_WARNING, "This item does not allow this type of Power Rune!")
        return false
    end
	if self:getEnchanted() then
	player:sendTextMessage(MESSAGE_STATUS_WARNING, "This item is already has a Power Rune!")
        return false
	end
	
    local value = attr.VALUES_PER_LEVEL and math.random(1, math.ceil(item_level * attr.VALUES_PER_LEVEL)) or 1
    self:setCustomAttribute("Slot" .. self:getLastSlot() + 1, attrId .. "|" .. value)
	self:setCustomAttribute("Enchanted", self:getLastSlot())
	
    return true
  end
  
  
  
  
  function Item.setNormalEnchant(self, player, itemType, weaponType, enchantId)
  if self:isUnique() then
    return false
  end
  
  
  local attrIds = {}
  local item_level = self:getItemLevel()
  local bonuses = self:getBonusAttributes()
    if bonuses then
      if #bonuses >= self:getMaxAttributes() then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Max number of bonuses reached!")
        return false
      end
      for v, k in pairs(bonuses) do
        table.insert(attrIds, k[1])
      end
    end
    local usItemType = self:getItemType()
    local attrId = enchantId
    local attr = US_ENCHANTMENTS[attrId]
	
	if attr.minLevel and  self:getItemLevel() < attr.minLevel    then
     player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item Level should be " .. attr.minLevel .. " or higher for this atributte!")
        return false
    end
	if bit.band(usItemType, attr.itemType) == 0 then
	 player:sendTextMessage(MESSAGE_STATUS_WARNING, "This item does not allow this type of Power Rune!")
        return false
    end
	
    local value = attr.VALUES_PER_LEVEL and math.random(1, math.ceil(item_level * attr.VALUES_PER_LEVEL)) or 1
    self:setCustomAttribute("Slot" .. self:getLastSlot() + 1, attrId .. "|" .. value)
	
    return true
  end
  
  
--enchanted*****
function Item.isEnchanted(self)
  return self:getCustomAttribute("Enchanted") and true or false
end

function Item.getEnchantedName(self)
  return US_ENCHANTMENTS[self:getEnchanted()].name
end
-- end enchanted****
function Item.getUnique(self)
    return self:getCustomAttribute("unique") and self:getCustomAttribute("unique") or nil
end

function Item.isUnique(self)
    return self:getCustomAttribute("unique") and true or false
end

function Item.getUniqueName(self)
    return US_UNIQUES[self:getUnique()].name
end

function Item.setMemory(self, value)
    self:setCustomAttribute("memory", value)
end

function Item.hasMemory(self)
    return self:getCustomAttribute("memory")
end

function Item.setLimitless(self, value)
    self:setCustomAttribute("limitless", value)
end

function Item.isLimitless(self)
    return self:getCustomAttribute("limitless")
end

function Item.setMirrored(self, value)
    self:setCustomAttribute("mirrored", value)
end

function Item.isMirrored(self)
    return self:getCustomAttribute("mirrored")
end

function Item.getItemType(self)
    local itemType = self:getType()
    local slot = itemType:getSlotPosition() - SLOTP_LEFT - SLOTP_RIGHT

    local weaponType = itemType:getWeaponType()
    if weaponType > 0 then
        if weaponType == WEAPON_SHIELD then
            return US_ITEM_TYPES.SHIELD
        end
        if weaponType == WEAPON_DISTANCE then
            return US_ITEM_TYPES.WEAPON_DISTANCE
        end
        if weaponType == WEAPON_WAND then
            return US_ITEM_TYPES.WEAPON_WAND
        end
        if isInArray({WEAPON_SWORD, WEAPON_CLUB, WEAPON_AXE}, weaponType) then
            return US_ITEM_TYPES.WEAPON_MELEE
        end
    else
        if slot == SLOTP_HEAD then
            return US_ITEM_TYPES.HELMET
        end
        if slot == SLOTP_ARMOR then
            return US_ITEM_TYPES.ARMOR
        end
        if slot == SLOTP_LEGS then
            return US_ITEM_TYPES.LEGS
        end
        if slot == SLOTP_FEET then
            return US_ITEM_TYPES.BOOTS
        end
        if slot == SLOTP_NECKLACE then
            return US_ITEM_TYPES.NECKLACE
        end
        if slot == SLOTP_RING then
            return US_ITEM_TYPES.RING
        end
        if slot == SLOTP_RUNE1 then
            return US_ITEM_TYPES.RUNE1
        end
        if slot == SLOTP_RUNE2 then
            return US_ITEM_TYPES.RUNE
        end
        if slot == SLOTP_RUNE3 then
            return US_ITEM_TYPES.RUNE
        end
    end
    return US_ITEM_TYPES.ALL
end

function Item.setRarity(self, rarity)
    self:setCustomAttribute("rarity", rarity)
    print("set rarity", rarity)
    local rarityName = US_CONFIG.RARITY[rarity] and US_CONFIG.RARITY[rarity].name or tostring(rarity)
    local itemName = self:getName()
    if rarity == 2 or rarity == 3 or rarity == 4 then
        local newName = rarityName .. " " .. itemName
        self:setAttribute(ITEM_ATTRIBUTE_NAME, newName)
    else
        self:setAttribute(ITEM_ATTRIBUTE_NAME, itemName)
    end

    if rarity == 2 then
      self:setShader("Orbital")
   end
    if rarity == 3 then
        self:setShader("Forged")
    end

    
    if rarity and self:getCustomAttribute("item_level") > 0 then
      local raritylevel = rarity
      print("rarity level", raritylevel)
      local level = self:getCustomAttribute("item_level")
      
      -- Modified formula using 1.5 base multiplier with diminishing returns
      local rarityMultiplier = 1 + (raritylevel * (US_CONFIG.ITEM_LEVEL_PER_RARITY / 4))
      level = math.floor(level * rarityMultiplier)
      
      print(string.format("Rarity %d (%.2fx) increased item level from %d to %d", 
          raritylevel, rarityMultiplier, self:getCustomAttribute("item_level"), level))
      self:setCustomAttribute("item_level", level)
  end

end

function Item.rollRarity(self)
    local rarity = COMMON
    for i = #US_CONFIG.RARITY, 1, -1 do
        if math.random(US_CONFIG.RARITY[i].chance) == 1 then
            rarity = i
            break
        end
    end
    self:setRarity(rarity)

end

function Item.getRarity(self)
    return self:getCustomAttribute("rarity") and US_CONFIG.RARITY[self:getCustomAttribute("rarity")] or US_CONFIG.RARITY[COMMON]
end

-- Rarity level mapping: 0=COMMON, 1=RARE, 2=EPIC, 3=LEGENDARY


function Item.getRarityLevel(self)
  local rarityId = self:getCustomAttribute("rarity")
  -- If already a number, just map to 0-based
  if type(rarityId) == "number" then
      return rarityId - 1
  end
  -- If it's a string, map it
  if type(rarityId) == "string" then
      local rarityMap = {
          ["COMMON"] = 0,
          ["RARE"] = 1,
          ["EPIC"] = 2,
          ["LEGENDARY"] = 3
      }
      return rarityMap[rarityId] or 0
  end
  return 0 -- default to COMMON
end

function Item.getRarityId(self)
    return self:getCustomAttribute("rarity") and self:getCustomAttribute("rarity") or COMMON
end

function Item.isCommon(self)
  return US_CONFIG.RARITY[COMMON] --or COMMON
end


function Item.getMaxAttributes(self)
    if self:isUnique() then
        return #US_UNIQUES[self:getUnique()].attributes
    end
    local rarity = self:getRarity()
    return rarity.maxBonus
end

function ItemType.isUpgradable(self)
    if self:isStackable() or self:getTransformEquipId() > 0 or self:getDecayId() > 0 or self:getDestroyId() > 0 or self:getCharges() > 0 then
    return false
  end
  local slot = self:getSlotPosition() - SLOTP_LEFT - SLOTP_RIGHT

  local weaponType = self:getWeaponType()
  if weaponType > 0 then
    if
      weaponType == WEAPON_SHIELD or weaponType == WEAPON_DISTANCE or weaponType == WEAPON_WAND or
        isInArray({WEAPON_SWORD, WEAPON_CLUB, WEAPON_AXE}, weaponType)
     then
      return true
    end
  else
    if slot == SLOTP_HEAD or slot == SLOTP_ARMOR or slot == SLOTP_LEGS or slot == SLOTP_FEET or slot == SLOTP_NECKLACE or slot == SLOTP_RING or slot == SLOTP_AMMO or slot == SLOTP_RUNE1 or slot == SLOTP_RUNE2 or slot == SLOTP_RUNE3 then
      return true
    end
  end
  return false
end

function ItemType.canHaveItemLevel(self)
 if self:getTransformEquipId() > 0 or self:getDecayId() > 0 or self:getDestroyId() > 0 or self:getCharges() > 0 then
    return false
  end
  local slot = self:getSlotPosition() - SLOTP_LEFT - SLOTP_RIGHT

  local weaponType = self:getWeaponType()
  if weaponType > 0 then
    if
      weaponType == WEAPON_SHIELD or weaponType == WEAPON_DISTANCE or weaponType == WEAPON_WAND or
        isInArray({WEAPON_SWORD, WEAPON_CLUB, WEAPON_AXE}, weaponType)
     then
      return true
    end
  else
    if slot == SLOTP_HEAD or slot == SLOTP_ARMOR or slot == SLOTP_LEGS or slot == SLOTP_FEET or slot == SLOTP_NECKLACE or slot == SLOTP_RING or slot == SLOTP_AMMO or slot == SLOTP_RUNE1 or slot == SLOTP_RUNE2 or slot == SLOTP_RUNE3 then
      return true
    end
  end
  return false
end

function MonsterType.calculateItemLevel(self)
  local level = 1
  local monsterValue = self:getMaxHealth() + self:getExperience()
  --level = math.ceil(math.pow(monsterValue, 0.478))
 -- return math.max(1, level)
   return 1
end


function Player.getNextSubId(self, itemSlot, attrSlot)
    local cid = self:getId()
    if not US_SUBID[cid] then
        US_SUBID[cid] = {current = 0}
    end

    local subId = US_SUBID[cid]
    subId.current = subId.current + 1

    if not subId[itemSlot] then
        subId[itemSlot] = {}
    end

    subId[itemSlot][attrSlot] = subId.current

    return subId.current
end

LoginEvent:type("login")
LoginEvent:register()
HealthChangeEvent:type("healthchange")
HealthChangeEvent:register()
ManaChangeEvent:type("manachange")
ManaChangeEvent:register()
DeathEvent:type("death")
DeathEvent:register()
KillEvent:type("kill")
KillEvent:register()
PrepareDeathEvent:type("preparedeath")
PrepareDeathEvent:register()
