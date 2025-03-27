local chickenCapture = Action()

-- CONFIGURATION --
local CAPTURE_REQUIREMENT = 10  -- Chickens needed for quest
local BROOM_ID = 2324            -- Broom item ID
local EGG_ID = 2695              -- Union-Approved Egg
local FEATHER_ID = 5890          -- Feather item
local STORAGE_PROGRESS = Mainquest.chickenscaught   -- Progress storage
local UNION_CHICKEN_NAMES = {"chicken", "union boss chicken"}

-- SOUNDS (define in sounds.xml) --
local SOUNDS = {
    SUCCESS = "Chicken Cluck",
    FAIL = "Splat",
    STUMBLE = "Trip",
    FEATHER = "Whoosh"
}

-- EFFECTS --
local EFFECTS = {
    SUCCESS = {
        magicEffect = CONST_ME_POFF,
        text = {msg = "CAUGHT!", color = TEXTCOLOR_GREEN}
    },
    FAIL = {
        magicEffect = CONST_ME_GREEN_RINGS,
        text = {msg = "SPAT ON!", color = TEXTCOLOR_RED}
    },
    STUMBLE = {
        magicEffect = CONST_ME_BLOCKHIT,
        condition = {
            type = CONDITION_HASTE,
            duration = 10000, -- 10 seconds
            formula = {-0.7, 0, -0.7, 0} -- 70% speed reduction
        }
    },
    FEATHER_BUFF = {
        magicEffect = CONST_ME_MAGIC_GREEN,
        condition = {
            type = CONDITION_HASTE,
            duration = 15000, -- 15 seconds
            formula = {0.3, 0, 0.3, 0} -- 30% speed boost
        }
    }
}

-- FAILURE CONSEQUENCES --
local FAILURE_EFFECTS = {
    [1] = { -- Stumble Debuff
        chance = 30,
        execute = function(player)
            local c = Condition(EFFECTS.STUMBLE.condition.type)
            c:setParameter(CONDITION_PARAM_TICKS, EFFECTS.STUMBLE.condition.duration)
            c:setFormula(
                EFFECTS.STUMBLE.condition.formula[1], EFFECTS.STUMBLE.condition.formula[2],
                EFFECTS.STUMBLE.condition.formula[3], EFFECTS.STUMBLE.condition.formula[4]
            )
            player:addCondition(c)
            player:say("Tripped on feathers!", TALKTYPE_MONSTER_SAY)
            player:getPosition():sendMagicEffect(EFFECTS.STUMBLE.magicEffect)
            player:say(SOUNDS.STUMBLE, TALKTYPE_MONSTER_SAY)
        end
    },
    [2] = { -- Feather Buff
        chance = 30,
        execute = function(player)
            local c = Condition(EFFECTS.FEATHER_BUFF.condition.type)
            c:setParameter(CONDITION_PARAM_TICKS, EFFECTS.FEATHER_BUFF.condition.duration)
            c:setFormula(
                EFFECTS.FEATHER_BUFF.condition.formula[1], EFFECTS.FEATHER_BUFF.condition.formula[2],
                EFFECTS.FEATHER_BUFF.condition.formula[3], EFFECTS.FEATHER_BUFF.condition.formula[4]
            )
            player:addCondition(c)
            player:addItem(FEATHER_ID, 1)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Feathers make you lighter! +30% speed")
            player:getPosition():sendMagicEffect(EFFECTS.FEATHER_BUFF.magicEffect)
            player:say(SOUNDS.FEATHER, TALKTYPE_MONSTER_SAY)
        end
    },
    [3] = { -- Summon Boss
        chance = 10,
        execute = function(pos)
            Game.createMonster("Union Boss Chicken", pos)
            pos:sendMagicEffect(CONST_ME_MORTAREA)
            pos:sendMagicEffect(CONST_ME_SOUND_RED)
        end
    }
}

-- MAIN FUNCTION --
function chickenCapture.onUse(player, item, fromPos, target, toPos, isHotkey)
    -- Verify target
    if not target or not target:isMonster() then
        player:sendTextMessage(MESSAGE_FAILURE, "You can only use this on unionized chickens!")
        return true
    end

    local targetName = target:getName():lower()
    if not table.contains(UNION_CHICKEN_NAMES, targetName) then
        return false
    end

    -- Check broom
    if player:getItemCount(BROOM_ID) == 0 then
        player:sendTextMessage(MESSAGE_FAILURE, "You need a broom to herd chickens!")
        return true
    end

    local monster = Monster(target:getId())
    if not monster then
        return false
    end

    -- Calculate success (65% base + 5% per capture)
    local currentProgress = math.max(0, player:getStorageValue(STORAGE_PROGRESS) * 3)
    local successChance = 10 + (currentProgress * 5)
    successChance = math.min(successChance, 95) -- Cap at 95%

    -- SUCCESS CASE --
    if math.random(100) <= successChance then
        -- Update progress
        player:setStorageValue(STORAGE_PROGRESS, currentProgress + 1)
        
        -- Effects
        target:getPosition():sendMagicEffect(EFFECTS.SUCCESS.magicEffect)
        player:say(EFFECTS.SUCCESS.text.msg, TALKTYPE_MONSTER_SAY)
        player:say(SOUNDS.SUCCESS, TALKTYPE_MONSTER_SAY)
        player:getPosition():sendMagicEffect(CONST_ME_SOUND_GREEN)
        
        -- Create egg and remove chicken
        Game.createItem(EGG_ID, 1, target:getPosition())
        monster:remove()

        -- Progress message
        if currentProgress + 1 >= CAPTURE_REQUIREMENT then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Quest Complete! Return to Farmer Cluckington.")
        else
            player:sendTextMessage(MESSAGE_STATUS_SMALL, 
                string.format("Progress: %d/%d (+%d%% success)", 
                currentProgress + 1, 
                CAPTURE_REQUIREMENT,
                math.min(currentProgress * 5, 30)))
        end

    -- FAIL CASE --
    else
        -- Base fail effects
        target:say("PTUI!", TALKTYPE_MONSTER_SAY)
        target:getPosition():sendMagicEffect(EFFECTS.FAIL.magicEffect)
        player:say(EFFECTS.FAIL.text.msg, TALKTYPE_MONSTER_SAY)
        player:say(SOUNDS.FAIL, TALKTYPE_MONSTER_SAY)
        
        -- Random additional consequences
        for _, effect in pairs(FAILURE_EFFECTS) do
            if math.random(100) <= effect.chance then
                if effect == FAILURE_EFFECTS[3] then
                    effect.execute(target:getPosition())
                else
                    effect.execute(player)
                end
            end
        end
    end

    return true
end

-- REGISTER THE ACTION --
chickenCapture:id(BROOM_ID)
chickenCapture:register()