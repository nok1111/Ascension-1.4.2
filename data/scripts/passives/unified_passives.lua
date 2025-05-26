local passiveEvent = CreatureEvent("UnifiedPassives")

if not PassiveSkills then
  dofile('data/scripts/PassiveTree/0_PassiveSkillsDataConfig.lua')
end
consacrated_counter = {}
local blazingdecree_area = createCombatArea({
  {1, 1, 1},
  {1, 3, 1},
  {1, 1, 1}
})

-- Standardized passive structure implementation
-- Spawns a fire distance effect and applies an area fire combat at the target's position
function doExtraFireball(playerid, targetid, baseDamage)
  print("doExtraFireball")
  if not playerid or not targetid then return end
  local player = Creature(playerid)
  local target = Creature(targetid)
  local fromPos = player:getPosition()
  local toPos = target:getPosition()
  -- Fire distance effect (e.g., 3 = fire, 36 = fireball, adjust as needed)
  doSendDistanceShoot(fromPos, toPos, 76)
  -- Calculate damage formula using player level and magic level
  local level = player:getLevel()
  local magic = player:getMagicLevel()
  local bonus = (level * 0.8) + (magic * 3.0)
  local totalDamage = baseDamage + bonus
  -- Apply fire damage to area
  
  doAreaCombatHealth(player, COMBAT_FIREDAMAGE, toPos, blazingdecree_area, -math.floor(totalDamage), -math.floor(totalDamage), 7)
end

