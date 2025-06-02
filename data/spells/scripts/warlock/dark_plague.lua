local config = {
	Heal = 78802,		--Storage for amount of targets
	BleedingTicks = 15000,	--duration of poison
	TimeBetweenTicks = 1500, --interval of poison damage
	delayondamage = 670
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 301)
combat:setArea(createCombatArea(AREA_CIRCLE2X2))
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

local bleed = Condition(CONDITION_CURSED, CONDITIONID_COMBAT)
	--bleed:setParameter(COMBAT_PARAM_EFFECT, 248)
	bleed:setTicks(config.BleedingTicks) 
	bleed:setParameter(CONDITION_PARAM_DELAYED, 1)
	bleed:setParameter(CONDITION_PARAM_TICKINTERVAL, config.TimeBetweenTicks) 


--formula for poison damage
local function CastSpell(cid, var) 
    local player = Player(cid)
    local level = player:getLevel()
    local magic = player:getMagicLevel()
	
	min = (level / 5) + (magic * 1.0)
    max = (level / 5) + (magic * 1.2)
	
    bleed:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-min,-max))
    combat:addCondition(bleed)
end

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setArea(createCombatArea(AREA_CIRCLE2X2))
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

--formula for AOE damage.
function onGetFormulaValues(player, level, magicLevel)
	local min = (player:getLevel() / 5) +  (player:getMagicLevel() * 3.5) + 25
	local max = (player:getLevel() / 5) +  (player:getMagicLevel() * 4.5) + 45	
	return -min, -max
end

combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


local function castSpell12(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
	local target = creature:getTarget()
	if not target then
		return
	end
	local sword = target:getPosition()
        sword.x = sword.x + 1
        sword.y = sword.y + 1

    sword:sendMagicEffect(833, "turn into bones!")	
	
    combat2:execute(creature, variant)
end

function onCastSpell(creature, variant)
	local cid = creature:getId()
	CastSpell(creature:getId(), variant)
	addEvent(castSpell12, config.delayondamage, creature:getId(), variant)
	combat:execute(creature, variant)	
		
	return true
end
