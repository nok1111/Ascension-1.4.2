-- Totem Spell System (RevScript with metatables)

-- ========== Totem Definitions ==========
TotemTypes = {
    OFFENSIVE = 1,
    DEFENSIVE = 2,
    HEALING = 3
}

-- ========== Condition IDs ==========
ConditionSubIDs = {
    OffensiveTotem = 201,
    DefensiveTotem = 202
}

-- ========== Combat Modifier Logic ==========
local DAMAGE_BOOST = 1.25
local DAMAGE_REDUCTION = 0.75
local MAX_HP_HEAL_BOOST = 0.08

function applyAuraCondition(cid, condition, subId)
    local totem = Creature(cid)
    if not totem or not totem:isMonster() then return end

    local pos = totem:getPosition()
    local range = 4
    local targets = Game.getSpectators(pos, false, false, range, range, range, range)
    for _, target in ipairs(targets) do
         if target:isMonster() and target ~= totem and not target:getMaster() then
            local cond = Condition(CONDITION_ATTRIBUTES)        
            cond:setParameter(CONDITION_PARAM_SUBID, subId)
            cond:setParameter(CONDITION_PARAM_TICKS, 1000)
            target:addCondition(cond)
           -- print("condition applied to" .. target:getName())
        end
    end

    addEvent(applyAuraCondition, 1000, cid, condition, subId)
end


function startTotemAuraLoop(cid)
    local totem = Creature(cid)
    if not totem or not totem:isMonster() then return end
    local totemType = totem:getStorageValue("TotemType")
    if totemType == TotemTypes.OFFENSIVE then
        applyAuraCondition(totem:getId(), CONDITION_ATTRIBUTES, ConditionSubIDs.OffensiveTotem)
    elseif totemType == TotemTypes.DEFENSIVE then
        applyAuraCondition(totem:getId(), CONDITION_ATTRIBUTES, ConditionSubIDs.DefensiveTotem)
    elseif totemType == TotemTypes.HEALING then
        local function healingLoop()
            if not totem or not totem:isMonster() then return end
            local pos = totem:getPosition()
            local targets = Game.getSpectators(pos, false, false, 4, 4, 4, 4)
            for _, target in ipairs(targets) do
                if target:isMonster() and target ~= totem then
                    local healAmount = math.floor(target:getMaxHealth() * MAX_HP_HEAL_BOOST)
                  --  print("[TotemAura] Healing ", target:getName(), "for", healAmount, "HP")
                    target:addHealth(healAmount)
                    target:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
                end
            end
            addEvent(healingLoop, 2000)
        end
        healingLoop()
    end
end


function triggerTotemAura(creature)
    if not creature or not creature:isMonster() then return end

    local totemType = creature:getStorageValue("TotemType")
    if totemType == TotemTypes.OFFENSIVE or totemType == TotemTypes.DEFENSIVE or totemType == TotemTypes.HEALING then
        addEvent(startTotemAuraLoop, 1000, creature:getId())
    end
end



-- ========== Damage Modifier System ==========
local function modifyTotemDamage(creature, attacker, primary, primaryType, secondary, secondaryType)
    if creature and creature:hasCondition(CONDITION_ATTRIBUTES, ConditionSubIDs.OffensiveTotem) then
      --  print("[TotemAura] Damage increased by Offensive Totem")
        primary = math.floor(primary * DAMAGE_BOOST)
        secondary = math.floor(secondary * DAMAGE_BOOST)
    elseif creature and creature:hasCondition(CONDITION_ATTRIBUTES, ConditionSubIDs.DefensiveTotem) then
      --  print("[TotemAura] Damage reduced by Defensive Totem")
        primary = math.floor(primary * DAMAGE_REDUCTION)
        secondary = math.floor(secondary * DAMAGE_REDUCTION)
    else
      --  print("[TotemAura] No totem condition applied")
    end
    return primary, primaryType, secondary, secondaryType
end

local TotemHealthEvent = CreatureEvent("TotemAuraHP")
function TotemHealthEvent.onHealthChange(creature, attacker, primary, primaryType, secondary, secondaryType, origin)
    return modifyTotemDamage(creature, attacker, primary, primaryType, secondary, secondaryType)
end
TotemHealthEvent:register()

local TotemManaEvent = CreatureEvent("TotemAuraMP")
function TotemManaEvent.onManaChange(creature, attacker, primary, primaryType, secondary, secondaryType, origin)
    return modifyTotemDamage(creature, attacker, primary, primaryType, secondary, secondaryType)
end
TotemManaEvent:register()

-- Register creature events once
local TotemsCombatEvent = EventCallback
TotemsCombatEvent.onTargetCombat = function(creature, target)
    target:registerEvent("TotemAuraHP")
    target:registerEvent("TotemAuraMP")
    return RETURNVALUE_NOERROR
end
TotemsCombatEvent:register()