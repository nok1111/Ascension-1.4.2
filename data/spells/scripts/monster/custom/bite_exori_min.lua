local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 216)
combat:setFormula(COMBAT_FORMULA_DAMAGE, -150, 0, -250, 0)

local arr = {
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0}
}

local area = createCombatArea(arr)
combat:setArea(area)

function onCastSpell(creature, var)
    return combat:execute(creature, var)
end