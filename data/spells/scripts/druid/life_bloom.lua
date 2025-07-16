local config = {
	hpPercent = 7,
	manaPercent = 1,
	 rounds = 6, -- amount of ticks
	timer = 1000, -- time between ticks
	effect = CONST_ME_SHINNYSPARK -- effect
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 15)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local baseMana = 100

function onCastSpell(creature, variant, isHotkey)
    local player = Player(creature)
    local magic = player:getMagicLevel()
    local healthpercent = (player:getMaxHealth() * (config.hpPercent/100)) + magic * 4.3
    local manapercent = (player:getMaxMana() * (config.manaPercent/100)) + magic * 2.1

	--addrequired mana to cast 15% of total players mana
	local requiredMana = player:getMaxMana() * 0.15

	--Decrease the % mana cost required to cast life bloom by 2% per level
	local bloomingWisdom = player:getStorageValue(PassiveSkills.BloomingWisdom) or 0
	requiredMana = requiredMana - (requiredMana * (bloomingWisdom / 100))
	if player:getMana() < requiredMana then
		player:sendCancelMessage(RETURNVALUE_NOTENOUGHMANA)
		return false
	end

    -- Build the regeneration conditions
    local forest_condition_hp = Condition(CONDITION_REGENERATION, CONDITIONID_COMBAT)
    forest_condition_hp:setParameter(CONDITION_PARAM_TICKS, config.timer)
    forest_condition_hp:setParameter(CONDITION_PARAM_HEALTHGAIN, healthpercent)
    forest_condition_hp:setParameter(CONDITION_PARAM_HEALTHTICKS, config.timer * config.rounds)
    forest_condition_hp:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
    forest_condition_hp:setParameter(CONDITION_PARAM_SUBID, 25973)

    local forest_condition_mana = Condition(CONDITION_REGENERATION, CONDITIONID_COMBAT)
    forest_condition_mana:setParameter(CONDITION_PARAM_TICKS, config.timer)
    forest_condition_mana:setParameter(CONDITION_PARAM_MANAGAIN, manapercent)
    forest_condition_mana:setParameter(CONDITION_PARAM_MANATICKS, config.timer * config.rounds)
    forest_condition_mana:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
    forest_condition_mana:setParameter(CONDITION_PARAM_SUBID, 25974)

    -- Use addPartyCondition for health
    local success = player:addPartyCondition(combat, variant, forest_condition_hp, baseMana)
    if not success then
        -- No party or no members in range, apply to self
        player:addCondition(forest_condition_hp)
        player:addCondition(forest_condition_mana)
        player:attachEffectById(125, true)
        player:sendAddBuffNotification(115, 6, 'Health and mana restoration: 7% every seconds', 3, 0)
        return true
    end

    -- Optionally, apply mana regen as well (if desired for all members)
    for _, member in ipairs(player:getParty():getMembers()) do
        member:addCondition(forest_condition_mana)
		member:attachEffectById(125, true)
		member:sendAddBuffNotification(115, 6, 'Health and mana restoration: 7% every seconds', 3, 0)
    end

    -- Visual effect for the caster
    player:attachEffectById(125, true)

    -- Buff notification (customize message as needed)
    player:sendAddBuffNotification(115, 6, 'Health and mana restoration: 7% every seconds', 3, 0)

    return true
end

