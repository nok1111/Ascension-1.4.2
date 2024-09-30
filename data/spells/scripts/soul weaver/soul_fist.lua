-- Minimum amount of magic missiles
local minMissiles = 1

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)



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

local function arcaneDamage(player, var, target, missileEffectpos, animationroll)
    local player = Player(player)
    local creature = Creature(target)
    if player and creature then
        --Position(missileEffectpos):sendDistanceEffect(creature:getPosition(), 111)
        if animationroll == 1 then
			
			local position = creature:getPosition()
			local positioneffect = position
			positioneffect.x = position.x + 1
			positioneffect.y = position.y + 1
			positioneffect:sendMagicEffect(434)
			positioneffect:sendMagicEffect(math.random(423,428))
		
            creature:getPosition():sendMagicEffect(435)
        end
        combat:execute(player, var)
    end
    return true
end

local function SoulFist(player, var, target, count)
    local player = Player(player)
    local creature = Creature(target)
    if player and creature then
        local playerpos = player:getPosition()
        local creaturepos = creature:getPosition()
        local missileEffectpos = Position(playerpos)
        local differencey = playerpos.y - creaturepos.y -- positive = N, negative = S
        local differencex = playerpos.x - creaturepos.x -- positive = W, negative = E
        local ymodifier = 0
        local xmodifier = 0
        local animationroll = 0
        -- Cycle between each side of player depending if missile is even or odd
        if count % 2 == 0 then -- even
            if differencey > 0 then -- Target it to the N
                xmodifier = xmodifier + 1
                if math.random(1,2) == 2 then
                    ymodifier = ymodifier - 1
                end
            elseif differencey < 0 then -- Target is to the S
                xmodifier = xmodifier - 1
                if differencey < -1 or math.random(1,2) == 2 then -- Force if 1sqm away due to client perspective
                    ymodifier = ymodifier + 1
                end
            end
            if differencex < 0 then -- Target is to the E
                ymodifier = ymodifier + 1
                if differencex < -1 or math.random(1,2) == 2 then -- Force if 1sqm away due to client perspective
                    xmodifier = xmodifier + 1
                end
            elseif differencex > 0 then -- Target is to the W
                ymodifier = ymodifier - 1
                if math.random(1,2) == 2 then
                    xmodifier = xmodifier - 1
                end
            end
        else -- odd
            animationroll = 1
            if differencey > 0 then -- Target it to the N
                xmodifier = xmodifier - 1
                if math.random(1,2) == 2 then
                    ymodifier = ymodifier - 1
                end
            elseif differencey < 0 then -- Target is to the S
                xmodifier = xmodifier + 1
                if differencey < -1 or math.random(1,2) == 2 then -- Force if 1sqm away due to client perspective
                    ymodifier = ymodifier + 1
                end
            end
            if differencex < 0 then -- Target is to the E
                ymodifier = ymodifier - 1
                if differencex < -1 or math.random(1,2) == 2 then -- Force if 1sqm away due to client perspective
                    xmodifier = xmodifier + 1
                end
            elseif differencex > 0 then -- Target is to the W
                ymodifier = ymodifier + 1
                if math.random(1,2) == 2 then
                    xmodifier = xmodifier - 1
                end
            end
        end
    
        --Position(playerpos):sendDistanceEffect(missileEffectpos, 111)
        addEvent(arcaneDamage, 150, player.uid, var, creature.uid, missileEffectpos, animationroll)
    end
    return true
end

function onCastSpell(player, var)

	aura_counter = 25952 -- soul counter
	aura_storage = 25950 -- soul aura storage
	
	local target = player:getTarget()
    local magiclevel = player:getMagicLevel()
	local maxhealth = player:getMaxHealth()

	local level = player:getLevel()
   local fistcounter = 1 + player:getStorageValue(aura_counter) 
    local count = 1
    for i = 1, fistcounter do
        addEvent(SoulFist, 150 * (i - 1), player.uid, var, target.uid, count)
        count = count + 1
		player:setStorageValue(aura_storage, -1)
		player:setStorageValue(aura_counter, 0)
		player:sendRemoveBuffNotification(42)
		
    end
    return true
end







