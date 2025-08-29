local function removePetArcher(creatureId)
    local c = Creature(creatureId)
    if not c then return false end

    c:remove()
end

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_NONE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_BLOCKHIT)

local area = createCombatArea(AREA_CROSS1X1)
setCombatArea(combat, area)

local function getSummonCount(player)
    local undeadCount = 0
    local summons = player:getSummons()
    for i = 1, #summons do
        local summon = summons[i]
        if summon:getName():lower() == "void sentinel" then
            undeadCount = undeadCount + 1
        end
    end
    return undeadCount
end

local function getMaxSummons(level)
    return math.min(1 + math.floor(level / 25), 4)
end

function onCastSpell(cid, var)
    local player = Player(cid)
    if not player then return false end

    local level = player:getLevel()
    local maxSummons = 1

    if getSummonCount(player) >= maxSummons then
        player:sendCancelMessage("You can't have more of these summons.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    local summonName = "void sentinel" 
    if not summonName then return false end

    local mySummonvoid = Game.createMonster(summonName, player:getPosition())
    if not mySummonvoid then return false end

    local summonpos = mySummonvoid:getPosition()
    --send magic effect
    summonpos:sendMagicEffect(170)
    
    player:addSummon(mySummonvoid)
    if player:getTarget() then
        mySummonvoid:setTarget(player:getTarget())
        local path = mySummonvoid:getPathTo(player:getTarget():getPosition())
        if path then
            mySummonvoid:move(path[1])
        end
    end
    
    local bulwark = math.max(player:getStorageValue(PassiveSkills.DemonicBulwark) or 0, 0)
    local summonhealth = level * mySummonvoid:getMaxHealth()
    mySummonvoid:setMaxHealth(summonhealth + (summonhealth * (bulwark / 100)))
    mySummonvoid:setHealth(summonhealth + (summonhealth * (bulwark / 100)))
    
    

    local deltaSpeed = math.max(player:getBaseSpeed() - mySummonvoid:getBaseSpeed(), 0)
    mySummonvoid:changeSpeed(deltaSpeed)

    player:say("arise!", TALKTYPE_MONSTER_SAY)
    addEvent(removePetArcher, 5 * 60 * 1000, mySummonvoid:getId())
    
    return true
end
