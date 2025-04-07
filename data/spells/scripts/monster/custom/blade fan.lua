-- Rogue Boss Spell: Blade Fan

local directions = {
    {dx = 3, dy = 0},    -- East
    {dx = -3, dy = 0},   -- West
    {dx = 0, dy = -3},   -- North
    {dx = 0, dy = 3},    -- South
    {dx = 3, dy = -3},   -- North-East
    {dx = -3, dy = -3},  -- North-West
    {dx = 3, dy = 3},    -- South-East
    {dx = -3, dy = 3}    -- South-West
}

local damagePercent = 0.08 -- 8% of max HP
local bladeEffect = CONST_ANI_WHIRLWINDAXE
local hitEffect = CONST_ME_DRAWBLOOD

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, hitEffect)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, 0, 0, 0, 0)

function onCastSpell(creature, variant)
    local casterPos = creature:getPosition()

    for _, dir in ipairs(directions) do
        for step = 1, 3 do
            local targetPos = Position(casterPos.x + dir.dx * step / 3, casterPos.y + dir.dy * step / 3, casterPos.z)
            casterPos:sendDistanceEffect(targetPos, bladeEffect)

            addEvent(function(cid, pos)
                local c = Creature(cid)
                if c then
                    combat:execute(c, Variant(pos))
                end
            end, 250 + step * 50, creature:getId(), targetPos)
        end
    end

    return true
end
