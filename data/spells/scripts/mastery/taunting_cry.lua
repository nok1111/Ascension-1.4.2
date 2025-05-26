local combat = Combat()
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

local speed = Condition(CONDITION_PARALYZE)
speed:setParameter(CONDITION_PARAM_TICKS, 5000)
speed:setFormula(-0.7, 52, -0.7, 52)

function onTargetCreature(creature, target)
    if target:getSpeed() > 0 then
        target:addCondition(speed)
    end
    if target:isMonster() then
        target:attachEffectById(20, true)
    end
    -- EchoingCommand passive: deal 5% (per level) of max health as holy damage
    local echoLevel = creature:getStorageValue(PassiveSkills.EchoingCommand) or 0
    if echoLevel > 0 then
        local maxHealth = creature:getMaxHealth()
        local percent = echoLevel / 100 -- 5% per level
        local holyDamage = math.floor(maxHealth * percent)
        if holyDamage > 0 then
            doTargetCombatHealth(creature, target, COMBAT_HOLYDAMAGE, -holyDamage, -holyDamage, CONST_ME_NONE)
            --target:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
        end
    end
    return doChallengeCreature(creature, target)
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local function delayedCombat(casterId, variant)
    local caster = Creature(casterId)
    if not caster or not caster:isPlayer() then return end
    combat:execute(caster, variant)
end

function onCastSpell(creature, variant)
    creature:attachEffectById(21, true)
    creature:attachEffectById(22, true)
    -- First hit immediately
    --combat:execute(creature, variant)
    -- Second hit after 1 second
    addEvent(delayedCombat, 600, creature:getId(), variant)
	addEvent(delayedCombat, 2000, creature:getId(), variant)
    return true
end
