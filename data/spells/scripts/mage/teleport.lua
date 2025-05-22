-- Get position depending on distance and direction
function adjustDirection(playerDirection, teleportPos, teleportDistance)
    if playerDirection == DIRECTION_NORTH then
        teleportPos.y = teleportPos.y  - teleportDistance
    elseif playerDirection == DIRECTION_SOUTH then
        teleportPos.y = teleportPos.y  + teleportDistance
    elseif playerDirection == DIRECTION_EAST then
        teleportPos.x = teleportPos.x  + teleportDistance
    elseif playerDirection == DIRECTION_WEST then
        teleportPos.x = teleportPos.x  - teleportDistance
    end
    return teleportPos
end

function teleportAttempt(creature, playerPos, teleportPos, pathing)
    if pathing then
        local checkPathing = creature:getPathTo(teleportPos, 0 , 0, true, false)
        if checkPathing == false then
            creature:sendTextMessage(MESSAGE_STATUS_SMALL, "You cannot teleport there.")
            return false
        end
    end
    creature:teleportTo(teleportPos)
    playerPos:sendMagicEffect(CONST_ME_TELEPORT)
    teleportPos:sendMagicEffect(CONST_ME_NEWTP1)

	local position = teleportPos
    position.x = position.x + 1
    position.y = position.y + 1
    position:sendMagicEffect(354)
    return true
end

function onCastSpell(creature, var)

    local playerPos = creature:getPosition()
    local playerDirection = creature:getDirection()
    local magicLevel = creature:getMagicLevel()
    local teleportDistance = 4
    local skull = creature:getSkull()

    -- Teleport extra sqm every talent point
    teleportDistance = teleportDistance + math.max(creature:getStorageValue(PassiveSkills.TeleportDistance) or 0, 0)
    

    -- Loop, starting from max distance
    -- This prioritizes max distance teleports and settles for lower range teleports if that is all that's available
    for i = teleportDistance, 2, -1 do
        local teleportPos = creature:getPosition()
        adjustDirection(playerDirection, teleportPos, i)
        local teleportTile = Tile(teleportPos)
        if teleportTile then -- Only continue if there is a ground tile
            if teleportTile:hasFlag(TILESTATE_BLOCKSOLID) == false and teleportTile:hasFlag(TILESTATE_FLOORCHANGE) == false and not teleportTile:hasFlag(TILESTATE_PROTECTIONZONE) then -- Only continue if tile doesn't contains stairs or a blocking object
                local creatureCheck = teleportTile:getCreatures()
                if creatureCheck then
                    if #creatureCheck == 0 then -- Only continue if there isn't a creature on the sqm (player/monster/npc)
                        -- If House
                        if teleportTile:hasFlag(TILESTATE_HOUSE) then
                            if skull == 0 then
                                local house = teleportTile:getHouse()
                                local houseOwner = house:getOwnerGuid()
                                if creature:getGuid() == houseOwner then
                                    if teleportAttempt(creature, playerPos, teleportPos) then
                                        return true -- Teleport successful, exit script
                                    end
                                end
                            end
                        -- If PZ
                        elseif teleportTile:hasFlag(TILESTATE_PROTECTIONZONE) then
                            if skull == 0 then
                                if teleportAttempt(creature, playerPos, teleportPos) then
                                    return true -- Teleport successful, exit script
                                end
                            end
                        end
                        -- If valid position return true, otherwise - keep looping.
                        if teleportAttempt(creature, playerPos, teleportPos, true) then
                            return true -- Teleport successful, exit script
                        end
                    end
                end
            end
        end
    end
    -- No valid position found
    creature:sendTextMessage(MESSAGE_STATUS_SMALL, "You cannot teleport there.")
    return false
end