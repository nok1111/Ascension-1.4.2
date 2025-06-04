
local area = createCombatArea({
    {0, 0, 1, 0, 0},
    {0, 1, 1, 1, 0},
    {1, 1, 3, 1, 1},
    {0, 1, 1, 1, 0},
    {0, 0, 1, 0, 0},
})

local config = {
    effect = 196, -- effect of explosion
    type = COMBAT_FIREDAMAGE, -- explosion damage type
    disteffect = CONST_ANI_FIRE, -- projectile effect
    conditiontype = CONDITION_FIRE, -- condition to apply
    timer = 3, -- seconds until explosion
    burn_duration = 5, -- seconds for fire condition after explosion
    burn_tick = 1000, -- ms per tick
    burn_damage = -10, -- damage per tick
	distenceffect = 76,
}
	local combat2 = Combat()
	combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
	combat2:setParameter(COMBAT_PARAM_EFFECT, 6)
	combat2:setArea(area)

	

    local cond = Condition(config.conditiontype, CONDITIONID_COMBAT)
	cond:setTicks(config.burn_duration * 1000)
	cond:setParameter(CONDITION_PARAM_DELAYED, 1)
	cond:setParameter(CONDITION_PARAM_TICKINTERVAL, config.burn_tick)

	local preexplosion = Condition(config.conditiontype, CONDITIONID_COMBAT)
    preexplosion:setParameter(CONDITION_PARAM_DELAYED, true)
    preexplosion:setParameter(CONDITION_PARAM_TICKS, config.timer * 1000)
    preexplosion:addDamage(config.timer * 1000, config.burn_tick, config.burn_damage)

	function onGetFormulaValues(player, skill, attack, factor)

		local magic = player:getMagicLevel()
		local power = magic * attack 
		local level = player:getLevel()
	
	
		local min = (level / 5) + (power * 0.045) + attack
		local max = (level / 5) + (power * 0.065) + attack * 1.5
		return -min, -max
	end
	
	setCombatCallback(combat2, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

	local function cast_bomb(creatureId, variant)
		local creature = Creature(creatureId)
		if not creature then
			return
		end
		local level = creature:getLevel()
		local maglevel = creature:getMagicLevel()
		
		min = (level / 5) + (maglevel * 1.2) + 2
		max = (level / 5) + (maglevel * 1.8) + 4
		
		cond:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-min,-max))
		combat2:addCondition(cond)
		combat2:execute(creature, variant)
	end

function onCastSpell(creature, variant)
    local target = creature:getTarget()
    if not target then
        creature:sendCancelMessage("You need a target for Living Bomb.")
        return false
    end
    local pos = target:getPosition()
    -- Apply bomb mark (paralyze for visual, not for gameplay)
    target:addCondition(preexplosion)
	--send distance effect from creature to target
	creature:getPosition():sendDistanceEffect(pos, config.distenceffect)
		
    -- Schedule explosion, now passing variant
	addEvent(cast_bomb, config.timer * 1000,creature:getId(), variant)
    --caster:sendMagicEffect(CONST_ME_MAGIC_RED)
    return true
end