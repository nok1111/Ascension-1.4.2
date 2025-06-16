-- Adaptive Fist Spell
local earthfist = Combat()
earthfist:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
earthfist:setParameter(COMBAT_PARAM_EFFECT, 648)
earthfist:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
earthfist:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

function onGetFormulaValues_RockPunch(player, skill, attack, factor)
    local sword = player:getEffectiveSkillLevel(SKILL_SWORD)
    local power = sword * attack
    local level = player:getLevel()
    local min = (level / 5) + (power * 0.035) + attack * 0.8
    local max = (level / 5) + (power * 0.065) + attack * 1.3
    return -min, -max
end
earthfist:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues_RockPunch")

local firefist = Combat()
firefist:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
firefist:setParameter(COMBAT_PARAM_EFFECT, 6)
firefist:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
firefist:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

function onGetFormulaValues_BlazingPunch(player, skill, attack, factor)
    local sword = player:getEffectiveSkillLevel(SKILL_SWORD)
    local power = sword * attack
    local level = player:getLevel()
    local min = (level / 4) + (power * 0.055) + attack * 1.1
    local max = (level / 4) + (power * 0.095) + attack * 1.7
    return -min, -max
end

firefist:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues_BlazingPunch")

local icefist = Combat()
icefist:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
icefist:setParameter(COMBAT_PARAM_EFFECT, 53)
icefist:setArea(createCombatArea(AREA_WAVE4, AREADIAGONAL_WAVE4))
icefist:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
icefist:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

function onGetFormulaValues_IcePunch(player, skill, attack, factor)
    local sword = player:getEffectiveSkillLevel(SKILL_SWORD)
    local power = sword * attack
    local level = player:getLevel()
    local min = (level / 4) + (power * 0.055) + attack * 1.1
    local max = (level / 4) + (power * 0.095) + attack * 1.7
    return -min, -max
end

icefist:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues_IcePunch")

local stunDuration = 2000
local paralyzedDuration = 3500
local stun = Condition(CONDITION_STUN, CONDITIONID_COMBAT)
stun:setParameter(CONDITION_PARAM_TICKS, stunDuration)

local paralyzed = Condition(CONDITION_PARALYZE, CONDITIONID_COMBAT)
paralyzed:setParameter(CONDITION_PARAM_TICKS, paralyzedDuration)
paralyzed:setFormula(-0.5, 0, -0.5, 0)

-- Tempest Fist (ice_ice) target effect logic
function onTargetCreature_ice(creature, target)

    if not target or not creature then return end
    if target:getCondition(CONDITION_PARALYZE, CONDITIONID_DEFAULT) or target:getCondition(CONDITION_PARALYZE, CONDITIONID_COMBAT) then
        target:addCondition(stun)
        target:attachEffectById(95, true)
    else
        target:addCondition(paralyzed)
        target:attachEffectById(95, true)
    end
end


local fakeicefist = Combat()
fakeicefist:setArea(createCombatArea(AREA_WAVE4, AREADIAGONAL_WAVE4))
fakeicefist:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature_ice")


local windfist = Combat()
windfist:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
windfist:setParameter(COMBAT_PARAM_EFFECT, 43)
windfist:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
windfist:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

function onGetFormulaValues_WindPunch(player, skill, attack, factor)
    local sword = player:getEffectiveSkillLevel(SKILL_SWORD)
    local power = sword * attack
    local level = player:getLevel()
    local min = (level / 4) + (power * 0.055) + attack * 1.1
    local max = (level / 4) + (power * 0.095) + attack * 1.7
    return -min, -max
end

windfist:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues_WindPunch")

local healingfist = Combat()
healingfist:setParameter(COMBAT_PARAM_EFFECT, 15)
healingfist:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
healingfist:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
healingfist:setArea(createCombatArea(AREA_CIRCLE3X3))

local healMonsters = false
local healnonparty = false

function onTargetCreature_healingfist(creature, target)
	local player = creature:getPlayer()
	local min = (player:getLevel() / 5) + (player:getMagicLevel() * 4.6) + 100
	local max = (player:getLevel() / 5) + (player:getMagicLevel() * 9.6) + 125

	if not healMonsters then
		local master = target:getMaster()
		if target:isMonster() and not master or master and master:isMonster() then
			return true
		end
	end

    if not healnonparty then
        if not isPartyMember(player, target) then
            return true
        end
    end

	doTargetCombatHealth(player, target, COMBAT_HEALING, min, max, 0)
    target:getPosition():sendMagicEffect(336)
    target:attachEffectById(96, true)
	return true
end

healingfist:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature_healingfist")