local PASSIVES = {
  
  holy_damage = {
    config = {
      type = "OnAttack",
      storage = PassiveSkills.HolyDamage,
    },
    trigger = function(player, target, damage, primaryType)
      if primaryType ~= COMBAT_HOLYDAMAGE then
        return false
      end
      local level = math.max(player:getStorageValue(PassiveSkills.HolyDamage) or 0, 0)
      return level > 0
    end,
    effect = function(player, target, damage)
      local level = math.max(player:getStorageValue(PassiveSkills.HolyDamage) or 0, 0)
      local percent = 1 + (level / 100)
      return damage * percent
    end,
  },

  consecrated_protection = {
    config = {
      subid = 50,
      type = "OnDefend",
      storage = PassiveSkills.ConsecratedProtection,
    },
    trigger = function(player, target, damage, origin)
      return player:getCondition(CONDITION_ATTRIBUTES, 0, 50)
    end,
    effect = function(player, target, damage)
      local level = math.max(player:getStorageValue(PassiveSkills.ConsecratedProtection) or 0, 0)
      -- Glacial Empowerment effect
      local percent = level / 100
     -- player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
      return damage * percent
    end
  },

  unyielding_strength = {
    config = {
      type = "OnAttack",
      storage = PassiveSkills.UnyieldingStrength,
    },
    trigger = function(player, target, damage, primaryType)
      if primaryType ~= COMBAT_PHYSICALDAMAGE then
        return false
      end
      local level = math.max(player:getStorageValue(PassiveSkills.UnyieldingStrength) or 0, 0)
      return level > 0
    end,
    effect = function(player, target, damage)
      local level = math.max(player:getStorageValue(PassiveSkills.UnyieldingStrength) or 0, 0)
      local percent = 1 + (level / 100)
      return damage * percent
    end,
  },
  GlacialEmpowerment = {
    config = {
      type = "OnAttack",
      storage = PassiveSkills.FrostDamage,
    },
    trigger = function(player, target, damage, primaryType)
      if primaryType ~= COMBAT_ICEDAMAGE then
        return false
      end
      local level = math.max(player:getStorageValue(PassiveSkills.FrostDamage) or 0, 0)
      return level > 0
    end,
    effect = function(player, target, damage)
      local level = math.max(player:getStorageValue(PassiveSkills.FrostDamage) or 0, 0)
      -- Glacial Empowerment effect
      local percent = 1 + (level / 100)
      return damage * percent
    end,
  },

  Consecrated_Strikes = {
    config = {
      type = "OnAttack",
      storage = PassiveSkills.ConsecratedStrikes,
    },
    -- Track hit counts per player
    trigger = function(player, target, damage, primaryType)
      if primaryType ~= COMBAT_PHYSICALDAMAGE then return false end
      local level = math.max(player:getStorageValue(PassiveSkills.ConsecratedStrikes) or 0, 0)
      if level <= 0 then return false end
      local pid = player:getId()
      consacrated_counter[pid] = (consacrated_counter[pid] or 0) + 1
      if consacrated_counter[pid] < 4 then return false end
      consacrated_counter[pid] = 0
      return math.random(100) <= level
    end,
    effect = function(player, target, damage)
      -- Deal extra holy damage equal to double the original primary damage
      local holyDamage = damage * 2
      doTargetCombatHealth(player, target, COMBAT_HOLYDAMAGE, -holyDamage, -holyDamage, CONST_ME_HOLYAREA)
      target:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
      return damage
    end,
  },

  blazingdecree = {
    config = {
      type = "OnAttack",
      storage = PassiveSkills.BlazingDecree,
    },
    trigger = function(player, target, damage, primaryType)
      if primaryType ~= COMBAT_FIREDAMAGE then
        return false
      end
      local level = math.max(player:getStorageValue(PassiveSkills.BlazingDecree) or 0, 0)
      return level > 0
    end,
    effect = function(player, target, damage)
      local level = math.max(player:getStorageValue(PassiveSkills.BlazingDecree) or 0, 0)
      local percent = 1 + (level / 100)
      return damage * percent
    end,
  },
  pyromaniac = {
    config = {
      type = "OnAttack",
      storage = PassiveSkills.Pyromaniac,
    },
    trigger = function(player, target, damage, primaryType)
      if primaryType ~= COMBAT_FIREDAMAGE then
        return false
      end
      local level = math.max(player:getStorageValue(PassiveSkills.Pyromaniac) or 0, 0)
      print("chance: " .. level)
      if level <= 0 then return false end
      local chance = level
      
      return math.random(100) <= chance
    end,
    effect = function(player, target, damage)
      -- Safe check: only trigger if player is valid and is a player
      if not player or not player:isPlayer() then return end
      -- First fireball immediately
      doExtraFireball(player:getId(), target:getId(), damage * 0.35)
      -- Second fireball after 100ms
      addEvent(function()
        if player and player:isPlayer() then
          doExtraFireball(player:getId(), target:getId(), damage * 0.35)
        end
      end, 200)
    end,
  },
  stellar = {
    config = {
      vocation = 6,
      chance = 10,
      type = "OnAttack"
    },
    trigger = function(player, target, damage, origin)
      return origin == ORIGIN_MELEE or origin == ORIGIN_RANGED or origin == ORIGIN_SPELL
    end,
    effect = function(player, target, damage)
      local magic = player:getMagicLevel()
      local level = player:getLevel()
      local extraDamage = (level / 5) + (magic * 3.3) + 15
      
      addEvent(function()
        if target and target:isMonster() and not target:getMaster() then
          doTargetCombatHealth(player, target, COMBAT_ENERGYDAMAGE, -extraDamage, -extraDamage, CONST_ME_NONE)
          player:say("stellar alligment!", TALKTYPE_MONSTER_SAY)
          local explo = target:getPosition()
          explo.x = explo.x + 1
          explo:sendMagicEffect(382)
        end
      end, 200)
      return damage
    end
  },
  
  blood_blades = {
    config = {
      subid = 29500,
      type = "OnAttack"
    },
    trigger = function(player, target, damage, origin)
      return origin == ORIGIN_MELEE
    end,
    effect = function(player, target, damage)
      local min = (player:getMaxHealth() * 0.15) + 10
      local max = (player:getMaxHealth() * 0.15) + 15
      player:addHealth(math.random(min, max))
      player:getPosition():sendMagicEffect(353)
      target:getPosition():sendMagicEffect(438)
      return damage * 1.5
    end
  },

  
  Monster_damage_reduction = {
    config = {
      vocation = "all",
      maxMissChance = 50,
      levelDifferenceFactor = 0.65,
      type = "OnAttack"
    },
    trigger = function(player, target, damage, origin)
      local monster_level = target:getMonsterLevel()
      local player_level = player:getLevel()
      return monster_level > 0 and (monster_level - player_level) > 0
    end,
    effect = function(player, target, damage)
      local monster_level = target:getMonsterLevel()
      local player_level = player:getLevel()
      local level_difference = monster_level - player_level
      local miss_chance = math.min(level_difference * PASSIVES.damage_reduction.config.levelDifferenceFactor, PASSIVES.damage_reduction.config.maxMissChance)
      
      if math.random(100) <= miss_chance then
        target:getPosition():sendMagicEffect(700)
        return 0
      end
      return damage
    end
  },

  Monster_damage_amplification = {
    config = {
      vocation = "all",
      amplificationFactor = 0.065, -- 6.5% more damage per level difference
      type = "OnDefend"
    },
    trigger = function(player, target, damage, origin)
      local monster_level = target:getMonsterLevel()
      local player_level = player:getLevel()
      return monster_level > 0 and (monster_level - player_level) > 0
    end,
    effect = function(player, target, damage)
      local monster_level = target:getMonsterLevel()
      local player_level = player:getLevel()
      local level_difference = monster_level - player_level
      local amp = 1 + (level_difference * PASSIVES.Monster_damage_amplification.config.amplificationFactor)
      local new_damage = math.floor(damage * amp)
      return new_damage
    end
  },
  
  demolition = {
    config = {
      aspectModeStorage = 50010,
      cooldown = 1.1,
      manaDeduction = 3,
      type = "OnAttack"
    },
    lastUse = {},
    trigger = function(player, target, damage, origin)
      return true
    end,
    effect = function(player, target, damage)
      local now = os.time()
      if PASSIVES.demolition.lastUse[player:getId()] and now - PASSIVES.demolition.lastUse[player:getId()] < PASSIVES.demolition.config.cooldown then
        return damage
      end
      
      PASSIVES.demolition.lastUse[player:getId()] = now
      local manaCost = player:getMaxMana() * (PASSIVES.demolition.config.manaDeduction / 100)
      player:addMana(-manaCost)
      
      local level = player:getLevel()
      local magic = player:getMagicLevel()
      local min = (level/5) + (magic * 5) + 10
      local max = (level/5) + (magic * 9) + 15
      
      addEvent(function()
        if target and player then
          local area = player:getStorageValue(PASSIVES.demolition.config.aspectModeStorage) == 1 and 
            createCombatArea({
              {0,0,1,0,0},
              {0,1,1,1,0},
              {1,1,3,1,1},
              {0,1,1,1,0},
              {0,0,1,0,0}
            }) or
            createCombatArea({
              {1,1,1},
              {1,3,1},
              {1,1,1}
            })
          
          doAreaCombatHealth(player, COMBAT_ENERGYDAMAGE, target:getPosition(), area, -min, -max, CONST_ME_NONE)
          player:say("Demolition!", TALKTYPE_MONSTER_SAY)
          local explo = target:getPosition()
          explo.x = explo.x + 3
          explo.y = explo.y + 3
          explo:sendMagicEffect(CONST_ME_CAKE)
        end
      end, 200)
      return damage
    end
  },
  
  light_dancer = {
    config = {
      vocation = 9,
      type = "OnAttack"
    },
    trigger = function(player, target, damage, origin)
      return origin == ORIGIN_MELEE and target:getCondition(CONDITION_ENERGY, 0, 25965)
    end,
    effect = function(player, target, damage)
      local magic = player:getMagicLevel()
      local level = player:getLevel()
      local extraDamage = damage + (damage * 0.55) + (magic * 10)
      
      addEvent(function()
        if target and player then
          doTargetCombatHealth(player, target, COMBAT_ENERGYDAMAGE, -extraDamage, -extraDamage, CONST_ME_NONE)
          player:say("Short Circuit!", TALKTYPE_MONSTER_SAY)
          local primaryPos = target:getPosition()
          primaryPos:sendMagicEffect(414)
          
          -- Get nearby monsters with same condition
          local creaturesList = Game.getSpectators(primaryPos, false, false, 2, 2, 2, 2)
          for _, nearbyCreature in ipairs(creaturesList) do
            if nearbyCreature:isMonster() and nearbyCreature:getId() ~= target:getId() and 
               nearbyCreature:getCondition(CONDITION_ENERGY, 0, 25965) then
              local reducedDamage = math.floor(extraDamage * 0.5)
              doTargetCombatHealth(player, nearbyCreature, COMBAT_ENERGYDAMAGE, -reducedDamage, -reducedDamage, CONST_ME_NONE)
              primaryPos:sendDistanceEffect(nearbyCreature:getPosition(), 117)
            end
          end
        end
      end, 300)
      return damage
    end
  },
  
  lightbringer = {
    config = {
      storage = 5000,
      chance = 20,
      type = "OnAttack"
    },
    trigger = function(player, target, damage, origin)
      return origin == ORIGIN_MELEE or origin == ORIGIN_RANGED or origin == ORIGIN_SPELL
    end,
    effect = function(player, target, damage)
      local extraDamage = damage * 1.8
      
      addEvent(function()
        if target and player then
          doTargetCombatHealth(player, target, COMBAT_ENERGYDAMAGE, -extraDamage, -extraDamage, CONST_ME_PURPLEDEATH)
          local min = (player:getMaxMana() * 0.14)
          local max = (player:getMaxMana() * 0.17)
          player:addMana(math.random(min, max))
          player:say("Deathbringer!", TALKTYPE_MONSTER_SAY)
          player:getPosition():sendMagicEffect(379)
          player:getPosition():sendMagicEffect(318)
          local explo = target:getPosition()
          explo.x = explo.x + 1
          explo.y = explo.y + 1
          explo:sendMagicEffect(CONST_ME_CAKE)
        end
      end, 200)
      return damage
    end
  },
  
  lighting_shield = {
    config = {
      condition = 25971,
      type = "OnDefend"
    },
    trigger = function(player, target, damage, origin)
      return true
    end,
    effect = function(player, target, damage)
      if math.random(100) <= 75 then
        player:getPosition():sendMagicEffect(548)
        player:getPosition():sendMagicEffect(577)
        if target and (target:isPlayer() or (target:isMonster() and target:getSkull() == SKULL_NONE)) then
          target:addCondition(PASSIVES.lighting_shield.stunCondition())
          target:getPosition():sendMagicEffect(CONST_ME_STUN)
        end
        return 0
      end
      return damage
    end,
    stunCondition = function()
      local cond = Condition(CONDITION_STUNED)
      cond:setParameter(CONDITION_PARAM_TICKS, 1500)
      return cond
    end
  },
  
  luck_dodge = {
    config = {
      vocation = "all",
      type = "OnDefend"
    },
    trigger = function(player, target, damage, origin)
      return true
    end,
    effect = function(player, target, damage)
      local luckChance = player:getCharacterStat(CHARSTAT_LUCK) * 10
      if math.random(1, 10000) <= luckChance then
        player:getPosition():sendMagicEffect(CONST_ME_685)
        return 0
      end
      return damage
    end
  },
  
  resilience_stat = { --reduce damage taken
    config = {
      vocation = "all",
      type = "OnDefend"
    },
    trigger = function(player, target, damage, origin)
      return true
    end,
    effect = function(player, target, damage)
      local resilience = player:getCharacterStat(CHARSTAT_RESILIENCE)
      
      -- First 20% of damage gets strong reduction (0.8% per point)
      local firstReduction = math.min(damage * 0.2, resilience * 0.008)
      
      -- Remaining 80% gets normal reduction (0.2% per point)
      local secondReduction = (damage - firstReduction) * resilience * 0.002
      
      local totalReduction = firstReduction + secondReduction
      local finalDamage = damage - totalReduction
      
      print(string.format("Resilience Defense (%d points):", resilience))
      print(string.format("First 20%% reduced by %.1f%% (%.1f damage)", 
                          firstReduction/damage*100, firstReduction))
      print(string.format("Remaining 80%% reduced by %.1f%% (%.1f damage)",
                          secondReduction/damage*100, secondReduction))
      print(string.format("Total reduction: %.1f%% (from %.1f to %.1f)",
                          totalReduction/damage*100, damage, finalDamage))
      
      return finalDamage
    end
  },
  
  voracity_leech = {
    config = {
      vocation = "all", -- All vocations example
      type = "OnAttack"
    },
    trigger = function(player, target, damage, origin)
      return origin ~= ORIGIN_HEALING
    end,
    effect = function(player, target, damage)
      -- Very powerful early-game formula
      local base = 0.05  -- 5% base leech
      local linear = player:getCharacterStat(CHARSTAT_VORACITY) * 0.003  -- 0.3% per point
      local diminishing = math.pow(player:getCharacterStat(CHARSTAT_VORACITY), 0.6) * 0.0005  -- Strong early scaling
      
      local leechPercent = math.min(base + linear + diminishing, 0.30)  -- Cap at 30%
      local healAmount = math.max(math.floor(math.abs(damage) * leechPercent), 2)  -- Minimum 2 HP
      
      print("Voracity Leech:")
      print("Base:", base, "Linear:", linear, "Diminishing:", diminishing)
      print("Total %:", leechPercent, "Heal:", healAmount)
      
      player:addHealth(healAmount)
      player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
      return damage
    end
  },
  
  frostbloom_shield = {
    config = {
      subid = 25961,
      type = "OnDefend"
    },
    trigger = function(player, target, damage, origin)
      return player:getCondition(CONDITION_ATTRIBUTES, 0, 25961)
    end,
    effect = function(player, target, damage)
      player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
      return damage * 0.8
    end
  },
  
  luck_dodge_stat = {
    config = {
      playerOnly = true,
      type = "OnDefend"
    },
    trigger = function(player, target, damage, origin)
      return math.random(1, 10000) <= player:getCharacterStat(CHARSTAT_LUCK) * 10
    end,
    effect = function(player, target, damage)
      player:getPosition():sendMagicEffect(CONST_ME_685)
      return 0
    end
  },
  
  compassion_shield_stat = {
    config = {
      playerOnly = true,
      type = "OnDefend"
    },
    trigger = function(player, target, damage, origin)
      return true
    end,
    effect = function(player, target, damage)
      return damage * (1 - player:getCharacterStat(CHARSTAT_COMPASSION) * 0.003)
    end
  },
  
  necroprophagy = {
    config = {
      vocation = 5,
      type = "OnAttack"
    },
    trigger = function(player, target, damage, origin)
      return origin ~= ORIGIN_HEALING
    end,
    effect = function(player, target, damage)
      local function getMaxServants(playerLevel)
        return math.min(math.max(math.floor(playerLevel / 25) + 2, 3), 7)
      end
      
      local function trySummonServant(player, chance)
        local undeadCount = 0
        local summons = player:getSummons()
        print("undeadCount: " .. undeadCount)
        
        -- Count existing servants
        for _, summon in ipairs(summons) do
          if summon:getName():lower() == "servant" then
            undeadCount = undeadCount + 1
          end
        end
        
        local maxServants = getMaxServants(player:getLevel())
        print("Max servants allowed: " .. maxServants)
        
        -- Summon new servant if under limit and chance succeeds
        if undeadCount < maxServants and math.random(100) <= chance then
          local summon = Game.createMonster("servant", player:getPosition(), false, true)
          if summon then
            summon:setMaster(player)
            local healthAmount = player:getMaxHealth() / 1.3
            summon:setMaxHealth(healthAmount)
            summon:setHealth(healthAmount)
            local deltaSpeed = math.max(player:getBaseSpeed() - summon:getBaseSpeed(), 0)
            summon:changeSpeed(deltaSpeed)
            
            -- Despawn after duration
            addEvent(function() 
              if summon and summon:isMonster() then 
                local pos = summon:getPosition()
                if pos then
                  pos:sendMagicEffect(CONST_ME_POFF)
                  summon:remove() 
                end
              end 
            end, 12000)
            return true
          end
        end
        return false
      end
      trySummonServant(player, 15)  -- 10% chance on damage
      return damage
    end
  },
}

