local positions = {
    {-1, -1},
    {0, -1},
    {1, -1},
    {1, 0},
    {1,  1},
    {0,  1},
    {-1,  1},
    {-1,  0}
}

local function sendEffcDragon(cid, max_iterations, iterations)
	local pid = Player(cid)
	if not pid then stopEvent(sendEffcDragon) return end
    iterations = iterations - 1
    if iterations > 0 then
        addEvent(sendEffcDragon, 150, cid, max_iterations, iterations)
    end
    local x = max_iterations - iterations
    if x > 8 then
        repeat
            x = x - 8
        until x <= 8
    end
    local y = x + 1
    if y > 8 then
        y = 1
    end
    local pid = Player(cid)
    local pid_p = pid:getPosition()
    local pos = Position(pid_p.x + positions[x][1], pid_p.y + positions[x][2], pid_p.z)
    local pos2 = Position(pid_p.x + positions[y][1], pid_p.y + positions[y][2], pid_p.z)
	local tile = Tile(pos)
    
    
    if not (tile:hasFlag(TILESTATE_PROTECTIONZONE)) then
        --pos:sendDistanceEffect(pos2, 4)
		
		local level = pid:getLevel()
		local magic = pid:getMagicLevel()
		local vit = pid:getMaxHealth() / 100
		local min = (level/5) + (vit * 0.5) + (magic * 2) + 10
		local max = (level/5) + (vit * 1.0) + (magic * 3.5) + 15
        doAreaCombatHealth(pid, COMBAT_FIREDAMAGE, pos, {1}, min, max, 585)

        local DragonHeart = pid:getStorageValue(PassiveSkills.DragonHeart)
		if DragonHeart > 0 then
            --increases the healing effectiveness by 10% per talent
            local healingproc = math.random(min/20, max/18) * (1 + DragonHeart/100)
            local extrahealing = pid:getSpecialSkill(SPECIALSKILL_EXTRAHEALING)
            if extrahealing > 0 then
                healingproc = healingproc * (1 + (extrahealing / 100))
            end
			pid:addHealth(healingproc)
		end
	--	doAreaCombatCondition(pid, pos, AREA_SQUARE1X1, condition, CONST_ME_NONE)
		
    end
end



function onCastSpell(creature, variant)
  local player = creature:getPlayer()
   if not player then
       return false
   end
   
	
    local times_to_run = 14 * #positions
    addEvent(sendEffcDragon, 150, creature.uid, times_to_run, times_to_run)
    player:attachEffectById(73, true)
    player:attachEffectById(74, true)
    return true
end





