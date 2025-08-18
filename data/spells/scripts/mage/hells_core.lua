
  

	local config = {
		meteor_effect = 632,
		explosion_effect = 631,
		warning_effect = 668
	}
	
	local combat = Combat()
	combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
	combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
	combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, false)
	combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
	
	local area = createCombatArea({
		{0, 0, 1, 0, 0},
		{0, 1, 1, 1, 0},
		{1, 1, 3, 1, 1},
		{0, 1, 1, 1, 0},
		{0, 0, 1, 0, 0}
		})
	combat:setArea(area)
	
	function onGetFormulaValues(player, skill, attack, factor)
		local magic = player:getMagicLevel()
		local power = magic * attack 
		local level = player:getLevel()
	
	
		local min = ((level / 5) + (power * 0.10) + (attack * 4.0) + 300) / 3.25
		local max = ((level / 5) + (power * 0.11) + (attack * 4.5) + 400) / 3.15
		return -min, -max
	end
	
	combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
	
	
	local function castMeteorDamage(creatureId, variant, targetId)
		local creature = Creature(creatureId)
		if not creature or not variant then
			return
		end
		
		combat:execute(creature, variant)
		local target = Creature(targetId)
		if not target then
			return
		end
		local variantPos = target:getPosition()
		local positionnube = variantPos
			positionnube.x = variantPos.x + 3
			positionnube.y = variantPos.y + 3
			positionnube:sendMagicEffect(config.explosion_effect)
	
	end
	
	local function castMeteorEffect(creatureId, variant, targetId)
		local creature = Creature(creatureId)
		if not creature or not variant then
			return
		end
		local target = Creature(targetId)
		if not target then
			return
		end
		
		local variantPos = target:getPosition()
		local positionMeteor = variantPos
			positionMeteor.x = variantPos.x + 1
			positionMeteor.y = variantPos.y + 1
			positionMeteor:sendMagicEffect(config.meteor_effect)
	
	end
	
	
	
	function onCastSpell(creature, variant, isHotkey)
		local player = creature:getPlayer()
		if not player then
			return false
		end
	
		local target = creature:getTarget()
		if not target then
			return false
		end
		local targetPos = target:getPosition() 
		local playerPos = player:getPosition() 
	
		target:attachEffectById(220, true)
		addEvent(castMeteorEffect, 300, creature:getId(), variant, target:getId())
		addEvent(castMeteorDamage, 1000, creature:getId(), variant, target:getId())
	
		return true
	end
	