

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 15)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setArea(createCombatArea(AREA_CIRCLE2X2))


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

function onTargetCreature(creature, target)
	if not creature then
        return false
    end	
	--You can change the formula to be anything from creature (the player that cast) and target
	local min = (creature:getLevel() / 5) + (creature:getMagicLevel() * 10) + 80
	local max = (creature:getLevel() / 5) + (creature:getMagicLevel() * 12) + 120
	
	--creature:say("creature!", TALKTYPE_MONSTER_SAY)
	
	if target and healtargets(creature, target) then
	doTargetCombatHealth(creature:getId(), target:getId(), COMBAT_HEALING, min, max, CONST_ME_NONE)
	end

	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")


function onCastSpell(creature, variant, target)

        combat:execute(creature:getMaster(), variant)
        creature:remove()
		
    
    return true
end


