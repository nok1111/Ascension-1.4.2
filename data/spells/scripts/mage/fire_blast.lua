

-- Pre-create combat areas at load time.
local areaSmall = createCombatArea(AREA_SQUARE1X1)

-- Primary combat object using the small area.
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:setArea(areaSmall)


-- Primary damage formula.
function onGetFormulaValues(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = skill * attack
    local magicpower = magic * attack
    local level = player:getLevel()
    

    local min = ((level / 5) + (power * 0.045) + (magicpower * 0.12) + 15) * 1
    local max = ((level / 5) + (power * 0.055) + (magicpower * 0.14) + 20) * 1

    local emberSurgeLevel = math.max(player:getStorageValue(PassiveSkills.EmberSurge) or 0, 0)
    local emberSurgeBonus = 1 + (emberSurgeLevel / 100)
    if emberSurgeBonus > 1 then
        min = min * emberSurgeBonus
        max = max * emberSurgeBonus
    end
    return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")



-- Cast spell callback.
function onCastSpell(creature, variant)
    if not creature then return false end

 	combat:execute(creature, variant)


    return true
end
