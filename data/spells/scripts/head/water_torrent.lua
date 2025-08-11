-- Damaging Area
local hitArea = {
    {0, 0, 1, 1, 1, 0, 0},
    {0, 1, 1, 1, 1, 1, 0},
    {1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 2, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1},
    {0, 1, 1, 1, 1, 1, 0},
    {0, 0, 1, 1, 1, 0, 0}
}

-- Animation Frames
local animationArea = {
{
    {0, 0, 0, 0, 0},
    {0, 1, 1, 1, 0},
    {0, 1, 2, 1, 0},
    {0, 1, 1, 1, 0},
    {0, 0, 0, 0, 0}
},
{
        {0, 1, 1, 1, 0},
        {1, 0, 0, 0, 1},
        {1, 0, 2, 0, 1},
        {1, 0, 0, 0, 1},
        {0, 1, 1, 1, 0}
},
{
    {0, 0, 1, 1, 1, 0, 0},
    {0, 1, 0, 0, 0, 1, 0},
    {1, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 2, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 1},
    {0, 1, 0, 0, 0, 1, 0},
    {0, 0, 1, 1, 1, 0, 0}
}
}



-- Damage Formula
function onGetFormulaValues(player, skill, attack, factor)

local levelTotal = player:getLevel()
local mindamage = levelTotal * 3.2
local maxdamage = levelTotal * 3.4
return -mindamage, -maxdamage
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setArea(createCombatArea(hitArea))
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then
        print("[Earthquake] onCastSpell: no player found!")
        return false
    end

    -- Check if boots are equipped in feet slot
    local boots = player:getSlotItem(CONST_SLOT_HEAD)
    if not boots or boots:getId() ~= 38178 then
        player:sendCancelMessage("You must equip the Water Torrent spell to use this effect.")
        return false
    end

    local newvariant = Variant(player:getPosition())

 -- no tocar
 local centre = {}
 local damageArea = {}
 local pushTargets = {}
 local blockedPos = {}
 local playerPos = player:getPosition()
 local delay = 100

 local getTargets = Game.getSpectators(playerPos, false, false, 3, 3, 3, 3)

 shuffle(getTargets)

 for _,target in pairs(getTargets) do
     if target.uid ~= creature.uid then -- If target is not the caster
         if not target:isNpc() and target:getSpeed() > 0 then -- only target Players and Monsters
             local targetPos = target:getPosition()
             local playerDir = playerPos:getDirectionTo(targetPos)
             if playerDir then
                 local nextPos = Position(targetPos):getBehindPos(playerDir, 1) -- Tile to push to
                 if Tile(nextPos):hasProperty(CONST_PROP_BLOCKSOLID) or Tile(nextPos):hasFlag(TILESTATE_FLOORCHANGE) or Tile(nextPos):getCreatureCount() > 0 then -- If tile to push to is invalid/blocked
                   

                     local secondaryPositions = {}
                   
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
                   
                     
                     shuffle(secondaryPositions)
                   
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
                     else -- Monster no puede moverse mas
                        
                         target:setDirection(playerDir)
                         nextPos:sendMagicEffect(CONST_ME_DRAWBLOOD)                                        
                     end
                   
                 else -- posicion valida en tabla almacenada
                     if not isInArray(blockedPos, nextPos) then
                         table.insert(blockedPos, nextPos)
                         table.insert(pushTargets, {target.uid, nextPos})
                     end
                 end
             end
         end
     end
 end

for i = 1, #pushTargets do
 local target = Creature(pushTargets[i][1])
 local initialPos = pushTargets[i][2] -- Initial target position
 local playerPos = creature:getPosition()

 -- empujamos al target 1 tile si esta dentro 4 tiles cerca del objetivo
 addEvent(function()
     if target then
         local currentPos = target:getPosition()
         local distanceX = math.abs(currentPos.x - playerPos.x)
         local distanceY = math.abs(currentPos.y - playerPos.y)
         local distance = math.max(distanceX, distanceY)

         if distance <= 4 then
             target:teleportTo(initialPos, true)
         end
     end
 end, 100)

 -- volvemos a checar si sigue cerca y volvemos a empujar
 addEvent(function()
     if target then
         local currentPos = target:getPosition()
         local distanceX = math.abs(currentPos.x - playerPos.x)
         local distanceY = math.abs(currentPos.y - playerPos.y)
         local distance = math.max(distanceX, distanceY)

         if distance <= 4 then
             local newPos = Position(initialPos)
             newPos = newPos:getBehindPos(creature:getPosition():getDirectionTo(initialPos), 1)
             target:teleportTo(newPos, true)
             initialPos = newPos -- Update initialPos for the next push
         end
     end
 end, 300)

 -- volvemos a checar si sigue cerca y volvemos a empujar
 addEvent(function()
     if target then
         local currentPos = target:getPosition()
         local distanceX = math.abs(currentPos.x - playerPos.x)
         local distanceY = math.abs(currentPos.y - playerPos.y)
         local distance = math.max(distanceX, distanceY)

         if distance <= 4 then
             local newPos = Position(initialPos)
             newPos = newPos:getBehindPos(creature:getPosition():getDirectionTo(initialPos), 1)
             target:teleportTo(newPos, true)
         end
     end
 end, 500)
end




 -- animacion
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
 end

 player:attachEffectById(194, true)

 -- combat execute
 return combat:execute(creature, newvariant)
end
