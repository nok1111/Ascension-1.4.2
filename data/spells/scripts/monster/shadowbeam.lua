

function onCastSpell(cid, variant)
    local summon = cid:getMaster() ~= 0
    if not summon then
        return false
    end
   
   local creature = Creature(cid)
    local owner = creature:getMaster()
    local target = owner:getTarget() 
    local targetPos = target:getPosition()
    local level = owner:getLevel()
    local maglevel = owner:getMagicLevel()
        local min = (level / 5) + (maglevel * 1.1) + 5
        local max = (level / 5) + (maglevel * 1.3) + 7
                creature:getPosition():sendDistanceEffect(target:getPosition(), 109)
                doAreaCombatHealth(cid, COMBAT_ENERGYDAMAGE, Position(targetPos.x,targetPos.y,targetPos.z), {1}, -min, -max, CONST_ME_BLUESKULL)
                doAreaCombatHealth(cid, COMBAT_ENERGYDAMAGE, Position(targetPos.x-1,targetPos.y,targetPos.z), {1}, -min, -max, CONST_ME_BLUESKULL)
                doAreaCombatHealth(cid, COMBAT_ENERGYDAMAGE, Position(targetPos.x+1,targetPos.y,targetPos.z), {1}, -min, -max, CONST_ME_BLUESKULL)
                doAreaCombatHealth(cid, COMBAT_ENERGYDAMAGE, Position(targetPos.x,targetPos.y-1,targetPos.z), {1}, -min, -max, CONST_ME_BLUESKULL)
                doAreaCombatHealth(cid, COMBAT_ENERGYDAMAGE, Position(targetPos.x,targetPos.y+1,targetPos.z), {1}, -min, -max, CONST_ME_BLUESKULL)
    return true
end