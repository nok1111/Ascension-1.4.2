


local stunDuration = 2000
local conditionburn = Condition(CONDITION_FIRE, CONDITIONID_COMBAT)
conditionburn:setTicks(7500)
conditionburn:setParameter(CONDITION_PARAM_DELAYED, 1)
conditionburn:setParameter(CONDITION_PARAM_TICKINTERVAL, 1500)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:setArea(createCombatArea(AREA_SQUARE2X2))


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

function onGetFormulaValues(player, skill, attack, factor)
    local power = skill * attack 
    local level = player:getLevel()

    local min = (level / 5) + (power * 0.10) + (attack * 4.0) + 50
    local max = (level / 5) + (power * 0.11) + (attack * 4.1) + 150
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onTargetCreature(creature, target)
	if not creature then
        return
    end	
		
	
    if not healtargets(creature, target) then

        local level = creature:getLevel()
        local maglevel = creature:getMagicLevel()
        
        local minburn = level / 5 + (maglevel * 4) + 10
        local maxburn = level / 5 + (maglevel * 6) + 15
        
        conditionburn:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-minburn,-maxburn))
        combat1:addCondition(conditionburn)
    end
    	
	return true
end

combat1:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")




function onCastSpell(creature, variant)
if not creature then return end

        combat:execute(creature:getMaster(), variant)
		combat1:execute(creature:getMaster(), variant)
        

local creatureposition = creature:getPosition()
local positioneffect = creatureposition
    positioneffect.x = creatureposition.x + 3
    positioneffect.y = creatureposition.y + 3
    positioneffect:sendMagicEffect(1143)

    creature:remove()
		
    
    return true
end