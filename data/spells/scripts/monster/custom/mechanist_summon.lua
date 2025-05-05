local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_NONE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)

local area = createCombatArea(AREA_CIRCLE3X3)
combat:setArea(area)

local removalTime = 5 * 60 * 1000 -- Time in minutes


local function removeMonsterAfterTime(monsterId, delay)
    addEvent(function()
        local monster = Creature(monsterId)
        if monster and not monster:isRemoved() then
            local effectPosition = monster:getPosition()
            effectPosition:sendMagicEffect(CONST_ME_EXPLOSIONAREA) 
            monster:remove()
        end
    end, delay)
end

function onCastSpell(creature, var)
    
    local spawnPosition = { 
        x = creature:getPosition().x + math.random(-2, 2),
        y = creature:getPosition().y + math.random(-2, 2),
        z = creature:getPosition().z 
    }
    local monster = Game.createMonster("Steam Mine", spawnPosition, true, false)

    if not monster then
        return false
    end
    
    creature:say("Tick-tock... Steam Mines deployed!")
    local monsterposs = monster:getPosition()
    monsterposs:sendMagicEffect(321)
    
    
    
    removeMonsterAfterTime(monster:getId(), removalTime)

    return combat:execute(creature, var)
end
