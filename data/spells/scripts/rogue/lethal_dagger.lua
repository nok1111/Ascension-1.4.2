
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 517)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 174)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

--here critical strike


function onGetFormulaValues2(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()

	local min = ((level / 5) + (power * 0.060) + attack * 1.0) * 1.1
    local max = ((level / 5) + (power * 0.0705) + attack * 1.3) * 1.2

    -- extra damage
    local assassinMastery = player:getStorageValue(PassiveSkills.AssassinsMastery) or 0
    if assassinMastery > 0 then
        local ExtraDamage = assassinMastery / 100
        local extra = ExtraDamage * (assassinMastery / 100)
        min = min + ( min * extra)
        max = max + ( max * extra)
    end
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

local combatteleport = Combat()
combatteleport:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)

function onGetFormulaValuesTeleport(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()

	local min = ((level / 5) + (power * 0.060) + attack * 1.0) * 0.8
    local max = ((level / 5) + (power * 0.0705) + attack * 1.3) * 0.8
	return -min, -max
end
combatteleport:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValuesTeleport")

local condition2 = Condition(CONDITION_BLEEDING, CONDITIONID_COMBAT)
condition2:setTicks(5000)
condition2:setParameter(CONDITION_PARAM_DELAYED, 1)
condition2:setParameter(CONDITION_PARAM_TICKINTERVAL, 1000)

local function bleed_mastery(cid, var)
    local player = Player(cid)
    local level = player:getLevel()
    local skill = player:getEffectiveSkillLevel(SKILL_SWORD)
    local attack = getDistanceAttack(cid)
	
    local power = skill * attack 

    local min = (((level / 5) + (power * 0.060) + attack * 1.0) * 0.33) + 2
    local max = (((level / 5) + (power * 0.0705) + attack * 1.3) * 0.35) + 3
	
    condition2:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-min,-max))
    combat:addCondition(condition2)
end

function onCastSpell(creature, variant, target)
    if not creature then
        return 
    end
	local target = creature:getTarget()
	if not target then
		return
	end
	local AssassinsMasteryBleed = creature:getStorageValue(PassiveSkills.AssassinsMastery) or 0
   -- print("AssassinsMasteryBleed: " .. AssassinsMasteryBleed)
	if AssassinsMasteryBleed > 0 then
		if math.random(1, 100) <= (AssassinsMasteryBleed * 4) then 	
				bleed_mastery(creature:getId(), var)
		end
	end

    -- DeathApproach passive: 25% chance per level to teleport and deal extra damage
    local deathApproachLevel = creature:getStorageValue(PassiveSkills.DeathApproach) or 0
    if deathApproachLevel > 0 and target then
        local chance = deathApproachLevel
        if math.random(1, 100) <= chance then
            -- Teleport the player to the target's position
            local targetPos = target:getPosition()
            local playerPos = creature:getPosition()
            local dist = math.max(math.abs(targetPos.x - playerPos.x), math.abs(targetPos.y - playerPos.y))
            if dist > 1 then
                -- Get the target's direction and calculate the position behind them
                local targetDir = target:getDirection()
                local behindPos = targetPos
                if targetDir == DIRECTION_NORTH then
                    behindPos = {x = targetPos.x, y = targetPos.y + 1, z = targetPos.z}
                elseif targetDir == DIRECTION_SOUTH then
                    behindPos = {x = targetPos.x, y = targetPos.y - 1, z = targetPos.z}
                elseif targetDir == DIRECTION_EAST then
                    behindPos = {x = targetPos.x - 1, y = targetPos.y, z = targetPos.z}
                elseif targetDir == DIRECTION_WEST then
                    behindPos = {x = targetPos.x + 1, y = targetPos.y, z = targetPos.z}
                end
                -- Check if the tile is walkable (optional, can add check here)
                creature:teleportTo(behindPos, true)
                creature:getPosition():sendMagicEffect(18)
            end
            -- Deal extra damage (e.g., 50% more)
            combatteleport:execute(creature, variant)
        end
    end

    

    -- ShadowReflection passive: 20% per level chance to summon a shadow clone
    local shadowReflectionLevel = creature:getStorageValue(PassiveSkills.ShadowReflection) or 0
    if shadowReflectionLevel > 0 and target then
        combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
        local chance = shadowReflectionLevel
        if math.random(1, 100) <= chance then
            -- Summon a shadow clone near the target
            local targetPos = target:getPosition()
            local summonPos = {x = targetPos.x + 1, y = targetPos.y, z = targetPos.z}
            local clone = Game.createMonster('shadow clone', summonPos, false, true)
            local CLONE_LIFETIME = 6000
            if clone then
                clone:setOutfit(creature:getOutfit()) 
                clone:setMaster(creature)
                clone:setTarget(target)
                targetPos:sendMagicEffect(CONST_ME_MORTAREA)
                clone:setMaxHealth(creature:getMaxHealth() * 0.4) 
                clone:addHealth(creature:getMaxHealth() * 0.4)
                clone:setShader('Ghost')
                addEvent(function() if clone then clone:remove() end end, CLONE_LIFETIME)
            end
        end
    end


    combat:execute(creature, variant)
    return true
end
