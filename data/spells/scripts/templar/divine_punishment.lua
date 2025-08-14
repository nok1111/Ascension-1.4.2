
local config = {
    cloud_duration = 800, -- duration in milliseconds
    cloud_delay = 800, -- delay between magic effects in milliseconds
	cloud_effect = 649,
	sword_effect = 664,
	ground_effect = 646
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:setArea(createCombatArea(AREA_SQUARE1X1))


function onGetFormulaValues(player, skill, attack, factor)

	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.10) + (attack * 5.0) + 350
    local max = (level / 5) + (power * 0.15) + (attack * 5.5) + 450
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function applycross(position)  	
    position:sendMagicEffect(config.sword_effect)

end

local function apply_floor(position)  	

	position:sendMagicEffect(config.ground_effect)
end

local function Damage_spell(creatureId, position)
	local creature = Creature(creatureId)
	if not creature then
		return
	end

    combat:execute(creature, Variant(position))
end

 local function apply_nube(position)  	
    position:sendMagicEffect(config.cloud_effect)
end
  
   
function onCastSpell(creature, variant)



local target = creature:getTarget()
local position = target:getPosition()
local positionnube = target:getPosition()
positionnube.x = target:getPosition().x + 0
positionnube.y = target:getPosition().y + 0
positionnube:sendMagicEffect(config.cloud_effect)

		for i = 1, config.cloud_duration / config.cloud_delay do
            addEvent(apply_nube, config.cloud_delay * i, positionnube)
        end

   position.x = target:getPosition().x + 1
   position.y = target:getPosition().y + 1	
   
   
   addEvent(applycross, 650, position)
   addEvent(apply_floor, 1100, position)
   addEvent(Damage_spell, 1100, creature:getId(), target:getPosition())
   

   
  return true
end


