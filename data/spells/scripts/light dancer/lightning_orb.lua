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



    local combat = Combat()
    combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMALLCLOUDS) -- effect of spell


    

local function sendEffc(cid, max_iterations, iterations)
	local pid = Player(cid)
	if not pid then stopEvent(sendEffc) return end
    iterations = iterations - 1
    if iterations > 0 then
        addEvent(sendEffc, 60, cid, max_iterations, iterations)
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
   if Tile(pos) and Tile(pos):hasFlag(TILESTATE_PROTECTIONZONE) then
        return false
    end
    
    if not (tile:hasFlag(TILESTATE_PROTECTIONZONE)) then
        pos:sendDistanceEffect(pos2, 161)
		
		local level = pid:getLevel()
		local magic = pid:getMagicLevel()
		
		local min = (level/10) + (magic * 2.1) + 20
		local max = (level/10) + (magic * 2.3) + 32
        doAreaCombatHealth(pid, COMBAT_ENERGYDAMAGE, pos, {1}, min, max, CONST_ME_NONE)
		doAreaCombatCondition(pid, pos, AREA_SQUARE1X1, condition, CONST_ME_NONE)
    end
end



function onCastSpell(creature, variant)


    local times_to_run = 8 * #positions
    addEvent(sendEffc, 60, creature.uid, times_to_run, times_to_run)
	 creature:sendAddBuffNotification(29, 7, 'Blood Blades: Life steal effect 1.5% target max health.', 3, 0)
    return true
end