local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 435)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 112)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)


function onGetFormulaValues(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.045) + (attack * 1.4) + 50
	local max = (level / 5) + (power * 0.085) + (attack * 1.8) + 75
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")



local interval = 100

local function startCombat(param)
	if isPlayer(param.cid) == false or getTilePzInfo(getCreaturePos(param.var.number)) == true then
		return
	end
	
	if param.count < getCreatureAuraCounter(param.cid) and getCreaturePosition(param.cid) then
	--print(getCreatureAuraCounter(param.cid))
		local playerPos = getCreaturePosition(param.cid)
		local creatures = getSpectators(playerPos, 7, 6)
		local targets = {}
		
		for i, creature in pairs(creatures) do
			if isMonster(creature) and isSightClear(playerPos, getCreaturePosition(creature), false) == TRUE then
				table.insert(targets, creature)
			end
		end

		if #targets > 0 then
			param.var.number = targets[math.random(1, #targets)]
			doCombat(param.cid, combat, param.var)
		end
		
		param.count = param.count+1
		setCreatureRemoveTooltip(param.cid)
		setCreatureAuraTooltip(param.cid)
		
		addEvent(startCombat, interval, param)
	elseif param.count >= getCreatureAuraCounter(param.cid) and getCreaturePosition(param.cid) then
	setCreatureRemoveTooltip(param.cid)
	setCreatureAuraStorage(param.cid)
	setCreatureAuraCounter(param.cid) --reduces counter -1
	
	else
		return false
	end
end

function onCastSpell(p, var)
	local cid = p:getId()
	if not cid then
	return false
	end
	var.type = 1
	--doPlayerCanAttack(cid, false)
	startCombat({cid = cid, var = var, count = 0})

	return LUA_NO_ERROR
end



