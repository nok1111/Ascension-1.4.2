local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, 0)
combat1:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 179) --CONST_ME_FIREATTACK, CONST_ME_RAGIAZ_BONECAPSULE, CONST_ANI_DEATH, CONST_ANI_SUDDENDEATH
combat1:setParameter(COMBAT_PARAM_BLOCKARMOR, true)


local area = createCombatArea({
    {0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0},
    {0, 0, 2, 0, 0},
    {0, 0, 1, 0, 0},
    {0, 0, 0, 0, 0}
    })
combat1:setArea(area)

function onGetFormulaValues(player, skill, attack, factor)

	local magic = player:getMagicLevel()
	local power = magic * attack 
	local level = player:getLevel()


	local min = (level / 5) + (power * 0.045) + attack
	local max = (level / 5) + (power * 0.065) + attack * 1.5
	return -min, -max
end

combat1:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")



local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, 571)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)



function onGetFormulaValues(player, skill, attack, factor)

	local magic = player:getMagicLevel()
	local power = magic * attack 
	local level = player:getLevel()


	local min = (level / 5) + (power * 0.045) + attack
	local max = (level / 5) + (power * 0.065) + attack * 1.5
	return -min, -max
end

combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function handleCosmicForceEffect(tid, config)
    local target = Creature(tid)
    if not target or not target:isPlayer() or target:isRemoved() then return end
    local tarpos = target:getPosition()
    for i = 0, #config, 1 do
        Position(config[i]):sendDistanceEffect(tarpos, 179)
        doSendMagicEffect(Position(config[i]), 214)
    end
end

local function handleCosmicForceCombat(cid, tid, combat2, creature)
    local target = Creature(tid)
    local caster = Creature(cid)
    if not target or not target:isPlayer() or target:isRemoved() then return end
    if not caster or not caster:isPlayer() or caster:isRemoved() then return end
    local tarpos = target:getPosition()
    local variant = numberToVariant(tid)
    --SendMagicEffect(tarpos, 321)
    combat2:execute(creature, variant)
	local CosmicForceManaRestore = caster:getStorageValue(PassiveSkills.CosmicForceManaRestore) or 0
	if CosmicForceManaRestore > 0 then
		--Cosmic Force now restores 3% of your max mana per level
		local maxMana = caster:getMaxMana()
		local CosmicForceManaRestore = maxMana * (CosmicForceManaRestore / 100)
		caster:addMana(CosmicForceManaRestore)
	end
end

function onCastSpell(creature, variant)
    local pos = creature:getPosition()
    local x, y, z = pos.x, pos.y, pos.z
    local config = {
        [0] = {x = x, y = y-1, z = z},
        [1] = {x = x, y = y+1, z = z}
    }

    local cid = creature:getId()
    variant = numberToVariant(cid)

    for i = 0, #config, 1 do
        --Creature(cid):getPosition():sendDistanceEffect(Position(config[i]), 118)
        doSendMagicEffect(Position(config[i]), 566)
        doSendMagicEffect(Position(config[i]), 567)
    end

    combat1:execute(creature, variant)

    for i = 0, #config, 1 do
        Position(config[i]):sendMagicEffect(569)
    end

    -- Replace the following blocks with the helper function calls:
    addEvent(function()
        handleCosmicForceEffect(tid, config)
    end, 400)

    addEvent(function()
        handleCosmicForceCombat(cid, tid, combat2, creature)
    end, 500)
end