-- Health change handler
function passiveEvent.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
  --print("[Passive System] Health change event triggered for " .. creature:getName())
  
  -- Handle attacker passives (OnAttack)
  if attacker and attacker:isPlayer() then
    local player = attacker:getPlayer()
    local vocationId = player:getVocation():getId()
    
    for passiveName, passiveData in pairs(PASSIVES) do
      if passiveData.config.type == "OnAttack" then
        --print("[Passive System] Checking attack passive: " .. passiveName)
        
        -- Check requirements
        if not (passiveData.config.playerOnly and not creature:isPlayer()) then
          local meetsReq = (passiveData.config.vocation and (type(passiveData.config.vocation) == "table" and table.contains(passiveData.config.vocation, vocationId) or vocationId == passiveData.config.vocation)) or 
                          (passiveData.config.storage and player:getStorageValue(passiveData.config.storage) > 0) or
                          (passiveData.config.condition and player:getCondition(CONDITION_ATTRIBUTES, 0, passiveData.config.condition))
          
          if meetsReq and passiveData.trigger(player, creature, primaryDamage, primaryType) then
            print("[Passive System] Attack passive triggered: " .. passiveName)
            -- Handle chance-based passives
            if passiveData.config.chance then
              if math.random(100) <= passiveData.config.chance then
                primaryDamage = passiveData.effect(player, creature, primaryDamage) or primaryDamage
              end
            else
              primaryDamage = passiveData.effect(player, creature, primaryDamage) or primaryDamage
            end
          end
        end
      end
    end
  end
  
  -- Handle defender passives (OnDefend)
  if creature:isPlayer() then
    local player = creature:getPlayer()
    local vocationId = player:getVocation():getId()
    
    for passiveName, passiveData in pairs(PASSIVES) do
      if passiveData.config.type == "OnDefend" then
        print("[Passive System] Checking defend passive: " .. passiveName)
        
        -- Check requirements
        if not (passiveData.config.playerOnly and not creature:isPlayer()) then
          local meetsReq = (passiveData.config.vocation and (type(passiveData.config.vocation) == "table" and table.contains(passiveData.config.vocation, vocationId) or vocationId == passiveData.config.vocation)) or 
                          (passiveData.config.storage and player:getStorageValue(passiveData.config.storage) > 0) or
                          (passiveData.config.condition and player:getCondition(CONDITION_ATTRIBUTES, 0, passiveData.config.condition))
          
          if meetsReq and passiveData.trigger(player, attacker, primaryDamage, origin) then
            print("[Passive System] Defend passive triggered: " .. passiveName)
            -- Handle chance-based passives
            if passiveData.config.chance then
              if math.random(100) <= passiveData.config.chance then
                primaryDamage = passiveData.effect(player, attacker, primaryDamage) or primaryDamage
              end
            else
              primaryDamage = passiveData.effect(player, attacker, primaryDamage) or primaryDamage
            end
          end
        end
      end
    end
  end
  
  return primaryDamage, primaryType, secondaryDamage, secondaryType
