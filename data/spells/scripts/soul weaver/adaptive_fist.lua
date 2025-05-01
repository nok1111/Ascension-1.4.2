-- Adaptive Fist Spell
-- Determines effect and logic based on active orb (booster) combination

local elementalBoosts = dofile('data/lib/additional/elemental_boosts.lua')

-- Individual skill-based formula callbacks for each spell variation
function onGetFormulaValues_RockPunch(player, skill, attack, factor)
    local sword = player:getEffectiveSkillLevel(SKILL_SWORD)
    local power = sword * attack
    local level = player:getLevel()
    local min = (level / 5) + (power * 0.035) + attack * 0.8
    local max = (level / 5) + (power * 0.065) + attack * 1.3
    return -min, -max
end

function onGetFormulaValues_BlazingPunch(player, skill, attack, factor)
    local sword = player:getEffectiveSkillLevel(SKILL_SWORD)
    local power = sword * attack
    local level = player:getLevel()
    local min = (level / 4) + (power * 0.055) + attack * 1.1
    local max = (level / 4) + (power * 0.095) + attack * 1.7
    return -min, -max
end

function onGetFormulaValues_TempestFist(player, skill, attack, factor)
    local sword = player:getEffectiveSkillLevel(SKILL_SWORD)
    local power = sword * attack
    local level = player:getLevel()
    local min = (level / 6) + (power * 0.025) + attack * 0.7
    local max = (level / 6) + (power * 0.045) + attack * 1.0
    return -min, -max
end

function onGetFormulaValues_WindFist(player, skill, attack, factor)
    local sword = player:getEffectiveSkillLevel(SKILL_SWORD)
    local power = sword * attack
    local level = player:getLevel()
    local min = (level / 5) + (power * 0.030) + attack * 0.9
    local max = (level / 5) + (power * 0.060) + attack * 1.4
    return -min, -max
end

-- Skill-based damage formula callback
function onGetFormulaValues(player, skill, attack, factor)
    local sword = player:getEffectiveSkillLevel(SKILL_SWORD)
    local power = sword * attack
    local level = player:getLevel()
    local min = (level / 5) + (power * 0.045) + attack
    local max = (level / 5) + (power * 0.085) + attack * 1.5
    return -min, -max
end

local function getActiveOrbs(player)
    local boosters = elementalBoosts.initElementalBoosters(player).boosters
    if #boosters < 2 then return nil, nil end
    return boosters[1].type, boosters[2].type
end

local function isPartyMember(player, target)
    if not player or not target then return false end
    local party = player:getParty()
    if not party then return false end
    return party:isMember(target)
end

