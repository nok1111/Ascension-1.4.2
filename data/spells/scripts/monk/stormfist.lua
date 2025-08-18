local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
combat:setArea(createCombatArea({
    {1, 1, 1},
    {1, 3, 1},
    {1, 1, 1}
}))


function onGetFormulaValues(player, skill, attack, factor)
  local sword = player:getEffectiveSkillLevel(SKILL_SWORD)
  local power = sword * attack
  local level = player:getLevel()
  local min = (level / 4) + (power * 0.055) + attack * 1.1
  local max = (level / 4) + (power * 0.095) + attack * 1.7
  return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function isExcludedTarget(creature, target)
  if not creature or not target then
      return true
  end
  if target:isNpc() then
      return true
  end
  -- Exclude party members and their summons
  if creature:isPlayer() and target:isPlayer() then
      local creatureParty = creature:getParty()
      local targetParty = target:getParty()
      if creatureParty and targetParty and creatureParty == targetParty then
          return true
      end
  end
  if target:isMonster() and target:getMaster() then
      local master = target:getMaster()
      if master:isPlayer() and creature:getParty() and master:getParty() == creature:getParty() then
          return true
      end
  end
  -- Secure mode check
  local player = creature:isPlayer() and creature or creature:getMaster()
  if player and player:hasSecureMode() then
      if target:isPlayer() or (target:isMonster() and target:getMaster() and target:getMaster():isPlayer()) then
          return true
      end
  end
  return false
end

function onTargetCreature(creature, target)
  if not isExcludedTarget(creature, target) then

      target:attachEffectById(9, true)
      target:attachEffectById(197, true)
      target:attachEffectById(198, true)
      target:addCondition(stunCondition)
  end
  return true
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

function onCastSpell(creature, variant)
  local player = Player(creature)
  if not player then
     return
  end

  local target = player:getTarget()
  if not target then
     return
  end

    local durationLevel = math.max(player:getStorageValue(PassiveSkills.StormfistDuration) or 0, 0)
    local duration = 3000 + (durationLevel * 1000)

    local stormfist = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
    stormfist:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
    stormfist:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.stormfist)
    stormfist:setParameter(CONDITION_PARAM_SKILL_MELEEPERCENT, 140)
    stormfist:setParameter(CONDITION_PARAM_TICKS, duration)

    player:addCondition(stormfist)
    player:attachEffectById(216, true)
    combat:execute(player, variant)


    
	 -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(19, duration / 1000, 'Your physical damage sends a lighting shock to nearby target and gain 40% melee stats.', 3, 0)

    return true
end
