local action = Action()

-- Demon cow appearance chance (30%)
local DEMON_CHANCE = 30
local DEMON_COW_ID = "demon cow" -- Match monster file name

-- Function to remove demon cow after timeout
local function removeDemonCow(cid)
    local demon = Monster(cid)
    if demon and demon:isMonster() then
        demon:getPosition():sendMagicEffect(CONST_ME_POFF)
        demon:remove()
    end
end

function action.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Basic checks
    if not target or not target:isMonster() then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "You can only milk cows!")
        return true
    end

    local targetName = target:getName():lower()
    local monster = Monster(target:getId())

    -- Only works on normal cows and demon cows
    if targetName ~= "cow" and targetName ~= DEMON_COW_ID then
        return false
    end

    -- Check if cow is below 50% health (prevent farming)
    if monster:getHealth() < monster:getMaxHealth() * 0.5 then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "This cow is too weak to be milked.")
        return true
    end

    -- Demon cow encounter
    if targetName == DEMON_COW_ID then
        target:say("THE COW GROWLS: ...OOM!", TALKTYPE_MONSTER_YELL)
        toPosition:sendMagicEffect(CONST_ME_FIREAREA)
        player:addItem(21403, 1) -- Regular milk bucket
        player:addHealth(-math.random(30, 70))
        return true
    end

    -- Regular milking (75% chance)
    if targetName == "cow" then

        target:say("Moo!", TALKTYPE_MONSTER_YELL)
        monster:addHealth(-math.random(7, 15)) -- Mark as milked

        if math.random(100) > DEMON_CHANCE then
            player:addItem(21402, 1) -- Regular milk bucket

        else

    -- Transform into demon cow (30% chance)
    local demon = Game.createMonster(DEMON_COW_ID, toPosition)
    local RedShader = "Monster Might"
    if demon then
        target:remove()
        demon:setShader(RedShader)
        player:say("WHAT THE... THE COW'S EYES TURN RED!", TALKTYPE_MONSTER_YELL)
        toPosition:sendMagicEffect(CONST_ME_MORTAREA)
        
        -- Make demon cow attack player
        addEvent(function()
            if demon:isMonster() then
                demon:setTarget(player)
            end
        end, 500)
        
        -- Schedule demon cow removal after 2 minutes
        addEvent(removeDemonCow, 120000, demon:getId())
    end

            return true
        end
    end



    return true
end

action:id(2005) -- Bucket item ID
action:register()