local config = {
	amount = 40
}

-- Configuration for magic effects
local effects = {
    north = 637,
    south = 638,
    east = 636,
    west = 639
}

-- Function to get the direction from the caster to the target
function getDirectionFromPosition(casterPos, targetPos)
    local dx = targetPos.x - casterPos.x
    local dy = targetPos.y - casterPos.y

    if math.abs(dx) > math.abs(dy) then
        if dx > 0 then
            return "east"
        else
            return "west"
        end
    else
        if dy > 0 then
            return "south"
        else
            return "north"
        end
    end
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 0)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setArea(createCombatArea(AREA_CROSS1X1))

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, 640)



function onGetFormulaValues(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_DISTANCE) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = ((level / 5) + (power * 0.085) + (attack * 1.5) + 150) / 6.8
	local max =  ((level / 5) + (power * 0.085) + (attack * 1.5) + 150) / 6.6
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function sendArrowAnimation(cid)
	local creature = Creature(cid)
	if creature then
		local pos = creature:getPosition()
		local x, y, z = pos.x, pos.y, pos.z
		math.randomseed(os.clock()*100000000000)
		local x2 = math.random(-6, -4)
		local y2 = math.random(-6, -4)
		creature:getPosition():sendDistanceEffect(Position(x+x2, y+y2, z), 3)
	end
	return true
end


local function doDamage_Arrows(combat, cid, targetPos, variant)
    local creature = Creature(cid)
    if creature then
        local pos = targetPos
        local x, y, z = pos.x, pos.y, pos.z
        math.randomseed(os.clock()*100000000000)
        local x3 = math.random(-2, 2)
        local y3 = math.random(-2, 2)
        if getTilePzInfo(Position(x+x3, y+y3, z)) == FALSE then
            if Tile(x+x3, y+y3, z) ~= nil then
                variant = positionToVariant(Position(x+x3, y+y3, z))
                combat:execute(creature, variant)
				combat2:execute(creature, variant)
            end
        end
    end
end

function onCastSpell(creature, variant, tid)
	 local creatureId = creature:getId()
    local target = Creature(variant:getNumber())
    if not target then
        return false
    end

    local casterPos = creature:getPosition()
    local targetPos = target:getPosition()
    local direction = getDirectionFromPosition(casterPos, targetPos)
	
	local effect = effects[direction]
    if effect then
		local positionnube = creature:getPosition()
		positionnube.x = creature:getPosition().x + 1
		positionnube.y = creature:getPosition().y + 1
        positionnube:sendMagicEffect(effect)
    end

    for i=0, config.amount, 1 do
        addEvent(doDamage_Arrows, i*75, combat, creatureId, targetPos, variant)
    end

    return true
end