local ICE_CLONE_NAME = "ice clone"  
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
        clone:setOutfit(player:getOutfit())  
        clone:setMaster(player)  
        clone:rename(player:getName())  -- Rename the boss with the new name
        clone:setMaxHealth(player:getMaxHealth() * 0.4) 
        clone:addHealth(player:getMaxHealth() * 0.4)
        clone:attachEffectById(214, true)
        addEvent(function() if clone then clone:remove() end end, CLONE_LIFETIME)
    end
end

function onCastSpell(player, var)
    for _, offset in ipairs(CLONE_POSITIONS) do
        createCloneAtPosition(player, offset.x, offset.y)
    end
    player:getPosition():sendMagicEffect(CONST_ME_ICETORNADO)  
    return true
end
