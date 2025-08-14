local config = {
    areaEffect = 514, -- Effect for the AoE
    damageEffect = 543, -- Effect for damage
    stunEffect = 543, -- Effect for the stun
    distanceEffect = 176, -- Distance effect for the AoE explosion 163
    damageType = COMBAT_ICEDAMAGE, -- Damage type
    stunDuration = 2000, -- Stun duration in milliseconds
    aoeRadius = 3, -- Radius of the AoE
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, config.damageType)
combat:setParameter(COMBAT_PARAM_EFFECT, config.damageEffect)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

local stunCondition = Condition(CONDITION_PARALYZE, CONDITIONID_COMBAT)
stunCondition:setParameter(CONDITION_PARAM_TICKS, config.stunDuration)
stunCondition:setFormula(-0.7, 0, -0.7, 0)

function onGetFormulaValues(player, skill, attack, factor)

	local magic = player:getMagicLevel()
	local power = magic * attack 
	local level = player:getLevel()
	local min = (level / 5) + (power * 0.045) + (attack/2)
	local max = (level / 5) + (power * 0.055) + attack
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function isExcludedTarget(creature, target)
    if not creature or not target then
        return true
    end

    -- Exclude party members and their summons
    if creature:isPlayer() and target:isPlayer() then
        local creatureParty = creature:getParty()
        local targetParty = target:getParty()
        if creatureParty and targetParty and creatureParty == targetParty then
            return true
        end
    end
    if target:isMonster() and target:getMaster() then
        local master = target:getMaster()
        if master:isPlayer() and creature:getParty() and master:getParty() == creature:getParty() then
            return true
        end
    end

    -- Secure mode check to exclude non-party players and their summons
    local player = creature:isPlayer() and creature or creature:getMaster()
    if player and player:hasSecureMode() then
        if target:isPlayer() or (target:isMonster() and target:getMaster() and target:getMaster():isPlayer()) then
            return true
        end
    end
    
    return false
end

local function applyStunEffect(target)
    target:addCondition(stunCondition)
    target:getPosition():sendMagicEffect(config.stunEffect)
end

local function executeAoeDamage(creature, position)
    local spectators = Game.getSpectators(position, false, false, config.aoeRadius, config.aoeRadius, config.aoeRadius, config.aoeRadius)
    for _, target in ipairs(spectators) do
        if target and not isExcludedTarget(creature, target) then
            combat:execute(creature, positionToVariant(target:getPosition()))
            applyStunEffect(target)
        end
    end
end

local function sendDistanceEffects(creature, position)
    for x = -config.aoeRadius, config.aoeRadius do
        for y = -config.aoeRadius, config.aoeRadius do
            if x ~= 0 or y ~= 0 then
                local targetPos = Position(position.x + x, position.y + y, position.z)
                if isSightClear(position, targetPos, true) then
                    position:sendDistanceEffect(targetPos, config.distanceEffect)
                end
            end
        end
    end
end

function onCastSpell(creature, variant)
    local creaturePos = creature:getPosition()
    creaturePos:sendMagicEffect(config.areaEffect)
    sendDistanceEffects(creature, creaturePos)
    executeAoeDamage(creature, creaturePos)
    return true
end
