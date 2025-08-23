local config = {
	amount = 6
}


local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setArea(createCombatArea(AREA_CIRCLE1X2))

function onGetFormulaValues(player, skill, attack, factor)
    local power = skill * attack 
    local level = player:getLevel()

    local min = ((level / 5) + (power * 0.0550) + attack * 1.0) * 1.5
    local max = ((level / 5) + (power * 0.0675) + attack * 1.3) * 1.6
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


--Detonation Expert damage code

local stunDuration = 2000
local conditionburn = Condition(CONDITION_FIRE, CONDITIONID_COMBAT)
conditionburn:setTicks(7500)
conditionburn:setParameter(CONDITION_PARAM_DELAYED, 1)
conditionburn:setParameter(CONDITION_PARAM_TICKINTERVAL, 1500)

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat2:setArea(createCombatArea(AREA_SQUARE2X2))


local combat3 = Combat()
combat3:setArea(createCombatArea(AREA_SQUARE2X2))

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

function onGetFormulaValuesDetonation(player, skill, attack, factor)
    local power = skill * attack 
    local level = player:getLevel()

    local min = (level / 5) + (power * 0.10) + (attack * 4.0) + 50
    local max = (level / 5) + (power * 0.11) + (attack * 4.1) + 65

    local detonationExpertLevel = player:getStorageValue(PassiveSkills.DetonationExpert) or 0
    if detonationExpertLevel > 0 then
        min = min * (1 + (detonationExpertLevel / 100))
        max = max * (1 + (detonationExpertLevel / 100)) 
    end
    return -min, -max
end

combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValuesDetonation")

function onTargetCreatureDetonation(creature, target)
	if not creature then
        return
    end	
		
	
    if not healtargets(creature, target) then

        local level = creature:getLevel()
        local maglevel = creature:getMagicLevel()
        
        local minburn = level / 5 + (maglevel * 4) + 10
        local maxburn = level / 5 + (maglevel * 6) + 15

        local detonationExpertLevel = player:getStorageValue(PassiveSkills.DetonationExpert) or 0
        if detonationExpertLevel > 0 then
            minburn = minburn * (1 + (detonationExpertLevel / 100))
            maxburn = maxburn * (1 + (detonationExpertLevel / 100)) 
        end
        
        conditionburn:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-minburn,-maxburn))
        combat3:addCondition(conditionburn)
    end
    	
	return true
end

combat3:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreatureDetonation")

--Detonation Expert damage code end


local function doDamage(cid, targetPos, variant)
    local creature = Creature(cid)
    if not creature then
        return
    end
    combat:execute(creature, variant)

    --Detonation Expert
    local detonationExpertLevel = creature:getStorageValue(PassiveSkills.DetonationExpert) or 0
    print(detonationExpertLevel)
    if detonationExpertLevel > 0 then
        local summons = creature:getSummons()
        print(#summons)
        if #summons > 0 then
            for _, summon in ipairs(summons) do
                print(summon:getName())
                if summon:getName() == "Explosive Barrel" then 
                    print("Explosive Barrel found")
                    -- Here you can add your damage code before removing the barrel
                    
                    local toPos = summon:getPosition()
                    combat2:execute(creature, Variant(toPos))
                    combat3:execute(creature, Variant(toPos))
                    summon:remove()
                    
                    local positioneffect = toPos
                    positioneffect.x = toPos.x + 3
                    positioneffect.y = toPos.y + 3
                    positioneffect:sendMagicEffect(1143)
                end
            end
        end

    end
end

function onCastSpell(creature, variant, targetPos)
    local creatureId = creature:getId()
    local target = creature:getTarget()
    local playerPos = creature:getPosition()
    if not target then
        return
    end
    local targetPos = target:getPosition()
    --send distance from player to targetpos
    playerPos:sendDistanceEffect(targetPos, 62)
    target:attachEffectById(163, true)


    addEvent(doDamage, 320,creatureId, targetPos, variant)

    return true
end