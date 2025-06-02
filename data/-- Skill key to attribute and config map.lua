-- Skill key to attribute and config map (extend as needed)
SKILL_ATTRIBUTE_MAP = {
    [SKILL_CLUB] = {attr = ITEM_ATTRIBUTE_SKILL_CLUB, per_upgrade = 'SKILL_CLUB_PER_UPGRADE'},
    [SKILL_SWORD] = {attr = ITEM_ATTRIBUTE_SKILL_SWORD, per_upgrade = 'SKILL_SWORD_PER_UPGRADE'},
    [SKILL_AXE] = {attr = ITEM_ATTRIBUTE_SKILL_AXE, per_upgrade = 'SKILL_AXE_PER_UPGRADE'},
    [SKILL_DISTANCE] = {attr = ITEM_ATTRIBUTE_SKILL_DISTANCE, per_upgrade = 'SKILL_DISTANCE_PER_UPGRADE'},
    [SKILL_SHIELD] = {attr = ITEM_ATTRIBUTE_SKILL_SHIELD, per_upgrade = 'SKILL_SHIELD_PER_UPGRADE'},
    [SKILL_FISHING] = {attr = ITEM_ATTRIBUTE_SKILL_FISHING, per_upgrade = 'SKILL_FISHING_PER_UPGRADE'},
}


--setupgradelevel

