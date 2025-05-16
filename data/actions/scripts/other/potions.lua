
local config = {
	-- health potion
	[35768] = {health = {min = 125, max = 175}, emptyId = 7636},
	-- mana potion
	[35765] = {mana = {min = 75, max = 125}, emptyId = 7636},
	-- small spirit potion
	[35764] = {health = {min = 60, max = 90}, mana = {min = 35, max = 70}, emptyId = 7635},
	
	
	-- medium health potion
	[35769] = {health = {min = 250, max = 350}, level = 50, emptyId = 7635},
	-- medium  mana potion
	[35766] = {mana = {min = 125, max = 185}, level = 50, emptyId = 7635},
	-- medium spirit potion
	[35763] = {health = {min = 125, max = 175}, mana = {min = 65, max = 95},  level = 50, emptyId = 7635},
	
	-- big mana potion
	[35767] = {mana = {min = 200, max = 275}, level = 80, emptyId = 7635},
	-- big health potion
	[35782] = {health = {min = 425, max = 575}, level = 80, emptyId = 7635},
	-- big spirit potion
	[35762] = {health = {min = 210, max = 290}, mana = {min = 100, max = 190}, level = 80, emptyId = 7635},
	
	-- ultimate health potion
	[8473] = {health = {min = 450, max = 600}, emptyId = 7635},
	
	
	
	
	-- ENCHANTED
	[37282] = {health = {min = 425, max = 475}, mana = {min = 475, max = 550}, level = 100, emptyId = 7635},
	[37283] = {mana = {min = 950, max = 1100}, level = 100, emptyId = 7635},
	[37284] = {health = {min = 850, max = 950}, level = 100, emptyId = 7635},
	
	-- ultimate mana potion 26029
	[26029] = {mana = {min = 400, max = 580}, vocations = {1, 2}, text = 'sorcerers and druids', level = 130, emptyId = 7635},
	
	-- Supreme Health Potion 26031
	[26031] = {health = {min = 650, max = 800}, vocations = {4}, text = 'knights', level = 200, emptyId = 7635},
	
	-- Ultimate Spirit Potion 26030
	[26030] = {health = {min = 400, max = 480}, mana = {min = 180, max = 310}, vocations = {3}, text = 'paladins', level = 130, emptyId = 7635},
	
	
	-- antidote potion
	[8474] = {antidote = true, emptyId = 7636},
	-- small health potion
	[8704] = {health = {min = 60, max = 85}, emptyId = 7636}
}

local antidote = Combat()
antidote:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
antidote:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HPUP)
antidote:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
antidote:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
antidote:setParameter(COMBAT_PARAM_DISPEL, CONDITION_POISON)

local exhaust = Condition(CONDITION_EXHAUST_HEAL)
exhaust:setParameter(CONDITION_PARAM_TICKS, (configManager.getNumber(configKeys.EX_ACTIONS_DELAY_INTERVAL) - 1000))
-- 1000 - 100 due to exact condition timing. -100 doesn't hurt us, and players don't have reminding ~50ms exhaustion.
math.randomseed(os.time())
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local potion = config[item.itemid]
	if not potion then
		return true
	end

	if target.itemid ~= 1 or target.type ~= THING_TYPE_PLAYER then
		return false
	end

	

	if player:getCondition(CONDITION_EXHAUST_HEAL) then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_YOUAREEXHAUSTED))
		return true
	end


	if potion.antidote and not antidote:execute(target, Variant(target.uid)) then
		return false
	end

	if (potion.level and player:getLevel() < potion.level)
			or (type(potion.vocations) == 'table' and not isInArray(potion.vocations, player:getVocation():getBase():getId()))
			and not (player:getGroup():getId() >= 2) then
		player:say(string.format('This potion can only be consumed by %s of level %d or higher.', potion.text, potion.level), TALKTYPE_MONSTER_SAY)
		return true
	end
	
		 for slot = CONST_SLOT_HEAD, CONST_SLOT_RUNE3 do
      local item = player:getSlotItem(slot)
      if item then
        local values = item:getBonusAttributes()
        if values then
          for key, value in pairs(values) do
            local attr = US_ENCHANTMENTS[value[1]]
            if attr then
              if attr.name == "Potion Buff" then
			  
                -- HEALTH POTION
				if type(potion.health) == 'table' and not doTargetCombatHealth(0, target, COMBAT_HEALING,(potion.health.min / 100) * value[2] ,(potion.health.max / 100) * value[2], 336) then
				return false
				end
				-- MANA POTION
				if type(potion.mana) == 'table' then
					if not doTargetCombatMana(0, target, gainedValue, gainedValue, 379) then
						return false
					elseif not doTargetCombatMana(0, target, (potion.mana.min / 100) * value[2], (potion.mana.max / 100) * value[2], 379) then
						return false
					end
				end
                 
				
              end
            end
          end
        end
      end
    end
	
	if type(potion.health) == 'table' and not doTargetCombatHealth(0, target, COMBAT_HEALING, potion.health.min, potion.health.max, 336) then
		return false
	end

	if type(potion.mana) == 'table' then
		if not doTargetCombatMana(0, target, gainedValue, gainedValue, 379) then
			return false
		elseif not doTargetCombatMana(0, target, potion.mana.min, potion.mana.max, 379) then
			return false
		end
	end

	--player:addAchievementProgress('Potion Addict', 100000)

	player:addCondition(exhaust)
	target:say("Aaaah...", TALKTYPE_MONSTER_SAY)
	--target:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)

	

	--Game.createItem(potion.emptyId, 1, item:getPosition())
	item:remove(1)
	
	return true
end
