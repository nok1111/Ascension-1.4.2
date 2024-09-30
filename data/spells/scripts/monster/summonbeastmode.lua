function onCastSpell(cid, variant)
    local owner = cid:getMaster()
    local target = owner:getTarget()
    local min = (owner:getLevel() * 0.7) + (AscendedSystem:getLevel(owner) * 1) 
    local max = (owner:getLevel() * 0.7) + (AscendedSystem:getLevel(owner) * 1) 
	
	--print(AscendedSystem:getLevel(owner))
    
    doAreaCombatHealth(owner:getId(), COMBAT_PHYSICALDAMAGE, target:getPosition(), {1}, -min, -max, 1)
	
	--pet healling
	 local minheal = (cid:getMaxHealth() * 0.01) -- 7% of max health
    local maxheal = (cid:getMaxHealth() * 0.01) -- 7% of max health
	
	cid:addHealth(math.random(minheal,maxheal))
	local petposition = cid:getPosition()
	petposition:sendMagicEffect(CONST_ME_HPUP)
	
	local position = target:getPosition()
    local positioneffect = position
    positioneffect.x = position.x + 1
    positioneffect.y = position.y + 1
    
	positioneffect:sendMagicEffect(469)
    return true
end