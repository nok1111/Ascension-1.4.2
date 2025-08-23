local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 50)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)


function onGetFormulaValues(player, skill, attack, factor)

	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = ((level / 5) + (power * 0.060) + attack) * 1.6
    local max = ((level / 5) + (power * 0.0705) + attack * 1.3) * 1.8

	local finalLevel = player:getStorageValue(PassiveSkills.FinalVeredict) or 0
	local target = player:getTarget()
	if finalLevel > 0 and target then
		local targetHealth = target:getHealth()
		local targetMaxHealth = target:getMaxHealth() or 1
		if targetHealth / targetMaxHealth < 0.5 then
			local percent = 1 + (finalLevel / 100)
			min = math.floor(-max * percent)
			max = math.floor(-max * percent)
		end
	end


	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


local function applycross(position)  	
    position:sendMagicEffect(597)
end

local function castSpell(creatureId, variant)
    local creature = Creature(creatureId)
    if not creature then
        return
    end

    combat:execute(creature, variant)

	-- BlessedImpact passive: 10% chance per level to heal with holy light
	local blessedLevel = creature:getStorageValue(PassiveSkills.BlessedImpact) or 0
	if blessedLevel > 0 and math.random(1, 100) <= blessedLevel then
		local maxMana = creature:getMaxMana() or 0
		local healAmount = math.floor(maxMana * 0.10)
		local extrahealing = creature:getSpecialSkill(SPECIALSKILL_EXTRAHEALING)
		if extrahealing > 0 then
			healAmount = healAmount * (1 + (extrahealing / 100))
		end
		creature:addHealth(healAmount)
		creature:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
	end
end

function onCastSpell(creature, variant)
    local target = creature:getTarget()
    local position = target:getPosition()
    addEvent(castSpell, 500, creature:getId(), variant)
    addEvent(applycross, 250, target:getPosition())
    position.x = target:getPosition().x + 1
    position.y = target:getPosition().y + 1
    position:sendMagicEffect(601)



    return true
end


