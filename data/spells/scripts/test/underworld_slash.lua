local config = {
    radius = 3, -- radius of the pulse
    effect = 435, -- magic effect for the pulse
    blindnessDuration = 3000, -- duration of blindness in milliseconds
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

function onGetFormulaValues(player, skill, attack, factor)
    local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
    local power = sword * attack 
    local level = player:getLevel()
    local magic = player:getMagicLevel()

    local min = (level / 5) + (power * 0.07) + (attack * 2.8) + 180
    local max = (level / 5) + (power * 0.08) + (attack * 3.0) + 190
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

local function getEnemiesInTile(position, caster)
    local enemies = {}
    local spectators = Tile(position):getCreatures()
    for _, spectator in ipairs(spectators) do
        if not spectator:isNpc() then
            local excluded = isExcludedTarget(caster, spectator)
            if not excluded then
                table.insert(enemies, spectator)
            end
        end
    end
    return enemies
end

local function applyBlindness(target)
    local condition = Condition(CONDITION_STUN)
    condition:setParameter(CONDITION_PARAM_TICKS, config.blindnessDuration)
    target:addCondition(condition)
    target:getPosition():sendMagicEffect(CONST_ME_PURPLESMOKE)
end

local function executeCombatAndBlindness(creatureId, position)
    local creature = Creature(creatureId)
    if not creature then
        return
    end

    local enemiesInTile = getEnemiesInTile(position, creature)
    for _, enemy in ipairs(enemiesInTile) do
        local variant = Variant(enemy:getPosition())
        combat:execute(creature, variant)
        applyBlindness(enemy)
    end
end

function onCastSpell(creature, variant)
    local position = creature:getPosition()
    position:sendMagicEffect(CONST_ME_MAGIC_BLUE)

    local creatureId = creature:getId()

    for i = 1, config.radius do
        addEvent(function()
            local positions = {
                Position(position.x + i, position.y, position.z),
                Position(position.x - i, position.y, position.z),
                Position(position.x, position.y + i, position.z),
                Position(position.x, position.y - i, position.z),
                Position(position.x + i, position.y + i, position.z),
                Position(position.x - i, position.y - i, position.z),
                Position(position.x + i, position.y - i, position.z),
                Position(position.x - i, position.y + i, position.z)
            }
            for _, effectPos in ipairs(positions) do
                effectPos:sendMagicEffect(config.effect)
                executeCombatAndBlindness(creatureId, effectPos)
            end
        end, i * 200)
    end

    return true
end
