local config = {
    maxDist = 7,
    itemId = 38202,
    effect = 1129, -- visual effect for boomerang
    delay = 600, -- ms between tile steps
    combatType = COMBAT_PHYSICALDAMAGE
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, config.combatType)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_NONE)

local area = createCombatArea({
    {0, 0, 0, 0, 0},
    {0, 1, 1, 1, 0},
    {0, 1, 3, 1, 0},
    {0, 1, 1, 1, 0},
    {0, 0, 0, 0, 0}
    })
combat:setArea(area)

function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()


	local min = (level * 3) + 15
	local max = (level * 4.2) + 25
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function getDirectionOffset(direction)
    if direction == DIRECTION_NORTH then return {x=0, y=-1}
    elseif direction == DIRECTION_EAST then return {x=1, y=0}
    elseif direction == DIRECTION_SOUTH then return {x=0, y=1}
    elseif direction == DIRECTION_WEST then return {x=-1, y=0}
    end
    return {x=0, y=0}
end

function doBoomerangStep(playerGuid, startPos, direction, dist, maxDist, forward)
    local player = Player(playerGuid)
    if not player then return end
    local offset = getDirectionOffset(direction)
    local pos = Position(startPos.x + offset.x * dist, startPos.y + offset.y * dist, startPos.z)
    -- Visual effect
    local posBoomerang = Position(startPos.x + offset.x * dist, startPos.y + offset.y * dist, startPos.z)
    local positionBoomerang = posBoomerang
    positionBoomerang.x = posBoomerang.x + 2
    positionBoomerang.y = posBoomerang.y + 1
    positionBoomerang:sendMagicEffect(config.effect)

    -- Damage
    combat:execute(player, Variant(pos))
    if forward then
        if dist < maxDist then
            addEvent(function()
                doBoomerangStep(playerGuid, startPos, direction, dist + 1, maxDist, true)
            end, config.delay)
        else
            -- Start backward
            addEvent(function()
                doBoomerangStep(playerGuid, startPos, direction, maxDist - 1, maxDist, false)
            end, config.delay)
        end
    else
        if dist > 0 then
            addEvent(function()
                doBoomerangStep(playerGuid, startPos, direction, dist - 1, maxDist, false)
            end, config.delay)
        end
    end
end



function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then return false end
    local item = player:getSlotItem(CONST_SLOT_HEAD)
    if not item or item:getId() ~= config.itemId then
        player:sendCancelMessage("You must equip the Boomerang item to use this spell.")
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
    doBoomerangStep(creature:getId(), startPos, direction, 1, config.maxDist, true)
    return true
end
