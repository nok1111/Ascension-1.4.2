local action = Action()

-- Demon cow appearance chance (30%)
local DEMON_CHANCE = 30
local DEMON_COW_ID = "demon_cow" -- Match monster file name

function action.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Basic checks
    if not target or not target:isMonster() then
        player:sendTextMessage(MESSAGE_FAILURE, "You can only milk cows!")
        return true
    end

    local targetName = target:getName():lower()
    local monster = Monster(target:getId())

    -- Only works on normal cows and demon cows
    if targetName ~= "cow" and targetName ~= DEMON_COW_ID then
        return false
    end

    -- Demon cow encounter
    if targetName == DEMON_COW_ID then
        player:say("THE COW GROWLS: ...OOM!", TALKTYPE_MONSTER_YELL)
        toPosition:sendMagicEffect(CONST_ME_FIREAREA)
        player:addHealth(-math.random(30, 70))
        return true
    end

    -- Check if cow is at full health (first-time milking)
    if monster:getHealth() < monster:getMaxHealth() then
        player:say("This cow has already been milked today.", TALKTYPE_MONSTER_YELL)
        return true
    end

    -- Regular milking (75% chance)
    if math.random(100) > DEMON_CHANCE then
        player:say("Moo!", TALKTYPE_MONSTER_YELL)
        player:addItem(2853, 1) -- Regular milk bucket
        monster:addHealth(-1) -- Mark as milked
        return true
    end

    -- Transform into demon cow (30% chance)
    local demon = Game.createMonster(DEMON_COW_ID, toPosition)
    if demon then
        target:remove()
        player:say("WHAT THE... THE COW'S EYES TURN RED!", TALKTYPE_MONSTER_YELL)
        toPosition:sendMagicEffect(CONST_ME_MORTAREA)
        
        -- Make demon cow attack player
        addEvent(function()
            if demon:isMonster() then
                demon:setTarget(player)
            end
        end, 500)
    end

    return true
end

action:id(2005) -- Bucket item ID
action:register()