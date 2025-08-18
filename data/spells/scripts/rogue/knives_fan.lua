local config = {
	amount = 40, --Amount of effects on the first wave
	firstTimer =20,	--time between each effect of the first wave
	amountSecond = 70, --Amount of effects on the second wave
	secondTimer = 10, --time between each effect of the second wave
}


--------------------------------------------
--  CONDITION FORMULA



local combatnodot = Combat()
local combat = Combat()
combat:setArea(createCombatArea(AREA_CIRCLE5X5))

local condition = Condition(CONDITION_POISON)
condition:setTicks(15000)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:setParameter(CONDITION_PARAM_TICKINTERVAL, 1500)

local conditioncursed = Condition(CONDITION_CURSED)
conditioncursed:setTicks(15000)
conditioncursed:setParameter(CONDITION_PARAM_DELAYED, 1)
conditioncursed:setParameter(CONDITION_PARAM_TICKINTERVAL, 1500)



function onGetFormulaValuesdot(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.08) + (attack * 0.2) + 150
	local max = (level / 5) + (power * 0.09) + (attack * 0.25) + 180
	return -min, -max
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValuesdot")

local function CastSpell(cid, var)
    local player = Player(cid)
    local level = player:getLevel()
    local magic = player:getMagicLevel()
	
	min = (level / 1) + (magic * 3.3)
    max = (level / 1) + (magic * 4.35)

	local Deathwind = player:getStorageValue(PassiveSkills.Deathwind) or 0
	if Deathwind > 0 then
		min = min + (min * (Deathwind / 100))
		max = max + (max * (Deathwind / 100))
		conditioncursed:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-min,-max))
		combat:addCondition(conditioncursed)
	else
		condition:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-min,-max))
		combat:addCondition(condition)
	end
	
    
end


----------------------------------------------
-- KNIVES FORMULA
local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, 1)



function onGetFormulaValues1(player, skill, attack, factor)

	local power = skill * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.08) + (attack * 0.2) + 25
	local max = (level / 5) + (power * 0.09) + (attack * 0.25) + 32
	return -min, -max
end

combat1:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues1")

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, 10)


function onGetFormulaValues2(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.08) + (attack * 0.2) + 25
	local max = (level / 5) + (power * 0.09) + (attack * 0.25) + 32
	return -min, -max
end

combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

local combat3 = Combat()
combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat3:setParameter(COMBAT_PARAM_EFFECT, 10)


function onGetFormulaValues3(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.08) + (attack * 0.2) + 25
	local max = (level / 5) + (power * 0.09) + (attack * 0.25) + 32
	return -min, -max
end

combat3:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues3")

local combat4 = Combat()
combat4:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat4:setParameter(COMBAT_PARAM_EFFECT, 10)


function onGetFormulaValues4(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.08) + (attack * 0.2) + 25
	local max = (level / 5) + (power * 0.09) + (attack * 0.25) + 32
	return -min, -max
end

combat4:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues4")

local combat5 = Combat()
combat5:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat5:setParameter(COMBAT_PARAM_EFFECT, 10)

function onGetFormulaValues5(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.08) + (attack * 0.2) + 25
	local max = (level / 5) + (power * 0.09) + (attack * 0.25) + 32
	return -min, -max
end

combat5:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues5")

local function healtargets(player, target)
    -- Check if player is valid
    if not player then
        return false
    end

    -- Check if the target is the player or is nil (indicating a self-heal)
    if target == player or target == nil then
        return true
    end

    -- Check if the target is a player
    if target:isPlayer() then
        -- Check if the target is in the same party as the player's leader
        if target:getParty() and target:getParty():getLeader() == player then
            return true
        end

        -- Check if the player has secure mode enabled (always heal)
        if player:hasSecureMode() then
            return true
        end

        -- Check if the target is in the same guild as the player's guild leader
        if target:getGuild() and target:getGuild():getLeader() == player then
            return true
        end
    end

    -- Check if the target has a master (summoned creature)
    if target:getMaster()  and target:getMaster():isPlayer() then -- Check if the target has a master (summon) then
        -- Check if the target is the player's master (heal own summons)
        if target:getMaster() == player then
            return true
        end

        -- Check if the target's master is a player and is in the same party as the player
        if target:getMaster():isPlayer() and player:getParty() and player:getParty() == target:getMaster():getParty() then
            -- Heal friendly party summoned creature
            return true
        end

        -- Check if the player has secure mode enabled (always heal non-friendly summons)
        if player:hasSecureMode() then
            return true
        end
    end

    -- If none of the conditions are met, the target is not a valid heal target
    return false
end


