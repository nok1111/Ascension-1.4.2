local area = createCombatArea{
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0}
}

local damageDelay = 1000 -- Delay for damage and magic effect in milliseconds (1 second)

function onCastSpell(cid, variant)
    if not cid then
        return false
    end


    -- Apply magic effect
        local warningeffect = cid:getPosition()
        warningeffect.x = warningeffect.x + 2
        warningeffect.y = warningeffect.y + 2
        warningeffect:sendMagicEffect(468)

    -- Schedule delayed damage and effect
    addEvent(function()
        if not cid or cid:isRemoved() then
            return
        end

        -- Apply area damage
        local min = 350
        local max = 400
        doAreaCombatHealth(cid:getId(), COMBAT_ENERGYDAMAGE, cid:getPosition(), area, -min, -max, CONST_ME_NONE)

        -- Apply magic effect
        local positioneffect = cid:getPosition()
        positioneffect.x = positioneffect.x + 3
        positioneffect.y = positioneffect.y + 3
        positioneffect:sendMagicEffect(322)

        -- Remove the caster
        cid:remove()
    end, damageDelay)

    return true
end
