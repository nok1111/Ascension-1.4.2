-- Register Item ID for Glacial Ice Patch
local ITEM_GLAICAL_ICE_PATCH = 39942 -- Replace with your actual item ID


local slowCondition = Condition(CONDITION_PARALYZE)
slowCondition:setParameter(CONDITION_PARAM_TICKS, 2000)
slowCondition:setFormula(-1, 120, -1, 120)

-- Slow effect on StepIn event
local moveEvent = MoveEvent()
moveEvent:type("stepin")

function moveEvent.onStepIn(creature, item, position, fromPosition)
    if creature:isPlayer() or creature:isMonster() then
	print("stepin")
        creature:addCondition(slowCondition) -- Slow by 50% for 3 seconds
		creature:getPosition():sendMagicEffect(3)
        item:remove() -- Remove the ice patch item after step-in
    end
    return true
end

moveEvent:id(ITEM_GLAICAL_ICE_PATCH)
moveEvent:register()

-- Glacial Step Spell that creates Glacial Ice Patch on each step
local glacialStep = Spell("instant")



local interval = 200 -- Interval to place new ice patches in milliseconds

function glacialStep.onCastSpell(creature, var)
    local player = creature:getPlayer()
    if not player then
        return false
    end
    
    local position = player:getPosition()
    -- Check if the spell is being cast in a protection or non-PvP zone
    if Tile(position):hasFlag(TILESTATE_PROTECTIONZONE) or Tile(position):hasFlag(TILESTATE_NOPVP) then
        player:sendCancelMessage("You cannot cast Glacial Step in a protected area.")
        return false
    end
    
    -- Set up repeated function to place ice patches
    local function placeIcePatch()
        if not player then return false end
        local position = player:getPosition()
		if not Tile(position):hasFlag(TILESTATE_PROTECTIONZONE) and not Tile(position):hasFlag(TILESTATE_NOPVP) then
			position:sendMagicEffect(CONST_ME_ICEAREA)
			Game.createItem(ITEM_GLAICAL_ICE_PATCH, 1, position)
		else
			player:sendCancelMessage("You cannot cast Glacial Step in a protected area.")
		end
    end

    -- Repeatedly place ice patches for 5 seconds while moving
    for i = 0, 10 do
        addEvent(placeIcePatch, interval * i)
    end

    return true
end


glacialStep:name("Glacial Step")
glacialStep:id(192)
glacialStep:words("glacial step")
glacialStep:level(15)
glacialStep:mana(50)
glacialStep:magicLevel(1)
glacialStep:cooldown(3000)
glacialStep:groupCooldown(3000)
glacialStep:isSelfTarget(true)
glacialStep:group(support)
glacialStep:needLearn(true)
glacialStep:vocation("none") -- Specify valid vocations here

glacialStep:register()


---------------------------------

