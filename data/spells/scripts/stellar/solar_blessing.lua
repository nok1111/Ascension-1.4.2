local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, 604)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(player, level, magicLevel)
	--healing them instantly for 50% of your max mana
	local maxmana = player:getMaxMana()
	local min = maxmana * 0.5
	local max = maxmana * 0.5
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local solar_blessing = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
solar_blessing:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
solar_blessing:setParameter(CONDITION_PARAM_SUBID, 29509)
solar_blessing:setParameter(CONDITION_PARAM_STAT_MAXHEALTHPOINTSPERCENT, 165)
solar_blessing:setParameter(CONDITION_PARAM_TICKS, 8000)

local function onAttach(creatureid, variant)
	local creature = Creature(creatureid)
	if not creature then return end
	creature:attachEffectById(107, true)
	combat:execute(creature, variant)
end

function onCastSpell(creature, variant)
	creature:attachEffectById(107, true)
	creature:attachEffectById(108, true)
	creature:addCondition(solar_blessing)

	--addevent these after 8 seconds, passing variant
	addEvent(function()
		onAttach(creature:getId(), variant)
	end, 8000)
	
	return combat:execute(creature, variant)
end
