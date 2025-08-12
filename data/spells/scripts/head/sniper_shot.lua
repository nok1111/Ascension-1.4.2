local config = {
    itemId = 34015,
    effect = 321, -- placeholder, adjust as needed
    distEffect = 191,
    delay = 1, -- ms between tile steps
    healPercent = 0.5, -- percent of damage dealt to heal
    explosionEffect = 949,
    combatType = COMBAT_HOLYDAMAGE
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, config.combatType)
--combat:setParameter(COMBAT_PARAM_EFFECT, config.effect)
--combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, config.distEffect)

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

local function isExcludedTarget(creature, target)
    if not creature or not target then
        return true
    end

	if target:isNpc() then
		return true
	end

    -- Exclude party members and their summons
    if creature:isPlayer() and target:isPlayer() then
        local creatureParty = creature:getParty()
        local targetParty = target:getParty()
        if creatureParty and targetParty and creatureParty == targetParty then
            return true
        end
    end
    if target:isMonster() and target:getMaster() then
        local master = target:getMaster()
        if master:isPlayer() and creature:getParty() and master:getParty() == creature:getParty() then
            return true
        end
    end

    -- Secure mode check to exclude non-party players and their summons
    local player = creature:isPlayer() and creature or creature:getMaster()
    if player and player:hasSecureMode() then
        if target:isPlayer() or (target:isMonster() and target:getMaster() and target:getMaster():isPlayer()) then
            return true
        end
    end
    
    return false
end


function doSniperShotStep(creatureId, startPos, direction, step, maxRange, targetPos)
    local creature = Creature(creatureId)
    if not creature then return end
    local player = creature:getPlayer()
    if not player then return end

    local offset = {x=0, y=0}
    if direction == DIRECTION_NORTH then offset.y = -step
    elseif direction == DIRECTION_SOUTH then offset.y = step
    elseif direction == DIRECTION_EAST then offset.x = step
    elseif direction == DIRECTION_WEST then offset.x = -step
    end
    local pos = Position(startPos.x + offset.x, startPos.y + offset.y, startPos.z)

    -- Send magic effect at each step until reaching targetPos (if set), or until max range
    pos:sendMagicEffect(config.effect)

    local tile = Tile(pos)
    if tile then
        local creatures = tile:getCreatures()
        for j = 1, #creatures do
            local target = creatures[j]
            if not isExcludedTarget(player, target) then
                -- Apply damage
                local level = player:getLevel()
                local min = (level * step) + 5
                local max = (level * step) + 10
                local damage = math.random(min, max)
                doTargetCombatHealth(player, target, config.combatType, -damage, -damage, config.effect)

                local positionSniperExplosion = Position(target:getPosition().x + 1, target:getPosition().y + 1, target:getPosition().z)
                positionSniperExplosion:sendMagicEffect(662) 
                
                --player:addHealth(damage)
                return -- Stop effect on first hit
            end
        end
    end

    if (not targetPos and step < maxRange) or (targetPos and (pos.x ~= targetPos.x or pos.y ~= targetPos.y or pos.z ~= targetPos.z) and step < maxRange) then
        addEvent(doSniperShotStep, config.delay, creatureId, startPos, direction, step + 1, maxRange, targetPos)
    end
end

function getFirstValidTargetPosition(startPos, direction, maxRange, player)
    print("getFirstValidTargetPosition")
    for i = 1, maxRange do
        local offset = {x=0, y=0}
        if direction == DIRECTION_NORTH then offset.y = -i
        elseif direction == DIRECTION_SOUTH then offset.y = i
        elseif direction == DIRECTION_EAST then offset.x = i
        elseif direction == DIRECTION_WEST then offset.x = -i
        end
        local pos = Position(startPos.x + offset.x, startPos.y + offset.y, startPos.z)
        local tile = Tile(pos)
        if tile then
            -- Block if solid or protection zone
            if tile:hasFlag(TILESTATE_BLOCKSOLID) or tile:hasFlag(TILESTATE_PROTECTIONZONE) then
                break
            end
            local creatures = tile:getCreatures()
            if creatures then
                for j = 1, #creatures do
                    local target = creatures[j]
                    if not isExcludedTarget(player, target) then
                        return pos
                    end
                end
            end
        end
    end
    return nil
end


function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then return false end
    local item = player:getSlotItem(CONST_SLOT_HEAD)
    if not item or item:getId() ~= config.itemId then
        player:sendCancelMessage("You must equip the Sniper Shot item to use this spell.")
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
    local targetPos = getFirstValidTargetPosition(startPos, direction, 10, player)
    if targetPos then




        startPos:sendDistanceEffect(targetPos, config.distEffect)
        combat:execute(creature, variant, targetPos)
        doSniperShotStep(creature:getId(), startPos, direction, 1, 10, targetPos)

        

        
    else
        combat:execute(creature, variant, startPos)
        doSniperShotStep(creature:getId(), startPos, direction, 1, 10, nil)

        --send distance effect to max range
        local offset = {x=0, y=0}
        if direction == DIRECTION_NORTH then offset.y = -10
        elseif direction == DIRECTION_SOUTH then offset.y = 10
        elseif direction == DIRECTION_EAST then offset.x = 10
        elseif direction == DIRECTION_WEST then offset.x = -10
        end
        local maxPos = Position(startPos.x + offset.x, startPos.y + offset.y, startPos.z)
        startPos:sendDistanceEffect(maxPos, config.distEffect)
    end
    return true
end
