local combatheal = Combat()
combatheal:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combatheal:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combatheal:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combatheal:setArea(createCombatArea(AREA_CIRCLE3X3))

local healMonsters = false

function onTargetCreature(creature, target)
	local player = creature:getPlayer()
	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local min = (player:getLevel() / 5) + (player:getMagicLevel() * 5.5) + 10.5
	local max = (player:getLevel() / 5) + (player:getMagicLevel() * 7.0) + 12.5
	local extrahealing = player:getSpecialSkill(SPECIALSKILL_EXTRAHEALING)
    if extrahealing > 0 then
        min = min * (1 + (extrahealing / 100))
        max = max * (1 + (extrahealing / 100))
    end

	if not healMonsters then
		local master = target:getMaster()
		if target:isMonster() and not master or master and master:isMonster() then
			return true
		end
	end
	player:addHealth(math.random(min,max))
	doTargetCombatHealth(creature:getId(), target, COMBAT_HEALING, min, max, CONST_ME_NONE)
	return true
end

combatheal:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")









local Center = Combat()
Center:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
--Center:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NEWHOLY1)
Center:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
Center:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

local Area = createCombatArea({
	{0, 1, 1, 1, 0},
	{1, 1, 1, 1, 1},
	{1, 1, 2, 1, 1},
	{1, 1, 1, 1, 1},
	{0, 1, 1, 1, 0}
})
Center:setArea(Area)

function onGetFormulaValues(player, skill, attack, factor)
  local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
    local power = sword * attack 
    local level = player:getLevel()
    local magic = player:getMagicLevel()

    local min = ((level / 5) + (power * 0.08) + (attack * 3) + 185) / 5
    local max = ((level / 5) + (power * 0.09) + (attack * 3.5) + 200) / 4
	return -min, -max
end

Center:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local Outside = Combat()
Outside:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
Outside:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
Outside:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)


local AreaOutside = createCombatArea({
	{0, 1, 1, 1, 0},
	{1, 0, 0, 0, 1},
	{1, 0, 2, 0, 1},
	{1, 0, 0, 0, 1},
	{0, 1, 1, 1, 0}
})
Outside:setArea(Area)

function onGetFormulaValues2(player, skill, attack, factor)
  local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
    local power = sword * attack 
    local level = player:getLevel()
    local magic = player:getMagicLevel()

     local min = ((level / 5) + (power * 0.08) + (attack * 3) + 250) / 5
    local max = ((level / 5) + (power * 0.09) + (attack * 3.5) + 280) / 4
	return -min, -max
end

Outside:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")


local function doDamage(cid, combat)
    local creature = Creature(cid)
	if not creature then
		return
	end
    if creature then
    	variant = numberToVariant(cid)
        combat:execute(creature, variant)
    end
end

local function sendAnimationCenter(cid)
	local creature = Creature(cid)
	if not creature then
		return
	end
	if creature then
		local pos=creature:getPosition()
		local x, y, z = pos.x, pos.y, pos.z

		local configCenter = {
			[0]={{x = x+1, y = y, z = z}, {x = x+1, y = y+1, z =z}},
			[1]={{x = x+1, y = y+1, z = z}, {x = x, y = y+1, z =z}},
			[2]={{x = x, y = y+1, z = z}, {x = x-1, y = y+1, z =z}},
			[3]={{x = x-1, y = y+1, z = z}, {x = x-1, y = y, z =z}},
			[4]={{x = x-1, y = y, z = z}, {x = x-1, y = y-1, z =z}},
			[5]={{x = x-1, y = y-1, z = z}, {x = x, y = y-1, z =z}},
			[6]={{x = x, y = y-1, z = z}, {x = x+1, y = y-1, z =z}},
			[7]={{x = x+1, y = y-1, z = z}, {x = x+1, y = y, z =z}},
			[8]={{x = x+1, y = y, z = z}, {x = x, y = y+1, z = z}},
			[9]={{x = x, y = y+1, z = z}, {x = x-1, y = y, z = z}},
			[10]={{x = x-1, y = y, z = z}, {x = x, y = y-1, z = z}},
			[11]={{x = x, y = y-1, z = z}, {x = x+1, y = y, z = z}},
		}

	  	for i=0, #configCenter, 1 do
	  		Position(configCenter[i][1]):sendDistanceEffect(Position(configCenter[i][2]), CONST_ANI_HOLY)
			Position(configCenter[i][1]):sendDistanceEffect(Position(configCenter[i][2]), CONST_ANI_SMALLHOLY)

	  	end 



	end
