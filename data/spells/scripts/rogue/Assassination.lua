
local config = {
	blood_effect = 517,
	red_aura = 556,
	blood_aura = 663,
	crows_in = 244,
	crows_out = 245
}

local area = {0, 0}
local storage = {}
local spell = SpellLib:new(area)

spell:doSetCombatParam(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
spell:doSetCombatParam(COMBAT_PARAM_EFFECT, config.blood_effect, 1)
spell:doSetCombatParam(COMBAT_PARAM_EFFECT, config.red_aura, 2)
spell:doSetCombatParam(COMBAT_PARAM_BLOCKSHIELD, true)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, math.random(489, 492))

function onGetFormulaValues(player, skill, attack, factor)
    local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
    local power = sword * attack 
    local level = player:getLevel()
    local magic = player:getMagicLevel()

    local min = ((level / 5) + (power * 0.08) + (attack * 3) + 200) / 8
    local max = ((level / 5) + (power * 0.09) + (attack * 3.5) + 250) / 7.5
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

spell:setInterval(300, 1)
spell:setInterval(300, 2)

local maxAtk = 10

local function step4(param)
    local p = Player(param.cid)
    if p then
        p:changeSpeed(param.currentSpeed)
    end
end

local function step3(param)
    local p = Player(param.cid)
    if not p or not param.c then
        return
    end

    local c = Creature(param.c)
    if not c then
        return
    end

    local pos = c:getPosition()
    local playerPos = p:getPosition()

    local positionsFree = {}

    local teleportPositions = {
        {x = pos.x+1, y = pos.y},
        {x = pos.x,   y = pos.y+1},
        {x = pos.x-1, y = pos.y},
        {x = pos.x,   y = pos.y-1},
        {x = pos.x+1, y = pos.y-1},
        {x = pos.x-1, y = pos.y+1},
        {x = pos.x+1, y = pos.y+1},
        {x = pos.x-1, y = pos.y-1}
    }

    for i, position in pairs(teleportPositions) do
        position.z = pos.z
        position.stackpos = STACKPOS_GROUND

        local t = Tile(position)
        if t ~= nil and not t:hasFlag(TILESTATE_BLOCKSOLID) and not (playerPos.x == position.x and playerPos.y == position.y) then
            table.insert(positionsFree, position)
        end
    end

    if #positionsFree > 0 then
        local newPos = positionsFree[math.random(1, #positionsFree)]
        doTeleportThing(param.cid, newPos)
        doSendMagicEffect(newPos, math.random(489, 492))
		doSendMagicEffect(newPos, config.blood_aura)
		

        p:setGhostMode(true)
        if param.count < maxAtk then
            combat:execute(param.cid, numberToVariant(c:getId()))

            param.count = param.count + 1
            if param.count == maxAtk then
                addEvent(step1, spell:getInterval(2), param)
            else
                addEvent(step1, spell:getInterval(1), param)
            end
        else
            combat:execute(param.cid, numberToVariant(c:getId()))
            step4(param)
            p:setGhostMode(false)
        end
    end
end

local function step2(param)
    param.countEffect = param.countEffect + 1
    param.countEffect = 0
    step3(param)
end

function step1(param)
    local p = Player(param.cid)
    if not p or #param.monsters == 0 then
        step4(param)
        return
    end

    param.nextMonster = param.nextMonster + 1
    if param.nextMonster > #param.monsters then
        param.nextMonster = 1
    end

    local c = param.monsters[param.nextMonster]
    if not c or c:isRemoved() then
        table.remove(param.monsters, param.nextMonster)
        step1(param)
        return
    end

    p:setGhostMode(false)

    param.c = c:getId()
    step2(param)
end

local function isExcludedTarget(creature, target)
    if not creature or not target then
        return true
    end

    -- Exclude party members and their summons
    if creature:isPlayer() and target:isPlayer() then
        local creatureParty = creature:getParty()
        local targetParty = target:getParty()
        if creatureParty and targetParty and creatureParty == targetParty then
            return true
        end
    end
    if target:isMonster() and target:getMaster() then
        local master = target:getMaster()
        if master:isPlayer() and creature:getParty() and master:getParty() == creature:getParty() then
            return true
        end
    end

    -- Secure mode check to exclude non-party players and their summons
    local player = creature:isPlayer() and creature or creature:getMaster()
    if player and player:hasSecureMode() then
        if target:isPlayer() or (target:isMonster() and target:getMaster() and target:getMaster():isPlayer()) then
            return true
        end
    end
    
    return false
end

function onCastSpell(p, var)
    local monsters = {}
    local target = p:getTarget()
    local tpos = target:getPosition()

    for i, s in ipairs(getSpectators(tpos, 2, 2, false, false)) do
        local c = Creature(s)
        if (c:isMonster() or c:isPlayer()) and not getTilePzInfo(pos) and isSightClear(p:getPosition(), c:getPosition(), true) and not isExcludedTarget(p, c) then
            table.insert(monsters, c)
        end
    end

    if #monsters > 0 then
        local cid = p:getId()
        local guid = p:getGuid()
        storage[guid] = {pos = p:getPosition()}
        
        if storage[guid] then   
            addEvent(function()
                local player = Player(cid)
                if player then
                    player:teleportTo(storage[guid].pos)
                    storage[guid].pos:sendMagicEffect(config.crows_in)
                    storage[guid].pos:sendMagicEffect(config.crows_out)
                end
            end, 3.1 * 1000)
            addEvent(function() storage[guid] = nil end, 4 * 1000)
        end
        
        local currentSpeed = p:getSpeed()
        p:changeSpeed(-currentSpeed)

        step1({cid = cid, p = p, var = var, countEffect = 0, count = 0, nextMonster = 0, monsters = monsters, currentSpeed = currentSpeed})
        return true
    end

    return false
end
