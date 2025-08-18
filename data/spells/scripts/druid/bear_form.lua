local combats = {}



-- Toggle Condition
local toggleCondition = false

-- Define the condition IDs and sub IDs
local conditions = {
    {conditionId = CONDITION_HASTE, subId = ConditionsSubIds.bearformhaste},
    {conditionId = CONDITION_ATTRIBUTES, subId = ConditionsSubIds.bearformmaxhp},
    {conditionId = CONDITION_SPELLGROUPCOOLDOWN, subId = ConditionsSubIds.bearformcooldown},
    {conditionId = CONDITION_REGENERATION, subId = ConditionsSubIds.bearformregen},
    {conditionId = CONDITION_OUTFIT, subId = ConditionsSubIds.bearformoutfit},
    -- Add more conditions with sub IDs as needed
}

function onCastSpell(creature, variant)


	-- Combat 1: Haste
local haste_bear = Condition(CONDITION_HASTE)
haste_bear:setParameter(CONDITION_PARAM_TICKS, 15000)
haste_bear:setFormula(-0.3, 0, -0.3, 0)
haste_bear:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.bearformhaste)
combats[1] = Combat()
combats[1]:setParameter(COMBAT_PARAM_EFFECT, 270)
combats[1]:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combats[1]:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combats[1]:addCondition(haste_bear)

-- Combat 2: Max Health Increase
local maxhp_bear_bear = Condition(CONDITION_ATTRIBUTES)
maxhp_bear_bear:setParameter(CONDITION_PARAM_TICKS, 15000)
maxhp_bear_bear:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 200)
maxhp_bear_bear:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
maxhp_bear_bear:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.bearformmaxhp)
combats[2] = Combat()
combats[2]:setParameter(COMBAT_PARAM_EFFECT, 13)
combats[2]:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combats[2]:addCondition(maxhp_bear_bear)


-- Combat 4: Stun Spell Group Cooldown (subId 1)
local stunSpellAttacks = Condition(CONDITION_SPELLGROUPCOOLDOWN)
stunSpellAttacks:setParameter(CONDITION_PARAM_TICKS, 15000)
stunSpellAttacks:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.bearformcooldown)
combats[3] = Combat()
combats[3]:setParameter(COMBAT_PARAM_EFFECT, 13)
combats[3]:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combats[3]:addCondition(stunSpellAttacks)



-- Combat 7: Health Regeneration
local regen_bear = Condition(CONDITION_REGENERATION)
regen_bear:setParameter(CONDITION_PARAM_EFFECT, 313)
regen_bear:setParameter(CONDITION_PARAM_TICKS, 15000)
regen_bear:setParameter(CONDITION_PARAM_HEALTHGAIN, maxhealthregen)
regen_bear:setParameter(CONDITION_PARAM_HEALTHTICKS, 1000)
regen_bear:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.bearformregen)
combats[4] = Combat()
combats[4]:setParameter(COMBAT_PARAM_EFFECT, 313)
combats[4]:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combats[4]:addCondition(regen_bear)

-- Combat 8: Outfit Change

local outfit_bear = createConditionObject(CONDITION_OUTFIT)
outfit_bear:setParameter(CONDITION_PARAM_TICKS, 15000)
outfit_bear:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.bearformoutfit)
addOutfitCondition(outfit_bear, {lookType = 1715, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookTypeEx = 0, lookAddons = 0})
combats[5] = Combat()
combats[5]:setParameter(COMBAT_PARAM_EFFECT, 13)
combats[5]:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combats[5]:addCondition(outfit_bear)


    local player = Player(creature)
    local maxhealth = player:getHealth() * 2
    local maxhealthregen = (player:getMaxHealth() / 100) * 3.2

    -- Toggle conditions on or off
    toggleCondition = not toggleCondition

    if toggleCondition then
        -- Add conditions
        for _, combat in ipairs(combats) do
            combat:execute(creature, variant)
        end
        player:addHealth(maxhealth)
        player:sendAddBuffNotification(6, 15, 'Bear Form', 5, 0)
    else
			player:removeCondition(outfit_bear)
			player:removeCondition(regen_bear)
			player:removeCondition(stunSpellAttacks)
			player:removeCondition(maxhp_bear_bear)
			player:removeCondition(haste_bear)
			player:sendRemoveBuffNotification(6)

    end

    return true
end








