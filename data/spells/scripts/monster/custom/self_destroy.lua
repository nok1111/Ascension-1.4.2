local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))


function onCastSpell(creature, variant)
    local pos = creature:getPosition()
    combat:execute(creature, Variant(pos))
    pos:sendMagicEffect(291)
    Position(pos.x + 3, pos.y + 3, pos.z):sendMagicEffect(631)
    creature:remove()
    return true
end
