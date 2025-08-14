-- Blood Aura (initial version, copied from fire_tornado)
local config = {
    itemId = 33997,
    area = {
        {0, 1, 1, 1, 0},
        {1, 1, 1, 1, 1},
        {1, 1, 3, 1, 1},
        {1, 1, 1, 1, 1},
        {0, 1, 1, 1, 0}
    },
    ticks = 50, -- number of times to repeat
    interval = 150 -- ms
}

local area = createCombatArea(config.area)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_LIFEDRAIN)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setArea(area)

function onGetFormulaValues(player, skill, attack, factor)
    local level = player:getLevel()
    local min = (level * 0.10) + 1
    local max = (level * 0.12) + 1
    return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function healtargets(player, target)
    -- Check if player is valid
    if not player then
        return false
    end

    -- Check if the target is the player or is nil (indicating a self-heal)
    if target == player or target == nil then
        return true
    end

    if target:isNpc() then
        return true
    end

    -- Check if the target is a player
    if target:isPlayer() then
        -- Check if the target is in the same party as the player's leader
        if target:getParty() and target:getParty():getLeader() == player then
            return true
        end

        -- Check if the player has secure mode enabled (always heal)
        if player:hasSecureMode() then
            return true
        end

        -- Check if the target is in the same guild as the player's guild leader
        if target:getGuild() and target:getGuild():getLeader() == player then
            return true
        end
    end

    -- Check if the target has a master (summoned creature)
    if target:getMaster()  and target:getMaster():isPlayer() then -- Check if the target has a master (summon) then
        -- Check if the target is the player's master (heal own summons)
        if target:getMaster() == player then
            return true
        end

        -- Check if the target's master is a player and is in the same party as the player
        if target:getMaster():isPlayer() and player:getParty() and player:getParty() == target:getMaster():getParty() then
            -- Heal friendly party summoned creature
            return true
        end

        -- Check if the player has secure mode enabled (always heal non-friendly summons)
        if player:hasSecureMode() then
            return true
        end
    end

    -- If none of the conditions are met, the target is not a valid heal target
    return false
end


function onTargetCreatureVoid(creature, target)
	if not creature or not target then
        return
    end	
	
	
    if not healtargets(creature, target) then
       -- target:attachEffectById(174, true)
        --SEND DISTANCE EFFECT FROM TARGET TO CREATURE
        local targetpos = target:getPosition()
        local creaturepos = creature:getPosition()
        targetpos:sendDistanceEffect(creaturepos, 193)
    end
    	
	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreatureVoid")

local function bloodAuraLoop(creatureId, variant, tick)
    local creature = Creature(creatureId)
    if not creature then return end
    local Newvariant = Variant(creature:getPosition())
    combat:execute(creature, Newvariant)
    if tick < config.ticks then
        addEvent(bloodAuraLoop, config.interval, creatureId, Newvariant, tick + 1)
    end
end

function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then return false end
    local item = player:getSlotItem(CONST_SLOT_HEAD)
    if not item or item:getId() ~= config.itemId then
        player:sendCancelMessage("You must equip the Blood Aura item to use this spell.")
        return false
    end
    local Newvariant = Variant(player:getPosition())
    bloodAuraLoop(creature:getId(), Newvariant, 1)
    player:attachEffectById(203, true)
    return true
end
