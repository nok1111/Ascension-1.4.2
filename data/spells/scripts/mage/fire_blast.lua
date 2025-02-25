local maxBoosters = 3

-- Pre-create combat areas at load time.
local areaSmall = createCombatArea(AREA_CROSS1X1)
local areaLarge = createCombatArea(AREA_CIRCLE2X2)

-- Primary combat object using the small area.
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:setArea(areaSmall)

-- Secondary combat object using the larger area and a modified damage formula.
local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat2:setArea(areaLarge)

-- Primary damage formula.
function onGetFormulaValues(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = magic * attack 
    local level = player:getLevel()
    local min = (level / 5) + (power * 0.045) + attack
    local max = (level / 5) + (power * 0.065) + attack * 1.5
    return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

-- Secondary damage formula: a bit more damage.
function onGetFormulaValues2(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = magic * attack 
    local level = player:getLevel()
    local min = (level / 5) + (power * 0.045) + attack
    local max = (level / 5) + (power * 0.065) + attack * 1.75  -- Increased multiplier for extra damage
    return -min, -max
end
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

-- Cast spell callback.
function onCastSpell(creature, variant)
    if not creature then return false end

    -- Execute the primary combat effect.
    

    -- If the creature has reached max fire boosters, execute the extra effect.
    if getElementalBoost(creature, "fire") >= maxBoosters then
         combat2:execute(creature, variant)
         ClearBooster(creature)
 else
 	combat:execute(creature, variant)
    end

    return true
end
