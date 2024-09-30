-- Damaging Area
local hitArea = {
    {1, 1, 1},
    {1, 2, 1},
    {1, 1, 1}
}

-- Animation Frames
local animationArea = {
    {
        {0, 0, 0, 0, 0},
        {0, 0, 1, 0, 0},
        {0, 1, 2, 1, 0},
        {0, 0, 1, 0, 0},
        {0, 0, 0, 0, 0}
    },
    {
        {0, 0, 0, 0, 0},
        {0, 1, 0, 1, 0},
        {0, 0, 0, 0, 0},
        {0, 1, 0, 1, 0},
        {0, 0, 0, 0, 0}
    },
    {
        {0, 1, 1, 1, 0},
        {1, 0, 0, 0, 1},
        {1, 0, 0, 0, 1},
        {1, 0, 0, 0, 1},
        {0, 1, 1, 1, 0}
    }
}

-- Get position behind target
function Position:getBehindPos(direction, steps)
    local offset = Position.directionOffset[direction]
    if offset then
        steps = steps or 1
        self.x = self.x + offset.x * steps
        self.y = self.y + offset.y * steps
    end
    return self
end

-- For shuffling the secondaryPosition table
function shuffle(t)
    local rand = math.random
    assert(t, "table.shuffle() expected a table, got nil")
    local iterations = #t
    local j
 
    for i = iterations, 2, -1 do
        j = rand(i)
        t[i], t[j] = t[j], t[i]
    end
end

-- Get 8-Axis direction of fromPos -> toPos
function Position:getDirectionTo(toPosition)
    local dir = DIRECTION_NORTH
    if(self.x > toPosition.x) then
        dir = DIRECTION_WEST
        if(self.y > toPosition.y) then
            dir = DIRECTION_NORTHWEST
        elseif(self.y < toPosition.y) then
            dir = DIRECTION_SOUTHWEST
        end
    elseif(self.x < toPosition.x) then
        dir = DIRECTION_EAST
        if(self.y > toPosition.y) then
            dir = DIRECTION_NORTHEAST
        elseif(self.y < toPosition.y) then
            dir = DIRECTION_SOUTHEAST
        end
    else
        if(self.y > toPosition.y) then
            dir = DIRECTION_NORTH
        elseif(self.y < toPosition.y) then
            dir = DIRECTION_SOUTH
        end
    end
    return dir
end

-- Animation frame magic effect
function animation(pos, playerpos, animationType)
    if not Tile(Position(pos)):hasProperty(CONST_PROP_BLOCKPROJECTILE) then
        if Position(pos):isSightClear(playerpos) then
            if animationType == 0 then
                Position(pos):sendMagicEffect(CONST_ME_POFF)
            end
            Position(pos):sendMagicEffect(564)
        end
    end
end

-- Stun animation magic effect
function stunAnimation(stunnedcreature, stunnedpos, counter)
    if counter ~= 0 and Creature(stunnedcreature) then
        stunnedpos:sendMagicEffect(CONST_ME_STUN)
        counter = counter - 1
        addEvent(stunAnimation, 500, stunnedcreature, stunnedpos, counter)
    end
    return true
end

-- Damage Formula
function onGetFormulaValues(player, skill, attack, factor)
    local skillTotal = skill * attack
    local levelTotal = player:getLevel() / 5
    return -(((skillTotal * 0.06) + 13) + (levelTotal)), -(((skillTotal * 0.11) + 27) + (levelTotal))
end
 
