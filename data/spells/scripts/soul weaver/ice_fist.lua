-- Minimum amount of magic missiles
local minMissiles = 1
local maxBoosters = 2
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)

local areaLarge = createCombatArea(AREA_CIRCLE2X2)

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat2:setArea(areaLarge)

function onGetFormulaValues(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.045) + attack
	local max = (level / 5) + (power * 0.085) + attack * 1.5
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

-- Secondary damage formula: a bit more damage.
function onGetFormulaValues2(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = magic * attack 
    local level = player:getLevel()
    local min = (level / 5) + (power * 0.045) + attack
    local max = (level / 5) + (power * 0.065) + attack * 1.75  -- Increased multiplier for extra damage
    return -min, -max
end
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

local function arcaneDamage(player, variant, target)
    local player = Player(player)
    local creature = Creature(target)
    if player and creature then

			local position = creature:getPosition()
			local positioneffect = position
			positioneffect.x = position.x + 1
			positioneffect.y = position.y + 2

			positioneffect:sendMagicEffect(math.random(739,740,741,742))
		    local pos = creature:getPosition()
            pos:sendMagicEffect(6)
            --Position(pos.x + 3, pos.y + 3, pos.z):sendMagicEffect(341)


        -- If the player has reached max fire boosters, execute the extra effect.
    if getElementalBoost(player, "fire") >= maxBoosters then
        print("combat 2")
         combat2:execute(player, variant)
         Position(pos.x + 1, pos.y + 1, pos.z):sendMagicEffect(341)
         ClearBooster(player)
    else
    combat:execute(player, variant)
    end


    end
    return true
end

function onCastSpell(player, variant)

	aura_counter = 25952 -- soul counter
	aura_storage = 25950 -- soul aura storage
	
	local target = player:getTarget()
    local magiclevel = player:getMagicLevel()
	local maxhealth = player:getMaxHealth()

   arcaneDamage(player:getId(), variant, target:getId())
    return true
end







