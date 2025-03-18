local MONSTER_DESPAWN_TIME = 15 * 60 * 1000 -- 15 minutes in milliseconds
local MALRITH_NAME = "Malrith, the Hungering Shade"
local MALRITH_POSITION = Position(910, 789, 9) -- Adjust to your summoning location

local function removeMonster(monsterId)
    local monster = Monster(monsterId)
    if monster then
        monster:say("The shadows wail as Malrith fades into nothingness...", TALKTYPE_MONSTER_YELL)
        monster:getPosition():sendMagicEffect(CONST_ME_POFF)
        monster:remove()
    end
end

local function isMalrithAlive()
    local spectators = Game.getSpectators(MALRITH_POSITION, false, false, 15, 15, 15, 15)
    for _, creature in pairs(spectators) do
        if creature:isMonster() and creature:getName() == MALRITH_NAME then
            return true
        end
    end
    return false
end

local summonMalrithAction = Action()

function summonMalrithAction.onUse(player, item, fromPosition, target, toPosition)
    local questStatus = player:getStorageValue(40061)

    -- Check if the player has started the final quest
    if questStatus < TASK_START then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The altar remains silent. You are not yet ready to face Malrith.")
        return true
    end

    -- Prevent summoning if the quest is already completed or reward received
    if questStatus >= TASK_COMPLETED then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The altar is lifeless. Malrith has been vanquished forever.")
        return true
    end

    -- Check if Malrith is already alive in the 15x15 area
    if isMalrithAlive() then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Malrith already walks this realm! Defeat him first.")
        return true
    end

    -- Create dramatic entrance effects
    fromPosition:sendMagicEffect(CONST_ME_MORTAREA)
    addEvent(function()
        player:say("The shadows shift... something ancient stirs!", TALKTYPE_MONSTER_YELL, false, player, fromPosition)
        addEvent(function()
            player:say("A deep, guttural voice echoes from the abyss...", TALKTYPE_MONSTER_YELL, false, player, fromPosition)
            addEvent(function()
                player:say("\"MORTALS... YOU DARE TO SUMMON ME? YOUR SOULS WILL BE MY FEAST!\"", TALKTYPE_MONSTER_YELL, false, player, fromPosition)
                addEvent(function()
                    local malrith = Game.createMonster(MALRITH_NAME, MALRITH_POSITION)
                    if malrith then
                        malrith:attachEffectById(9, true)
                        malrith:attachEffectById(32, true)
                        addEvent(removeMonster, MONSTER_DESPAWN_TIME, malrith:getId())
                    end
                end, 5000) -- Delay before Malrith actually appears
            end, 4000)
        end, 3000)
    end, 2000)

    return true
end

summonMalrithAction:aid(5011) -- Set action ID for Malrith's summoning object
summonMalrithAction:register()

