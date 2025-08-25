local combat = Combat()
local time_between_hits = 0.2 --seconds
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 180)
combat:setParameter(COMBAT_PARAM_EFFECT, 571)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)



function onGetFormulaValues(player, skill, attack, factor)

	local magic = player:getMagicLevel()
    local power = skill * attack
    local magicpower = magic * attack
    local level = player:getLevel()
    

    local min = ((level / 5) + (power * 0.045) + (magicpower * 0.12) + 15) * 0.6
    local max = ((level / 5) + (power * 0.055) + (magicpower * 0.14) + 20) * 0.7
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function restoreMana(player)
    -- Ensure the 'player' object is valid
    if not player or not player:isPlayer() then
        return false
    end

    local maxMana = player:getMaxMana() -- Get the player's maximum mana

    
    local manaToRestore = math.floor(maxMana * 0.03) -- Calculate 3% of total mana
    local storage = player:getStorageValue(PassiveSkills.SurgeRecovery) or 0
    if storage > 0 then
        manaToRestore = math.floor(maxMana * (1 + storage / 100))
    end
    -- Use addMana to add the calculated mana to the player's current mana
    player:addMana(manaToRestore)

    -- Assuming we have a way to get the player's position for the magic effect
    local pos = player:getPosition()

    -- Get player's position for the magic effect
    local pos = player:getPosition()
    -- Create the 'mana up' magic effect at the player's position
    doSendMagicEffect(pos, 1173) -- Adjust CONST_ME_MAGIC_BLUE to your effect constant

    
    return true
end

-- Example usage:
-- Assuming you have a way to reference the player object, perhaps triggered by an in-game event or command
-- 


function onCastSpell(creature, var)
   combat:execute(creature, var)
   restoreMana(creature)
   --max 6 charges
   local maxCharges = 6
   local currentCharges = getBuffStack(creature, "ArcaneSurge")
   if currentCharges < maxCharges then
      addBuffStack(creature, "ArcaneSurge", 1)
      local updatedCharges = getBuffStack(creature, "ArcaneSurge")
      creature:sendAddBuffNotification(37, -1, 'Arcane Surge', 5, updatedCharges)
   end
  return true
end
