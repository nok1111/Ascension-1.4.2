
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 40)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 134)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

--here critical strike


function onGetFormulaValues2(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.045) + attack
	local max = (level / 5) + (power * 0.085) + attack * 1.5

    -- JudmentManaExtraDamage: add 2% of total mana per level as extra damage
    local manaExtraLevel = player:getStorageValue(PassiveSkills.JudmentManaExtraDamage) or 0
    if manaExtraLevel > 0 then
        local maxMana = player:getMaxMana() or 0
        local extra = maxMana * (manaExtraLevel / 100)
        min = min + extra
        max = max + extra
    end
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")



function onCastSpell(creature, variant, target)
    if not creature then
        return 
    end
	local target = creature:getTarget()
	if not target then
		return
	end
	local JudmentStun = creature:getStorageValue(PassiveSkills.JudmentStun) or 0
	if JudmentStun > 0 then
		if math.random(1, 100) <= JudmentStun then	
			local stun = Condition(CONDITION_STUN, CONDITIONID_COMBAT)
				stun:setParameter(CONDITION_PARAM_TICKS, 2000)
				target:attachEffectById(66, true)
				combat:addCondition(stun)
		end
	end

    combat:execute(creature, variant)
    -- Send magic effect on target with offset +1 on x and y
    if target then
        target:attachEffectById(67, true)
    end

    -- BlessedJudgment passive: heal caster for 2% of max health per level
    local blessedLevel = creature:getStorageValue(PassiveSkills.BlessedJudgment) or 0
	if blessedLevel > 0 then
		local maxHealth = creature:getMaxHealth()
		local healPercent = blessedLevel / 100
		local healAmount = math.floor(maxHealth * healPercent)
		if healAmount > 0 then
			creature:addHealth(healAmount)
			creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	end
    -- JudmentRestore passive: restore 5% of total mana per level
    local restoreLevel = creature:getStorageValue(PassiveSkills.JudmentRestore) or 0
    if restoreLevel > 0 then
        local maxMana = creature:getMaxMana() or 0
        local manaAmount = math.floor(maxMana * (restoreLevel / 100))
        if manaAmount > 0 then
            creature:addMana(manaAmount)
            creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
        end
    end
    -- RighteousFocus passive: grant crit chance buff as a condition for 5 seconds
    local righteousLevel = creature:getStorageValue(PassiveSkills.RighteousFocus) or 0
    if righteousLevel > 0 then
        local critChance = righteousLevel -- 10% per level
        local cond = Condition(CONDITION_ATTRIBUTES)
        cond:setParameter(CONDITION_PARAM_TICKS, 3000)
        cond:setParameter(CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, critChance)
        creature:addCondition(cond)
        creature:getPosition():sendMagicEffect(CONST_ME_YELLOW_RINGS)
    end
    return true
end
