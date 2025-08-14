local config = {
    itemId = 38191,
    healEffect = CONST_ME_MAGIC_GREEN,
    areaEffect = CONST_ME_MAGIC_BLUE,

}


local function healtargets(player, target)
    -- Check if player is valid
    if not player then
        return false
    end

    -- Check if the target is the player or is nil (indicating a self-heal)
    if target == player or target == nil then
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

function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then
        return false
    end
    local item = player:getSlotItem(CONST_SLOT_HEAD)
    if not item or item:getId() ~= config.itemId then
        player:sendCancelMessage("You must equip the Healing Prisma item to use this spell.")
        return false
    end

    local center = player:getPosition()
    local healing = (player:getLevel() * 5) + 100
    local radius = 3 -- 5x5 area
    local party = player:getParty()
    

    -- Gather party members and self in radius
    -- Use getSpectators to get all players in a 5x5 area
    local spectators = Game.getSpectators(center, false, true, radius, radius, radius, radius)
    for _, thing in pairs(spectators) do
            if healtargets(player, thing) then
                doTargetCombatHealth(creature:getId(), thing:getId(), COMBAT_HEALING, healing, healing, config.healEffect)
                thing:attachEffectById(200, true)
            end
    end
    creature:attachEffectById(199, true)
    return true
end
