function onCastSpell(cid, variant)
    local owner = cid:getMaster()
    local target = owner:getTarget()
    local min = (owner:getLevel() * 1.5) + (AscendedSystem:getLevel(owner) * 5) 
    local max = (owner:getLevel() * 1.5) + (AscendedSystem:getLevel(owner) * 5) 
    
    doAreaCombatHealth(owner:getId(), COMBAT_PHYSICALDAMAGE, target:getPosition(), {1}, -min, -max, 1)
	
	
	--pet healling
	 local minheal = (cid:getMaxHealth() * 0.03) -- 7% of max health
    local maxheal = (cid:getMaxHealth() * 0.03) -- 7% of max health
	
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