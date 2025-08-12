local config = {
    itemId = 33995,
    effect = 448, -- choose a strong melee effect
    delay = 200, -- ms between tile steps
    healPercent = 0.5, -- percent of damage dealt to heal
    combatType = COMBAT_EARTHDAMAGE
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, config.combatType)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_NONE)

local area = createCombatArea({
    {1},
    {1},
})
combat:setArea(area)

function onGetFormulaValues(player, skill, attack, factor)
    local level = player:getLevel()
    local min = (level * 4) + 10
    local max = (level * 5) + 20
    return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function doSmashingBlowStep(playerGuid, startPos, direction, dist, maxDist, totalDamage)
    local player = Player(playerGuid)
    if not player then return end
    local offset = {x=0, y=0}
    if direction == DIRECTION_NORTH then offset.y = -dist
    elseif direction == DIRECTION_SOUTH then offset.y = dist
    elseif direction == DIRECTION_EAST then offset.x = dist
    elseif direction == DIRECTION_WEST then offset.x = -dist
    end
    local pos = Position(startPos.x + offset.x, startPos.y + offset.y, startPos.z)
    pos:sendMagicEffect(config.effect)
    
    local damage = combat:execute(player, Variant(pos)) or 0

    local level = player:getLevel()
    local min = (level * 4) + 10
    local max = (level * 5) + 20

    totalDamage = math.random(min, max)
    if dist < maxDist then
        addEvent(function()
            doSmashingBlowStep(playerGuid, startPos, direction, dist + 1, maxDist, totalDamage)
        end, config.delay)
    else
        -- Heal after both hits
        if totalDamage > 0 then
            player:addHealth(totalDamage)
            player:getPosition():sendMagicEffect(701)
        end
    end
end

function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then return false end
    local item = player:getSlotItem(CONST_SLOT_HEAD)
    if not item or item:getId() ~= config.itemId then
        player:sendCancelMessage("You must equip the Smashing Blow item to use this spell.")
        return false
    end

    local targetPos = variant:getPosition()
    local playerPos = player:getPosition()
    local dx = targetPos.x - playerPos.x
    local dy = targetPos.y - playerPos.y

    local direction
    if math.abs(dx) > math.abs(dy) then
        if dx > 0 then
            direction = DIRECTION_EAST
        else
            direction = DIRECTION_WEST
        end
    else
        if dy > 0 then
            direction = DIRECTION_SOUTH
        else
            direction = DIRECTION_NORTH
        end
    end

    player:setDirection(direction)
    
    local direction = creature:getDirection()
    local startPos = player:getPosition()
    doSmashingBlowStep(creature:getId(), startPos, direction, 1, 2, 0)
    return true
end
