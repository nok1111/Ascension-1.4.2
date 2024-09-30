local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_DRAWBLOOD)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EXPLOSION)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 1.2, 0, 2.0, 0)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

local interval = 300

local function startCombat(param)
	if isPlayer(param.cid) == false or getTilePzInfo(getCreaturePos(param.var.number)) == TRUE then
		return
	end
	
	if param.count < 30 then
		local target = getCreatureTarget(param.cid)
		
		if target ~= 0 and isMonster(target) and isSightClear(getCreaturePosition(param.cid), getCreaturePosition(target), false) == TRUE then
			if table.contains(param.targets, target) == false then
				if #param.targets < 2 then
					table.insert(param.targets, target)
				else
					table.remove(param.targets, 1)
				end			
			end
		end
		
		for i, creature in pairs(param.targets) do
			if getCreatureDistanceTo(param.cid, target) > 6 then
				table.remove(param.targets, i)
			else
				param.var.number = creature
				doCombat(param.cid, combat, param.var)
			end
		end
		
		param.count = param.count+1
		addEvent(startCombat, interval, param)
	else
		doPlayerCanAttack(param.cid, true)
	end
end

function onCastSpell(p, var)
	local cid = p:getId()
	doPlayerCanAttack(cid, false)
	var.type = 1
	startCombat({cid = cid, var = var, count = 0, targets = {var.number}})
	return LUA_NO_ERROR
end
