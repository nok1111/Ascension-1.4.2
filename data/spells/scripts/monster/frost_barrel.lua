


local stunDuration = 2000
local stun = Condition(CONDITION_STUN)
stun:setParameter(CONDITION_PARAM_TICKS, stunDuration)
stun:setParameter(CONDITION_PARAM_SUBID, MonsterStorage.frostbarrel)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 239)
combat:setArea(createCombatArea(AREA_SQUARE2X2))
combat:addCondition(stun)

local combat1 = Combat()
combat1:setArea(createCombatArea(AREA_SQUARE2X2))

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
        return
    end	
   
		local magic = creature:getMagicLevel()
		local level = creature:getLevel() / 5
		
		local mindamage =  level + (magic * 1.2) + 10
		local maxdamage =  level + (magic * 1.5) + 15
		
	
    if not healtargets(creature, target) then
        doTargetCombatHealth(creature:getId(), target:getId(), COMBAT_ENERGYDAMAGE, -mindamage, -maxdamage, 416)
        target:attachEffectById(164, true)
    end
    	
	return true
end

combat1:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")


function onCastSpell(creature, variant)
if not creature then return end

        combat:execute(creature:getMaster(), variant)
		combat1:execute(creature:getMaster(), variant)
        creature:remove()
		
    
    return true
end