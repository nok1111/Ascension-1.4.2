if not PassiveSkills then
    dofile('data/scripts/PassiveTree/0_PassiveSkillsDataConfig.lua')
end

local config = {
    rounds = 8, -- amount of ticks
    timer = 1500, -- time between ticks (ms)
    effect = CONST_ME_SKULLHORIZONTAL -- visual effect
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_REGENERATION)
condition:setParameter(CONDITION_PARAM_TICKS, config.timer)
condition:setParameter(CONDITION_PARAM_MANAGAIN, 0)
condition:setParameter(CONDITION_PARAM_MANATICKS, config.timer * config.rounds)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

-- Handles the periodic mana gain, including SurgeRecovery passive
local function manaFlowTick(cid, count)
    local creature = Creature(cid)
    if not creature then return end
    local base = creature:getMaxMana() * 0.020
    local surgeLevel = math.max(creature:getStorageValue(PassiveSkills.SurgeRecovery) or 0, 0)
    local bonus = 1 + (surgeLevel / 100)
    local manaAmount = base * bonus
    creature:addMana(manaAmount)
    if count > 0 then
        addEvent(manaFlowTick, config.timer, cid, count - 1)
    end
end

function onCastSpell(creature, variant)
    if creature:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT, 25941) then
        creature:sendCancelMessage("Spell is already active.")
        creature:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

	
    
    -- Initial tick
    creature:addCondition(condition)
	-- Initial tick immediately
	addEvent(manaFlowTick, config.timer, creature:getId(), config.rounds)

    local player = Player(creature)
    if player then
        -- Visual and notification
        player:attachEffectById(18, true)
        player:sendAddBuffNotification(13, (config.timer / 1000) * config.rounds, 'Mana Flow', 5, 0)
    end

    return combat:execute(creature, variant)
end