local function SpellAnimation(cid, combat1, combat2, combat3, combat4, combat5)
	local creature = Creature(cid)
	if creature then
		local pos = creature:getPosition()
		local x, y, z = pos.x, pos.y, pos.z
		local posArray = {
			[1] = {x = x + 1, y = y, z = z},
			[2] = {x = x + 1, y = y + 1, z = z},
			[3] = {x = x, y = y + 1, z = z},
			[4] = {x = x - 1, y = y + 1, z = z},
			[5] = {x = x - 1, y = y, z = z},
			[6] = {x = x - 1, y = y - 1, z = z},
			[7] = {x = x, y = y - 1, z = z},
			[8] = {x = x + 1, y = y - 1, z = z},
			[9] = {x = x + 2, y = y - 1, z = z},
			[10] = {x = x + 2, y = y, z = z},
			[11] = {x = x + 2, y = y + 1, z = z},
			[12] = {x = x + 1, y = y + 2, z = z},
			[13] = {x = x, y = y + 2, z = z},
			[14] = {x = x - 1, y = y + 2, z = z},
			[15] = {x = x - 2, y = y + 1, z = z},
			[16] = {x = x - 2, y = y, z = z},
			[17] = {x = x - 2, y = y - 1, z = z},
			[18] = {x = x - 1, y = y - 2, z = z},
			[19] = {x = x, y = y - 2, z = z},
			[20] = {x = x + 1, y = y - 2, z = z},
			[21] = {x = x + 3, y = y, z = z},
			[22] = {x = x + 3, y = y + 1, z = z},
			[23] = {x = x + 3, y = y + 2, z = z},
			[24] = {x = x + 2, y = y + 2, z = z},
			[25] = {x = x + 1, y = y + 3, z = z},
			[26] = {x = x, y = y + 3, z = z},
			[27] = {x = x - 1, y = y + 3, z = z},
			[28] = {x = x - 2, y = y + 2, z = z},
			[29] = {x = x - 3, y = y + 1, z = z},
			[30] = {x = x - 3, y = y, z = z},
			[31] = {x = x - 3, y = y - 1, z = z},
			[32] = {x = x - 2, y = y - 2, z = z},
			[33] = {x = x - 1, y = y - 3, z = z},
			[34] = {x = x, y = y - 3, z = z},
			[35] = {x = x + 1, y = y - 3, z = z},
			[36] = {x = x + 2, y = y - 2, z = z},
			[37] = {x = x + 3, y = y - 1, z = z},
			[38] = {x = x + 4, y = y - 2, z = z},
			[39] = {x = x + 4, y = y - 1, z = z},
			[40] = {x = x + 4, y = y, z = z},
			[41] = {x = x + 4, y = y + 1, z = z},
			[42] = {x = x + 4, y = y + 2, z = z},
			[43] = {x = x - 4, y = y - 2, z = z},
			[44] = {x = x - 4, y = y - 1, z = z},
			[45] = {x = x - 4, y = y, z = z},
			[46] = {x = x - 4, y = y + 1, z = z},
			[47] = {x = x - 4, y = y + 2, z = z},
			[48] = {x = x - 2, y = y + 4, z = z},
			[49] = {x = x - 1, y = y + 4, z = z},
			[50] = {x = x, y = y+ 4, z = z},
			[51] = {x = x + 1, y = y + 4, z = z},
			[52] = {x = x + 2, y = y + 4, z = z},
			[53] = {x = x - 2, y = y - 4, z = z},
			[54] = {x = x - 1, y = y - 4, z = z},
			[55] = {x = x, y = y -45, z = z},
			[56] = {x = x + 1, y = y - 4, z = z},
			[57] = {x = x + 2, y = y - 4, z = z},
			[58] = {x = x + 3, y = y - 3, z = z},
			[59] = {x = x + 3, y = y - 2, z = z},
			[60] = {x = x + 2, y = y - 3, z = z},
			[61] = {x = x + 3, y = y + 3, z = z},
			[62] = {x = x + 3, y = y + 2, z = z},
			[63] = {x = x + 2, y = y + 3, z = z},
			[64] = {x = x - 3, y = y + 3, z = z},
			[65] = {x = x - 3, y = y + 2, z = z},
			[66] = {x = x - 2, y = y + 3, z = z},
			[67] = {x = x - 3, y = y - 3, z = z},
			[68] = {x = x - 3, y = y - 2, z = z},
			[69] = {x = x - 2, y = y - 3, z = z},
			[70] = {x = x - 1, y = y - 3, z = z},
			[71] = {x = x + 5, y = y, z = z},
			[72] = {x = x - 5, y = y, z = z},
			[73] = {x = x, y = y + 5, z = z},
			[74] = {x = x, y = y - 5, z = z}
		}
		local dmgArray = {
			[1] = 5,
			[2] = 4,
			[3] = 5,
			[4] = 4,
			[5] = 5,
			[6] = 4,
			[7] = 5,
			[8] = 4,
			[9] = 3,
			[10] = 4,
			[11] = 3,
			[12] = 3,
			[13] = 4,
			[14] = 3,
			[15] = 3,
			[16] = 4,
			[17] = 3,
			[18] = 3,
			[19] = 4,
			[20] = 3,
			[21] = 3,
			[22] = 2,
			[23] = 2,
			[24] = 2,
			[25] = 2,
			[26] = 3,
			[27] = 2,
			[28] = 2,
			[29] = 2,
			[30] = 3,
			[31] = 2,
			[32] = 2,
			[33] = 2,
			[34] = 3,
			[35] = 2,
			[36] = 2,
			[37] = 2,
			[38] = 1,
			[39] = 1,
			[40] = 2,
			[41] = 1,
			[42] = 1,
			[43] = 1,
			[44] = 1,
			[45] = 2,
			[46] = 1,
			[47] = 1,
			[48] = 1,
			[49] = 1,
			[50] = 2,
			[51] = 1,
			[52] = 1,
			[53] = 1,
			[54] = 1,
			[55] = 2,
			[56] = 1,
			[57] = 1,
			[58] = 1,
			[59] = 1,
			[60] = 1,
			[61] = 1,
			[62] = 1,
			[63] = 1,
			[64] = 1,
			[65] = 1,
			[66] = 1,
			[67] = 1,
			[68] = 1,
			[69] = 1,
			[70] = 1,
			[71] = 1,
			[72] = 1,
			[73] = 1,
			[74] = 1
		}

