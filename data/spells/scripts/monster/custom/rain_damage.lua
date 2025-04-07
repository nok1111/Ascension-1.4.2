-- Delayed AoE Looping Spell

local AREA_CENTER = 668
local DAMAGE_EFFECT = 472
local damageInterval = 200 -- ms
local totalDuration = 3000 -- ms
local damagePercent = 0.05 -- 5% of max HP

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, DAMAGE_EFFECT)

local areaOffsets = {
    {-1, -1}, {0, -1}, {1, -1},
    {-1, 0},  {0, 0},  {1, 0},
    {-1, 1},  {0, 1},  {1, 1}
}

local function loopDamage(creatureId, centerPos, loopsLeft)
    local creature = Creature(creatureId)
    if not creature or loopsLeft <= 0 then return end

    local randomOffset = areaOffsets[math.random(#areaOffsets)]
    local targetPos = Position(centerPos.x + randomOffset[1], centerPos.y + randomOffset[2], centerPos.z)
    combat:execute(creature, Variant(targetPos))

    addEvent(loopDamage, damageInterval, creatureId, centerPos, loopsLeft - 1)
end

function onCastSpell(creature, variant)
    local specs = Game.getSpectators(creature:getPosition(), false, true, 5, 5, 3, 3)
    local playerTargets = {}
    for _, spec in ipairs(specs) do
        if spec:isPlayer() and spec ~= creature then
            table.insert(playerTargets, spec)
        end
    end

    if #playerTargets == 0 then return true end

    local target = playerTargets[math.random(#playerTargets)]
    local centerPos = target:getPosition()
    local effect_offset = Position(centerPos.x + 2, centerPos.y + 2, centerPos.z)
    effect_offset:sendMagicEffect(AREA_CENTER)

    addEvent(function(cid, pos)
        local caster = Creature(cid)
        if caster then
            loopDamage(caster:getId(), pos, totalDuration / damageInterval)
        end
    end, 1500, creature:getId(), centerPos)

    return true
end
