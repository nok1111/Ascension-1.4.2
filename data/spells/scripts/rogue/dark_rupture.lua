local combat = Combat()
local combat2 = Combat()

local time_between_hits2 = 1.75 --seconds
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 620)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)

combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, 516)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_USECHARGES, true)

--347


function onGetFormulaValues(player, skill, attack, factor)
	local power = skill * attack 
    local level = player:getLevel()

    local min = ((level / 5) + (power * 0.060) + attack * 1.0) * 1.0
    local max = ((level / 5) + (power * 0.0705) + attack * 1.3) * 1.15
	return -min, -max
	
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onGetFormulaValues2(player, skill, attack, factor)
	local power = skill * attack 
    local level = player:getLevel()

    local min = ((level / 5) + (power * 0.060) + attack * 1.0) * 1.65
    local max = ((level / 5) + (power * 0.0705) + attack * 1.3) * 1.75
	return -min, -max
	
end
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

local combatbleed = Combat()
combatbleed:setArea(createCombatArea(AREA_SQUARE2X2))

local condition2 = Condition(CONDITION_BLEEDING, CONDITIONID_COMBAT)
condition2:setTicks(5000)
condition2:setParameter(CONDITION_PARAM_DELAYED, 1)
condition2:setParameter(CONDITION_PARAM_TICKINTERVAL, 1000)

local function bleed_mastery(cid, var)
    local player = Player(cid)
    local level = player:getLevel()
    local skill = player:getEffectiveSkillLevel(SKILL_SWORD)
	
	min = (level / 5) + (skill * 0.025) + level
    max = (level / 5) + (skill * 0.028) + level
	
    condition2:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-min,-max))
    combatbleed:addCondition(condition2)
end

local function bleed_mastery(cid, var)
    local player = Player(cid)
    local level = player:getLevel()
    local skill = player:getEffectiveSkillLevel(SKILL_SWORD)
	
	min = (level / 5) + (skill * 0.025) + level
    max = (level / 5) + (skill * 0.028) + level

	min = min * 0.35
	max = max * 0.35
	
    condition2:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-min,-max))
    combatbleed:addCondition(condition2)
end

local function castSpell2(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combat2:execute(creature, variant)
	creature:getTarget():getPosition():sendMagicEffect(173)
end

function onCastSpell(creature, variant)
if not creature then
        return false
    end
local target = creature:getTarget()
target:getPosition():sendMagicEffect(516)

local VirulentRupture = creature:getStorageValue(PassiveSkills.VirulentRupture) or 0
	if VirulentRupture > 0 and target:getCondition(CONDITION_BLEEDING, CONDITIONID_COMBAT) then
		if math.random(1, 100) <= (VirulentRupture) then				
			bleed_mastery(creature:getId(), variant)
			combatbleed:execute(creature, variant)
			target:attachEffectById(141, true)
		end
	end
  
  if target:getCondition(CONDITION_STUN, 0)then
  --combat2:execute(creature, var) 
  target:attachEffectById(140, true)
  
  
	castSpell2(creature:getId(), variant)
  else
	combat:execute(creature, variant) 
	target:attachEffectById(139, true)

  end
  
  return true
end
