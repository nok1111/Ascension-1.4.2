local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA) 


local function getBladePositions(center, bladeCount, radius)
    local positions = {}
    local angleStep = (2 * math.pi) / bladeCount

    for i = 0, bladeCount - 1 do
        local angle = angleStep * i
        local x = math.floor(center.x + radius * math.cos(angle) + 0.5)
        local y = math.floor(center.y + radius * math.sin(angle) + 0.5)
        table.insert(positions, Position(x, y, center.z))
    end

    return positions
end

local function attackWithBlade(creatureId, blades, targets, remainingTime)
    local creature = Creature(creatureId)
    if not creature or remainingTime <= 0 then return end

    local casterPos = creature:getPosition()
    if #targets == 0 then
        casterPos:sendMagicEffect(math.random(629,629)) 
        return
    end

    -- Pick a random target from the list
    local target = targets[math.random(#targets)]
    if target and target:isCreature() then
        local targetPos = target:getPosition()

        -- Blade strike effect and damage
        combat:execute(creature, Variant(targetPos))
        targetPos:sendMagicEffect(math.random(629,629))

    end

    
    addEvent(attackWithBlade, 500, creatureId, blades, targets, remainingTime - 1)
end

function onCastSpell(creature, variant)
    local casterPos = creature:getPosition()
    local targets = {}

    for _, spec in ipairs(Game.getSpectators(casterPos, false, false, 5, 5, 5, 5)) do
        if spec:isMonster() or spec:isPlayer() then
            table.insert(targets, spec)
        end
    end

    if #targets == 0 then
        return false
    end

    local bladeCount = math.min(#targets, 3) -- Max 3 cyclones
    local blades = getBladePositions(casterPos, bladeCount, 2) -- cyclones appear in a circle radius 2

    -- Summon blades around caster
    for _, pos in ipairs(blades) do
        pos:sendMagicEffect(CONST_ME_MAGIC_GREEN)
    end

    addEvent(attackWithBlade, 500, creature:getId(), blades, targets, 10) -- Lasts 5 seconds (500 * 10)

    return true
end