local combat = Combat()
    combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
    combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
    combat:setArea(createCombatArea(hitArea))
    combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(creature, var)
 
    -- Defaults
    local centre = {}
    local damageArea = {}
    local pushTargets = {}
    local blockedPos = {}
    local playerPos = creature:getPosition()
    local delay = 100
    local stunDuration = 5000
 
    -- Get creatures in squares around caster
    local getTargets = Game.getSpectators(playerPos, false, false, 3, 3, 3, 3)
 
    -- Shuffle targets so its random who prioritizes which squares/positions
    shuffle(getTargets)
 
    for _,target in pairs(getTargets) do
        if target.uid ~= creature.uid then -- If target is not the caster
            if not target:isNpc() and target:getSpeed() > 0 then -- only target Players and Monsters
                local targetPos = target:getPosition()
                local playerDir = playerPos:getDirectionTo(targetPos)
                if playerDir then
                    local nextPos = Position(targetPos):getBehindPos(playerDir, 1) -- Tile to push to
                    if Tile(nextPos):hasProperty(CONST_PROP_BLOCKSOLID) or Tile(nextPos):hasFlag(TILESTATE_FLOORCHANGE) or Tile(nextPos):getCreatureCount() > 0 then -- If tile to push to is invalid/blocked
                      
                        -- Alternative push positions
                        local secondaryPositions = {}
                      
                        -- Get alternative push positions
                        if playerDir == DIRECTION_NORTH then
                            table.insert(secondaryPositions, Position(targetPos):getBehindPos(DIRECTION_NORTHEAST, 1))
                            table.insert(secondaryPositions, Position(targetPos):getBehindPos(DIRECTION_NORTHWEST, 1))
                        elseif playerDir == DIRECTION_NORTHEAST then
                            table.insert(secondaryPositions, Position(targetPos):getBehindPos(DIRECTION_NORTH, 1))
                            table.insert(secondaryPositions, Position(targetPos):getBehindPos(DIRECTION_EAST, 1))
                        elseif playerDir == DIRECTION_EAST then
                            table.insert(secondaryPositions, Position(targetPos):getBehindPos(DIRECTION_NORTHEAST, 1))
                            table.insert(secondaryPositions, Position(targetPos):getBehindPos(DIRECTION_SOUTHEAST, 1))
                        elseif playerDir == DIRECTION_SOUTHEAST then
                            table.insert(secondaryPositions, Position(targetPos):getBehindPos(DIRECTION_EAST, 1))
                            table.insert(secondaryPositions, Position(targetPos):getBehindPos(DIRECTION_SOUTH, 1))
                        elseif playerDir == DIRECTION_SOUTH then
                            table.insert(secondaryPositions, Position(targetPos):getBehindPos(DIRECTION_SOUTHEAST, 1))
                            table.insert(secondaryPositions, Position(targetPos):getBehindPos(DIRECTION_SOUTHWEST, 1))
                        elseif playerDir == DIRECTION_SOUTHWEST then
                            table.insert(secondaryPositions, Position(targetPos):getBehindPos(DIRECTION_SOUTH, 1))
                            table.insert(secondaryPositions, Position(targetPos):getBehindPos(DIRECTION_WEST, 1))
                        elseif playerDir == DIRECTION_WEST then
                            table.insert(secondaryPositions, Position(targetPos):getBehindPos(DIRECTION_SOUTHWEST, 1))
                            table.insert(secondaryPositions, Position(targetPos):getBehindPos(DIRECTION_NORTHWEST, 1))
                        elseif playerDir == DIRECTION_NORTHWEST then
                            table.insert(secondaryPositions, Position(targetPos):getBehindPos(DIRECTION_WEST, 1))
                            table.insert(secondaryPositions, Position(targetPos):getBehindPos(DIRECTION_NORTH, 1))
                        end
                      
                        -- Shuffle alternative push positions
                        shuffle(secondaryPositions)
                      
                        -- Check for valid positions
                        local validSecondary = false
                        for i = 1, #secondaryPositions do
                            if not validSecondary then
                                local position = secondaryPositions[i]
                                local creatureCheck = Tile(nextPos):getCreatureCount()
                                if not Tile(position):hasFlag(TILESTATE_FLOORCHANGE) then
                                    if not Tile(position):hasProperty(CONST_PROP_BLOCKSOLID) and Tile(position):getCreatureCount() < 1 then -- Ensure alternative push position is valid
                                        nextPos = secondaryPositions[i]
                                        validSecondary = true
                                    end
                                end
                            end
                        end
                      
                        -- If valid alternative push position
                        if validSecondary and not isInArray(blockedPos, nextPos) then
                            table.insert(blockedPos, nextPos)
                            table.insert(pushTargets, {target.uid, nextPos})
                        else -- Monster is stuck, stun them against wall
                            if target:isPlayer() then
                                stunDuration = stunDuration / 2
                            end
                            -- Headbutt the wall fam
                            target:setDirection(playerDir)
                            nextPos:sendMagicEffect(CONST_ME_DRAWBLOOD)
                          
                            -- Stun
                            local stun = Condition(CONDITION_STUN)
                            stun:setParameter(CONDITION_PARAM_TICKS, stunDuration)
                            target:addCondition(stun)
                          
                            -- Mute
                            local mute = Condition(CONDITION_MUTED)
                            mute:setParameter(CONDITION_PARAM_TICKS, stunDuration)
                            target:addCondition(mute)

                            addEvent(stunAnimation, 0, target.uid, target:getPosition(), (stunDuration / 1000) * 2)
                        end
                      
                    else -- Regular push position is valid
                        if not isInArray(blockedPos, nextPos) then
                            table.insert(blockedPos, nextPos)
                            table.insert(pushTargets, {target.uid, nextPos})
                        end
                    end
                end
            end
        end
    end

    -- Push targets
    for i = 1, #pushTargets do
        local target = Creature(pushTargets[i][1])
        target:teleportTo(pushTargets[i][2], true)
    end
 
    -- animation
    local animationType = 0
    for j = 1, #animationArea do
        if j > 2 then
            animationType = 1
        end
        for k,v in ipairs(animationArea[j]) do
            for i = 1, #v do
                if v[i] == 3 or v[i] == 2 then
                    centre.Row = k
                    centre.Column = i
                elseif v[i] == 1 then
                    local darea = {}
                    darea.Row = k
                    darea.Column = i
                    darea.Delay = math.random(j * delay, (j * delay) + delay)
                    darea.Animation = animationType
                    table.insert(damageArea, darea)
                end
            end
        end
    end
    for i = 1,#damageArea do
        local modifierx = damageArea[i].Column - centre.Column
        local modifiery = damageArea[i].Row - centre.Row
        local animationPos = Position(playerPos)
        animationPos.x = animationPos.x + modifierx
        animationPos.y = animationPos.y + modifiery
        local animationDelay = damageArea[i].Delay or 0
        addEvent(animation, animationDelay, animationPos, playerPos, damageArea[i].Animation)
    end
 
    -- Execute Damage
    return combat:execute(creature, var)
end