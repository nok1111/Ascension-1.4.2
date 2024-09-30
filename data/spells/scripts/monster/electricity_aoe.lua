-- Frames (1 = Area, 2 = Player, 3 = Player + Self Damaging)
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_VISBALLONE)

local arr = {
        {1, 0, 0, 0, 1},
        {0, 1, 1, 1, 0},
        {0, 1, 3, 1, 0},
        {0, 1, 1, 1, 0},
        {1, 0, 0, 0, 1}
}

local area = createCombatArea(arr)
    combat:setArea(area)



local function animation(pos, playerpos)
    if not Tile(Position(pos)):hasProperty(CONST_PROP_BLOCKPROJECTILE) then
        -- This is only applicable for directional spells
        --if Position(pos):isSightClear(playerpos) then
        Position(pos):sendMagicEffect(179)
        Position(pos):sendMagicEffect(48)
        --end
    end
end

function onCastSpell(creature, var)

    local animationarea = arr
    local creaturepos = creature:getPosition()
    local playerpos = Position(creaturepos)
    local targeted = true -- is this a targettable spell? (strike or gfb-like spell etc)
    local delay = 100
 
    if targeted then
        creaturepos = creature:getTarget():getPosition()
    end
 
    local centre = {}
    local damagearea = {}
    for k,v in ipairs(animationarea) do
        for i = 1, #v do
            if v[i] == 3 or v[i] == 2 then
                centre.Row = k
                centre.Column = i
                table.insert(damagearea, centre)
            elseif v[i] == 1 then
                local darea = {}
                darea.Row = k
                darea.Column = i
                table.insert(damagearea, darea)
            end
        end
    end

    for i = 1,#damagearea do
        -- adjust delay randomizer here, different animations have different "sweet-spot" delays
        local animationDelay = math.random(1,6) * delay
        local modifierx = damagearea[i].Column - centre.Column
        local modifiery = damagearea[i].Row - centre.Row
        local damagepos = Position(creaturepos)
        damagepos.x = damagepos.x + modifierx
        damagepos.y = damagepos.y + modifiery
        addEvent(animation, animationDelay, damagepos, playerpos)
    end
    return combat:execute(creature, var)
end

