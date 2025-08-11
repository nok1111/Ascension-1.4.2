local config = {
	Heal = 78802,		--Storage for amount of targets
	bleed_runeingTicks = 2,	--So i can configure the healing more easily
	TimeBetweenTicks = 1000 --Same ^
}

local combat = Combat()
--combat:setParameter(COMBAT_PARAM_EFFECT, 201)
combat:setArea(createCombatArea(AREA_SQUARE1X1))
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

function onGetFormulaValues(player, level, magicLevel)
	local min = (player:getLevel() / 5) +  (player:getMagicLevel() * 3.5) + 15
	local max = (player:getLevel() / 5) +  (player:getMagicLevel() * 3.7) + 20	
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onTargetCreature(creature, target)
	--Formula for damage
	local magic = creature:getMagicLevel()
	local level = creature:getLevel()
	local targetmaxhp = target:getMaxHealth() / 100
	local damage = (magic * 3.5) + (targetmaxhp * 1.2) + 10
	--End formula

	local bleed_rune = Condition(CONDITION_POISON)
	bleed_rune:setParameter(COMBAT_PARAM_EFFECT, 248)
	bleed_rune:setParameter(CONDITION_PARAM_DELAYED, true)
	bleed_rune:addDamage(config.bleed_runeingTicks, config.TimeBetweenTicks, -damage)
	bleed_rune:addDamage(config.bleed_runeingTicks, config.TimeBetweenTicks, -(damage*0.5))
	target:addCondition(bleed_rune)
	

	local actualAmount = creature:getStorageValue(config.Heal)
	creature:setStorageValue(config.Heal, actualAmount+1)
	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local function Start2_rune(cid, damage)
	local creature = Creature(cid)
	if creature then
		if creature:getStorageValue(config.Heal) > 0 then
			local finalDamage = damage*creature:getStorageValue(config.Heal)

			local condition = Condition(CONDITION_REGENERATION)
			condition:setParameter(CONDITION_PARAM_SUBID, 1)
			condition:setParameter(CONDITION_PARAM_TICKS, config.bleed_runeingTicks * config.TimeBetweenTicks)
			condition:setParameter(CONDITION_PARAM_HEALTHGAIN, finalDamage*0.5)
			condition:setParameter(CONDITION_PARAM_HEALTHTICKS, config.TimeBetweenTicks)
			condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
			creature:addCondition(condition)

			creature:setStorageValue(config.Heal, 0)
		end
	end
end

local function Start_rune(cid, damage)
	local creature = Creature(cid)
	if creature then
		if creature:getStorageValue(config.Heal) > 0 then
			local finalDamage = damage*creature:getStorageValue(config.Heal)

			local condition = Condition(CONDITION_REGENERATION)
			condition:setParameter(CONDITION_PARAM_SUBID, 1)
			condition:setParameter(CONDITION_PARAM_TICKS, config.bleed_runeingTicks * config.TimeBetweenTicks)
			condition:setParameter(CONDITION_PARAM_HEALTHGAIN, finalDamage)
			condition:setParameter(CONDITION_PARAM_HEALTHTICKS, config.TimeBetweenTicks)
			condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
			creature:addCondition(condition)

			addEvent(Start2_rune, config.TimeBetweenTicks*config.bleed_runeingTicks, cid, damage)
		end
	end
end

function onCastSpell(creature, variant)
	local cid = creature:getId()
	creature:setStorageValue(config.Heal, 0)
	combat:execute(creature, variant)
	local target = creature:getTarget()
	local position = target:getPosition()
	local positioneffect = position
    positioneffect.x = position.x + 1
    positioneffect.y = position.y + 1
    positioneffect:sendMagicEffect(203)
	
	--Healing Formula (Same as damage i think)
	local damage = 5
	--End formula
	addEvent(Start_rune, 50, cid, damage)
	return true
end