function onCastSpell(player, variant)
    local orb1, orb2 = getActiveOrbs(player)
    if not orb1 or not orb2 then
        player:sendCancelMessage("You need two orbs to use this spell.")
        return false
    end

    local combination = orb1 .. '_' .. orb2
    local target = player:getTarget()
    if not target and combination ~= 'life_life' then
        player:sendCancelMessage("You need a target for this spell.")
        return false
    end

    -- Remove the spent orbs from the player's boosters
    local data = elementalBoosts.initElementalBoosters(player)
    data.boosters = {}
    elementalBoosts.updatePlayerEffects(player)

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
        local function animatePunch(playerId, positions, index)
            local player = Player(playerId)
            if not player or index > #positions then return end
            local fromPos = player:getPosition()
            local toPos = positions[index]
            fromPos:sendDistanceEffect(toPos, CONST_ANI_EARTH)
            toPos:sendMagicEffect(648)
            addEvent(animatePunch, 120, playerId, positions, index + 1)
        end
        local function applyPunchDamage(playerId, positions)
            local player = Player(playerId)
            if not player then return end
            local combat = Combat()
            combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
            combat:setParameter(COMBAT_PARAM_EFFECT, 648)
            combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues_RockPunch")
            for _, pos in ipairs(positions) do
                combat:execute(player, Variant(pos))
            end
        end
        local pos = player:getPosition()
        local dir = player:getDirection()
        local length = 5
        local punchPositions = getPunchPositions(pos, dir, length)
        animatePunch(player:getId(), punchPositions, 1)
        addEvent(applyPunchDamage, 120 * length + 100, player:getId(), punchPositions)
        player:say("Rock Punch!", TALKTYPE_MONSTER_SAY)

    elseif (combination == 'fire_fire') then
        -- Blazing Punch: single target, AoE if burning
        local combat = Combat()
        combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
        combat:setParameter(COMBAT_PARAM_EFFECT, 41)
        combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues_BlazingPunch")
        combat:execute(player, variant)
        if target and target:getCondition(CONDITION_FIRE) then
            -- Spread fire in 1x1 area
            local tpos = target:getPosition()
            for x = -1, 1 do
                for y = -1, 1 do
                    local pos = Position(tpos.x + x, tpos.y + y, tpos.z)
                    local c = Tile(pos):getTopCreature()
                    if c and c ~= target and c:isMonster() then
                        local aoeCombat = Combat()
                        aoeCombat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
                        aoeCombat:setParameter(COMBAT_PARAM_EFFECT, 41)
                        aoeCombat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues_BlazingPunch")
                        aoeCombat:execute(player, Variant(c:getId()))
                    end
                end
            end
        end
        player:say("Blazing Punch!", TALKTYPE_MONSTER_SAY)

    elseif (combination == 'ice_ice') then
        -- Tempest Fist: AREA_WAVE4, stun
        local combat = Combat()
        combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
        combat:setParameter(COMBAT_PARAM_EFFECT, 42)
        combat:setArea(AREA_WAVE4)
        combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues_TempestFist")
        combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "function(cid, target) local stun = Condition(CONDITION_PARALYZE, CONDITIONID_COMBAT) stun:setParameter(CONDITION_PARAM_TICKS, 2000) stun:setParameter(CONDITION_PARAM_SPEED, -500) Creature(target):addCondition(stun) end")
        combat:execute(player, variant)
        player:say("Tempest Fist!", TALKTYPE_MONSTER_SAY)

    elseif (combination == 'ice_fire' or combination == 'fire_ice') then
        -- Wind Fist: push, stun if wall
        if target then
            local pos = target:getPosition()
            local dir = player:getDirection()
            local nextPos = Position(pos)
            nextPos:getNextPosition(dir, 1)
            if Tile(nextPos):getTopCreature() == nil then
                target:teleportTo(nextPos)
                nextPos:sendMagicEffect(47)
            else
                -- Hit wall, stun
                local stun = Condition(CONDITION_PARALYZE, CONDITIONID_COMBAT)
                stun:setParameter(CONDITION_PARAM_TICKS, 1500)
                stun:setParameter(CONDITION_PARAM_SPEED, -600)
                target:addCondition(stun)
            end
            -- Optional: deal wind damage on push
            local combat = Combat()
            combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
            combat:setParameter(COMBAT_PARAM_EFFECT, 47)
            combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues_WindFist")
            combat:execute(player, Variant(target:getId()))
        end
        player:say("Wind Fist!", TALKTYPE_MONSTER_SAY)

    elseif (combination == 'life_life') then
        -- Restoring Fist: heal self + party
        local level = player:getLevel()
        local magic = player:getMagicLevel()
        local base = (level / 4) + (magic * 3)
        local maxhp = player:getMaxHealth()
        local heal = math.floor(base + (maxhp * 0.05))
        player:addHealth(heal)
        player:getPosition():sendMagicEffect(43)
        -- Heal nearby party members by half
        local party = player:getParty()
        if party then
            for _, member in ipairs(party:getMembers()) do
                if player:getPosition():getDistance(member:getPosition()) <= 3 then
                    member:addHealth(math.floor(heal / 2))
                    member:getPosition():sendMagicEffect(43)
                end
            end
        end
        player:say("Restoring Fist!", TALKTYPE_MONSTER_SAY)
    else
        player:sendCancelMessage("Invalid orb combination.")
        return false
    end
    return true
end
