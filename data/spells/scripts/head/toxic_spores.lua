local config = {
    itemId = 34077,
    effect = CONST_ME_POISONAREA, -- Green poison cloud
    distEffect = CONST_ANI_POISON,
    combatType = COMBAT_EARTHDAMAGE,
    area = {
        {0, 1, 1, 1, 0},
        {1, 1, 1, 1, 1},
        {1, 1, 3, 1, 1},
        {1, 1, 1, 1, 1},
        {0, 1, 1, 1, 0}
    },
    poisonTicks = 8000, -- ms
    poisonDamage = -80, -- total poison damage
    poisonInterval = 2000 -- ms
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, config.combatType)
combat:setParameter(COMBAT_PARAM_EFFECT, config.effect)
combat:setArea(createCombatArea(config.area))

local conditionSpores = Condition(CONDITION_POISON)
conditionSpores:setParameter(CONDITION_PARAM_DELAYED, true)
conditionSpores:setParameter(CONDITION_PARAM_TICKS, config.poisonTicks)
conditionSpores:setParameter(CONDITION_PARAM_PERIODICDAMAGE, true)


function onGetFormulaValues(player, skill, attack, factor)
    local level = player:getLevel()
    local min = (level * 2.6) + 10
    local max = (level * 3.2) + 20
    return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function isExcludedTarget(creature, target)
    if not creature or not target then
        return true
    end
    if target:isNpc() then
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
    -- Secure mode check
    local player = creature:isPlayer() and creature or creature:getMaster()
    if player and player:hasSecureMode() then
        if target:isPlayer() or (target:isMonster() and target:getMaster() and target:getMaster():isPlayer()) then
            return true
        end
    end
    return false
end

local function CastSpellsporesDot(cid, var)
    local player = Player(cid)
    local level = player:getLevel()
    local maglevel = player:getMagicLevel()
	
	min = (level * 0.25) + 15
    max = (level * 0.35) + 20
	
    conditionSpores:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-min,-max))
    combat:addCondition(conditionSpores)
end

function onCastSpell(creature, variant, isHotkey)
    print("onCastSpell")
    local player = creature:getPlayer()
    if not player then return false end
    local item = player:getSlotItem(CONST_SLOT_HEAD)
    if not item or item:getId() ~= config.itemId then
        player:sendCancelMessage("You must equip the Toxic Spores item to use this spell.")
        return false
    end
    local newvariant = Variant(player:getPosition())
    CastSpellsporesDot(creature:getId(), newvariant)
    combat:execute(creature, newvariant)

    local positionSniperExplosion = Position(player:getPosition().x + 2, player:getPosition().y + 2, player:getPosition().z)
    positionSniperExplosion:sendMagicEffect(477) 

    return true
end
