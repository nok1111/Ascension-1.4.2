-- Minimum amount of magic missiles
local minMissiles = 3

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

function onGetFormulaValues(player, skill, attack, factor)
local magicfactor = player:getMagicLevel()


	local damage = ((player:getLevel() / 5) + ((magicfactor * attack) * 0.060) + attack) / 5 
	return -damage
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function arcaneDamage(player, variant, target, missileEffectpos, animationroll, creature)
    local player = Player(player)
    local creature = Creature(target)
    if player and creature then
      
        Position(missileEffectpos):sendDistanceEffect(creature:getPosition(), CONST_ANI_FROSTFIRE)
        if animationroll == 1 then
            creature:getPosition():sendMagicEffect(CONST_ME_PURPLEENERGY)
        end
      -- combat:execute(player, variant)	
    end
    return true
end

local function arcaneBolt(player, var, target, count)
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
        missileEffectpos.x = missileEffectpos.x + xmodifier
        missileEffectpos.y = missileEffectpos.y + ymodifier
        Position(playerpos):sendDistanceEffect(missileEffectpos, CONST_ANI_FROSTFIRE)
        addEvent(arcaneDamage, 30, player.uid, var, creature.uid, missileEffectpos, animationroll)
    end
    return true
end

function onUseWeapon(player, variant, creature)
	if not combat:execute(player, variant) then
		return false
	end
	
  local magiclevel = player:getMagicLevel()
    local target = player:getTarget()
    local missileCount = minMissiles + math.floor(magiclevel / 15) -- extra missile every 20 magic levels
    local count = 1
    for i = 1, missileCount do
        addEvent(arcaneBolt, 30 * (i - 1), player.uid, var, target.uid, count)
		addEvent(function()  combat:execute(player, variant) end, 30 * (i - 1), player.uid, var, target.uid, count)
        count = count + 1
    end
    return true
end



