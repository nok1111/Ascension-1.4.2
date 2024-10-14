local CrystalsAction = Action()

function CrystalsAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not target or not target:isItem() or not target:getType():isUpgradable() then
    return false
  end
  if toPosition.y <= CONST_SLOT_AMMO then
    player:sendTextMessage(MESSAGE_STATUS_WARNING, "You can't use that on equipped item!")
    player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    return true
  end
  if item.itemid == US_CONFIG[1][ITEM_UPGRADE_CRYSTAL]  and target:isUnidentified() then
    player:sendTextMessage(MESSAGE_STATUS_WARNING, "Sorry, this item is unidentified and can't be modified!")
    player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    return true
  end
   if item.itemid == US_CONFIG[1][ITEM_UPGRADE_CRYSTAL_BREAKER]  and target:isUnidentified() then
    player:sendTextMessage(MESSAGE_STATUS_WARNING, "Sorry, this item is unidentified and can't be modified!")
    player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    return true
  end
    if item.itemid == US_CONFIG[1][ITEM_ENCHANT_CRYSTAL]  and target:isUnidentified() then
    player:sendTextMessage(MESSAGE_STATUS_WARNING, "Sorry, this item is unidentified and can't be modified!")
    player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    return true
  end
    if item.itemid == US_CONFIG[1][ITEM_ALTER_CRYSTAL]  and target:isUnidentified() then
    player:sendTextMessage(MESSAGE_STATUS_WARNING, "Sorry, this item is unidentified and can't be modified!")
    player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    return true
  end
    if item.itemid == US_CONFIG[1][ITEM_CLEAN_CRYSTAL]  and target:isUnidentified() then
    player:sendTextMessage(MESSAGE_STATUS_WARNING, "Sorry, this item is unidentified and can't be modified!")
    player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    return true
  end
   if item.itemid == US_CONFIG[1][ITEM_FORTUNE_CRYSTAL]  and target:isUnidentified() then
    player:sendTextMessage(MESSAGE_STATUS_WARNING, "Sorry, this item is unidentified and can't be modified!")
    player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    return true
  end 
    if item.itemid == US_CONFIG[1][ITEM_FAITH_CRYSTAL]  and target:isUnidentified() then
    player:sendTextMessage(MESSAGE_STATUS_WARNING, "Sorry, this item is unidentified and can't be modified!")
    player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    return true
  end
 
  
  
  if target:isMirrored() then
    player:sendTextMessage(MESSAGE_STATUS_WARNING, "Sorry, this item is mirrored and can't be modified!")
    player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    return true
  end
  local itemType = ItemType(target.itemid)
  if item.itemid == US_CONFIG[1][ITEM_UPGRADE_CRYSTAL] then
    if itemType:isUpgradable() then
      local upgrade = target:getUpgradeLevel()
      if upgrade < US_CONFIG.MAX_UPGRADE_LEVEL then
        upgrade = upgrade + 1
        if upgrade >= US_CONFIG.UPGRADE_LEVEL_DESTROY then
          if math.random(100) > US_CONFIG.UPGRADE_DESTROY_CHANCE[upgrade] then
            if player:getItemCount(US_CONFIG.ITEM_UPGRADE_CATALYST) > 0 then
              player:sendTextMessage(MESSAGE_INFO_DESCR, "Upgrade failed! Item protected from being destroyed!")
              player:removeItem(US_CONFIG.ITEM_UPGRADE_CATALYST, 1)
              item:remove(1)
              player:getPosition():sendMagicEffect(521)
              return true
            end
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "Upgrade failed! Item destroyed!")
            target:remove(1)
            item:remove(1)
            player:getPosition():sendMagicEffect(521)
            return true
          end
        else
          if math.random(100) > US_CONFIG.UPGRADE_SUCCESS_CHANCE[upgrade] then

              if upgrade > US_CONFIG.UNBREAKED_UPGRADE_LEVEL then
                 player:sendTextMessage(MESSAGE_STATUS_WARNING, "Upgrade failed!!, your item has reached a softcap for upgrades and the upgrade chance will be drastically lower.")
               else
              player:sendTextMessage(MESSAGE_STATUS_WARNING, "Upgrade failed!!")
             end
           -- target:reduceUpgradeLevel()
            item:remove(1)
            player:getPosition():sendMagicEffect(521)
            return true
          end
        end

        target:setUpgradeLevel(upgrade)

        item:remove(1)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Item upgrade level increased to " .. upgrade .. "!")
        player:getPosition():sendMagicEffect(519)

        if target:getItemLevel() == 0 then
          target:setItemLevel(1, true)
        end
      else
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Maximum upgrade level "  .. US_CONFIG.MAX_UPGRADE_LEVEL .. " reached Unchained Orb!")
      end
    else
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
      return true
    end



