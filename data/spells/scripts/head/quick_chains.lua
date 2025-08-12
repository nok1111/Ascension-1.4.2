local config = {
    maxDist = 7,
    distEffect = 121,        --Don't change this since is for animation, and the dist would break if u change it
    distTimer = 3          --Sorry ;-;
}


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


function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then
        print("[Quick Chains] onCastSpell: no player found!")
        return false
    end

    -- Check if boots are equipped in feet slot
    local boots = player:getSlotItem(CONST_SLOT_HEAD)
    if not boots or boots:getId() ~= 38156 then
        player:sendCancelMessage("You must equip the Quick Chains spell to use this effect.")
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

    local direction = creature:getDirection() -- 0=N,1=E,2=S,3=W etc (TFS standard)
    local maxTiles = 7
    local effect = 121 -- chain effect
    local chaintipEffect = 120 -- chain tip effect

    local foundTarget = nil
    local stopChain = false
    local chainPos = Position(playerPos.x, playerPos.y, playerPos.z)
    
    for i = 1, maxTiles do
        if stopChain then break end
        chainPos = Position(chainPos.x, chainPos.y, chainPos.z)
        chainPos = chainPos:getBehindPos(direction, 1)
        -- Send chain animation
        playerPos:sendDistanceEffect(chainPos, chaintipEffect)
        
        for t = 1, 8 do
            if stopChain then break end
            addEvent(function(cx, cy, cz, effectId)
                if stopChain then return end
                local fromPos = Position(playerPos.x, playerPos.y, playerPos.z)
                local toPos = Position(cx, cy, cz)
                fromPos:sendDistanceEffect(toPos, effectId)
            end, t*100, chainPos.x, chainPos.y, chainPos.z, effect)
        end


        -- Check for creatures
        local tile = Tile(chainPos)
        if tile then
            local creatures = tile:getCreatures()
            if creatures then
                for _, target in ipairs(creatures) do
                    if not isExcludedTarget(creature, target) and target:getSpeed() > 0 then
                        foundTarget = target
                        stopChain = true
                        break
                    end
                end
            end
        end
        if foundTarget then break end
    end

    if foundTarget then
        local function getStepDirection(fromPos, toPos)
            local dx = toPos.x - fromPos.x
            local dy = toPos.y - fromPos.y
            if math.abs(dx) > math.abs(dy) then
                return dx > 0 and DIRECTION_EAST or DIRECTION_WEST
            elseif dy ~= 0 then
                return dy > 0 and DIRECTION_SOUTH or DIRECTION_NORTH
            else
                return nil
            end
        end

        local function moveTargetStep(cid, tx, ty, tz, px, py, pz, effectId, playerId)
            local target = Creature(cid)
            local player = Creature(playerId)
            if not target or not player then return end
            local tpos = Position(tx, ty, tz)
            local ppos = Position(px, py, pz)
            local playerPos = player:getPosition()
            if tpos:getDistance(ppos) <= 1 then
                return
            end
            local dir = getStepDirection(tpos, ppos)
            if dir then
                local nextPos = Position(tpos.x, tpos.y, tpos.z)
                if dir == DIRECTION_NORTH then nextPos.y = nextPos.y - 1
                elseif dir == DIRECTION_SOUTH then nextPos.y = nextPos.y + 1
                elseif dir == DIRECTION_EAST then nextPos.x = nextPos.x + 1
                elseif dir == DIRECTION_WEST then nextPos.x = nextPos.x - 1 end
                -- Only move if tile is walkable
                if Tile(nextPos) and Tile(nextPos):getGround() then
                    target:teleportTo(nextPos, true)
                    local minDamagepull = (player:getLevel() *0.1) + 1
                    local maxDamagepull = (player:getLevel() *0.2) + 2
                    doTargetCombatHealth(player:getId(), target:getId(), COMBAT_DEATHDAMAGE, -minDamagepull, -maxDamagepull, CONST_ME_NONE)
                    nextPos:sendDistanceEffect(playerPos, effectId)
                    for d = 1, 25 do
                        addEvent(function()
                            nextPos:sendDistanceEffect(playerPos, effectId)
                        end, d * 2)
                    end
                    addEvent(moveTargetStep, 10, cid, nextPos.x, nextPos.y, nextPos.z, px, py, pz, effectId, playerId)
                else
                    -- If blocked, stop
                    tpos:sendMagicEffect(CONST_ME_POFF)
                end
            end
        end
        addEvent(moveTargetStep, 30, foundTarget:getId(), foundTarget:getPosition().x, foundTarget:getPosition().y, foundTarget:getPosition().z, playerPos.x, playerPos.y, playerPos.z, effect, creature:getId())
    end



    return true
end
