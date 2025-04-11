-- Poison Wave Spell: Applies poison in a 1x6 animated wave

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_POISONAREA)

local function applyPoisonwave(creature, target)
    print("proc")
    local minPercent = 0.01
    local maxPercent = 0.02
    local damagePerTick = math.random(minPercent * 100, maxPercent * 100) / 100 * target:getMaxHealth()

    local poison = Condition(CONDITION_POISON)
    poison:setParameter(CONDITION_PARAM_DELAYED, true)
    poison:setParameter(CONDITION_PARAM_TICKS, 5000)
    poison:setParameter(CONDITION_PARAM_TICKINTERVAL, 1000)
    poison:setParameter(CONDITION_PARAM_PERIODICDAMAGE, -math.floor(damagePerTick))
    target:addCondition(poison)
    print(target:getName())
end

function onCastSpell(creature, variant)
    local casterPos = creature:getPosition()
    local dir = creature:getDirection()

 for i = 1, 6 do
    addEvent(function(cid, step)
        local caster = Creature(cid)
        if not caster then return end

        local stepPos = Position(caster:getPosition().x + Position.directionOffset[dir].x * step,
                                 caster:getPosition().y + Position.directionOffset[dir].y * step,
                                 caster:getPosition().z)

        stepPos:sendMagicEffect(CONST_ME_POISONAREA)
        caster:getPosition():sendDistanceEffect(stepPos, CONST_ANI_POISON)

        local tile = Tile(stepPos)
        if tile then
            local targets = tile:getCreatures()
            if targets then
                for _, target in ipairs(targets) do
                    if target:isPlayer() or target:isMonster() then
                        applyPoisonwave(caster, target)
                    end
                end
            end
        end
    end, i * 150, creature:getId(), i)
end

    return true
end
