--[[#######################################################################################]]--
local config = {
   rounds = 10, -- number of times the spell loops (effects & damage)
   delay = 200, -- ms
   radius = {x = 3, y = 3}, -- sqm radius
   damageType = COMBAT_ENERGYDAMAGE,
   areaEffect = CONST_ME_WATEREXPLOSION,
   distanceEffect = CONST_ANI_BUBLES2,
}

--[[#######################################################################################]]--
function doTyphoonDamage(cid, attacker, combatType, position, min, max, effect)
   --// Incase the creature disappears within 120-250ms time window
   local creature = Creature(cid)
   if not creature then
   
       return
   end
   
   if creature then
   doAreaCombatHealth(attacker, combatType, position, 0, min, max, effect)
   end
end

local running = {}
local offsets = {DIRECTION_WEST, DIRECTION_NORTH, DIRECTION_EAST, DIRECTION_SOUTH}

local function run_typhoon(cid, i, j, delay, radius, damage, damageType, areaEffect, distanceEffect)
   local player = Player(cid)
   --// Player doesn't exist anymore
   if not player or Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) and bit.band(player:getGroup():getFlags(), PlayerFlag_IgnoreProtectionZone) == 0 then
       stopEvent(running[cid])
       running[cid] = nil
       return
   end
   --// Maximum rounds complete
   if i > j then
       stopEvent(running[cid])
       running[cid] = nil
       return
   end
   local center = player:getPosition()
   local specs = Game.getSpectators(center, false, false, radius.x, radius.x, radius.y, radius.y)
   --// Send effects and damage creatures within radius
   local args = {nil, cid, damageType, nil, damage.min, damage.max, areaEffect}
   for i = 1, #specs do
       if specs[i]:isMonster(cid) or specs[i]:isPlayer(cid) and player:hasSecureMode()== false then
       local tile = Tile(specs[i]:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE)
       if tile then
       stopEvent(running[cid])
       running[cid] = nil
       return true
       end
           local specPos = specs[i]:getPosition()
           args[1] = specs[i]:getId()
           args[4] = specPos
           center:sendDistanceEffect(specPos, distanceEffect)
           doTyphoonDamage(unpack(args))
		   --doAreaCombatHealth(cid, COMBAT_ENERGYDAMAGE, 0, 0, damage.min, damage.max, CONST_ME_WATEREXPLOSION)
           end
       end
	local pos = player:getPosition()
   --// Send distance effects (N/E/S/W) & area effect on player
   for i = 1, #offsets do
       local fromPos = pos:setDirectionOffset(offsets[i])
       local toPos = pos:setDirectionOffset(offsets[i+1] or offsets[1])
       fromPos:sendDistanceEffect(toPos, distanceEffect)
   end
   local position = player:getPosition()
    position.x = position.x + 1
    position.y = position.y + 1
    position:sendMagicEffect(CONST_ME_WATERTORNADO)
   addEvent(run_typhoon, delay, cid, i+1, j, delay, radius, damage, damageType, areaEffect, distanceEffect)
end






function onCastSpell(cid, creature, variant)
    local player = Player(cid)
    if not player then
        return false
    end

    local level = player:getLevel()
    local maglevel = player:getMagicLevel()
    local a = (level / 5) + (maglevel * 1.80) + 85
    local b = (level / 5) + (maglevel * 2.70) + 165
    local damage = {min = -a, max = -b}

    -- check if sendEffects event is already running for this player
    if running[cid] then
        stopEvent(running[cid])
    end
    -- run the spell
    run_typhoon(player:getId(), 0, config.rounds, config.delay, config.radius, damage, config.damageType, config.areaEffect, config.distanceEffect)
    return true
end