local config = {
    duration = 10,
    ticksBetween = 800,
    effect = 559,
    effect2 = 511
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:setArea(createCombatArea(AREA_CIRCLE2X2))


function onGetFormulaValues(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = ((level / 5) + (power * 0.085) + (attack * 1.5) + 150) / 2.68
	local max =  ((level / 5) + (power * 0.085) + (attack * 1.5) + 150) / 2.45
    return -min, -max
end


combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


local function doAnimation(creatureId, pos)
    local creature = Creature(creatureId)
    if not creature then
        return
    end

    for i = 1, 3 do
        local randomPos = Position(pos.x + math.random(-2, 2), pos.y + math.random(-2, 2), pos.z)
        if pos:isSightClear(randomPos, true) then
            randomPos:sendMagicEffect(595)
            combat:execute(creature, Variant(randomPos))
             
        end
    end
end

local function apply_floor(creatureId, positionnube)  	
local creature = Creature(creatureId)
	if not creature then
		return
	end
	positionnube:sendMagicEffect(616)
end

function onCastSpell(creature, variant)
    local pos = creature:getPosition()
	local positionnube = creature:getPosition()
	positionnube.x = creature:getPosition().x + 2
	positionnube.y = creature:getPosition().y + 2

    -- Schedule animation effects
    for i = 1, (config.duration * 1000) / config.ticksBetween do  -- Modified for simpler calculation
        addEvent(doAnimation, config.ticksBetween * i, creature:getId(),  pos)
    end
	for i = 1, config.duration * 1000 / 100 do
	addEvent(apply_floor, 100 * i, creature:getId(), positionnube)
	end
	apply_floor(creature:getId(), positionnube)
	creature:getPosition():sendMagicEffect(593)
    return true
end
