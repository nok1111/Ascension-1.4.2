local maxBoosters = 3

-- Load PassiveSkills symbolic constants
if not PassiveSkills then
    dofile('data/scripts/PassiveTree/0_PassiveSkillsDataConfig.lua')
end

local PYROMANIAC_STORAGE = PassiveSkills.Pyromaniac -- or the storage ID directly
local PYROMANIAC_EXTRA_FIREBALLS = 2
local PYROMANIAC_FIREBALL_EFFECTIVENESS = 0.75


-- Pre-create combat areas at load time.
local areaSmall = createCombatArea(AREA_CROSS1X1)
local areaLarge = createCombatArea(AREA_CIRCLE2X2)

-- Primary combat object using the small area.
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:setArea(areaSmall)

-- Secondary combat object using the larger area and a modified damage formula.
local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat2:setArea(areaLarge)

-- Primary damage formula.
function onGetFormulaValues(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = magic * attack
    local level = player:getLevel()
    local emberSurgeLevel = math.max(player:getStorageValue(PassiveSkills.EmberSurge) or 0, 0)
    local emberSurgeBonus = 1 + (emberSurgeLevel / 100)
    print("emberSurgeBonus: " .. emberSurgeBonus)
    local min = ((level / 5) + (power * 0.045) + attack) * emberSurgeBonus
    local max = ((level / 5) + (power * 0.065) + attack * 1.5) * emberSurgeBonus
    return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

-- Secondary damage formula: a bit more damage.
function onGetFormulaValues2(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = magic * attack
    local level = player:getLevel()
    local emberSurgeLevel = player:getStorageValue(PassiveSkills.EmberSurge) or 0
    local emberSurgeBonus = 1 + (emberSurgeLevel / 100)
    local min = ((level / 5) + (power * 0.045) + attack) * emberSurgeBonus
    local max = ((level / 5) + (power * 0.065) + attack * 1.75) * emberSurgeBonus
    return -min, -max
end
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

-- Cast spell callback.
function onCastSpell(creature, variant)
    if not creature then return false end

    -- Execute the primary combat effect.
    
    -- Call unified passives with spellType context for fire spells
    if passiveEvent and type(passiveEvent.onHealthChange) == "function" then
        passiveEvent.onHealthChange(creature, creature, 0, 0, 0, 0, {spellType = "fire"})
    end
    

    -- If the creature has reached max fire boosters, execute the extra effect.
    if getElementalBoost(creature, "fire") >= maxBoosters then
         combat2:execute(creature, variant)
         ClearBooster(creature)
 else
 	combat:execute(creature, variant)
    end

    return true
end
