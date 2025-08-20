local passiveEvent = CreatureEvent("UnifiedPassives")

consacrated_counter = {}
local blazingdecree_area = createCombatArea({
  {1, 1, 1},
  {1, 3, 1},
  {1, 1, 1}
})
local permafrost_area = createCombatArea({
  {1, 1, 1},
  {1, 3, 1},
  {1, 1, 1}
})

local demolition_area = createCombatArea({
  {1, 1, 1},
  {1, 3, 1},
  {1, 1, 1}
})

-- Standardized passive structure implementation
-- Spawns a fire distance effect and applies an area fire combat at the target's position
function doExtraFireball(playerid, targetid, baseDamage)
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
  local bonus = (level * 0.2) + (magic /10) + 1
  local totalDamage = baseDamage + bonus
  -- Apply fire damage to area
  
  doAreaCombatHealth(player:getId(), COMBAT_FIREDAMAGE, toPos, blazingdecree_area, -math.floor(totalDamage), -math.floor(totalDamage), 7)
end

local function StarfallPassive(playerId, targetId)
  local player = Creature(playerId)
  local target = Creature(targetId)
  if not player or not target then
      return
  end

  local level = player:getLevel()
	local magic = player:getMagicLevel()

	local minburn = ((level / 5) + (magic * 1.5) + 2) + 2
	local maxburn =  ((level / 5) + (magic * 1.6) + 2) + 3

    local AstralBurnDurationLevel = math.max(player:getStorageValue(PassiveSkills.AstralBurn) or 0, 0)
    local conditionastralburn = Condition(CONDITION_ENERGY, CONDITIONID_COMBAT)
    local duration = AstralBurnDurationLevel + 1

    
    conditionastralburn:addDamage(duration, 1000, math.random(minburn, maxburn))
    conditionastralburn:setParameter(CONDITION_PARAM_DELAYED, 1) 
    conditionastralburn:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.astralburn)

    if AstralBurnDurationLevel > 0 then
        target:addCondition(conditionastralburn)
    end

  local targetPos = target:getPosition()
  targetPos.x = targetPos.x + 1
  targetPos:sendMagicEffect(382)
  target:attachEffectById(86, true)

  local playerLevel = player:getLevel()
  local playerMagic = player:getMagicLevel()
  local playerBonus = (playerLevel * 0.8) + (playerMagic * 3.0)
  local totalDamage = playerBonus

  doAreaCombatHealth(player:getId(), COMBAT_ENERGYDAMAGE, target:getPosition(), 0, -math.floor(totalDamage), -math.floor(totalDamage), CONST_ME_NONE)

end

function doDemolition(playerid, targetid, baseDamage)
  if not playerid or not targetid then return end
  local player = Creature(playerid)
  local target = Creature(targetid)
  local fromPos = player:getPosition()
  local toPos = target:getPosition()
  -- Calculate damage formula using player level and magic level
  local level = player:getLevel()
  local distance = player:getEffectiveSkillLevel(SKILL_DISTANCE) * 1
  local bonus = (level * 0.8) + (distance * 3.0) + 50
  local totalDamage = baseDamage + bonus
  -- Apply fire damage to area
  
  doAreaCombatHealth(player:getId(), COMBAT_FIREDAMAGE, toPos, demolition_area, -math.floor(totalDamage), -math.floor(totalDamage), CONST_ME_NONE)
end



