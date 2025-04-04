-- ========== Totem Summoning Logic ==========
local TotemController = {}
TotemController.__index = TotemController

function TotemController.summonRandomTotem(caster)
    -- Check for existing totem summons
    local summons = caster:getSummons()
    for _, summon in ipairs(summons) do
        if summon:getStorageValue("TotemType") > 0 then
            return -- Already has a totem summoned
        end
    end

    local totems = {
        {name = "Offensive Totem", type = TotemTypes.OFFENSIVE},
        {name = "Defensive Totem", type = TotemTypes.DEFENSIVE},
        {name = "Healing Totem", type = TotemTypes.HEALING}
    }
    local selected = totems[math.random(#totems)]
    local pos = caster:getPosition()
    local summon = Game.createMonster(selected.name, pos, false, false)
    if summon then
        summon:getPosition():sendMagicEffect(627)
        summon:setMaxHealth(math.floor(caster:getMaxHealth() * 0.25))
        summon:addHealth(summon:getMaxHealth())
        summon:setMaster(caster)
        summon:setStorageValue("TotemType", selected.type)
        triggerTotemAura(summon)
    end
end


function onCastSpell(creature, variant)
    TotemController.summonRandomTotem(creature)
    return true
end