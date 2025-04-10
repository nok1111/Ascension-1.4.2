-- Thunder Chant - Troll Shaman Spell


local WARNING_EFFECT = 78 -- cloudy warning area
local DAMAGE_DELAY = 1500 -- delay before strike


local combat = Combat()

local groundoffset = {x = 0, y = 0}
local thunderEffectPosOffset = {x = 1, y = 0}
local warning_offset = {x = 2, y = 2}

combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)

combat:setArea(createCombatArea(AREA_CIRCLE3X3))


function onCastSpell(creature, variant)
    local spectators = Game.getSpectators(creature:getPosition(), false, true, 6, 6, 6, 6)
    local players = {}
    for _, spec in ipairs(spectators) do
        if spec:isPlayer() then
            table.insert(players, spec)
        end
    end

    if #players == 0 then return true end

    local target = players[math.random(#players)]
    local pos = target:getPosition()
    --pos:sendMagicEffect(WARNING_EFFECT)
     Position(pos.x + warning_offset.x, pos.y + warning_offset.y, pos.z):sendMagicEffect(668)
   

    addEvent(function(cid, tpos)
        local caster = Creature(cid)
        if caster then
            combat:execute(caster, Variant(tpos))
            Position(tpos.x + groundoffset.x, tpos.y + groundoffset.y, tpos.z):sendMagicEffect(7)
             Position(tpos.x + thunderEffectPosOffset.x, tpos.y + thunderEffectPosOffset.y, tpos.z):sendMagicEffect(345)
        end
    end, DAMAGE_DELAY, creature:getId(), pos)

    return true
end