-- Frostbloom Fist Combat (ice_life combination)
local frostbloomCombat = Combat()
frostbloomCombat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
frostbloomCombat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)

-- Damage reduction condition
local damageReductionCondition = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
damageReductionCondition:setParameter(CONDITION_PARAM_SUBID, 25961) -- Unique subid for frostbloom

function onGetFrostbloomValues(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = magic * attack 
    local level = player:getLevel()
    local min = (level / 5) + (power * 0.045) + attack
    local max = (level / 5) + (power * 0.065) + attack * 1.5
    return -min, -max
end

setCombatCallback(frostbloomCombat, CALLBACK_PARAM_SKILLVALUE, "onGetFrostbloomValues")


local damageReductionCondition = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
damageReductionCondition:setParameter(CONDITION_PARAM_SUBID, 25961) -- Unique subid for frostbloom
damageReductionCondition:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
damageReductionCondition:setParameter(CONDITION_PARAM_TICKS, 8000)

function onCastSpell(player, variant)
    local orb1, orb2 = getActiveOrbs(player)
    if not orb1 or not orb2 then
        player:sendCancelMessage("You need two orbs to use this spell.")
        return false
    end

    local combination = orb1 .. '_' .. orb2
    local target = player:getTarget()
    if not target and combination ~= 'life_life' and combination ~= 'ice_ice' and combination ~= 'fire_life' and combination ~= 'life_fire' and combination ~= 'ice_fire' and combination ~= 'fire_ice' then
        player:sendCancelMessage("You need a target for this spell.")
        return false
    end

  

    if (combination == 'fire_life' or combination == 'life_fire') then
        -- Rock Punch: Animated earth punch, 5-tile line, effect 648
        local directionOffsets = {
            [DIRECTION_NORTH] = {x = 0, y = -1},
            [DIRECTION_SOUTH] = {x = 0, y = 1},
            [DIRECTION_EAST]  = {x = 1, y = 0},
            [DIRECTION_WEST]  = {x = -1, y = 0}
        }
        local function getPunchPositions(startPos, direction, length)
            local positions = {}
            local offset = directionOffsets[direction]
            local pos = Position(startPos)
            for i = 1, length do
                pos = Position(pos.x + offset.x, pos.y + offset.y, pos.z)
                table.insert(positions, pos)
            end
            return positions
        end
        local function applyPunchDamage(playerId, positions, index)
            local player = Player(playerId)
            if not player or index > #positions then return end
            
            -- Execute damage for current position
            earthfist:execute(player, Variant(positions[index]))
            
            -- Schedule next position if there are more
            if index < #positions then
                addEvent(applyPunchDamage, 120, playerId, positions, index + 1)
            end
        end
        
        local pos = player:getPosition()
        local dir = player:getDirection()
        local length = 5
        local punchPositions = getPunchPositions(pos, dir, length)
        
        -- Start the sequence with first position
        addEvent(applyPunchDamage, 120, player:getId(), punchPositions, 1)
        player:say("Rock Punch!", TALKTYPE_MONSTER_SAY)

    elseif (combination == 'fire_fire') then
        -- Blazing Punch: single target, AoE if burning
        local target = player:getTarget()

            -- Check if target is within 1 square range
        if target and getDistanceBetween(player:getPosition(), target:getPosition()) > 2 then
            player:sendCancelMessage("You need to be adjacent to the target to use Blazing Punch.")
            return true
        end
        
        local function executeDelayedFirefist(playerId, targetPos, count, effectnumber)
            local player = Player(playerId)
            local target = player:getTarget()
            if not player or not target then
                return
            end
            
            -- Convert targetPos back to Variant for execution
            firefist:execute(player, Variant(targetPos))
            
            -- Effect position logic
            local effectPos = Position(targetPos)
            effectPos.x = effectPos.x + 1
            effectPos.y = effectPos.y + 1
            effectPos:sendMagicEffect(effectnumber)
            effectPos:sendMagicEffect(362)
            
            if count > 1 then
                local nextEffect = (effectnumber + 1)  -- Cycles 739→740→741→742→739...
                addEvent(executeDelayedFirefist, 200, playerId, targetPos, count - 1, nextEffect)
            end
        end
        
        -- Start 3 consecutive attacks with 200ms delay between them
        if target then
            executeDelayedFirefist(player:getId(), target:getPosition(), 4, 739)
        end

        player:say("Blazing Punch!", TALKTYPE_MONSTER_SAY)

    elseif (combination == 'ice_ice') then
 -- Tempest Fist: AREA_WAVE4, stun if already paralyzed
        print("ice_ice")
            
        -- Execute icefist (damage combat)
        icefist:execute(player, variant)
        
        fakeicefist:execute(player, variant)
        
        player:say("Tempest Fist!", TALKTYPE_MONSTER_SAY)

    elseif (combination == 'ice_life' or combination == 'life_ice') then
        -- Frostbloom Fist: Single target damage with damage reduction
        local target = player:getTarget()
        if target and target:isMonster() then
            -- Apply damage
            frostbloomCombat:execute(player, Variant(target:getPosition()))
            
            player:addCondition(damageReductionCondition)
            target:getPosition():sendMagicEffect(53) -- Visual effect
        end
        
        player:say("Frostbloom Fist!", TALKTYPE_MONSTER_SAY)

    elseif (combination == 'ice_fire' or combination == 'fire_ice') then
        -- Wind Fist: animated push in a 3-tile line
        local dir = player:getDirection()
        local startPos = player:getPosition()
        local length = 5
        
        local dirOffsets = {
            [DIRECTION_NORTH] = {x=0, y=-1},
            [DIRECTION_SOUTH] = {x=0, y=1},
            [DIRECTION_EAST] = {x=1, y=0},
            [DIRECTION_WEST] = {x=-1, y=0},
            [DIRECTION_NORTHEAST] = {x=1, y=-1},
            [DIRECTION_NORTHWEST] = {x=-1, y=-1},
            [DIRECTION_SOUTHEAST] = {x=1, y=1},
            [DIRECTION_SOUTHWEST] = {x=-1, y=1}
        }

        local function animateWindFist(player, startPos, dir, length)
            local offset = dirOffsets[dir]
            local positions = {}
            local playerId = player:getId() -- Store player ID for safe access
            
            -- Calculate all positions in the line
            for i = 1, length do
                local pos = Position(startPos.x, startPos.y, startPos.z)
                pos.x = pos.x + (offset.x * i)
                pos.y = pos.y + (offset.y * i)
                positions[#positions+1] = pos
            end

            local function processStep(index, playerId)
                -- Safe check for player
                local player = Player(playerId)
                if not player then return end
                
                if index > #positions then return end
                
                -- Send magic effect at current position
                positions[index]:sendMagicEffect(629) -- CONST_ME_POFF
                
                -- Get all creatures at the position (not just top creature)
                local creatures = Tile(positions[index]):getCreatures()
                if creatures and #creatures > 0 then
                    for _, creature in ipairs(creatures) do
                        -- Safe check for creature
                        if creature and creature:getId() and (creature:isPlayer() or creature:isMonster()) then
                            local pushPos = Position(positions[index].x, positions[index].y, positions[index].z)
                            pushPos.x = pushPos.x + offset.x
                            pushPos.y = pushPos.y + offset.y
                            
                            local tile = Tile(pushPos)
                            if tile and tile:isWalkable() and not (tile:hasFlag(TILESTATE_FLOORCHANGE) or tile:hasFlag(TILESTATE_PROTECTIONZONE) or tile:hasProperty(CONST_PROP_BLOCKSOLID)) then
                                creature:teleportTo(pushPos)
                                creature:attachEffectById(61, true)
                                creature:attachEffectById(60, true)
                                windfist:execute(player, Variant(creature:getPosition()))
                            else
                                creature:detachEffectById(61)
                                creature:detachEffectById(60)
                                creature:attachEffectById(62, true)
                                creature:addCondition(stun)
                                windfist:execute(player, Variant(creature:getPosition()))
                            end
                        end
                    end
                end
                
                -- Schedule next step with safety checks
                addEvent(function(index, playerId)
                    local player = Player(playerId)
                    if player then
                        processStep(index, playerId)
                    end
                end, 120, index + 1, playerId)
            end
            
            -- Start animation
            processStep(1, playerId)
        end
        
        animateWindFist(player, startPos, dir, length)
        player:say("Wind Fist!", TALKTYPE_MONSTER_SAY)

    elseif (combination == 'life_life') then
        -- Restoring Fist: heal self + party
        local level = player:getLevel()
        local magic = player:getMagicLevel()
        local base = (level / 4) + (magic * 3)
        local maxhp = player:getMaxHealth()
        local heal = math.floor(base + (maxhp * 0.05))
        
        healingfist:execute(player, variant)
        
        player:say("Restoring Fist!", TALKTYPE_MONSTER_SAY)
        player:attachEffectById(96, true)
    else
        player:sendCancelMessage("Invalid orb combination.")
        return false
    end

    -- Remove the spent orbs from the player's boosters
    ClearBooster(player)
    updatePlayerEffects(player)
    return true
end
