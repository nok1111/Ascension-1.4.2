local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)


local arr = {
        {0, 1, 1, 1, 0},
        {1, 1, 1, 1, 1},
        {1, 1, 3, 1, 1},
        {1, 1, 1, 1, 1},
        {0, 1, 1, 1, 0}
}

local area = createCombatArea(arr)
    combat:setArea(area)

function onGetFormulaValues(player, skill, attack, factor)
  local frostAuraLevel = player:getStorageValue(PassiveSkills.FrostAura) or 0
  --dealing frostAuraLevel% of your max mana as ice damage
  local maxMana = player:getMaxMana()
  local min = maxMana * (frostAuraLevel / 100)
  local max = maxMana * (frostAuraLevel / 100)
    
    return -min, -max
end
    combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function repeatAuraTicks(playerId, variant, ticksLeft)
    local player = Player(playerId)
    if not player or ticksLeft <= 0 then
        return
    end
    combat:execute(player, variant)
    addEvent(repeatAuraTicks, 1000, playerId, variant, ticksLeft - 1)
end

function onCastSpell(creature, variant)
	local player = Player(creature)
  if not player then
    return 
  end

    local frost_armor = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
    frost_armor:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
    frost_armor:setParameter(CONDITION_PARAM_SUBID, 29513)
    frost_armor:setParameter(CONDITION_PARAM_STAT_MAXHEALTHPOINTSPERCENT, 125)

    --local durationLevel = math.max(player:getStorageValue(PassiveSkills.StormfistDuration) or 0, 0)
    local duration = 8000 --+ (durationLevel * 1000)

    frost_armor:setParameter(CONDITION_PARAM_TICKS, duration)

    player:addCondition(frost_armor)
    player:attachEffectById(120, true)
    player:attachEffectById(121, true)

      -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(120, duration / 1000, 'Reduce Damage taken by 20% and deals ice damage back to the attacker.', 3, 0)
      
    local frostAuraLevel =  player:getStorageValue(PassiveSkills.FrostAura) or 0
    if frostAuraLevel > 0 then
        repeatAuraTicks(player:getId(), variant, 8)
        player:attachEffectById(123, true)
    end


    return true
end
