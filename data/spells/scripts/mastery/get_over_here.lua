local config = {
    maxDist = 7,
    distEffect = 121,        --Don't change this since is for animation, and the dist would break if u change it
    distTimer = 3          --Sorry ;-;
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, false)

function onTargetCreature(creature, target)
    return doChallengeCreature(creature, target)
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

function onGetFormulaValues(player, skill, attack, factor)

	local min = (player:getLevel() / 2) 
	local max = (player:getLevel() / 2) 
	
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function getRepelTilesChain(cid)
    return 3
end
 
local function getNextPosChain(creature, target, tiles)
    local cid = creature:getPosition()
    local tar = target:getPosition()
    local x,y,z = (cid.x-tar.x),(cid.y-tar.y),(cid.z-tar.z)
    local newx,newy,newz = tar.x,tar.y,tar.z
    local value = 0
    if math.abs(x) ~= 4 or math.abs(y) ~= 4 then
        if x == 0 then
            if y > 0 then
                value = 6
            elseif y < 0 then
                value = 2
            end
        elseif y == 0 then
            if x > 0 then
                value = 4
            elseif x < 0 then
                value = 0
            end
        elseif x > 0 then
            if y > 0 then
                value = 5
            elseif y < 0 then
                value = 3
            end
        elseif x < 0 then
            if y > 0 then
                value = 7
            elseif y < 0 then
                value = 1
            end
        end--Working until here
    elseif x==-4 then
        if math.abs(y) == 3 then
            value = 0
        elseif y == 0 then
            value = 0
        elseif y > 0 then
            value = 7
        elseif y < 0 then
            value = 1
        end
    elseif x == 4 then
        if math.abs(y) == 3 then
            value = 4
        elseif y == 0 then
            value = 4
        elseif y > 0 then
            value = 5
        elseif y < 0 then
            value = 3
        end
    elseif y == -4 then
        if math.abs(x) == 3 then
            value = 2
        elseif x == 0 then
            value = 2
        elseif x > 0 then
            value = 3
        elseif x < 0 then
            value = 1
        end
    elseif y == 4 then
        if math.abs(x) == 3 then
            value = 6
        elseif x == 0 then
            value = 6
        elseif x > 0 then
            value = 5
        elseif x < 0 then
            value = 7 
        end
    end

    local places = {
      [0] = {x=newx-tiles, y=newy, z=newz, stackpos = 253},
      [1] = {x=(newx-tiles), y=(newy-tiles), z=newz, stackpos = 253},
      [2] = {x=newx, y=(newy-tiles), z=newz, stackpos = 253},
      [3] = {x=(newx+tiles), y=(newy-tiles), z=newz, stackpos = 253},
      [4] = {x=(newx+tiles), y=newy, z=newz, stackpos = 253},
      [5] = {x=(newx+tiles), y=(newy+tiles), z=newz, stackpos = 253},
      [6] = {x=newx, y=(newy+tiles), z=newz, stackpos = 253},
      [7] = {x=(newx-tiles), y=(newy+tiles), z=newz, stackpos = 253}
    }
    return places[value]
end

local function doTheMoving(stop, cid, target, tiles, combat, variant)
    if stop == true then return true end
    local creature = Creature(cid)
    if creature and creature:getSpeed() > 0 then
        local targetO = Creature(target)
        if targetO then
            if queryTileAddThing(targetO, getNextPosChain(creature, targetO, 1)) ~= RETURNVALUE_NOERROR or targetO:getPosition():getDistance(creature:getPosition()) == 1 then
                stop = true
                return true
            end
            if creature:getTarget() ~= targetO then
                stop = true
            end
            local oldPos = targetO:getPosition()
            targetO:teleportTo(getNextPosChain(creature, targetO, 1), true)
            creature:getTarget():getPosition():sendDistanceEffect(targetO:getPosition(), 121)
            targetO:getPosition():sendMagicEffect(10)
            if creature:getPosition():isSightClear(targetO:getPosition(), true) then
                variant = numberToVariant(target)
                combat:execute(creature, variant)
            end
            tiles = tiles-1
        end
    end
end
 
local function doRepelChain(cid, target, tiles, variant)
    local startingTiles = tiles
    local stop = false
    local creatureId = cid:getId()
    local targetId = target:getId()
    if queryTileAddThing(target, getNextPosChain(cid, target, 1)) == RETURNVALUE_NOERROR then
        for i = 0, 5, 1 do
            addEvent(doTheMoving, 250*i, stop, creatureId, targetId, tiles, combat, variant)
            if queryTileAddThing(target, getNextPosChain(cid, target, 1)) ~= RETURNVALUE_NOERROR or target:getPosition():getDistance(cid:getPosition()) < 2 then
                stop = true
            end
            if target:getPosition():getDistance(cid:getPosition()) == 1 then
                break
            end
            if stop == true then
                break
            end
        end
    end