-- Additional stat and special skill logic (do NOT remove old logic, only add below)

  -- Magic Level
  local magicLevel = itemType.getStat and itemType:getStat(STAT_MAGICPOINTS)
  if magicLevel and magicLevel > 0 then
    if oldLevel < level then
      self:setAttribute(ITEM_ATTRIBUTE_MAGICPOINTS, self:getAttribute(ITEM_ATTRIBUTE_MAGICPOINTS) + (level - oldLevel) * US_CONFIG.MAGIC_PER_UPGRADE)
    else
      self:setAttribute(ITEM_ATTRIBUTE_MAGICPOINTS, self:getAttribute(ITEM_ATTRIBUTE_MAGICPOINTS) - (oldLevel - level) * US_CONFIG.MAGIC_PER_UPGRADE)
    end
  end

  -- Max HP (scaling)
  local maxHP = itemType.getStat and itemType:getStat(STAT_MAXHITPOINTS)
  if maxHP and maxHP > 0 then
    if oldLevel < level then
      self:setAttribute(ITEM_ATTRIBUTE_MAXHITPOINTS, self:getAttribute(ITEM_ATTRIBUTE_MAXHITPOINTS) + (level - oldLevel) * US_CONFIG.MAXHP_PER_UPGRADE)
    else
      self:setAttribute(ITEM_ATTRIBUTE_MAXHITPOINTS, self:getAttribute(ITEM_ATTRIBUTE_MAXHITPOINTS) - (oldLevel - level) * US_CONFIG.MAXHP_PER_UPGRADE)
    end
  end

  -- Max MP (scaling)
  local maxMP = itemType.getStat and itemType:getStat(STAT_MAXMANAPOINTS)
  if maxMP and maxMP > 0 then
    if oldLevel < level then
      self:setAttribute(ITEM_ATTRIBUTE_MAXMANAPOINTS, self:getAttribute(ITEM_ATTRIBUTE_MAXMANAPOINTS) + (level - oldLevel) * US_CONFIG.MAXMP_PER_UPGRADE)
    else
      self:setAttribute(ITEM_ATTRIBUTE_MAXMANAPOINTS, self:getAttribute(ITEM_ATTRIBUTE_MAXMANAPOINTS) - (oldLevel - level) * US_CONFIG.MAXMP_PER_UPGRADE)
    end
  end

  -- Special Skills (all scaling)
  local critChance = itemType.getSpecialSkill and itemType:getSpecialSkill(SPECIALSKILL_CRITICALHITCHANCE)
  if critChance and critChance > 0 then
    if oldLevel < level then
      self:setAttribute(ITEM_ATTRIBUTE_CRITICALHITCHANCE, self:getAttribute(ITEM_ATTRIBUTE_CRITICALHITCHANCE) + (level - oldLevel) * US_CONFIG.CRITCHANCE_PER_UPGRADE)
    else
      self:setAttribute(ITEM_ATTRIBUTE_CRITICALHITCHANCE, self:getAttribute(ITEM_ATTRIBUTE_CRITICALHITCHANCE) - (oldLevel - level) * US_CONFIG.CRITCHANCE_PER_UPGRADE)
    end
  end

  local critAmount = itemType.getSpecialSkill and itemType:getSpecialSkill(SPECIALSKILL_CRITICALHITAMOUNT)
  if critAmount and critAmount > 0 then
    if oldLevel < level then
      self:setAttribute(ITEM_ATTRIBUTE_CRITICALHITAMOUNT, self:getAttribute(ITEM_ATTRIBUTE_CRITICALHITAMOUNT) + (level - oldLevel) * US_CONFIG.CRITAMOUNT_PER_UPGRADE)
    else
      self:setAttribute(ITEM_ATTRIBUTE_CRITICALHITAMOUNT, self:getAttribute(ITEM_ATTRIBUTE_CRITICALHITAMOUNT) - (oldLevel - level) * US_CONFIG.CRITAMOUNT_PER_UPGRADE)
    end
  end

  local lifeLeechChance = itemType.getSpecialSkill and itemType:getSpecialSkill(SPECIALSKILL_LIFELEECHCHANCE)
  if lifeLeechChance and lifeLeechChance > 0 then
    if oldLevel < level then
      self:setAttribute(ITEM_ATTRIBUTE_LIFELEECHCHANCE, self:getAttribute(ITEM_ATTRIBUTE_LIFELEECHCHANCE) + (level - oldLevel) * US_CONFIG.LIFELEECHCHANCE_PER_UPGRADE)
    else
      self:setAttribute(ITEM_ATTRIBUTE_LIFELEECHCHANCE, self:getAttribute(ITEM_ATTRIBUTE_LIFELEECHCHANCE) - (oldLevel - level) * US_CONFIG.LIFELEECHCHANCE_PER_UPGRADE)
    end
  end

  local lifeLeechAmount = itemType.getSpecialSkill and itemType:getSpecialSkill(SPECIALSKILL_LIFELEECHAMOUNT)
  if lifeLeechAmount and lifeLeechAmount > 0 then
    if oldLevel < level then
      self:setAttribute(ITEM_ATTRIBUTE_LIFELEECHAMOUNT, self:getAttribute(ITEM_ATTRIBUTE_LIFELEECHAMOUNT) + (level - oldLevel) * US_CONFIG.LIFELEECHAMOUNT_PER_UPGRADE)
    else
      self:setAttribute(ITEM_ATTRIBUTE_LIFELEECHAMOUNT, self:getAttribute(ITEM_ATTRIBUTE_LIFELEECHAMOUNT) - (oldLevel - level) * US_CONFIG.LIFELEECHAMOUNT_PER_UPGRADE)
    end
  end

  local manaLeechChance = itemType.getSpecialSkill and itemType:getSpecialSkill(SPECIALSKILL_MANALEECHCHANCE)
  if manaLeechChance and manaLeechChance > 0 then
    if oldLevel < level then
      self:setAttribute(ITEM_ATTRIBUTE_MANALEECHCHANCE, self:getAttribute(ITEM_ATTRIBUTE_MANALEECHCHANCE) + (level - oldLevel) * US_CONFIG.MANALEECHCHANCE_PER_UPGRADE)
    else
      self:setAttribute(ITEM_ATTRIBUTE_MANALEECHCHANCE, self:getAttribute(ITEM_ATTRIBUTE_MANALEECHCHANCE) - (oldLevel - level) * US_CONFIG.MANALEECHCHANCE_PER_UPGRADE)
    end
  end

  local manaLeechAmount = itemType.getSpecialSkill and itemType:getSpecialSkill(SPECIALSKILL_MANALEECHAMOUNT)
  if manaLeechAmount and manaLeechAmount > 0 then
    if oldLevel < level then
      self:setAttribute(ITEM_ATTRIBUTE_MANALEECHAMOUNT, self:getAttribute(ITEM_ATTRIBUTE_MANALEECHAMOUNT) + (level - oldLevel) * US_CONFIG.MANALEECHAMOUNT_PER_UPGRADE)
    else
      self:setAttribute(ITEM_ATTRIBUTE_MANALEECHAMOUNT, self:getAttribute(ITEM_ATTRIBUTE_MANALEECHAMOUNT) - (oldLevel - level) * US_CONFIG.MANALEECHAMOUNT_PER_UPGRADE)
    end
  end

  local attackSpeed = itemType.getSpecialSkill and itemType:getSpecialSkill(SPECIALSKILL_ATTACKSPEED)
  if attackSpeed and attackSpeed > 0 then
    if oldLevel < level then
      self:setAttribute(ITEM_ATTRIBUTE_ATTACKSPEED, self:getAttribute(ITEM_ATTRIBUTE_ATTACKSPEED) + (level - oldLevel) * US_CONFIG.ATTACKSPEED_PER_UPGRADE)
    else
      self:setAttribute(ITEM_ATTRIBUTE_ATTACKSPEED, self:getAttribute(ITEM_ATTRIBUTE_ATTACKSPEED) - (oldLevel - level) * US_CONFIG.ATTACKSPEED_PER_UPGRADE)
    end
  end

    -- SKILLS
    if itemType.getSkill then
        for skillKey, v in pairs(SKILL_ATTRIBUTE_MAP) do
            local skillValue = itemType:getSkill(skillKey)
            if skillValue and skillValue > 0 then
                local per_upgrade = US_CONFIG[v.per_upgrade] or 1
                if oldLevel < level then
                    self:setAttribute(v.attr, self:getAttribute(v.attr) + (level - oldLevel) * per_upgrade)
                else
                    self:setAttribute(v.attr, self:getAttribute(v.attr) - (oldLevel - level) * per_upgrade)
                end
            end
        end
    end
    -- Health/Mana Regen
    local healthGain = itemType.getHealthGain and itemType:getHealthGain()
    if healthGain and healthGain > 0 then
        local per_upgrade = US_CONFIG.HEALTHGAIN_PER_UPGRADE or 1
        if oldLevel < level then
            self:setAttribute(ITEM_ATTRIBUTE_HEALTHGAIN, self:getAttribute(ITEM_ATTRIBUTE_HEALTHGAIN) + (level - oldLevel) * per_upgrade)
        else
            self:setAttribute(ITEM_ATTRIBUTE_HEALTHGAIN, self:getAttribute(ITEM_ATTRIBUTE_HEALTHGAIN) - (oldLevel - level) * per_upgrade)
        end
    end
    local healthTicks = itemType.getHealthTicks and itemType:getHealthTicks()
    if healthTicks and healthTicks > 0 then
        local per_upgrade = US_CONFIG.HEALTHTICKS_PER_UPGRADE or 1
        if oldLevel < level then
            -- Upgrades LOWER the tick interval (faster regen)
            self:setAttribute(ITEM_ATTRIBUTE_HEALTHTICKS, math.max(1, self:getAttribute(ITEM_ATTRIBUTE_HEALTHTICKS) - (level - oldLevel) * per_upgrade))
        else
            self:setAttribute(ITEM_ATTRIBUTE_HEALTHTICKS, self:getAttribute(ITEM_ATTRIBUTE_HEALTHTICKS) + (oldLevel - level) * per_upgrade)
        end
    end
    local manaGain = itemType.getManaGain and itemType:getManaGain()
    if manaGain and manaGain > 0 then
        local per_upgrade = US_CONFIG.MANAGAIN_PER_UPGRADE or 1
        if oldLevel < level then
            self:setAttribute(ITEM_ATTRIBUTE_MANAGAIN, self:getAttribute(ITEM_ATTRIBUTE_MANAGAIN) + (level - oldLevel) * per_upgrade)
        else
            self:setAttribute(ITEM_ATTRIBUTE_MANAGAIN, self:getAttribute(ITEM_ATTRIBUTE_MANAGAIN) - (oldLevel - level) * per_upgrade)
        end
    end
    local manaTicks = itemType.getManaTicks and itemType:getManaTicks()
    if manaTicks and manaTicks > 0 then
        local per_upgrade = US_CONFIG.MANATICKS_PER_UPGRADE or 1
        if oldLevel < level then
            -- Upgrades LOWER the tick interval (faster regen)
            self:setAttribute(ITEM_ATTRIBUTE_MANATICKS, math.max(1, self:getAttribute(ITEM_ATTRIBUTE_MANATICKS) - (level - oldLevel) * per_upgrade))
        else
            self:setAttribute(ITEM_ATTRIBUTE_MANATICKS, self:getAttribute(ITEM_ATTRIBUTE_MANATICKS) + (oldLevel - level) * per_upgrade)
        end
    end

    -------------------------------------



    --set itemlevel
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
   
   
         -- Magic Level
       if itemType:getStat(STAT_MAGICPOINTS) > 0 then
         if value >= US_CONFIG.MAGIC_PER_ITEM_LEVEL then
           finalValue = math.floor((value / US_CONFIG.MAGIC_PER_ITEM_LEVEL) * US_CONFIG.MAGIC_FROM_ITEM_LEVEL)
         else
           finalValue = 0
         end
         if oldLevel < level then
           self:setAttribute(ITEM_ATTRIBUTE_MAGICPOINTS, (self:getAttribute(ITEM_ATTRIBUTE_MAGICPOINTS) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_MAGICPOINTS) + finalValue) or (itemType:getStat(STAT_MAGICPOINTS) + finalValue))
         else
           self:setAttribute(ITEM_ATTRIBUTE_MAGICPOINTS, (self:getAttribute(ITEM_ATTRIBUTE_MAGICPOINTS) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_MAGICPOINTS) - finalValue) or (itemType:getStat(STAT_MAGICPOINTS) - finalValue))
         end
       end
     
       -- Max HP (scaling)
       if itemType:getStat(STAT_MAXHITPOINTS) > 0 then
         if value >= US_CONFIG.MAXHP_PER_ITEM_LEVEL then
           finalValue = math.floor((value / US_CONFIG.MAXHP_PER_ITEM_LEVEL) * US_CONFIG.MAXHP_FROM_ITEM_LEVEL)
         else
           finalValue = 0
         end
         if oldLevel < level then
           self:setAttribute(ITEM_ATTRIBUTE_MAXHITPOINTS, (self:getAttribute(ITEM_ATTRIBUTE_MAXHITPOINTS) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_MAXHITPOINTS) + finalValue) or (itemType:getStat(STAT_MAXHITPOINTS) + finalValue))
         else
           self:setAttribute(ITEM_ATTRIBUTE_MAXHITPOINTS, (self:getAttribute(ITEM_ATTRIBUTE_MAXHITPOINTS) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_MAXHITPOINTS) - finalValue) or (itemType:getStat(STAT_MAXHITPOINTS) - finalValue))
         end
       end
     
       -- Max MP (scaling)
       if itemType:getStat(STAT_MAXMANAPOINTS) > 0 then
         if value >= US_CONFIG.MAXMP_PER_ITEM_LEVEL then
           finalValue = math.floor((value / US_CONFIG.MAXMP_PER_ITEM_LEVEL) * US_CONFIG.MAXMP_FROM_ITEM_LEVEL)
         else
           finalValue = 0
         end
         if oldLevel < level then
           self:setAttribute(ITEM_ATTRIBUTE_MAXMANAPOINTS, (self:getAttribute(ITEM_ATTRIBUTE_MAXMANAPOINTS) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_MAXMANAPOINTS) + finalValue) or (itemType:getStat(STAT_MAXMANAPOINTS) + finalValue))
         else
           self:setAttribute(ITEM_ATTRIBUTE_MAXMANAPOINTS, (self:getAttribute(ITEM_ATTRIBUTE_MAXMANAPOINTS) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_MAXMANAPOINTS) - finalValue) or (itemType:getStat(STAT_MAXMANAPOINTS) - finalValue))
         end
       end
     
       -- Special Skills (all scaling)
       if itemType:getSpecialSkill(SPECIALSKILL_CRITICALHITCHANCE) > 0 then
         if value >= US_CONFIG.CRITCHANCE_PER_ITEM_LEVEL then
           finalValue = math.floor((value / US_CONFIG.CRITCHANCE_PER_ITEM_LEVEL) * US_CONFIG.CRITCHANCE_FROM_ITEM_LEVEL)
         else
           finalValue = 0
         end
         if oldLevel < level then
           self:setAttribute(ITEM_ATTRIBUTE_CRITICALHITCHANCE, (self:getAttribute(ITEM_ATTRIBUTE_CRITICALHITCHANCE) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_CRITICALHITCHANCE) + finalValue) or (itemType:getSpecialSkill(SPECIALSKILL_CRITICALHITCHANCE) + finalValue))
         else
           self:setAttribute(ITEM_ATTRIBUTE_CRITICALHITCHANCE, (self:getAttribute(ITEM_ATTRIBUTE_CRITICALHITCHANCE) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_CRITICALHITCHANCE) - finalValue) or (itemType:getSpecialSkill(SPECIALSKILL_CRITICALHITCHANCE) - finalValue))
         end
       end
     
       if itemType:getSpecialSkill(SPECIALSKILL_CRITICALHITAMOUNT) > 0 then
         if value >= US_CONFIG.CRITAMOUNT_PER_ITEM_LEVEL then
           finalValue = math.floor((value / US_CONFIG.CRITAMOUNT_PER_ITEM_LEVEL) * US_CONFIG.CRITAMOUNT_FROM_ITEM_LEVEL)
         else
           finalValue = 0
         end
         if oldLevel < level then
           self:setAttribute(ITEM_ATTRIBUTE_CRITICALHITAMOUNT, (self:getAttribute(ITEM_ATTRIBUTE_CRITICALHITAMOUNT) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_CRITICALHITAMOUNT) + finalValue) or (itemType:getSpecialSkill(SPECIALSKILL_CRITICALHITAMOUNT) + finalValue))
         else
           self:setAttribute(ITEM_ATTRIBUTE_CRITICALHITAMOUNT, (self:getAttribute(ITEM_ATTRIBUTE_CRITICALHITAMOUNT) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_CRITICALHITAMOUNT) - finalValue) or (itemType:getSpecialSkill(SPECIALSKILL_CRITICALHITAMOUNT) - finalValue))
         end
       end
     
       if itemType:getSpecialSkill(SPECIALSKILL_LIFELEECHCHANCE) > 0 then
         if value >= US_CONFIG.LIFELEECHCHANCE_PER_ITEM_LEVEL then
           finalValue = math.floor((value / US_CONFIG.LIFELEECHCHANCE_PER_ITEM_LEVEL) * US_CONFIG.LIFELEECHCHANCE_FROM_ITEM_LEVEL)
         else
           finalValue = 0
         end
         if oldLevel < level then
           self:setAttribute(ITEM_ATTRIBUTE_LIFELEECHCHANCE, (self:getAttribute(ITEM_ATTRIBUTE_LIFELEECHCHANCE) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_LIFELEECHCHANCE) + finalValue) or (itemType:getSpecialSkill(SPECIALSKILL_LIFELEECHCHANCE) + finalValue))
         else
           self:setAttribute(ITEM_ATTRIBUTE_LIFELEECHCHANCE, (self:getAttribute(ITEM_ATTRIBUTE_LIFELEECHCHANCE) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_LIFELEECHCHANCE) - finalValue) or (itemType:getSpecialSkill(SPECIALSKILL_LIFELEECHCHANCE) - finalValue))
         end
       end
     
       if itemType:getSpecialSkill(SPECIALSKILL_LIFELEECHAMOUNT) > 0 then
         if value >= US_CONFIG.LIFELEECHAMOUNT_PER_ITEM_LEVEL then
           finalValue = math.floor((value / US_CONFIG.LIFELEECHAMOUNT_PER_ITEM_LEVEL) * US_CONFIG.LIFELEECHAMOUNT_FROM_ITEM_LEVEL)
         else
           finalValue = 0
         end
         if oldLevel < level then
           self:setAttribute(ITEM_ATTRIBUTE_LIFELEECHAMOUNT, (self:getAttribute(ITEM_ATTRIBUTE_LIFELEECHAMOUNT) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_LIFELEECHAMOUNT) + finalValue) or (itemType:getSpecialSkill(SPECIALSKILL_LIFELEECHAMOUNT) + finalValue))
         else
           self:setAttribute(ITEM_ATTRIBUTE_LIFELEECHAMOUNT, (self:getAttribute(ITEM_ATTRIBUTE_LIFELEECHAMOUNT) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_LIFELEECHAMOUNT) - finalValue) or (itemType:getSpecialSkill(SPECIALSKILL_LIFELEECHAMOUNT) - finalValue))
         end
       end
     
       if itemType:getSpecialSkill(SPECIALSKILL_MANALEECHCHANCE) > 0 then
         if value >= US_CONFIG.MANALEECHCHANCE_PER_ITEM_LEVEL then
           finalValue = math.floor((value / US_CONFIG.MANALEECHCHANCE_PER_ITEM_LEVEL) * US_CONFIG.MANALEECHCHANCE_FROM_ITEM_LEVEL)
         else
           finalValue = 0
         end
         if oldLevel < level then
           self:setAttribute(ITEM_ATTRIBUTE_MANALEECHCHANCE, (self:getAttribute(ITEM_ATTRIBUTE_MANALEECHCHANCE) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_MANALEECHCHANCE) + finalValue) or (itemType:getSpecialSkill(SPECIALSKILL_MANALEECHCHANCE) + finalValue))
         else
           self:setAttribute(ITEM_ATTRIBUTE_MANALEECHCHANCE, (self:getAttribute(ITEM_ATTRIBUTE_MANALEECHCHANCE) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_MANALEECHCHANCE) - finalValue) or (itemType:getSpecialSkill(SPECIALSKILL_MANALEECHCHANCE) - finalValue))
         end
       end
     
       if itemType:getSpecialSkill(SPECIALSKILL_MANALEECHAMOUNT) > 0 then
         if value >= US_CONFIG.MANALEECHAMOUNT_PER_ITEM_LEVEL then
           finalValue = math.floor((value / US_CONFIG.MANALEECHAMOUNT_PER_ITEM_LEVEL) * US_CONFIG.MANALEECHAMOUNT_FROM_ITEM_LEVEL)
         else
           finalValue = 0
         end
         if oldLevel < level then
           self:setAttribute(ITEM_ATTRIBUTE_MANALEECHAMOUNT, (self:getAttribute(ITEM_ATTRIBUTE_MANALEECHAMOUNT) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_MANALEECHAMOUNT) + finalValue) or (itemType:getSpecialSkill(SPECIALSKILL_MANALEECHAMOUNT) + finalValue))
         else
           self:setAttribute(ITEM_ATTRIBUTE_MANALEECHAMOUNT, (self:getAttribute(ITEM_ATTRIBUTE_MANALEECHAMOUNT) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_MANALEECHAMOUNT) - finalValue) or (itemType:getSpecialSkill(SPECIALSKILL_MANALEECHAMOUNT) - finalValue))
         end
       end
     
       if itemType:getSpecialSkill(SPECIALSKILL_ATTACKSPEED) > 0 then
         if value >= US_CONFIG.ATTACKSPEED_PER_ITEM_LEVEL then
           finalValue = math.floor((value / US_CONFIG.ATTACKSPEED_PER_ITEM_LEVEL) * US_CONFIG.ATTACKSPEED_FROM_ITEM_LEVEL)
         else
           finalValue = 0
         end
         if oldLevel < level then
           self:setAttribute(ITEM_ATTRIBUTE_ATTACKSPEED, (self:getAttribute(ITEM_ATTRIBUTE_ATTACKSPEED) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_ATTACKSPEED) + finalValue) or (itemType:getSpecialSkill(SPECIALSKILL_ATTACKSPEED) + finalValue))
         else
           self:setAttribute(ITEM_ATTRIBUTE_ATTACKSPEED, (self:getAttribute(ITEM_ATTRIBUTE_ATTACKSPEED) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_ATTACKSPEED) - finalValue) or (itemType:getSpecialSkill(SPECIALSKILL_ATTACKSPEED) - finalValue))
         end
       end
   
   -- Club
       if itemType:getSkill(SKILL_CLUB) > 0 then
         if value >= US_CONFIG.SKILLS_PER_ITEM_LEVEL then
           finalValue = math.floor((value / US_CONFIG.SKILLS_PER_ITEM_LEVEL) * US_CONFIG.SKILLS_FROM_ITEM_LEVEL)
         else
           finalValue = 0
         end
         if oldLevel < level then
             self:setAttribute(ITEM_ATTRIBUTE_SKILL_CLUB, (self:getAttribute(ITEM_ATTRIBUTE_SKILL_CLUB) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_SKILL_CLUB) + finalValue) or (itemType:getSkill(SKILL_CLUB) + finalValue))
         else
             self:setAttribute(ITEM_ATTRIBUTE_SKILL_CLUB, (self:getAttribute(ITEM_ATTRIBUTE_SKILL_CLUB) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_SKILL_CLUB) - finalValue) or (itemType:getSkill(SKILL_CLUB) - finalValue))
         end
       end
   
   -- Sword
       if itemType:getSkill(SKILL_SWORD) > 0 then
         if value >= US_CONFIG.SKILLS_PER_ITEM_LEVEL then
           finalValue = math.floor((value / US_CONFIG.SKILLS_PER_ITEM_LEVEL) * US_CONFIG.SKILLS_FROM_ITEM_LEVEL)
         else
           finalValue = 0
         end
         if oldLevel < level then
             self:setAttribute(ITEM_ATTRIBUTE_SKILL_SWORD, (self:getAttribute(ITEM_ATTRIBUTE_SKILL_SWORD) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_SKILL_SWORD) + finalValue) or (itemType:getSkill(SKILL_SWORD) + finalValue))
         else
             self:setAttribute(ITEM_ATTRIBUTE_SKILL_SWORD, (self:getAttribute(ITEM_ATTRIBUTE_SKILL_SWORD) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_SKILL_SWORD) - finalValue) or (itemType:getSkill(SKILL_SWORD) - finalValue))
         end
       end
   
   -- Axe
       if itemType:getSkill(SKILL_AXE) > 0 then
         if value >= US_CONFIG.SKILLS_PER_ITEM_LEVEL then
           finalValue = math.floor((value / US_CONFIG.SKILLS_PER_ITEM_LEVEL) * US_CONFIG.SKILLS_FROM_ITEM_LEVEL)
         else
           finalValue = 0
         end
         if oldLevel < level then
             self:setAttribute(ITEM_ATTRIBUTE_SKILL_AXE, (self:getAttribute(ITEM_ATTRIBUTE_SKILL_AXE) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_SKILL_AXE) + finalValue) or (itemType:getSkill(SKILL_AXE) + finalValue))
         else
             self:setAttribute(ITEM_ATTRIBUTE_SKILL_AXE, (self:getAttribute(ITEM_ATTRIBUTE_SKILL_AXE) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_SKILL_AXE) - finalValue) or (itemType:getSkill(SKILL_AXE) - finalValue))
         end
       end
   
   -- Distance
       if itemType:getSkill(SKILL_DISTANCE) > 0 then
         if value >= US_CONFIG.SKILLS_PER_ITEM_LEVEL then
           finalValue = math.floor((value / US_CONFIG.SKILLS_PER_ITEM_LEVEL) * US_CONFIG.SKILLS_FROM_ITEM_LEVEL)
         else
           finalValue = 0
         end
         if oldLevel < level then
             self:setAttribute(ITEM_ATTRIBUTE_SKILL_DISTANCE, (self:getAttribute(ITEM_ATTRIBUTE_SKILL_DISTANCE) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_SKILL_DISTANCE) + finalValue) or (itemType:getSkill(SKILL_DISTANCE) + finalValue))
         else
             self:setAttribute(ITEM_ATTRIBUTE_SKILL_DISTANCE, (self:getAttribute(ITEM_ATTRIBUTE_SKILL_DISTANCE) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_SKILL_DISTANCE) - finalValue) or (itemType:getSkill(SKILL_DISTANCE) - finalValue))
         end
       end
   
   -- Shield
       if itemType:getSkill(SKILL_SHIELD) > 0 then
         if value >= US_CONFIG.SKILLS_PER_ITEM_LEVEL then
           finalValue = math.floor((value / US_CONFIG.SKILLS_PER_ITEM_LEVEL) * US_CONFIG.SKILLS_FROM_ITEM_LEVEL)
         else
           finalValue = 0
         end
         if oldLevel < level then
             self:setAttribute(ITEM_ATTRIBUTE_SKILL_SHIELD, (self:getAttribute(ITEM_ATTRIBUTE_SKILL_SHIELD) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_SKILL_SHIELD) + finalValue) or (itemType:getSkill(SKILL_SHIELD) + finalValue))
         else
             self:setAttribute(ITEM_ATTRIBUTE_SKILL_SHIELD, (self:getAttribute(ITEM_ATTRIBUTE_SKILL_SHIELD) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_SKILL_SHIELD) - finalValue) or (itemType:getSkill(SKILL_SHIELD) - finalValue))
         end
       end
   
   
         -- Health/Mana Regen
         if itemType:getHealthGain() > 0 then
           if value >= US_CONFIG.HEALTHGAIN_PER_ITEM_LEVEL then
             finalValue = math.floor((value / US_CONFIG.HEALTHGAIN_PER_ITEM_LEVEL) * US_CONFIG.HEALTHGAIN_FROM_ITEM_LEVEL)
           else
             finalValue = 0
           end
             if oldLevel < level then
                 self:setAttribute(ITEM_ATTRIBUTE_HEALTHGAIN, (self:getAttribute(ITEM_ATTRIBUTE_HEALTHGAIN) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_HEALTHGAIN) + finalValue) or (itemType:getHealthGain() + finalValue))
             else
                 self:setAttribute(ITEM_ATTRIBUTE_HEALTHGAIN, (self:getAttribute(ITEM_ATTRIBUTE_HEALTHGAIN) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_HEALTHGAIN) - finalValue) or (itemType:getHealthGain() - finalValue))
             end
         end
   
         if itemType:getHealthTicks() > 0 then
           if value >= US_CONFIG.HEALTHTICKS_PER_ITEM_LEVEL then
             finalValue = math.floor((value / US_CONFIG.HEALTHTICKS_PER_ITEM_LEVEL) * US_CONFIG.HEALTHTICKS_FROM_ITEM_LEVEL)
           else
             finalValue = 0
           end
             if oldLevel < level then
                 -- Upgrades LOWER the tick interval (faster regen)
                 self:setAttribute(ITEM_ATTRIBUTE_HEALTHTICKS, (self:getAttribute(ITEM_ATTRIBUTE_HEALTHTICKS) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_HEALTHTICKS) - finalValue) or (itemType:getHealthTicks() - finalValue))
             else
                 self:setAttribute(ITEM_ATTRIBUTE_HEALTHTICKS, (self:getAttribute(ITEM_ATTRIBUTE_HEALTHTICKS) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_HEALTHTICKS) + finalValue) or (itemType:getHealthTicks() + finalValue))
             end
         end
         if itemType:getManaGain() > 0 then
           if value >= US_CONFIG.MANAGAIN_PER_ITEM_LEVEL then
             finalValue = math.floor((value / US_CONFIG.MANAGAIN_PER_ITEM_LEVEL) * US_CONFIG.MANAGAIN_FROM_ITEM_LEVEL)
           else
             finalValue = 0
           end
             if oldLevel < level then
                 self:setAttribute(ITEM_ATTRIBUTE_MANAGAIN, (self:getAttribute(ITEM_ATTRIBUTE_MANAGAIN) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_MANAGAIN) + finalValue) or (itemType:getManaGain() + finalValue))
             else
                 self:setAttribute(ITEM_ATTRIBUTE_MANAGAIN, (self:getAttribute(ITEM_ATTRIBUTE_MANAGAIN) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_MANAGAIN) - finalValue) or (itemType:getManaGain() - finalValue))
             end
         end
         if itemType:getManaTicks() > 0 then
           if value >= US_CONFIG.MANATICKS_PER_ITEM_LEVEL then
             finalValue = math.floor((value / US_CONFIG.MANATICKS_PER_ITEM_LEVEL) * US_CONFIG.MANATICKS_FROM_ITEM_LEVEL)
           else
             finalValue = 0
           end
             if oldLevel < level then
                 -- Upgrades LOWER the tick interval (faster regen)
                 self:setAttribute(ITEM_ATTRIBUTE_MANATICKS, (self:getAttribute(ITEM_ATTRIBUTE_MANATICKS) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_MANATICKS) - finalValue) or (itemType:getManaTicks() - finalValue))
             else
                 self:setAttribute(ITEM_ATTRIBUTE_MANATICKS, (self:getAttribute(ITEM_ATTRIBUTE_MANATICKS) > 0) and (self:getAttribute(ITEM_ATTRIBUTE_MANATICKS) + finalValue) or (itemType:getManaTicks() + finalValue))
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
               level = level + math.floor(itemType:getMagicLevel() / US_CONFIG.ITEM_LEVEL_PER_MAGICLEVEL)
           end
   
           if itemType:getStat(STAT_MAXHITPOINTS) > 0 then
               level = level + math.floor(itemType:getMaxHP() / US_CONFIG.ITEM_LEVEL_PER_MAXHP)
           end
   
           if itemType:getStat(STAT_MAXMANAPOINTS) > 0 then
               level = level + math.floor(itemType:getMaxMP() / US_CONFIG.ITEM_LEVEL_PER_MAXMP)
           end
   
           if itemType:getSpecialSkill(SPECIALSKILL_CRITICALHITCHANCE) > 0 then
               level = level + math.floor(itemType:getCritChance() / US_CONFIG.ITEM_LEVEL_PER_CRITCHANCE)
           end
   
           if itemType:getSpecialSkill(SPECIALSKILL_CRITICALHITCHANCE) > 0 then
               level = level + math.floor(itemType:getCritAmount() / US_CONFIG.ITEM_LEVEL_PER_CRITAMOUNT)
           end
   
           if itemType:getSpecialSkill(SPECIALSKILL_LIFLEECHCHANCE) > 0 then
               level = level + math.floor(itemType:getLifeLeechChance() / US_CONFIG.ITEM_LEVEL_PER_LIFELEECHCHANCE)
           end
   
           if itemType:getSpecialSkill(SPECIALSKILL_LIFLEECHAMOUNT) > 0 then
               level = level + math.floor(itemType:getLifeLeechAmount() / US_CONFIG.ITEM_LEVEL_PER_LIFELEECHAMOUNT)
           end
   
           if itemType:getSpecialSkill(SPECIALSKILL_MANALEECHCHANCE) > 0 then
               level = level + math.floor(itemType:getManaLeechChance() / US_CONFIG.ITEM_LEVEL_PER_MANALEECHCHANCE)
           end
   
           if itemType:getSpecialSkill(SPECIALSKILL_MANALEECHAMOUNT) > 0 then
               level = level + math.floor(itemType:getManaLeechAmount() / US_CONFIG.ITEM_LEVEL_PER_MANALEECHAMOUNT)
           end
   
           if itemType:getSpecialSkill(SPECIALSKILL_ATTACKSPEED) > 0 then
               level = level + math.floor(itemType:getAttackSpeed() / US_CONFIG.ITEM_LEVEL_PER_ATTACKSPEED)
           end
   
           if itemType:getSkill(SKILL_CLUB) > 0 then
             level = level + math.floor(itemType:getSkill(SKILL_CLUB) / US_CONFIG.ITEM_LEVEL_PER_SKILL)
           end
   
           if itemType:getSkill(SKILL_SWORD) > 0 then
             level = level + math.floor(itemType:getSkill(SKILL_SWORD) / US_CONFIG.ITEM_LEVEL_PER_SKILL)
           end
   
           if itemType:getSkill(SKILL_AXE) > 0 then
             level = level + math.floor(itemType:getSkill(SKILL_AXE) / US_CONFIG.ITEM_LEVEL_PER_SKILL)
           end
   
           if itemType:getSkill(SKILL_DISTANCE) > 0 then
             level = level + math.floor(itemType:getSkill(SKILL_DISTANCE) / US_CONFIG.ITEM_LEVEL_PER_SKILL)
           end
   
           if itemType:getSkill(SKILL_SHIELD) > 0 then
             level = level + math.floor(itemType:getSkill(SKILL_SHIELD) / US_CONFIG.ITEM_LEVEL_PER_SKILL)
           end
   
           if itemType:getHealthGain() > 0 then
             level = level + math.floor(itemType:getHealthGain() / US_CONFIG.ITEM_LEVEL_PER_HEALTHGAIN)
           end
           if itemType:getHealthTicks() > 0 then
             level = level + math.floor(itemType:getHealthTicks() / US_CONFIG.ITEM_LEVEL_PER_HEALTHTICKS)
           end
       
           if itemType:getManaGain() > 0 then
             level = level + math.floor(itemType:getManaGain() / US_CONFIG.ITEM_LEVEL_PER_MANAGAIN)
           end
           if itemType:getManaTicks() > 0 then
             level = level + math.floor(itemType:getManaTicks() / US_CONFIG.ITEM_LEVEL_PER_MANATICKS)
           end
   
       end
       return self:setCustomAttribute("item_level", level)
   end