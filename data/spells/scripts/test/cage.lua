local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_TELEPORT)

local function removeItems(pos, itemID)
    local positions = {
        {x = pos.x - 1, y = pos.y - 1, z = pos.z},
        {x = pos.x - 1, y = pos.y, z = pos.z},
        {x = pos.x - 1, y = pos.y + 1, z = pos.z},
        {x = pos.x, y = pos.y - 1, z = pos.z},
        {x = pos.x, y = pos.y + 1, z = pos.z},
        {x = pos.x + 1, y = pos.y - 1, z = pos.z},
        {x = pos.x + 1, y = pos.y, z = pos.z},
        {x = pos.x + 1, y = pos.y + 1, z = pos.z}
    }

    for _, position in ipairs(positions) do
        local item = Tile(position):getItemById(itemID)
        if item then
            item:remove()
        end
    end
end

local function swapPositionsAndSummonMonster(params)
    local target = Creature(params.target)
    local caster = Creature(params.caster)
    local itemID = params.itemID
    local summonMonster = params.summonMonster
    local duration = params.duration

    if not target or not caster then
        return
    end

    local targetPos = target:getPosition()
    local casterPos = caster:getPosition()

    target:teleportTo(casterPos)
    caster:teleportTo(targetPos)

    local positions = {
        {x = targetPos.x - 1, y = targetPos.y - 1, z = targetPos.z},
        {x = targetPos.x - 1, y = targetPos.y, z = targetPos.z},
        {x = targetPos.x - 1, y = targetPos.y + 1, z = targetPos.z},
        {x = targetPos.x, y = targetPos.y - 1, z = targetPos.z},
        {x = targetPos.x, y = targetPos.y + 1, z = targetPos.z},
        {x = targetPos.x + 1, y = targetPos.y - 1, z = targetPos.z},
        {x = targetPos.x + 1, y = targetPos.y, z = targetPos.z},
        {x = targetPos.x + 1, y = targetPos.y + 1, z = targetPos.z}
    }

    for _, position in ipairs(positions) do
        Game.createItem(itemID, 1, position)
    end

    Game.createMonster(summonMonster, targetPos, true, true)

    addEvent(removeItems, duration * 1000, targetPos, itemID)
end

function onCastSpell(creature, variant)
    local target = creature:getTarget()
    if not target then
        return false
    end

    local params = {
        target = target:getId(),
        caster = creature:getId(),
        itemID = 1275, -- Example item ID
        summonMonster = "Demon", -- Example monster to summon
        duration = 10 -- Duration in seconds
    }

    addEvent(swapPositionsAndSummonMonster, 1, params)
    return true
end