end

local function goAnimation(stopIt, cid, tid)
    if stopIt == true then return true end
    local creature = Creature(cid)
    if creature and creature:getSpeed() > 0 then
        local target = Creature(tid)
        if target then
            if creature:getPosition():isSightClear(target:getPosition(), true) then
                creature:getPosition():sendDistanceEffect(target:getPosition(), 121)
            end
            if target:getPosition():getDistance(creature:getPosition()) < 2 or creature:getTarget()~=target then
                stopIt = true
            end
        end
    end
end

local function triggering(cid, tid)
    local creature = Creature(cid)
    if creature and creature:getSpeed() > 0 then
        local target = Creature(tid)
        if target then
            if target:getPosition():getDistance(creature:getPosition()) > config.maxDist then 
                creature:sendCancelMessage("Target is too far.")
                creature:getPosition():sendMagicEffect(CONST_ME_POFF)
                return false 
            end
            if (target:isPlayer(i)) or (target:isMonster()) then
                if queryTileAddThing(target, getNextPosChain(creature, target, 1)) == RETURNVALUE_NOERROR then
                    if (isPlayer(target.uid)) or (isMonster(target.uid)) and getTilePzInfo(getCreaturePosition(creature)) == FALSE then
                        doRepelChain(creature, Creature(target.uid), getRepelTilesChain(creature), var)
                    end
                else
                    doPlayerSendCancel(creature, "Something is in the way to repel the target.")
                end
            else
                doPlayerSendCancel(creature, "There is no target to repel.")
            end
        end
    end
end
 
function onCastSpell(creature, var)
    local playerPos = creature:getPosition()
    local direction = creature:getDirection() -- 0=N,1=E,2=S,3=W etc (TFS standard)
    local maxTiles = 7
    local effect = 121 -- chain effect
    local chaintipEffect = 120 -- chain tip effect

    local foundTarget = nil
    local chainPos = Position(playerPos.x, playerPos.y, playerPos.z)
    for i = 1, maxTiles do
        chainPos = Position(chainPos.x, chainPos.y, chainPos.z)
        chainPos = chainPos:getBehindPos(direction, 1)
        -- Send chain animation
        playerPos:sendDistanceEffect(chainPos, chaintipEffect)
        for t = 1, 3 do
            addEvent(function(px, py, pz, cx, cy, cz, effectId)
                local fromPos = Position(px, py, pz)
                local toPos = Position(cx, cy, cz)
                fromPos:sendDistanceEffect(toPos, effectId)
            end, t*50, playerPos.x, playerPos.y, playerPos.z, chainPos.x, chainPos.y, chainPos.z, chaintipEffect)
        end


        for j = 1, 16 do
            addEvent(function(px, py, pz, cx, cy, cz, effectId)
                local fromPos = Position(px, py, pz)
                local toPos = Position(cx, cy, cz)
                fromPos:sendDistanceEffect(toPos, effectId)
            end, 50, playerPos.x, playerPos.y, playerPos.z, chainPos.x, chainPos.y, chainPos.z, effect)
        end

        -- Check for creatures
        local tile = Tile(chainPos)
        if tile then
            local creatures = tile:getCreatures()
            for _, target in ipairs(creatures) do
                if (target:isMonster() or (target:isPlayer() and target.uid ~= creature.uid)) and target:getSpeed() > 0 then
                    foundTarget = target
                    break
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

        local function moveTargetStep(cid, tx, ty, tz, px, py, pz, effectId)
            local target = Creature(cid)
            if not target then return end
            local tpos = Position(tx, ty, tz)
            local ppos = Position(px, py, pz)
            if tpos.x == ppos.x and tpos.y == ppos.y and tpos.z == ppos.z then
                tpos:sendMagicEffect(CONST_ME_TELEPORT)
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
                    tpos:sendDistanceEffect(nextPos, effectId)
                    addEvent(moveTargetStep, 30, cid, nextPos.x, nextPos.y, nextPos.z, px, py, pz, effectId)
                else
                    -- If blocked, stop
                    tpos:sendMagicEffect(CONST_ME_POFF)
                end
            end
        end
        addEvent(moveTargetStep, 30, foundTarget:getId(), foundTarget:getPosition().x, foundTarget:getPosition().y, foundTarget:getPosition().z, playerPos.x, playerPos.y, playerPos.z, effect)
    end

    return true
end