local PASSIVES = {


  DeadFromAbove = {
    config = {
      type = "OnAttack",
      storage = PassiveSkills.DeadFromAbove,
    },
    trigger = function(player, target, damage, primaryType, origin)
      if primaryType ~= COMBAT_PHYSICALDAMAGE then
        return false
      end
      local level = math.max(player:getStorageValue(PassiveSkills.DeadFromAbove) or 0, 0)
      if level > 0 then
        local chance = level -- 2% per level
        return math.random(100) <= chance 
      end
      return false
    end,
    effect = function(player, target, damage)
      if not player or not target or not damage then
        return
      end
      local fromPos = player:getPosition()
      local toPos = target:getPosition()
      -- Calculate damage formula using player level and magic level
      local level = player:getLevel()
      local distance = player:getEffectiveSkillLevel(SKILL_DISTANCE) * 1
      local bonus = (level * 0.8) + (level * ((distance * 2) / 100)) + 50
      local totalDamage = bonus
      -- Apply fire damage to area
      
      doAreaCombatHealth(player:getId(), COMBAT_FIREDAMAGE, toPos, demolition_area, -math.floor(totalDamage), -math.floor(totalDamage), CONST_ME_NONE)
      local positioneffect = toPos
      positioneffect.x = toPos.x + 2
      positioneffect.y = toPos.y + 1
      positioneffect:sendMagicEffect(990)

      local ScorchedMarkLevel = math.max(player:getStorageValue(PassiveSkills.ScorchedMark) or 0, 0)
      if ScorchedMarkLevel > 0 then
        local condition = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
        condition:setParameter(CONDITION_PARAM_TICKS, 5000)
        condition:setParameter(CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, ScorchedMarkLevel)
        condition:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.scorchedmark)
        player:addCondition(condition)
      end
      return damage
    end,
  },



    -- Demolition Passive: Fire damage has a 2% chance per level to trigger AoE physical damage
    demolition = {
      config = {
        type = "OnAttack",
        storage = PassiveSkills.Demolition,
      },
      trigger = function(player, target, damage, primaryType, origin)
        if primaryType ~= COMBAT_FIREDAMAGE then
          return false
        end
        local level = math.max(player:getStorageValue(PassiveSkills.Demolition) or 0, 0)
        if level > 0 then
          local chance = level -- 2% per level
          return math.random(100) <= chance 
        end
        return false
      end,
      effect = function(player, target, damage)
        if not player or not target or not damage then
          return
        end
        local fromPos = player:getPosition()
        local toPos = target:getPosition()
        -- Calculate damage formula using player level and magic level
        local level = player:getLevel()
        local distance = player:getEffectiveSkillLevel(SKILL_DISTANCE) * 1
        local bonus = (level * 0.8) + (level * ((distance * 2) / 100)) + 50
        local totalDamage = bonus
        -- Apply fire damage to area
        
        doAreaCombatHealth(player:getId(), COMBAT_PHYSICALDAMAGE, toPos, demolition_area, -math.floor(totalDamage), -math.floor(totalDamage), CONST_ME_NONE)
        local positioneffect = toPos
        positioneffect.x = toPos.x + 1
        positioneffect.y = toPos.y + 1
        positioneffect:sendMagicEffect(805)

        local volatileImpactLevel = math.max(player:getStorageValue(PassiveSkills.VolatileImpact) or 0, 0)
        if volatileImpactLevel > 0 then
          local condition = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
          condition:setParameter(CONDITION_PARAM_TICKS, 5000)
          condition:setParameter(CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, volatileImpactLevel)
          condition:setParameter(CONDITION_PARAM_SPECIALSKILL_ATTACKSPEED, volatileImpactLevel)
          condition:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.volatileimpact)
          player:addCondition(condition)
        end
        return damage
      end,
    },


  vial_of_nature = {
    config = {
      type = "OnDefend",
      subid = 29704,
    },
    trigger = function(player, attacker, damage, primaryType, origin)
      -- physical damage reduction
      return primaryType == COMBAT_EARTHDAMAGE or primaryType == COMBAT_FIREDAMAGE or primaryType == COMBAT_ICEDAMAGE or primaryType == COMBAT_HOLYDAMAGE or primaryType == COMBAT_DEATHDAMAGE
    end,
    effect = function(player, attacker, damage, primaryType, origin)
      if not player or not attacker or not damage then
        return
      end
 
        damage = damage * 0.95
      
      return damage
    end,
  },

  vial_of_stone = {
    config = {
      type = "OnDefend",
      subid = 29703,
    },
    trigger = function(player, attacker, damage, primaryType, origin)
      -- physical damage reduction
      return primaryType == COMBAT_PHYSICALDAMAGE
    end,
    effect = function(player, attacker, damage, primaryType, origin)
      if not player or not attacker or not damage then
        return
      end
 
        damage = damage * 0.95
      
      return damage
    end,
  },


  permafrost_trap = {
    config = {
      type = "OnAttack",
      storage = PassiveSkills.PermafrostTrap,
    },
    trigger = function(player, target, damage, primaryType, origin)
      if primaryType ~= COMBAT_ICEDAMAGE then
        return false
      end
      local level = math.max(player:getStorageValue(PassiveSkills.PermafrostTrap) or 0, 0)
      local chance = level
      return math.random(100) <= chance
    end,
    effect = function(player, target, damage)
      if not player or not target or not damage then
        return
      end
      print("permafrost trap")
      local playerlevel = player:getLevel()
      local playerMagic = player:getMagicLevel()
      local playerBonus = ((playerlevel / 5) + (playerMagic * 1.5) + 2)
      -- Deal doarea damage dotarget
      doTargetCombatHealth(player:getId(), target:getId(), COMBAT_ICEDAMAGE, -playerBonus, -playerBonus, CONST_ME_NONE)
      target:attachEffectById(119, true)   
      return damage -- Prevent double damage application
    end,
  },

  
  MagneticShield = {
    config = {
      type = "OnDefend",
      subid = ConditionsSubIds.MagneticShield,
    },
    trigger = function(player, attacker, damage, primaryType, origin)
      return player:getCondition(CONDITION_ATTRIBUTES, 0, ConditionsSubIds.MagneticShield)
    end,
    effect = function(player, attacker, damage)
      if not player or not attacker or not damage then
        return
      end

      return 0
    end,
  },

  LightningWaltzParry = {
    config = {
      type = "OnDefend",
      subid = ConditionsSubIds.LightningWaltzparry,
    },
    trigger = function(player, attacker, damage, primaryType, origin)
      return player:getCondition(CONDITION_ATTRIBUTES, 0, ConditionsSubIds.LightningWaltzparry)
    end,
    effect = function(player, attacker, damage)
      if not player or not attacker or not damage then
        return
      end
      -- send magic effect on player pos
      player:getPosition():sendMagicEffect(685)
      return 0
    end,
  },


  lightning_riposte = {
    config = {
      type = "OnDefend",
      storage = PassiveSkills.LightningRiposte,
    },
    trigger = function(player, attacker, damage, primaryType, origin)
      -- Only trigger on physical damage
      if primaryType ~= COMBAT_PHYSICALDAMAGE then
        return false
      end
      local level = math.max(player:getStorageValue(PassiveSkills.LightningRiposte) or 0, 0)
      if level <= 0 then
        return false
      end
      local chance = level -- 2% per level
      return math.random(100) <= chance
    end,
    effect = function(player, attacker, damage)
      if not player or not attacker or not damage then
        return
      end
      -- Deflect: reduce incoming damage by 30% (customizable)
      local reducedDamage = damage * 0.7
      -- Reflect: send a portion (20% of reduced damage + scaling) as energy damage
      doTargetCombatHealth(player:getId(), attacker:getId(), COMBAT_ENERGYDAMAGE, -reducedDamage, -reducedDamage, CONST_ME_ENERGYAREA)
      player:attachEffectById(148, true)
      player:attachEffectById(149, true) 
      return 0
    end,
  },

  frost_armor = {
    config = {
      type = "OnDefend",
      subid = ConditionsSubIds.frostarmor,
    },
    trigger = function(player, attacker, damage, primaryType, origin)
      return player:getCondition(CONDITION_ATTRIBUTES, 0, ConditionsSubIds.frostarmor)
    end,
    effect = function(player, attacker, damage)
      if not player or not attacker or not damage then
        return
      end
      

      doTargetCombatHealth(player:getId(), attacker:getId(), COMBAT_ICEDAMAGE, -(damage * 0.25), -(damage * 0.35), CONST_ME_NONE)
      --send distance effect from player to attacker
      player:getPosition():sendDistanceEffect(attacker:getPosition(), 37)
      player:getPosition():sendMagicEffect(543)
      return damage * 0.8
    end,
  },


  mountain_stance = {
    config = {
      type = "OnDefend",
      subid = ConditionsSubIds.mountain_stance,
    },
    trigger = function(player, attacker, damage, primaryType, origin)
      return player:getCondition(CONDITION_ATTRIBUTES, 0, ConditionsSubIds.mountain_stance)
    end,
    effect = function(player, attacker, damage)
      if not player or not attacker or not damage then
        return
      end
      -- send magic effect on player pos
      player:getPosition():sendMagicEffect(671)
      return damage * 0.7
    end,
  },

  zen_barrier = {
    config = {
      type = "OnDefend",
      subid = ConditionsSubIds.zen_sphere,
    },
    trigger = function(player, attacker, damage, primaryType, origin)
      return player:getCondition(CONDITION_ATTRIBUTES, 0, ConditionsSubIds.zen_sphere)
    end,
    effect = function(player, attacker, damage)
      if not player or not attacker or not damage then
        return
      end
      -- Absorb and heal for the damage amount
      local healAmount = math.abs(damage)
      --Increase the healing effectiveness of zen barrier by 10% (per level)
      local SereneAmplificationLevel = math.max(player:getStorageValue(PassiveSkills.SereneAmplification) or 0, 0)
      if SereneAmplificationLevel > 0 then
        healAmount = healAmount * (1 + (SereneAmplificationLevel / 100))
      end
      player:addHealth(healAmount)
      player:getPosition():sendMagicEffect(2)
      return 0
    end,
  },

  chi_reserve = {
    config = {
      type = "OnAttack",
      storage = PassiveSkills.ChiReserve,
    },
    trigger = function(player, target, damage, primaryType, origin)
      if primaryType ~= COMBAT_PHYSICALDAMAGE or origin ~= ORIGIN_MELEE then
        return false
      end
      local level = math.max(player:getStorageValue(PassiveSkills.ChiReserve) or 0, 0)
      if level > 0 then
        local chance = level
        return math.random(100) <= chance
      end
      return false
    end,
    effect = function(player, target, damage)
      if not player or not target or not damage then
        return
      end
      local playerPos = player:getPosition()
      local spectators = Game.getSpectators(playerPos, false, true, 5, 5, 5, 5)
      local allies = {}
      for _, creature in ipairs(spectators) do
        if creature:isPlayer() and creature ~= player and (not creature:getParty() or creature:getParty() == player:getParty()) then
          table.insert(allies, creature)
        end
      end
      if #allies > 0 then
        local chosen = allies[math.random(#allies)]
        chosen:addHealth(damage)
        --send distance effect from player to chosen
        player:getPosition():sendDistanceEffect(chosen:getPosition(), 156)
        player:getPosition():sendMagicEffect(572)
       -- player:say("Chi Reserve!", TALKTYPE_MONSTER_SAY)
      end
      return damage
    end,
  },

  mystic_punch = {
    config = {
      type = "OnAttack",
      storage = PassiveSkills.MysticPunch,
    },
    trigger = function(player, target, damage, primaryType, origin)
      if primaryType ~= COMBAT_PHYSICALDAMAGE then
        return false
      end
      local level = math.max(player:getStorageValue(PassiveSkills.MysticPunch) or 0, 0)
      if level > 0 then
        local chance = level
        return math.random(100) <= chance
      end
      return false
    end,
    effect = function(player, target, damage)
      if not player or not target or not damage then
        return
      end
      -- Mystic Punch: deal 150% of original damage and show effect
      local extraDamage = damage * 1.5
      local mysticEffects = {100, 101, 102, 103}
      local effectId = mysticEffects[math.random(#mysticEffects)]
      doTargetCombatHealth(player:getId(), target:getId(), COMBAT_PHYSICALDAMAGE, -math.floor(extraDamage), -math.floor(extraDamage), CONST_ME_NONE)
      target:attachEffectById(effectId, true)
      target:say(effectId, TALKTYPE_MONSTER_SAY)
      --Landing a mystic punch increases your attack speed by 8% (per level) for 5 seconds CONDITION_PARAM_SPECIALSKILL_ATTACKSPEED
      
      
      local InnerTempoLevel = math.max(player:getStorageValue(PassiveSkills.InnerTempo) or 0, 0)
      if InnerTempoLevel > 0 then
        local conditionInnerTempo = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
        conditionInnerTempo:setParameter(CONDITION_PARAM_TICKS, 5 * 1000)
        conditionInnerTempo:setParameter(CONDITION_PARAM_SPECIALSKILL_ATTACKSPEED, InnerTempoLevel)
        player:addCondition(conditionInnerTempo)
      end
      player:say("Mystic Punch!", TALKTYPE_MONSTER_SAY)
      return damage
    end,
  },

  tempest_god_stormfist_damage = {
    config = {
      type = "OnAttack",
      subid = ConditionsSubIds.stormfist,
    },
    trigger = function(player, target, damage, primaryType, origin)
      if origin ~= ORIGIN_MELEE then
        return false
      end
      -- Check for Stormfist buff (subid ConditionsSubIds.stormfist)
      return player:getCondition(CONDITION_ATTRIBUTES, 0, ConditionsSubIds.stormfist)
    end,
    effect = function(player, target, damage)
      if not player or not target or not damage then
        return
      end
      local level = math.max(player:getStorageValue(PassiveSkills.StormfistDamage) or 0, 0)
      local ampDamage = damage
      if level > 0 then
        ampDamage = damage * (1 + (level / 100))
      end
      
      -- Deal damage to main target
      doTargetCombatHealth(player:getId(), target:getId(), COMBAT_PHYSICALDAMAGE, -math.floor(ampDamage), -math.floor(ampDamage), CONST_ME_HITAREA)
      target:attachEffectById(9, true)
      -- Deal damage to nearby monsters (radius 2)
      local pos = target:getPosition()
      local spectators = Game.getSpectators(pos, false, false, 2, 2, 2, 2)
      for _, creature in ipairs(spectators) do
        if creature ~= target and not creature:isNpc() then
          doTargetCombatHealth(player:getId(), creature:getId(), COMBAT_PHYSICALDAMAGE, -math.floor(ampDamage), -math.floor(ampDamage), CONST_ME_HITAREA)
          creature:attachEffectById(9, true)
        end
      end
      return 0 -- Prevent double damage application
    end,
  },

  
  Falling_Stars = {
    config = {
      type = "OnAttack",
      storage = PassiveSkills.FallingStars,
    },
    trigger = function(player, target, damage, primaryType, origin)
      if primaryType ~= COMBAT_ENERGYDAMAGE then
        return false
      end
      local level = math.max(player:getStorageValue(PassiveSkills.FallingStars) or 0, 0)
      return level > 0
    end,
    effect = function(player, target, damage)
      if not player or not target or not damage then
        return
      end
      local level = math.max(player:getStorageValue(PassiveSkills.FallingStars) or 0, 0)
      -- 2% chance per level
      local chance = level
      if math.random(1, 100) <= chance then
        -- Call the star fall effect
          StarfallPassive(player:getId(), target:getId())
      end
      -- Optionally, return damage unchanged if no other effect
      return damage
    end,
  },

  cosmic_focus = {
    config = {
      type = "OnAttack",
      storage = PassiveSkills.CosmicFocus,
    },
    trigger = function(player, target, damage, primaryType, origin)
      if primaryType ~= COMBAT_ENERGYDAMAGE then
        return false
      end
      local level = math.max(player:getStorageValue(PassiveSkills.CosmicFocus) or 0, 0)
      return level > 0
    end,
    effect = function(player, target, damage)
      if not player or not target or not damage then
        return
      end
      local level = math.max(player:getStorageValue(PassiveSkills.CosmicFocus) or 0, 0)
      local percent = 1 + (level / 100)
      return damage * percent
    end,
  },
  
  holy_damage = {
    config = {
      type = "OnAttack",
      storage = PassiveSkills.HolyDamage,
    },
    trigger = function(player, target, damage, primaryType, origin)
      if primaryType ~= COMBAT_HOLYDAMAGE then
        return false
      end
      local level = math.max(player:getStorageValue(PassiveSkills.HolyDamage) or 0, 0)
      return level > 0
    end,
    effect = function(player, target, damage)
      if not player or not target or not damage then
        return
      end
      local level = math.max(player:getStorageValue(PassiveSkills.HolyDamage) or 0, 0)
      local percent = 1 + (level / 100)
      return damage * percent
    end,
  },

  consecrated_protection = {
    config = {
      subid = ConditionsSubIds.consecratedprotection,
      type = "OnDefend",
      storage = PassiveSkills.ConsecratedProtection,
    },
    trigger = function(player, attacker, damage, primaryType, origin) 
      return player:getCondition(CONDITION_ATTRIBUTES, 0, ConditionsSubIds.consecratedprotection)
    end,
    effect = function(player, attacker, damage)
      if not player or not attacker or not damage then
        return
      end
      local level = math.max(player:getStorageValue(PassiveSkills.ConsecratedProtection) or 0, 0)
      -- Glacial Empowerment effect
      local percent = level / 100
     -- player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
      return damage * percent
    end
  },

  elusive_dance = {
    config = {
      type = "OnDefense",
      storage = PassiveSkills.Quickstep,
    },
    trigger = function(player, attacker, damage, primaryType, origin)
      local level = math.max(player:getStorageValue(PassiveSkills.Quickstep) or 0, 0)
      return level > 0
    end,
    effect = function(player, attacker, damage)
      if not player or not attacker or not damage then
        return
      end
      local level = math.max(player:getStorageValue(PassiveSkills.Quickstep) or 0, 0)
      if level > 0 then
        local dodgeChance = level -- 2% per level
        if math.random(1, 100) <= dodgeChance then
          player:getPosition():sendMagicEffect(685)
          return 0 -- Dodge successful
        end
      end
      return damage
    end,
  },

  scent_of_blood = {
    config = {
      type = "OnAttack",
      storage = PassiveSkills.ScentOfBlood,
    },
    trigger = function(player, target, damage, primaryType, origin)
      -- Check if target is bleeding
      return target and target:getCondition(CONDITION_BLEEDING)
    end,
    effect = function(player, target, damage)
      if not player or not target or not damage then
        return
      end
      local level = math.max(player:getStorageValue(PassiveSkills.ScentOfBlood) or 0, 0)
      print("level: " .. level)
      if level > 0 then
        local percent = 1 + (level / 100) -- 3% per level 
        return damage * percent
      end
      return damage
    end,
  },

  unyielding_strength = {
    config = {
      type = "OnAttack",
      storage = PassiveSkills.UnyieldingStrength,
    },
    trigger = function(player, target, damage, primaryType, origin)
      if primaryType ~= COMBAT_PHYSICALDAMAGE then
        return false
      end
      local level = math.max(player:getStorageValue(PassiveSkills.UnyieldingStrength) or 0, 0)
      return level > 0
    end,
    effect = function(player, target, damage)
      if not player or not target or not damage then
        return
      end
      local level = math.max(player:getStorageValue(PassiveSkills.UnyieldingStrength) or 0, 0)
      local percent = 1 + (level / 100)
      return damage * percent
    end,
  },

  survival_instincts = {
    config = {
      type = "OnAttack",
      storage = PassiveSkills.SurvivalInstincts,
    },
    trigger = function(player, target, damage, primaryType, origin)
      -- Trigger on physical auto attacks
      if origin ~= ORIGIN_MELEE then
        return false
      end
      local level = math.max(player:getStorageValue(PassiveSkills.SurvivalInstincts) or 0, 0)
      return level > 0
    end,
    effect = function(player, target, damage)
      if not player or not target or not damage then
        return
      end
      local level = math.max(player:getStorageValue(PassiveSkills.SurvivalInstincts) or 0, 0)
      if level > 0 then
        local maxHealth = player:getMaxHealth()
        local currentHealth = player:getHealth()
        local missingPercent = math.max(0, (maxHealth - currentHealth) / maxHealth)

        -- Heal = missingPercent * level * maxHealth * 0.01
        local healAmount = math.floor(missingPercent * level * maxHealth * 0.01)
        if healAmount > 0 then
          player:addHealth(healAmount)
          player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
        end
      end
      return damage
    end,
  },

  ember_touch = {
    config = {
      type = "OnAttack",
      storage = PassiveSkills.EmberTouch,
    },
    trigger = function(player, target, damage, primaryType, origin)
      if origin ~= ORIGIN_MELEE then
        return false
      end
      local level = math.max(player:getStorageValue(PassiveSkills.EmberTouch) or 0, 0)
      return level > 0 and target and target:isCreature()
    end,
    effect = function(player, target, damage)
      if not player or not target or not damage then
        return
      end
      local level = math.max(player:getStorageValue(PassiveSkills.EmberTouch) or 0, 0)
      if level > 0 and target and target:isCreature() then
        local chance = level
        if math.random(1, 100) <= chance then
          local burn = Condition(CONDITION_FIRE)
          burn:setParameter(CONDITION_PARAM_TICKS, 2000 * level)
          burn:setParameter(CONDITION_PARAM_DELAYED, 1)
          burn:setParameter(CONDITION_PARAM_TICKINTERVAL, 1000)
          --target 0.5% max health
          burn:setParameter(CONDITION_PARAM_PERIODICDAMAGE, -(target:getMaxHealth() * 0.03))
          target:addCondition(burn)
        end
      end
      return damage
    end,
  },

  flame_eater = {
    config = {
      type = "OnAttack",
      storage = PassiveSkills.FlameEater,
    },
    trigger = function(player, target, damage, primaryType, origin)
      if not target or not target:isCreature() then
        return false
      end
      local level = math.max(player:getStorageValue(PassiveSkills.FlameEater) or 0, 0)
      return level > 0 and target:getCondition(CONDITION_FIRE)
    end,
    effect = function(player, target, damage)
      if not player or not target or not damage then
        return
      end
      local level = math.max(player:getStorageValue(PassiveSkills.FlameEater) or 0, 0)
      if level > 0 and target:getCondition(CONDITION_FIRE) then
        local percent = 1 + (level / 100)
        return damage * percent
      end
      return damage
    end,
  },

  emberhide = {
    config = {
      type = "OnDefend",
      storage = PassiveSkills.Emberhide,
    },
    trigger = function(player, attacker, damage, primaryType, origin)
      -- Trigger for all non-physical damage types
      return primaryType ~= COMBAT_PHYSICALDAMAGE and (player:getStorageValue(PassiveSkills.Emberhide) or 0) > 0
    end,
    effect = function(player, attacker, damage, primaryType, origin)
      if not player or not attacker or not damage then
        return
      end
      local level = math.max(player:getStorageValue(PassiveSkills.Emberhide) or 0, 0)
      if level > 0 then
        local percent = 1 - (level / 100)
        return damage * percent
      end
      return damage
    end,
  },

  GlacialEmpowerment = {
    config = {
      type = "OnAttack",
      storage = PassiveSkills.FrostDamage,
    },
    trigger = function(player, target, damage, primaryType, origin)
      if primaryType ~= COMBAT_ICEDAMAGE then
        return false
      end
      local level = math.max(player:getStorageValue(PassiveSkills.FrostDamage) or 0, 0)
      return level > 0
    end,
    effect = function(player, target, damage)
      if not player or not target or not damage then
        return
      end
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
    trigger = function(player, target, damage, primaryType, origin)
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
      if not player or not target or not damage then
        return
      end
      -- Deal extra holy damage equal to double the original primary damage
      local holyDamage = damage * 2
      doTargetCombatHealth(player:getId(), target:getId(), COMBAT_HOLYDAMAGE, -holyDamage, -holyDamage, CONST_ME_HOLYAREA)
      target:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
      return damage
    end,
  },

  blazingdecree = {
    config = {
      type = "OnAttack",
      storage = PassiveSkills.BlazingDecree,
    },
    trigger = function(player, target, damage, primaryType, origin)
      if primaryType ~= COMBAT_FIREDAMAGE then
        return false
      end
      local level = math.max(player:getStorageValue(PassiveSkills.BlazingDecree) or 0, 0)
      return level > 0
    end,
    effect = function(player, target, damage)
      if not player or not target or not damage then
        return
      end
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
    trigger = function(player, target, damage, primaryType, origin)
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
      if not player or not target or not damage then
        return
      end
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
 
  
  blood_blades = {
    config = {
      subid = ConditionsSubIds.blood_blades,
      type = "OnAttack"
    },
    trigger = function(player, target, damage, primaryType, origin)
      return origin == ORIGIN_MELEE
    end,
    effect = function(player, target, damage)
      if not player or not target or not damage then
        return
      end
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
    trigger = function(player, attacker, damage, primaryType, origin)
      local monster_level = attacker:getMonsterLevel()
      local player_level = player:getLevel()
      return monster_level > 0 and (monster_level - player_level) > 0
    end,
    effect = function(player, target, damage)
      if not player or not target or not damage then
        return
      end
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
    trigger = function(player, target, damage, primaryType, origin)
      local monster_level = target:getMonsterLevel()
      local player_level = player:getLevel()
      return monster_level > 0 and (monster_level - player_level) > 0
    end,
    effect = function(player, target, damage)
      if not player or not target or not damage then
        return
      end
      local monster_level = target:getMonsterLevel()
      local player_level = player:getLevel()
      local level_difference = monster_level - player_level
      local amp = 1 + (level_difference * PASSIVES.Monster_damage_amplification.config.amplificationFactor)
      local new_damage = math.floor(damage * amp)
      return new_damage
    end
  },
  
  
  light_dancer = {
    config = {
      type = "OnAttack",
      storage = PassiveSkills.ShortCircuit,
    },
    trigger = function(player, target, damage, primaryType, origin)
      if origin ~= ORIGIN_MELEE then
        print("Origin is not melee")
        return
      end
      return target:getCondition(CONDITION_ENERGY, 0, ConditionsSubIds.static_charge)
    end,
    effect = function(player, target, damage)
      if not player or not target or not damage then
        return
      end
      
      local ShortCircuitLevel = math.max(player:getStorageValue(PassiveSkills.ShortCircuit) or 0, 0)
      --Your attacks deal extra 20% damage (per level)
      local extraDamage = damage * (1 + (ShortCircuitLevel / 100))

      doTargetCombatHealth(player:getId(), target:getId(), COMBAT_ENERGYDAMAGE, -extraDamage, -extraDamage, CONST_ME_NONE)
      target:attachEffectById(147, true)

    local HighVoltageLevel = math.max(player:getStorageValue(PassiveSkills.HighVoltage) or 0, 0)
    if HighVoltageLevel > 0 then
      --15% chance
      if math.random(1, 100) <= 25 then
        --increases your magic level by 10% condition
        local condition = Condition(CONDITION_ATTRIBUTES)
        condition:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.highvoltagelevel)
        condition:setParameter(CONDITION_PARAM_TICKS, 6000)
        condition:setParameter(CONDITION_PARAM_STAT_MAGICPOINTSPERCENT, 100 + HighVoltageLevel)
        condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
        player:addCondition(condition)
      end
    end

    local LightsONLevel = math.max(player:getStorageValue(PassiveSkills.LightsON) or 0, 0)
    if LightsONLevel > 0 then
      --restore 2% of your total mana per hit
      local mana = player:getMaxMana() * (LightsONLevel / 100)
      player:addMana(mana)
    end

      return 0
    end
  },
  
  Deathbringer = {
    config = {
      type = "OnAttack",
      storage = PassiveSkills.Deathbringer,
    },
    trigger = function(player, target, damage, primaryType, origin)
      if origin ~= ORIGIN_MELEE then
        return false
      end
      return player:getStorageValue(PassiveSkills.Deathbringer) > 0
    end,
    effect = function(player, target, damage)
      if not player or not target or not damage then
        return
      end
      local extraDamage = 1.8
      local level = math.max(player:getStorageValue(PassiveSkills.Deathbringer) or 0, 0)
      if level > 0 then
        if math.random(1, 100) <= level then
          local new_damage = damage * extraDamage
          doTargetCombatHealth(player:getId(), target:getId(), COMBAT_DEATHDAMAGE, -new_damage, -new_damage, 18)
          local min = (damage * 0.35)
          local max = (damage * 0.4)
          player:addMana(math.random(min, max))
          player:attachEffectById(71, true)
        end
      end
      return damage
    end
  },
  
  dark_aura_damage_reduction = {
    config = {
      subid = ConditionsSubIds.darkaura,
      type = "OnDefend"
    },
    trigger = function(player, attacker, damage, origin)
      return player:getCondition(CONDITION_ATTRIBUTES, 0, ConditionsSubIds.darkaura)
    end,
    effect = function(player, attacker, damage)
      if not player or not attacker or not damage then
        return
      end
      return damage * 0.75
    end
  },

  shieldwall_damage_reduction = {
    config = {
      subid = ConditionsSubIds.shieldwall,
      type = "OnDefend"
    },
    trigger = function(player, attacker, damage, origin)
      return player:getCondition(CONDITION_ATTRIBUTES, 0, ConditionsSubIds.shieldwall)
    end,
    effect = function(player, attacker, damage)
      if not player or not attacker or not damage then
        return
      end
      return damage * 0.75
    end
  },

  
  frostbloom_shield = {
    config = {
      subid = ConditionsSubIds.frostbloom,
      type = "OnDefend"
    },
    trigger = function(player, attacker, damage, origin)
      return player:getCondition(CONDITION_ATTRIBUTES, 0, ConditionsSubIds.frostbloom)
    end,
    effect = function(player, attacker, damage)
      if not player or not attacker or not damage then
        return
      end
      player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
      return damage * 0.8
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
      if not player or not target or not damage then
        return
      end
      local function getMaxServants(playerLevel)
        --default max 3
        local maxServants = 3
        local legionMasteryNumber = player:getStorageValue(PassiveSkills.LegionMasteryNumber)
        
        if legionMasteryNumber > 0 then
          maxServants = maxServants + legionMasteryNumber
        end
        return maxServants
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
            local healthAmount = player:getMaxHealth() * 0.7
            local bulwark = math.max(player:getStorageValue(PassiveSkills.DemonicBulwark) or 0, 0)
            healthAmount = healthAmount + (healthAmount * (bulwark / 100))
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
      local LegionMasteryChance = player:getStorageValue(PassiveSkills.LegionMasteryChance) or 0
      trySummonServant(player, 1 + LegionMasteryChance)  -- 10% chance on damage
      return damage
    end
  },


}

-- Health change handler
function passiveEvent.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
  --print("[Passive System] Health change event triggered for " .. creature:getName())
  
  local allowedAttackTypes = {
    [COMBAT_ICEDAMAGE] = true,
    [COMBAT_PHYSICALDAMAGE] = true,
    [COMBAT_FIREDAMAGE] = true,
    [COMBAT_EARTHDAMAGE] = true,
    [COMBAT_ENERGYDAMAGE] = true,
    [COMBAT_HOLYDAMAGE] = true,
    [COMBAT_DEATHDAMAGE] = true,
    [COMBAT_LIFEDRAIN] = true,
    [COMBAT_MANADRAIN] = true
  }
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
                          (passiveData.config.subid and player:getCondition(CONDITION_ATTRIBUTES, 0, passiveData.config.subid))
          
          if meetsReq and passiveData.trigger(player, creature, primaryDamage, primaryType, origin) and allowedAttackTypes[primaryType] then
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

  local allowedDefendTypes = {
    [COMBAT_ICEDAMAGE] = true,
    [COMBAT_PHYSICALDAMAGE] = true,
    [COMBAT_FIREDAMAGE] = true,
    [COMBAT_EARTHDAMAGE] = true,
    [COMBAT_ENERGYDAMAGE] = true,
    [COMBAT_HOLYDAMAGE] = true,
    [COMBAT_DEATHDAMAGE] = true,
    [COMBAT_LIFEDRAIN] = true,
    [COMBAT_MANADRAIN] = true
  }
  
  -- Handle defender passives (OnDefend)
  if creature:isPlayer() then
    local player = creature:getPlayer()
    local vocationId = player:getVocation():getId()
    
    for passiveName, passiveData in pairs(PASSIVES) do
      if passiveData.config.type == "OnDefend" then
       -- print("[Passive System] Checking defend passive: " .. passiveName)
        
        -- Check requirements
        if not (passiveData.config.playerOnly and not creature:isPlayer()) then
          local meetsReq = (passiveData.config.vocation and (type(passiveData.config.vocation) == "table" and table.contains(passiveData.config.vocation, vocationId) or vocationId == passiveData.config.vocation)) or 
                          (passiveData.config.storage and player:getStorageValue(passiveData.config.storage) > 0) or
                          (passiveData.config.subid and player:getCondition(CONDITION_ATTRIBUTES, 0, passiveData.config.subid))
          
          if meetsReq and passiveData.trigger(player, attacker, primaryDamage, primaryType, origin) and allowedDefendTypes[primaryType] then
            --print("[Passive System] Defend passive triggered: " .. passiveName)
            

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
       -- print("Max servants allowed: " .. maxServants)
        
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
    target:registerEvent("LucellaTransform")
    target:registerEvent("quests_kill_drops") 
	target:registerEvent("LuckDrops") 
  return true
end

TargetCombatEventpassives:register()
-- Register all events
passiveEvent:type("healthchange")
passiveEvent:register()

loginEventpassives:type("login")
loginEventpassives:register()

print(">> Unified passives system loaded")