end

local function sendAnimationOutside(cid)
	local creature = Creature(cid)
	if not creature then
		return
	end
	if creature then
		local pos=creature:getPosition()
		local x, y, z = pos.x, pos.y, pos.z
		
		local position = creature:getPosition()
	local positioneffect = position
    positioneffect.x = position.x + 1
    positioneffect.y = position.y + 1
	
    positioneffect:sendMagicEffect(342)

	  	local configOutside = {
			--Second Ring
			[0]={{x = x+2, y = y-1, z = z}, {x = x+2, y = y+1, z = z}},
			[1]={{x = x+2, y = y+1, z = z}, {x = x+1, y = y+2, z = z}},
			[2]={{x = x+1, y = y+2, z = z}, {x = x-1, y = y+2, z = z}},
			[3]={{x = x-1, y = y+2, z = z}, {x = x-2, y = y+1, z = z}},
			[4]={{x = x-2, y = y+1, z = z}, {x = x-2, y = y-1, z = z}},
			[5]={{x = x-2, y = y-1, z = z}, {x = x-1, y = y-2, z = z}},
			[6]={{x = x-1, y = y-2, z = z}, {x = x+1, y = y-2, z = z}},
			[7]={{x = x+1, y = y-2, z = z}, {x = x+2, y = y-1, z = z}},

			--[8]={{x = x+2, y = y, z = z}, {x = x+1, y = y+1, z = z}},
			--[9]={{x = x+1, y = y+1, z = z}, {x = x, y = y+2, z = z}},
			--[10]={{x = x, y = y+2, z = z}, {x = x-1, y = y+1, z = z}},
			--[11]={{x = x-1, y = y+1, z = z}, {x = x-2, y = y, z = z}},
			--[12]={{x = x-2, y = y, z = z}, {x = x-1, y = y-1, z = z}},
			--[13]={{x = x-1, y = y-1, z = z}, {x = x, y = y-2, z = z}},
			--[14]={{x = x, y = y-2, z = z}, {x = x+1, y = y-1, z = z}},
			--[15]={{x = x+1, y = y-1, z = z}, {x = x+2, y = y, z = z}},

		}
	  	for i=0, #configOutside, 1 do
	  		Position(configOutside[i][1]):sendDistanceEffect(Position(configOutside[i][2]), CONST_ANI_HOLY)
			Position(configOutside[i][1]):sendDistanceEffect(Position(configOutside[i][2]), CONST_ANI_SMALLHOLY)
			 --positioneffect:sendMagicEffect(344)
	  	end 
	end
end


function onCastSpell(creature, variant)

	
	combatheal:execute(creature, variant)

	creature:attachEffectById(132, true)
	creature:attachEffectById(133, true)

	
	-------------------------------------
	local cid = creature:getId()
	Center:execute(creature, variant)
	Outside:execute(creature, variant)
	addEvent(doDamage, 400, cid, Center)
	addEvent(doDamage, 400, cid, Outside)


	--addEvent(sendAnimationCenter, 0, cid)
	--addEvent(sendAnimationOutside, 50, cid)
	--addEvent(sendAnimationCenter, 150, cid)
	--addEvent(sendAnimationOutside, 200, cid)
	--addEvent(sendAnimationCenter, 300, cid)
	--addEvent(sendAnimationOutside, 350, cid)
	--addEvent(sendAnimationCenter, 450, cid)
	--addEvent(sendAnimationOutside, 500, cid)
	return true
end