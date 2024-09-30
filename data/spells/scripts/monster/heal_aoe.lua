local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 215)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setArea(createCombatArea(AREA_SQUARE1X1))

function onTargetCreature(creature, target)
    if target:isPlayer() then
        return true
    end

    local min, max = 3500, 5500
    doTargetCombatHealth(0, target, COMBAT_HEALING, min, max, 217)
    return true
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")


function onCastSpell(creature, variant)

return combat:execute(creature, variant)
end