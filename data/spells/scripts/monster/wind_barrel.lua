

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 270)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setArea(createCombatArea(AREA_SQUARE2X2))

local condition = Condition(CONDITION_HASTE)
condition:setParameter(CONDITION_PARAM_TICKS, 6000)
condition:setParameter(CONDITION_PARAM_SUBID, MonsterStorage.windbarrel)
condition:setFormula(1.4, -70, 1.4, -70)

local function healtargets(player, target)
    -- Check if player is valid
    if not player then
        return false
    end
    if not target then
        return false
    end

    if target:isNpc() then
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

function onTargetCreature(creature, target)
    if not creature then
        return
    end

	if target and healtargets(creature, target) then
    target:addCondition(condition)
    target:attachEffectById(165, true)

    if target:isPlayer() then
    target:sendAddBuffNotification(21, 6, 'you feel light', 5, 0)
    end
    
	end
	
	return true
end
combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")



function onCastSpell(creature, variant, target)	
        combat:execute(creature:getMaster(), variant)
        creature:remove()	 
    return true
end