local AREA_Damage = {
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 2, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 2, 3, 2, 1, 1, 0, 0},
{0, 1, 1, 2, 3, 4, 3, 2, 1, 1, 0},
{0, 1, 2, 3, 4, 5, 4, 3, 2, 1, 0},
{1, 2, 3, 4, 5, 2, 5, 4, 3, 2, 1},
{0, 1, 2, 3, 4, 5, 4, 3, 2, 1, 0},
{0, 1, 1, 2, 3, 4, 3, 2, 1, 1, 0},
{0, 0, 1, 1, 2, 3, 2, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 2, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}
}

		for i = 1, #posArray, 1 do
			if pos:isSightClear(Position(posArray[i]), true) then
				if getTilePzInfo(Position(posArray[i])) == FALSE then
				local player = Player(cid)
				 local position = player:getPosition()
				  local explo = player:getPosition()
                  explo.x = explo.x + 1
                  explo.y = explo.y + 1
    
					pos:sendDistanceEffect(Position(posArray[i]), 9)
					pos:sendDistanceEffect(Position(posArray[i]), 9)
					--explo:sendMagicEffect( 235, "core")
					
					local tile = Tile(Position(posArray[i]))
					if tile ~= nil then
						local creatures = tile:getCreatures()
						if creatures ~= nil and not healtargets(player, creatures[1]) then
							if #creatures > 0 then
							
								local times = dmgArray[i]
								local variant = positionToVariant(Position(posArray[i]))
								if times == 1 then
									combat1:execute(creature, variant)		
								elseif times == 2 then
									combat2:execute(creature, variant)
								elseif times == 3 then
									combat3:execute(creature, variant)
								elseif times == 4 then
									combat4:execute(creature, variant)
								elseif times == 5 then
									combat5:execute(creature, variant)
								end
								
							end
						end
					end
				end
			end
		end
	end
	return true


end

function onCastSpell(creature, variant)
	local creatureId = creature:getId()

	local Deathwind = creature:getStorageValue(PassiveSkills.Deathwind) or 0
	if Deathwind > 0 then
		for i, c in ipairs({combat, combatnodot, combat1, combat2, combat3, combat4, combat5}) do
			c:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
		end

		combat2:setParameter(COMBAT_PARAM_EFFECT, 18)
		combat3:setParameter(COMBAT_PARAM_EFFECT, 18)
		combat4:setParameter(COMBAT_PARAM_EFFECT, 18)
		combat5:setParameter(COMBAT_PARAM_EFFECT, 18)
	else
		for i, c in ipairs({combat, combatnodot}) do
			c:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
		end
	end
	
	CastSpell(creature:getId(), variant)	
	addEvent(SpellAnimation, 1, creatureId, combat1, combat2, combat3, combat4, combat5)
	combat:execute(creature, variant)
	creature:getPosition():sendMagicEffect(735)

	return true
end