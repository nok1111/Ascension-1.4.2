local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)

-- Damage formula (adjust values as needed)
function onGetFormulaValues(player, level, magicLevel)
    local min = (level / 5) + (magicLevel * 1.8) + 10
    local max = (level / 5) + (magicLevel * 3.0) + 20

     -- Increases the damage of your elemental fists (Fire, Ice, Life) by 3% per level when used in combination
     local level = math.max(player:getStorageValue(PassiveSkills.ElementalHarmony) or 0, 0)
     if level > 0 then
         min = min * (1 + (level / 100))
         max = max * (1 + (level / 100))
     end
     
    return -min, -max  -- Negative values indicate damage
end
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")


local lifeFistCounter = lifeFistCounter or {}

local function arcaneDamage(playerId, variant, targetId, effectId)
    local player = Player(playerId)
    local creature = Creature(targetId)
    if not player or not creature then return true end

    local pos = creature:getPosition()
    local playerpos = player:getPosition()

    Position(playerpos):sendDistanceEffect(pos, effectId)

    combat:execute(player, variant)
    creature:attachEffectById(110, true)
    -- Every third consecutive Life punch triggers the effect
    local LifePulseLevel = math.max(player:getStorageValue(PassiveSkills.LifePulse) or 0, 0)
    if LifePulseLevel > 0 then
        local playerGuid = player:getGuid()
        lifeFistCounter[playerGuid] = (lifeFistCounter[playerGuid] or 0) + 1
        if lifeFistCounter[playerGuid] >= 3 then
            -- 20% chance per level on every third punch
            if math.random(100) <= (20 * LifePulseLevel) then
                -- Heal one random nearby ally
                local radius = 5
                local playerPos = player:getPosition()
                local spectators = Game.getSpectators(playerPos, false, true, radius, radius, radius, radius)
                local allies = {}
                for _, creature in ipairs(spectators) do
                    if creature:isPlayer() and creature ~= player and (not creature:getParty() or creature:getParty() == player:getParty()) then
                        table.insert(allies, creature)
                    end
                end
                if #allies > 0 then
                    local chosen = allies[math.random(#allies)]
                    local magicLevel = player:getMagicLevel()
                    local level = player:getLevel()
                    local base = ((level / 10) + (magicLevel * 2)) + level
                    local healAmount = math.floor(base * player:getMaxHealth())
                    local extrahealing = player:getSpecialSkill(SPECIALSKILL_EXTRAHEALING)
                    if extrahealing > 0 then
                        healAmount = healAmount * (1 + (extrahealing / 100))
                    end
                    chosen:addHealth(healAmount)
                    chosen:getPosition():attachEffectById(110, true)
                    player:getPosition():attachEffectById(110, true)
                end
            end
            lifeFistCounter[playerGuid] = 0 -- Reset after third punch
        end
    end

    return true
end

local function heal(playerId, variant)
    local player = Player(playerId)
    if not player then return true end
    local magicLevel = player:getMagicLevel()
    local level = player:getLevel()
    local base = ((level / 10) + (magicLevel * 2)) + level
    local healAmount = math.floor(base * player:getMaxHealth())
    local extrahealing = player:getSpecialSkill(SPECIALSKILL_EXTRAHEALING)
    if extrahealing > 0 then
        healAmount = healAmount * (1 + (extrahealing / 100))
    end
    player:addHealth(healAmount)
    player:getPosition():attachEffectById(110, true)

   -- restore 1.2% of your maximum health and 2% of your maximum mana.", PassiveSkills.MeditativeRecovery * level
   local MeditativeRecovery_level = math.max(player:getStorageValue(PassiveSkills.MeditativeRecovery) or 0, 0)

   if MeditativeRecovery_level > 0 then
    
		player:addHealth(player:getMaxHealth() * (0.012 * MeditativeRecovery_level))
		player:addMana(player:getMaxMana() * (0.02 * MeditativeRecovery_level))
	end						
    return true
end

function onCastSpell(player, variant)
    local target = player:getTarget()
    if target then
        for i = 0, 1 do
            addEvent(function()
                arcaneDamage(player:getId(), variant, target:getId(), 189 + i)
                heal(player:getId(), variant)
            end, i * 250)
        end
        
    end
    addElementalBoost(player, "life", 1)
    
    return true
end