elseif item.itemid == US_CONFIG[1][ITEM_UPGRADE_CRYSTAL_BREAKER] then
    if itemType:isUpgradable() then
      local upgrade = target:getUpgradeLevel()
      if upgrade >= US_CONFIG.UNBREAKED_UPGRADE_LEVEL and upgrade < US_CONFIG.MAX_UPGRADE_LEVEL then
        upgrade = upgrade + 1
        if upgrade >= US_CONFIG.UPGRADE_LEVEL_DESTROY then
          if math.random(100) > US_CONFIG.UPGRADE_DESTROY_CHANCE[upgrade] then
            if player:getItemCount(US_CONFIG.ITEM_UPGRADE_CATALYST) > 0 then
              player:sendTextMessage(MESSAGE_INFO_DESCR, "Upgrade failed! Item protected from being destroyed!")
              player:removeItem(US_CONFIG.ITEM_UPGRADE_CATALYST, 1)
              item:remove(1)
              player:getPosition():sendMagicEffect(521)
              return true
            end
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "Upgrade failed! Item destroyed!")
            target:remove(1)
            item:remove(1)
            player:getPosition():sendMagicEffect(521)
            return true
          end
        else
          if math.random(100) > US_CONFIG.UPGRADE_SUCCESS_CHANCE_BREAKER[upgrade] then
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "Upgrade failed!!")
           -- target:reduceUpgradeLevel()
            item:remove(1)
            player:getPosition():sendMagicEffect(521)
            return true
          end
        end

        target:setUpgradeLevel(upgrade)

        item:remove(1)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Item upgrade level increased to " .. upgrade .. "!")
        player:getPosition():sendMagicEffect(519)

        if target:getItemLevel() == 0 then
          target:setItemLevel(1, true)
        end
      else
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "this orb can only be used on items with a higher upgrade level of " .. US_CONFIG.UNBREAKED_UPGRADE_LEVEL .. " and lower than " .. US_CONFIG.MAX_UPGRADE_LEVEL)
      end
    else
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
      return true
    end





  elseif item.itemid == US_CONFIG[1][ITEM_ENCHANT_CRYSTAL] then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes to Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
        if not target:rollAttribute(player, itemType, weaponType) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted new attributes.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end

	
 elseif item.itemid == 38147 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes to Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 65) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Frost Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	
	
	
	
	--***CRAFTING STAT RUNES***--
	 elseif item.itemid == 38199 then --normal
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes to Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setNormalEnchant(player, itemType, weaponType, 3) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a normal Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
		 elseif item.itemid == 38200 then --celestial
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes to Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 7) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a celestial Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	

		 elseif item.itemid == 38179 then --celestial
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes to Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 8) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a celestial Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	
	
	elseif item.itemid == 38195 then --normal
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes to Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setNormalEnchant(player, itemType, weaponType, 9) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a normal Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
		 elseif item.itemid == 38196 then --celestial
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes to Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 6) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a celestial Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	elseif item.itemid == 38197 then --normal
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes to Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setNormalEnchant(player, itemType, weaponType, 10) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a normal Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
		 elseif item.itemid == 38198 then --celestial
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes to Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 5) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a celestial Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	
	--***LOOT/CHEST STAT RUNES***--
	 elseif item.itemid == 38188 then --normal
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setNormalEnchant(player, itemType, weaponType, 43) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly life a normal Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
		 elseif item.itemid == 38194 then --normal
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setNormalEnchant(player, itemType, weaponType, 44) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly life a normal Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	
	
	--**crafting resistance
	elseif item.itemid == 38201 then --normal physical protection
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setNormalEnchant(player, itemType, weaponType, 22) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a normal Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	elseif item.itemid == 38202 then --celestial physical protection
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 72) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a celestial Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	
		elseif item.itemid == 38203 then --normal magic protection
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setNormalEnchant(player, itemType, weaponType, 23) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a normal Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
		 elseif item.itemid == 38204 then --celestial magic protection
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 73) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a celestial Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end

	--** life enchants ** --
	 elseif item.itemid == 38198 then --celestial
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes to Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 5) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a celestial Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	
	
	--***FLAME RUNES***--
	 elseif item.itemid == 38158 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 30) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Fire Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
		 elseif item.itemid == 38183 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 58) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Fire Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
		 elseif item.itemid == 38152 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 67) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Fire Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	elseif item.itemid == 38168 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 67) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Fire Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	
		--***frost RUNES***--
	 elseif item.itemid == 38155 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 68) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a frost Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	 elseif item.itemid == 38161 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 70) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a frost Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	elseif item.itemid == 38186 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 71) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a frost Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	
	--***CELESTIAL RUNES***--
	 elseif item.itemid == 38180 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 38) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a celestial Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	 elseif item.itemid == 38149 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 39) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a celestial Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	 elseif item.itemid == 38175 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 76) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Life Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	 elseif item.itemid == 38169 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 77) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Life Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	--***healing RUNES***--
	 elseif item.itemid == 38157 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 48) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Healing Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	elseif item.itemid == 38163 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 49) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Healing Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	elseif item.itemid == 38205 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 61) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Healing Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	elseif item.itemid == 38206 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 60) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Healing Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	--***Moon RUNES***--
	 elseif item.itemid == 38160 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 40) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Moon Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	 elseif item.itemid == 38154 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 18) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Moon Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	
	
	--***Moon RUNES***--
		 elseif item.itemid == 38173 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 16) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Grial Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	
	
	--***death RUNES***--
	 elseif item.itemid == 38162 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 42) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Death Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	 elseif item.itemid == 38156 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 63) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Death Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	elseif item.itemid == 38187 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 52) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Death Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	
	
	
	--***thunder RUNES***--
	 elseif item.itemid == 38153 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 41) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Lightning Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	 elseif item.itemid == 38159 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 20) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Lightning Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	 elseif item.itemid == 38184 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 56) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Lightning Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	 elseif item.itemid == 38190 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 75) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Lightning Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	
	
	--***LEAF RUNES***--
	 elseif item.itemid == 38172 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 64) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Terra Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	
	--***DOUBLE DAMAGE RUNES***--
	 elseif item.itemid == 38164 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 51) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Mystic Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	 elseif item.itemid == 38167 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 53) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Mystic Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	
	--***EMPEROR DAMAGE RUNES***--
	 elseif item.itemid == 38177 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 69) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted an Emperor Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	 elseif item.itemid == 38176 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 13) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted an Emperor Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	
	--***SUMMON RUNES***--
	 elseif item.itemid == 38165 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 27) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Luck Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	 elseif item.itemid == 38171 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 24) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Luck Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
		 elseif item.itemid == 38151 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 19) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Luck Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	
		--***deflect RUNES***--
	 elseif item.itemid == 38181 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 26) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Steel Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	elseif item.itemid == 38150 then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant add attributes Corrupted or Trinket items!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      if itemType then
        local weaponType = itemType:getWeaponType()
		local rarityLevel = target:getRarityId()
		local item_level = target:getItemLevel()
        if not target:setEnchant(player, itemType, weaponType, 25) then
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        elseif rarityLevel == 1 then
		  player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cannot add attributes to Common items!")
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly enchanted a Celestial Steel Attribute.")
		player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    end
	
	
	
	
	
	
	
  elseif item.itemid == US_CONFIG[1][ITEM_ALTER_CRYSTAL] then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant remove Corrupted or Trinket attributes!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      local bonuses = target:getBonusAttributes()
      if bonuses then
        local last = target:getLastSlot()
        target:removeCustomAttribute("Slot" .. last)
		
		if target:isEnchanted() then
		if last == target:getEnchanted() then
		target:removeCustomAttribute("Enchanted")
		end
		--print(target:getEnchanted())
		--print(last)
		end
        item:remove(1)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly removed last attribute.")
		player:getPosition():sendMagicEffect(520)
      else
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item has no attributes!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
      end
    end
  elseif item.itemid == US_CONFIG[1][ITEM_CLEAN_CRYSTAL] then
    if target:isUnique() then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "You cant remove Corrupted or Trinket attributes!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    else
      local bonuses = target:getBonusAttributes()
      if bonuses then
        for i = 1, #bonuses do
          target:removeCustomAttribute("Slot" .. i)
		  target:removeCustomAttribute("Enchanted")
        end
        item:remove(1)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly removed all attributes.")
		player:getPosition():sendMagicEffect(520)
      else
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item has no attributes!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
      end
    end
  elseif item.itemid == US_CONFIG[1][ITEM_FORTUNE_CRYSTAL] then
    local bonuses = target:getBonusAttributes()
    if bonuses then
      local last = target:getLastSlot()
      local values = target:getBonusAttribute(last)
      local attr = US_ENCHANTMENTS[values[1]]
      local item_level = target:getItemLevel()
      values[2] = attr.VALUES_PER_LEVEL and math.random(1, math.ceil(item_level * attr.VALUES_PER_LEVEL)) or 1
      target:setAttributeValue(last, values[1] .. "|" .. values[2])
	  player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly changed last attribute value.")
	  player:getPosition():sendMagicEffect(520)
      item:remove(1)
    else
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item has no attributes!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    end
  elseif item.itemid == US_CONFIG[1][ITEM_FAITH_CRYSTAL] then
    local bonuses = target:getBonusAttributes()
    if bonuses then
      for i = 1, #bonuses do
        local values = bonuses[i]
        local attr = US_ENCHANTMENTS[values[1]]
        local item_level = target:getItemLevel()
        values[2] = attr.VALUES_PER_LEVEL and math.random(1, math.ceil(item_level * attr.VALUES_PER_LEVEL)) or 1
        target:setAttributeValue(i, values[1] .. "|" .. values[2])
      end
	  player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfuly changed all attribute values.")
	  player:getPosition():sendMagicEffect(520)
      item:remove(1)
    else
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item has no attributes!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    end
  elseif item.itemid == US_CONFIG.ITEM_SCROLL_IDENTIFY then
    if target:isUnidentified() then
      if itemType then
        local weaponType = itemType:getWeaponType()
        if target:identify(player, itemType, weaponType) then
          item:remove(1)
        else
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        end
      end
    end
	  elseif item.itemid == US_CONFIG.ITEM_BOOK_IDENTIFY then
    if target:isUnidentified() then
      if itemType then
        local weaponType = itemType:getWeaponType()
        if target:identify(player, itemType, weaponType) then
         -- item:remove(1)
        else
          player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        end
      end
    end
  elseif item.itemid == US_CONFIG.ITEM_MIND_CRYSTAL then
    if not item:hasMemory() then
      if target:isUnidentified() then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Sorry, this item is unidentified and can't be copied!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
      elseif not target:getBonusAttributes() then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Sorry, this item doesn't have any attributes!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
      elseif target:isUnique() then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Sorry, this item is Corrupted or Trinket and can't be copied!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
	 elseif target:isEnchanted() then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Sorry, this item has a power rune and can't be copied!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
      else
        local crystal = Game.createItem(item.itemid, 1)
        local maxAttr = target:getMaxAttributes()
        for i = 1, maxAttr do
          local attr = target:getBonusAttribute(i)
          if attr then
            crystal:addAttribute(i, attr[1], attr[2])
            target:removeCustomAttribute("Slot" .. i)
          end
        end
        crystal:setMemory(true)
        if player:addItemEx(crystal) then
          player:sendTextMessage(MESSAGE_INFO_DESCR, "Item attributes saved into orb's memory!")
          player:getPosition():sendMagicEffect(520)
          item:remove(1)
        end
      end
    else
      if target:getBonusAttributes() then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Sorry, this item already have attributes!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
      else
        local maxAttr = target:getMaxAttributes()
        for i = 1, maxAttr do
          local attr = item:getBonusAttribute(i)
          if attr then
            target:addAttribute(i, attr[1], attr[2])
          end
        end
        item:remove(1)
      end
    end
  elseif item.itemid == US_CONFIG.ITEM_LIMITLESS_CRYSTAL then
    if not target:isLimitless() then
      player:sendTextMessage(MESSAGE_INFO_DESCR, "Required Item Level removed from the item!")
      target:setLimitless(true)
      item:remove(1)
    else
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "Sorry, there are no Corrupted available for this item!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    end
  elseif item.itemid == US_CONFIG.ITEM_MIRRORED_CRYSTAL then
    local copy = Game.createItem(target.itemid, 1)
    copy:setRarity(target:getRarityId())
    copy:setCustomAttribute("upgrade", target:getUpgradeLevel())
    copy:setCustomAttribute("item_level", target:getItemLevel())
    if target:getBonusAttributes() then
      for i = 1, target:getMaxAttributes() do
        local attr = target:getBonusAttribute(i)
        if attr then
          copy:addAttribute(i, attr[1], attr[2])
        end
      end
    end
    if target:isUnique() then
      copy:setCustomAttribute("unique", target:getUnique())
    end
    if target:isLimitless() then
      copy:setLimitless(true)
    end

    if target:getAttribute(ITEM_ATTRIBUTE_ATTACK) > 0 then
      copy:setAttribute(ITEM_ATTRIBUTE_ATTACK, target:getAttribute(ITEM_ATTRIBUTE_ATTACK))
    end
    if target:getAttribute(ITEM_ATTRIBUTE_DEFENSE) > 0 then
      copy:setAttribute(ITEM_ATTRIBUTE_DEFENSE, target:getAttribute(ITEM_ATTRIBUTE_DEFENSE))
    end
    if target:getAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE) > 0 then
      copy:setAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE, target:getAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE))
    end
    if target:getAttribute(ITEM_ATTRIBUTE_ARMOR) > 0 then
      copy:setAttribute(ITEM_ATTRIBUTE_ARMOR, target:getAttribute(ITEM_ATTRIBUTE_ARMOR))
    end
    if target:getAttribute(ITEM_ATTRIBUTE_HITCHANCE) > 0 then
      copy:setAttribute(ITEM_ATTRIBUTE_HITCHANCE, target:getAttribute(ITEM_ATTRIBUTE_HITCHANCE))
    end

    copy:setMirrored(true)
    if player:addItemEx(copy) then
      player:sendTextMessage(MESSAGE_INFO_DESCR, "Item mirrored and placed in your backpack!")
      item:remove(1)
    end
  elseif item.itemid == US_CONFIG.ITEM_VOID_CRYSTAL then
    local usItemType = target:getItemType()
    local canUnique = false
    for i = 1, #US_UNIQUES do
      if US_UNIQUES[i].minLevel <= target:getItemLevel() and bit.band(usItemType, US_UNIQUES[i].itemType) ~= 0 then
        canUnique = true
        break
      end
    end
    if not canUnique then
      player:sendTextMessage(MESSAGE_STATUS_WARNING, "Sorry, there are no Corrupted available for this item!")
      player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
      return true
    end
    if canUnique then
      local unique = math.random(#US_UNIQUES)
      while US_UNIQUES[unique].minLevel > target:getItemLevel() or bit.band(usItemType, US_UNIQUES[unique].itemType) == 0 do
        unique = math.random(#US_UNIQUES)
      end
      local slots = target:getMaxAttributes()
      for i = 1, slots do
        target:removeCustomAttribute("Slot" .. i)
		target:removeCustomAttribute("Enchanted")
      end
      target:setUnique(unique)
      player:sendTextMessage(MESSAGE_INFO_DESCR, "Corrupted item " .. target:getUniqueName() .. " discovered!")
      item:remove(1)
    end
  end

  return true
end

-- can't use table as parameter, so...
CrystalsAction:id(
    US_CONFIG[1][ITEM_UPGRADE_CRYSTAL],
    US_CONFIG[1][ITEM_ENCHANT_CRYSTAL],
    US_CONFIG[1][ITEM_ALTER_CRYSTAL],
    US_CONFIG[1][ITEM_CLEAN_CRYSTAL],
    US_CONFIG[1][ITEM_FORTUNE_CRYSTAL],
    US_CONFIG[1][ITEM_FAITH_CRYSTAL],
    US_CONFIG.ITEM_MIND_CRYSTAL,
    US_CONFIG.ITEM_LIMITLESS_CRYSTAL,
    US_CONFIG.ITEM_MIRRORED_CRYSTAL,
    US_CONFIG.ITEM_VOID_CRYSTAL,
    US_CONFIG.ITEM_SCROLL_IDENTIFY
)
CrystalsAction:register()
