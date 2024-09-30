

-------------------------------------------------------------------------
local config = {
    combat = COMBAT_ENERGYDAMAGE,
    distanceEffect = 25,
    rounds = 6,
    delay = 500
}
local storage = {}

local acombat, combat = createCombatObject(), createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, config.combat)
--setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 104)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)




local arr1 = {
{0, 0, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 3, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 0, 0}
}


setCombatArea(acombat, createCombatArea(arr1))

function onGetFormulaValues(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (magic * 1.5) + 20
	local max = (level / 5) + (magic * 1.6) + 30
    return -min, -max
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")



function onTargetTile(cid, pos)
	if not cid then
	return false 
	end

	
    return math.random(2) == 1 and pos:sendMagicEffect(311) and doCombat(cid, combat, positionToVariant(pos))
end

setCombatCallback(acombat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

local function doTimeCombat(cid, combat, var)
     if isPlayer(cid) then
         doCombat(cid, combat, var)
     end
     return true
end

function onCastSpell(cid, var)
    local player = Player(cid)
	local guid = player:getGuid()
	local targetPlayerposition = player:getPosition()	
	local targetPlayerpositioneffect = targetPlayerposition
    targetPlayerpositioneffect.x = targetPlayerposition.x + 2
    targetPlayerpositioneffect.y = targetPlayerposition.y + 2
	
	storage[guid] = {pos = targetPlayerpositioneffect}
	

	
	if storage[guid] then   
	


	storage[guid].pos:sendMagicEffect(358)
	addEvent(function() storage[guid].pos:sendMagicEffect(358) end, 500)
	addEvent(function() storage[guid].pos:sendMagicEffect(358) end, 1000)
	addEvent(function() storage[guid].pos:sendMagicEffect(358) end, 1500)
	addEvent(function() storage[guid].pos:sendMagicEffect(358) end, 2000)
	addEvent(function() storage[guid].pos:sendMagicEffect(358) end, 2500)



	addEvent(function() storage[guid] = nil   end, 4 * 1000)
            --storage[guid] = nil     
    end
	
	
     for x = 1, config.rounds do
         addEvent(doTimeCombat, (x-1) * config.delay, cid.uid, acombat, var)
     end
	 
	 
	 
     return true
end