end

-- Death handler

local deathEvent = CreatureEvent("NecroprophagyDeath")
function deathEvent.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
  if killer and creature and killer:isPlayer() and creature:isMonster() then
    local player = killer:getPlayer()
    if player:getVocation():getId() == 5 then
      local function getMaxServants(playerLevel)
        return math.min(math.max(math.floor(playerLevel / 25) + 2, 3), 7)
      end
      
      local function trySummonServant(player, chance)
        local undeadCount = 0
        local summons = player:getSummons()
        
        -- Count existing servants
        for _, summon in ipairs(summons) do
          if summon:getName():lower() == "servant" then
            undeadCount = undeadCount + 1
          end
        end
        
        local maxServants = getMaxServants(player:getLevel())
        print("Max servants allowed: " .. maxServants)
        
        -- Summon new servant if under limit and chance succeeds
        if undeadCount < maxServants and math.random(100) <= chance then
          local summon = Game.createMonster("servant", player:getPosition(), false, true)
          if summon then
            summon:setMaster(player)
            local healthAmount = player:getMaxHealth() / 1.3
            summon:setMaxHealth(healthAmount)
            summon:setHealth(healthAmount)
            local deltaSpeed = math.max(player:getBaseSpeed() - summon:getBaseSpeed(), 0)
            summon:changeSpeed(deltaSpeed)
            
            -- Despawn after duration
            addEvent(function() 
              if summon and summon:isMonster() then 
                local pos = summon:getPosition()
                if pos then
                  pos:sendMagicEffect(CONST_ME_POFF)
                  summon:remove() 
                end
              end 
            end, 12000)
            return true
          end
        end
        return false
      end
      trySummonServant(player, 100)  -- 100% chance on death
    end
  end
  return true
end

deathEvent:register()

-- Login handler to register events
local loginEventpassives = CreatureEvent("RegisterPassives")
function loginEventpassives.onLogin(player)
  player:registerEvent("UnifiedPassives")
  return true
end

-- Target combat handler to register events
local TargetCombatEventpassives = EventCallback
TargetCombatEventpassives.onTargetCombat = function(creature, target)
    target:registerEvent("UnifiedPassives")
    target:registerEvent("NecroprophagyDeath")
    target:registerEvent("monsterorb")
    target:registerEvent("EliteMonsterCombatHP")
    target:registerEvent("EliteMonsterCombatMana")
  return true
end

TargetCombatEventpassives:register()
-- Register all events
passiveEvent:type("healthchange")
passiveEvent:register()

loginEventpassives:type("login")
loginEventpassives:register()

print(">> Unified passives system loaded")
