local positions = {
    {0, -3},
    {1, -3},
    {2, -2},
    {3, -1},
    {3,  0},
    {3,  1},
    {2,  2},
    {1,  3},
    {0,  3},
    {-1, 3},
    {-2, 2},
    {-3, 1},
    {-3, 0},
    {-3, -1},
    {-2, -2},
    {-1, -3}
}

local positions2 = {
    {0, -2},
    {1, -2},
    {2, -1},
    {2,  0},
    {2,  1},
    {1,  2},
    {0,  2},
    {-1, 2},
    {-2, 1},
    {-2, 0},
    {-2, -1},
    {-1, -2}

}


    local combat = Combat()
    combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMALLCLOUDS) -- effect of spell
    local condition = Condition(CONDITION_PARALYZE)
    condition:setParameter(CONDITION_PARAM_TICKS, 20000) -- 20 seconds
    condition:setFormula(-0.25, 0, -0.45, 0) -- player speed -25% to -45%
    combat:addCondition(condition)
    local area = createCombatArea(AREA_SQUARE1X1)-- need to setup right area of effect
    combat:setArea(area)
    Combat:addCondition(condition)
    

local function sendEffc(cid, max_iterations, iterations)
	local pid = Player(cid)
	if not pid then stopEvent(sendEffc) return end
    iterations = iterations - 1
    if iterations > 0 then
        addEvent(sendEffc, 150, cid, max_iterations, iterations)
    end
    local x = max_iterations - iterations
    if x > 16 then
        repeat
            x = x - 16
        until x <= 16
    end
    local y = x + 1
    if y > 16 then
        y = 1
    end
    local pid = Player(cid)
    local pid_p = pid:getPosition()
    local pos = Position(pid_p.x + positions[x][1], pid_p.y + positions[x][2], pid_p.z)
    local pos2 = Position(pid_p.x + positions[y][1], pid_p.y + positions[y][2], pid_p.z)
    local tile = Tile(pos)
    if not (tile:hasProperty(CONST_PROP_BLOCKPROJECTILE) or tile:hasFlag(TILESTATE_FLOORCHANGE) or tile:hasFlag(TILESTATE_TELEPORT) or tile:hasFlag(TILESTATE_PROTECTIONZONE)) then
        pos:sendDistanceEffect(pos2, 33)
		local level = pid:getLevel()
		local magic = pid:getMagicLevel()
		local distance = pid:getEffectiveSkillLevel(SKILL_DISTANCE) * 1
		
		local min = (level/5) + (magic * 5.0) + (distance * 2.2) + 45
		local max = (level/5) + (magic * 5.3) + (distance * 2.75) + 95

        doAreaCombatHealth(pid, COMBAT_ENERGYDAMAGE, pos, {1}, min, max, 176)
		doAreaCombatCondition(pid, pos, AREA_SQUARE1X1, condition, 176)
    end
end

local function sendEffc2(cid, max_iterations, iterations)
	local pid = Player(cid)
	if not pid then stopEvent(sendEffc2) return end
	
    iterations = iterations - 1
    if iterations > 0 then
        addEvent(sendEffc2, 200, cid, max_iterations, iterations)
    end
    local x = max_iterations - iterations
    if x > 12 then
        repeat
            x = x - 12
        until x <= 12
    end
    local y = x + 1
    if y > 12 then
        y = 1
    end
	
    
    local pid_p = pid:getPosition()
    local pos3 = Position(pid_p.x + positions2[x][1], pid_p.y + positions2[x][2], pid_p.z)
    local pos4 = Position(pid_p.x + positions2[y][1], pid_p.y + positions2[y][2], pid_p.z)
    local tile2 = Tile(pos3)
    if not (tile2:hasProperty(CONST_PROP_BLOCKPROJECTILE) or tile2:hasFlag(TILESTATE_FLOORCHANGE) or tile2:hasFlag(TILESTATE_TELEPORT) or tile2:hasFlag(TILESTATE_PROTECTIONZONE)) then
        --pos:sendDistanceEffect(pos2, 160)
		
		local level = pid:getLevel()
		local magic = pid:getMagicLevel()
		local distance = pid:getEffectiveSkillLevel(SKILL_DISTANCE) * 1
		
		local min = (level/5) + (magic * 5.0) + (distance * 2.2) + 45
		local max = (level/5) + (magic * 5.3) + (distance * 2.75) + 95
      
        doAreaCombatHealth(pid, COMBAT_ENERGYDAMAGE, pos3, {1}, min, max, 176)
		doAreaCombatCondition(pid, pos3, AREA_SQUARE1X1, condition, 0)
    end
end

function onCastSpell(creature, variant)


    local times_to_run = 10 * #positions
	local times_to_run2 = 10 * #positions2
    addEvent(sendEffc, 25, creature.uid, times_to_run, times_to_run)
	addEvent(sendEffc2, 50, creature.uid, times_to_run2, times_to_run2)
    return true
end