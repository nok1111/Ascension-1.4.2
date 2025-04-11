-- Arrow Spray Cone Spell (Directional)

local damage = 80
local delay = 50
local effect = 123

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 7)
--combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, 0, -damage, 0, -damage)

-- Base offset cone pattern facing EAST
-- Base offset cone pattern facing EAST
local coneOffsets = {
    {x = 1, y = -1}, {x = 1, y = 0}, {x = 1, y = 1},
    {x = 2, y = -2}, {x = 2, y = -1}, {x = 2, y = 0}, {x = 2, y = 1}, {x = 2, y = 2},
    {x = 3, y = -3}, {x = 3, y = -2}, {x = 3, y = -1}, {x = 3, y = 0}, {x = 3, y = 1}, {x = 3, y = 2}, {x = 3, y = 3},
    {x = 4, y = -4}, {x = 4, y = -3}, {x = 4, y = -2}, {x = 4, y = -1}, {x = 4, y = 0}, {x = 4, y = 1}, {x = 4, y = 2}, {x = 4, y = 3}, {x = 4, y = 4}
}

-- Rotation helpers
local function rotateOffset(offset, dir)
    local x, y = offset.x, offset.y
    if dir == DIRECTION_NORTH then return {x = -y, y = -x}
    elseif dir == DIRECTION_SOUTH then return {x = y, y = x}
    elseif dir == DIRECTION_WEST then return {x = -x, y = -y}
    else return offset end -- DIRECTION_EAST
end

function onCastSpell(creature, variant)
    local casterPos = creature:getPosition()
    local dir = creature:getDirection()

    for i, offset in ipairs(coneOffsets) do
        addEvent(function(cid, offsetData)
            local caster = Creature(cid)
            if not caster then return end

            local rotated = rotateOffset(offsetData, dir)
            local toPos = Position(caster:getPosition().x + rotated.x, caster:getPosition().y + rotated.y, caster:getPosition().z)
            caster:getPosition():sendDistanceEffect(toPos, effect)
            combat:execute(caster, Variant(toPos))
        end, i * delay, creature:getId(), offset)
    end

    return true
end
