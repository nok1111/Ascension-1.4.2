local configHeal = {	
	timer = 30,	-- Total time in seconds for heals
	interval = 1500  -- Interval in milliseconds (1.5 seconds)
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setArea(createCombatArea(AREA_CIRCLE6X6))


local condition2 = Condition(CONDITION_ATTRIBUTES)
condition2:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.angel_form)
condition2:setParameter(CONDITION_PARAM_TICKS, 15000)
condition2:setParameter(CONDITION_PARAM_STAT_MAGICPOINTSPERCENT, 135)
condition2:setParameter(CONDITION_PARAM_DISABLE_DEFENSE, true)
condition2:setParameter(CONDITION_PARAM_BUFF_SPELL, true)


function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 6.9) + 40
	local max = (level / 5) + (maglevel * 13.2) + 82
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")




function onCastSpell(creature, variant)

local player = Player(creature)


	local cid = creature:getId()

	 -- Schedule heal executions every interval
    for i = 0, (configHeal.timer * 1000) / configHeal.interval do
        addEvent(function()
            if creature then
                combat:execute(creature, variant)
            end
        end, i * configHeal.interval)
    end

	creature:addCondition(condition2)
	combat:execute(creature, variant)
	creature:attachEffectById(29, true)
	creature:attachEffectById(30, true)
	
	player:sendAddBuffNotification(26, 15, 'Holy Form', 5, 0)
  
	

	return true
end
