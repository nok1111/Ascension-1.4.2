local passiveEvent = CreatureEvent("UnifiedPassives")

local PASSIVES = {
  -- Stellar Alignment (Vocation 7)
  stellar = {
    vocation = 7,
    trigger = function(player, creature, damage, origin)
      return origin == ORIGIN_MELEE or origin == ORIGIN_RANGED or origin == ORIGIN_SPELL
    end,
    effect = function(player, creature, damage)
      local magic = player:getMagicLevel()
      local level = player:getLevel()
      local extraDamage = (level / 5) + (magic * 3.3) + 15
      
      addEvent(function()
        if creature and creature:isMonster() and not creature:getMaster() then
          doTargetCombatHealth(player, creature, COMBAT_ENERGYDAMAGE, -extraDamage, -extraDamage, CONST_ME_NONE)
          player:say("stellar alligment!", TALKTYPE_MONSTER_SAY)
          local explo = creature:getPosition()
          explo.x = explo.x + 1
          explo:sendMagicEffect(382)
        end
      end, 200)
    end,
    chance = 10 -- 1 in 10 chance
  },
  
  -- Blood Blades (Storage 29500)
  blood_blades = {
    storage = 29500,
    trigger = function(player, creature, damage, origin)
      return origin == ORIGIN_MELEE
    end,
    effect = function(player, creature, damage)
      local min = (player:getMaxHealth() * 0.15) + 10
      local max = (player:getMaxHealth() * 0.15) + 15
      player:addHealth(math.random(min, max))
      player:getPosition():sendMagicEffect(353)
      creature:getPosition():sendMagicEffect(438)
      return damage * 1.5
    end
  },
  
  -- Druid Elements (Vocation 8)
  druid_elements = {
    vocation = 8,
    trigger = function(player, creature, damage, primaryType)
      return primaryType == COMBAT_PHYSICALDAMAGE or primaryType == COMBAT_ENERGYDAMAGE
    end,
    effect = function(player, creature, damage)
      creature:getPosition():sendMagicEffect(445)
      return damage * 0.80
    end
  },
  
  -- Damage Reduction (Level-based)
  damage_reduction = {
    config = {
      maxMissChance = 50,
      levelDifferenceFactor = 0.65
    },
    trigger = function(player, creature, damage, origin)
      local monster_level = creature:getMonsterLevel()
      local player_level = player:getLevel()
      return monster_level > 0 and (monster_level - player_level) > 0
    end,
    effect = function(player, creature, damage)
      local monster_level = creature:getMonsterLevel()
      local player_level = player:getLevel()
      local level_difference = monster_level - player_level
      local miss_chance = math.min(level_difference * PASSIVES.damage_reduction.config.levelDifferenceFactor, PASSIVES.damage_reduction.config.maxMissChance)
      
      if math.random(100) <= miss_chance then
        creature:getPosition():sendMagicEffect(270)
        creature:getPosition():sendMagicEffect(577)
        return 0
      end
      return damage
    end
  },
  
  -- Demolition
  demolition = {
    config = {
      aspectModeStorage = 50010,
      cooldown = 1.1,
      manaDeduction = 3
    },
    lastUse = {},
    trigger = function(player, creature, damage, origin)
      return true
    end,
    effect = function(player, creature, damage)
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
        if creature and player then
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
          
          doAreaCombatHealth(player, COMBAT_ENERGYDAMAGE, creature:getPosition(), area, -min, -max, CONST_ME_NONE)
          player:say("Demolition!", TALKTYPE_MONSTER_SAY)
          local explo = creature:getPosition()
          explo.x = explo.x + 3
          explo.y = explo.y + 3
          explo:sendMagicEffect(CONST_ME_CAKE)
        end
      end, 200)
      return damage
    end
  },
  
  -- Light Dancer (Vocation 9)
  light_dancer = {
    vocation = 9,
    trigger = function(player, creature, damage, origin)
      return origin == ORIGIN_MELEE and creature:getCondition(CONDITION_ENERGY, 0, 25965)
    end,
    effect = function(player, creature, damage)
      local magic = player:getMagicLevel()
      local level = player:getLevel()
      local extraDamage = damage + (damage * 0.55) + (magic * 10)
      
      addEvent(function()
        if creature and player then
          doTargetCombatHealth(player, creature, COMBAT_ENERGYDAMAGE, -extraDamage, -extraDamage, CONST_ME_NONE)
          player:say("Short Circuit!", TALKTYPE_MONSTER_SAY)
          local primaryPos = creature:getPosition()
          primaryPos:sendMagicEffect(414)
          
          -- Get nearby monsters with same condition
          local creaturesList = Game.getSpectators(primaryPos, false, false, 2, 2, 2, 2)
          for _, nearbyCreature in ipairs(creaturesList) do
            if nearbyCreature:isMonster() and nearbyCreature:getId() ~= creature:getId() and 
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
  
  -- Lightbringer (Storage 5000)
  lightbringer = {
    storage = 5000,
    trigger = function(player, creature, damage, origin)
      return origin == ORIGIN_MELEE or origin == ORIGIN_RANGED or origin == ORIGIN_SPELL
    end,
    effect = function(player, creature, damage)
      local extraDamage = damage * 1.8
      
      addEvent(function()
        if creature and player then
          doTargetCombatHealth(player, creature, COMBAT_ENERGYDAMAGE, -extraDamage, -extraDamage, CONST_ME_PURPLEDEATH)
          local min = (player:getMaxMana() * 0.14)
          local max = (player:getMaxMana() * 0.17)
          player:addMana(math.random(min, max))
          player:say("Deathbringer!", TALKTYPE_MONSTER_SAY)
          player:getPosition():sendMagicEffect(379)
          player:getPosition():sendMagicEffect(318)
          local explo = creature:getPosition()
          explo.x = explo.x + 1
          explo.y = explo.y + 1
          explo:sendMagicEffect(CONST_ME_CAKE)
        end
      end, 200)
      return damage
    end,
    chance = 20
  },
  
  -- Lighting Shield (Condition 25971)
  lighting_shield = {
    condition = 25971,
    stunCondition = function()
      local cond = Condition(CONDITION_STUNED)
      cond:setParameter(CONDITION_PARAM_TICKS, 1500)
      return cond
    end,
    trigger = function(player, creature, damage, origin)
      return true
    end,
    effect = function(player, creature, damage)
      if math.random(100) <= 75 then
        player:getPosition():sendMagicEffect(548)
        player:getPosition():sendMagicEffect(577)
        if creature and (creature:isPlayer() or (creature:isMonster() and creature:getSkull() == SKULL_NONE)) then
          creature:addCondition(PASSIVES.lighting_shield.stunCondition())
          creature:getPosition():sendMagicEffect(CONST_ME_STUN)
        end
        return 0
      end
      return damage
    end
  },
  
  -- One With The Elements (Vocation 2)
  one_with_elements = {
    vocation = 2,
    trigger = function(player, creature, damage, primaryType)
      return primaryType == COMBAT_PHYSICALDAMAGE or primaryType == COMBAT_ENERGYDAMAGE or 
             primaryType == COMBAT_FIREDAMAGE or primaryType == COMBAT_EARTHDAMAGE or 
             primaryType == COMBAT_DEATHDAMAGE or primaryType == COMBAT_HOLYDAMAGE or 
             primaryType == COMBAT_ICEDAMAGE
    end,
    effect = function(player, creature, damage)
      player:addMana(player:getMaxMana() * 0.02)
      player:getPosition():sendMagicEffect(379)
      return damage
    end
  }
}

-- Health change handler
function passiveEvent.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
  -- Handle attacker passives
  if attacker and attacker:isPlayer() then
    local player = attacker:getPlayer()
    local vocationId = player:getVocation():getId()
    
    for name, passive in pairs(PASSIVES) do
      -- Check requirements
      local meetsReq = (passive.vocation and vocationId == passive.vocation) or 
                      (passive.storage and player:getStorageValue(passive.storage) > 0) or
                      (passive.condition and player:getCondition(CONDITION_ATTRIBUTES, 0, passive.condition))
      
      if meetsReq and passive.trigger(player, creature, primaryDamage, origin) then
        -- Handle chance-based passives
        if passive.chance then
          if math.random(passive.chance) == passive.chance then
            passive.effect(player, creature, primaryDamage)
          end
        else
          local newDamage = passive.effect(player, creature, primaryDamage)
          if newDamage then primaryDamage = newDamage end
        end
      end
    end
  end
  
  -- Handle creature passives (defensive)
  if creature and creature:isPlayer() then
    local player = creature:getPlayer()
    local vocationId = player:getVocation():getId()
    
    for name, passive in pairs(PASSIVES) do
      -- Similar checks as above
      local meetsReq = (passive.vocation and vocationId == passive.vocation) or 
                      (passive.storage and player:getStorageValue(passive.storage) > 0) or
                      (passive.condition and player:getCondition(CONDITION_ATTRIBUTES, 0, passive.condition))
      
      if meetsReq and passive.trigger(player, attacker, primaryDamage, primaryType) then
        local newDamage = passive.effect(player, attacker, primaryDamage)
        if newDamage then primaryDamage = newDamage end
      end
    end
  end
  
  return primaryDamage, primaryType, secondaryDamage, secondaryType
end

-- Death handler for Necroprophagy
local deathEvent = CreatureEvent("NecroprophagyDeath")
function deathEvent.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
  if killer and creature and killer:isPlayer() and creature:isMonster() then
    local player = killer:getPlayer()
    if player:getStorageValue(5000) == 1 then -- Check if player has necroprophagy passive
      local undeadCount = 0
      local summons = player:getSummons()
      
      -- Count existing summons
      for _, summon in ipairs(summons) do
        if summon:getName():lower() == "servant" then
          undeadCount = undeadCount + 1
        end
      end
      
      -- Summon new servant if under limit
      if undeadCount < 3 and math.random(100) <= 10 then
        local summon = Game.createMonster("Servant", creature:getPosition(), false, true)
        if summon then
          summon:setMaster(player)
          local healthAmount = player:getMaxHealth() / 1.3
          summon:setMaxHealth(healthAmount)
          summon:setHealth(healthAmount)
          local deltaSpeed = math.max(player:getBaseSpeed() - summon:getBaseSpeed(), 0)
          summon:changeSpeed(deltaSpeed)
          
          -- Make summon attack player's target
          if player:getTarget() then
            summon:setTarget(player:getTarget())
          end
          
          -- Despawn after duration
          addEvent(function() 
            if summon then 
              summon:getPosition():sendMagicEffect(CONST_ME_POFF)
              summon:remove() 
            end 
          end, 6000)
        end
      end
    end
  end
  return true
end

-- Login handler to register events
local loginEvent = CreatureEvent("RegisterPassives")
function loginEvent.onLogin(player)
  player:registerEvent("UnifiedPassives")
  player:registerEvent("NecroprophagyDeath")
  return true
end

-- Target combat handler to register events
local targetCombatEvent = EventCallback()
function targetCombatEvent.onTargetCombat(creature, target)
  if target:isPlayer() then
    target:registerEvent("UnifiedPassives")
    target:registerEvent("NecroprophagyDeath")
  end
  return RETURNVALUE_NOERROR
end

-- Register all events
passiveEvent:type("healthchange")
passiveEvent:register()

deathEvent:type("death")
deathEvent:register()

loginEvent:type("login")
loginEvent:register()

targetCombatEvent:register()

print(">> Unified passives system loaded")
