
local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
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

local conditionvoid = Condition(CONDITION_PARALYZE, CONDITIONID_COMBAT)
conditionvoid:setParameter(CONDITION_PARAM_TICKS, 2000)
conditionvoid:setFormula(-0.9, 0, -0.9, 0)


function onTargetCreatureVoid(creature, target)
	if not creature then
        return
    end	
		
	
    if not healtargets(creature, target) then
        combat:addCondition(conditionvoid)
        target:attachEffectById(174, true)
    end
    	
	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreatureVoid")

function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    -- Check if boots are equipped in feet slot
    local boots = player:getSlotItem(CONST_SLOT_FEET)
    if not boots or boots:getId() ~= 32497 then
        player:sendCancelMessage("You must equip the Boots of the Void to use this effect.")
        return false
    end

    local targetPos = variant:getPosition()
    if not targetPos then
        player:sendCancelMessage("No target position.")
        return false
    end
    
    combat:execute(player, variant)
    player:attachEffectById(176, true)


    return true
end
