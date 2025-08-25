local config = {
	hpPercent = 3,
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

    

    local extrahealing = player:getSpecialSkill(SPECIALSKILL_EXTRAHEALING)
    if extrahealing > 0 then
        healthpercent = healthpercent * (1 + (extrahealing / 100))
    end

	--addrequired mana to cast 15% of total players mana
	local requiredMana = player:getMaxMana() * 0.25

	--Decrease the % mana cost required to cast life bloom by 2% per level
	local bloomingWisdom = player:getStorageValue(PassiveSkills.BloomingWisdom) or 0
	requiredMana = requiredMana - (requiredMana * (bloomingWisdom / 100))

    print("actual mana: " .. player:getMana())
    print("required mana: " .. requiredMana)
	if player:getMana() < requiredMana then
		player:sendCancelMessage(RETURNVALUE_NOTENOUGHMANA)
		return false
        else
            player:addMana(-requiredMana)
	end

    print("Health percent: " .. healthpercent)
    print("Mana percent: " .. manapercent)
    print("Magic level: " .. magic)


    local Life_bloom_hp = Condition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)


    Life_bloom_hp:setTicks(config.timer * config.rounds)

    Life_bloom_hp:setParameter(CONDITION_PARAM_HEALTHGAIN, healthpercent)
	Life_bloom_hp:setParameter(CONDITION_PARAM_HEALTHTICKS, config.timer)
    Life_bloom_hp:setParameter(CONDITION_PARAM_MANAGAIN, manapercent)
	Life_bloom_hp:setParameter(CONDITION_PARAM_MANATICKS, config.timer)
    Life_bloom_hp:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
    Life_bloom_hp:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.lifebloomhp)

    if not player:getParty() then
        player:say("No party or no members in range, apply to self", TALKTYPE_MONSTER_SAY)

      
        player:addCondition(Life_bloom_hp)
        player:attachEffectById(125, true)
        player:sendAddBuffNotification(9, 6, 'Health and mana restoration: 7% every seconds', 3, 0)
        return true
    else

        -- Optionally, apply mana regen as well (if desired for all members)
        for _, member in ipairs(player:getParty():getMembers()) do
            member:addCondition(Life_bloom_hp)
            member:attachEffectById(125, true)
            member:sendAddBuffNotification(9, 6, 'Health and mana restoration: 7% every seconds', 3, 0)
            
        end

        player:addCondition(Life_bloom_hp)
        player:attachEffectById(125, true)
        player:sendAddBuffNotification(9, 6, 'Health and mana restoration: 7% every seconds', 3, 0)
    end
    return true
end

