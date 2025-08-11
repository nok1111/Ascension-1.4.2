-- blessed_tree.lua
-- Revscript Death event for Blessed Tree: heals all nearby players in AREA_SQUARE2X2

local blessedTreeDeath = CreatureEvent("BlessedTreeDeath")

local AREA_tree = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
    })

function blessedTreeDeath.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
    if not creature:isMonster() or creature:getName():lower() ~= "blessed tree" then
        return true
    end
    local pos = creature:getPosition()
    local spectators = Game.getSpectators(pos, false, true, 1, 1, 1, 1)
    for _, target in ipairs(spectators) do
        if target:isPlayer() then
            local healHp = math.floor(target:getMaxHealth() * 0.5)
            local healMp = math.floor(target:getMaxMana() * 0.5)
            target:addHealth(healHp)
            target:addMana(healMp)
            target:getPosition():sendMagicEffect(381)
            target:say("You are blessed by the tree!", TALKTYPE_MONSTER_YELL)
        end
    end
    doAreaCombatHealth(creature:getId(), COMBAT_HEALING, pos, AREA_tree, 50, 50, 15)
    return true
end

blessedTreeDeath:register()
