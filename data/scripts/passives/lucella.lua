-- lucella.lua
-- Revscript HealthChange event for Lucella's transformation

local lucellaTransform = CreatureEvent("LucellaTransform")

function lucellaTransform.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
  -- Only apply to monster Lucella
  if not creature:isMonster() or creature:getName():lower() ~= "lucella" then
    return primaryDamage, primaryType, secondaryDamage, secondaryType
  end

  -- Only trigger if below 50% HP and doesn't already have the transform condition
  if creature:getHealth() / creature:getMaxHealth() < 0.5 and not creature:getCondition(CONDITION_ATTRIBUTES, 0, ConditionsSubIds.lucellatransform) then
    local transformed = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
    transformed:setParameter(CONDITION_PARAM_TICKS, -1)
    transformed:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.lucellatransform)
    creature:addCondition(transformed)
    creature:attachEffectById(155, true)
    -- heal monster
    creature:addHealth(creature:getMaxHealth() * 0.5)
    -- send effect with x and y offset
    local targetPos = creature:getPosition()
    targetPos.x = targetPos.x + 2
    targetPos.y = targetPos.y + 1
    targetPos:sendMagicEffect(1067)
  end

  return primaryDamage, primaryType, secondaryDamage, secondaryType
end

lucellaTransform:register()
