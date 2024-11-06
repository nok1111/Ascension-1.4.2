local ICE_CLONE_NAME = "Ice Clone"  -- Set a custom name for the clone creature.
local CLONE_LIFETIME = 20000  -- 20 seconds in milliseconds.
local CLONE_POSITIONS = {
    {x = -1, y = -1}, {x = 1, y = -1},
    {x = -1, y = 1}, {x = 1, y = 1}
}

function createCloneAtPosition(player, offsetX, offsetY)
    local position = player:getPosition()
    position.x = position.x + offsetX
    position.y = position.y + offsetY

    local clone = Game.createMonster(ICE_CLONE_NAME, position)
    if clone then
        clone:setOutfit(player:getOutfit())  -- Match the player's outfit.
        clone:setMaster(player)  -- Set the player as the master of the clone.
        addEvent(function() if clone then clone:remove() end end, CLONE_LIFETIME)
    end
end

function onCastSpell(player, var)
    for _, offset in ipairs(CLONE_POSITIONS) do
        createCloneAtPosition(player, offset.x, offset.y)
    end
    player:getPosition():sendMagicEffect(CONST_ME_ICETORNADO)  -- Effect for the spell cast.
    return true
end
