

local monster_ressistance = CreatureEvent("monster_ressistance")

function monster_ressistance.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
  if not creature:isMonster() then
    return primaryDamage, primaryType, secondaryDamage, secondaryType
  end

  if not attacker:isPlayer() then
    return primaryDamage, primaryType, secondaryDamage, secondaryType
  end

  local monsterLevel = creature:getMonsterLevel() or 0
    if monsterLevel < 1 then 
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

  local maxMissChance = 75
  local levelDifferenceFactor = 1.0

  local player_level = attacker:getLevel()
  local level_difference = monsterLevel - player_level
  local miss_chance = math.min(level_difference * levelDifferenceFactor, maxMissChance)
      
  if math.random(100) <= miss_chance then
    creature:getPosition():sendMagicEffect(700)
    return 0, primaryType, secondaryDamage, secondaryType
  end


  return primaryDamage, primaryType, secondaryDamage, secondaryType
end

monster_ressistance:register()
