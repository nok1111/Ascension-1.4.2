local config = {
    rounds = 2, -- number of ticks
    timer = 1000, -- milliseconds between ticks
    effect = CONST_ME_AURARED, -- visual effect
    percent = 20 -- percent of max HP to swap for mana
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, config.effect)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_REGENERATION, CONDITIONID_COMBAT)
condition:setParameter(CONDITION_PARAM_TICKS, config.timer * config.rounds)
condition:setParameter(CONDITION_PARAM_MANAGAIN, 0)
condition:setParameter(CONDITION_PARAM_MANATICKS, config.timer * config.rounds)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
condition:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.bloodpact)

local function bloodPactTick(cid, count)
    local creature = Creature(cid)
    if not creature then return end

    local hpToLose = math.floor(creature:getMaxHealth() * (config.percent / 100))
	local storage = creature:getStorageValue(PassiveSkills.PactmasterGift)
    
	local manaToGain = 1
	if storage > 0 then
		manaToGain = 1 + (storage / 100)
        
	end
	
    if creature:getHealth() <= hpToLose then
        creature:sendCancelMessage("You are too low on health.")
        return
    end

    creature:addHealth(-hpToLose)
    creature:addMana(hpToLose * manaToGain)
    creature:attachEffectById(221, true)

    if count > 1 then
        addEvent(bloodPactTick, config.timer, cid, count - 1)
    end
end

function onCastSpell(creature, variant)
    if creature:getCondition(CONDITION_REGENERATION, CONDITIONID_COMBAT, ConditionsSubIds.bloodpact) then
        creature:sendCancelMessage("Spell is already active.")
        --creature:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    local hpToLose = math.floor(creature:getMaxHealth() * (config.percent / 100))
    if creature:getHealth() <= hpToLose then
        creature:sendCancelMessage("You are too low on health.")
        return false
    end

    creature:addCondition(condition)
    bloodPactTick(creature:getId(), config.rounds)
    return true
end