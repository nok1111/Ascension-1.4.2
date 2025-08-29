local checkWeaponSlots = {
    CONST_SLOT_LEFT,
    CONST_SLOT_RIGHT,
}

-- These weapons have a different hit area
local lanceWeapons = { -- LANCE (3)
    2414, -- Dragon Lance
    2964, -- Ripper Lance
    11323,-- Zaoan Halberd
    13838,-- Heavy Trident
    2425, -- Obsidian Lance
    2426, -- Naginata
    2438, -- Epee
    2396, -- Ice Rapier
    20093 -- Life Preserver
}

local hitArea = {
    { -- ONE HAND     (1)
        { -- NESW
            {0, 0, 0, 0, 0},
            {0, 0, 0, 0, 0},
            {0, 1, 3, 1, 0},
            {0, 0, 0, 0, 0},
            {0, 0, 0, 0, 0}
        },
        { -- DIAGONAL
            {0, 0, 0, 0, 0},
            {0, 0, 0, 0, 0},
            {0, 0, 3, 1, 0},
            {0, 0, 1, 0, 0},
            {0, 0, 0, 0, 0}
        }
    },
    { -- TWO HAND     (2)
        { -- NESW
            {0, 0, 0, 0, 0},
            {0, 0, 0, 0, 0},
            {0, 1, 3, 1, 0},
            {0, 1, 0, 1, 0},
            {0, 0, 0, 0, 0}
        },
        { -- DIAGONAL
            {0, 0, 0, 0, 0},
            {0, 0, 0, 0, 0},
            {0, 0, 3, 1, 1},
            {0, 0, 1, 0, 0},
            {0, 0, 1, 0, 0}
        }
    },
    { -- LANCE         (3)
        { -- NESW
            {0, 1, 0},
            {1, 1, 1},
            {1, 3, 1}
        },
        { -- DIAGONAL
            {0, 0, 0, 0},
            {0, 1, 1, 0},
            {0, 1, 3, 1},
            {0, 0, 1, 0}
        }
    }
}

local combats = {}


function onGetFormulaValues(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.045) + (attack * 2.0) + 50
	local max = (level / 5) + (power * 0.085) + (attack * 2.5) + 65
	
	return -min, -max
end

for i = 1, #hitArea do
    combats[i] = Combat()
    combats[i]:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
    combats[i]:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
    combats[i]:setParameter(COMBAT_PARAM_USECHARGES, true)
    combats[i]:setArea(createCombatArea(hitArea[i][1], hitArea[i][2]))
    --combats[i]:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_POFF)
end


local function animation(pos, playerpos)
    if not Tile(Position(pos)):hasProperty(CONST_PROP_BLOCKPROJECTILE) then
        --if Position(pos):isSightClear(playerpos) then
		   local newposition = Position(pos)
			newposition.x = newposition.x + 1
			newposition.y = newposition.y + 1
	
			newposition:sendMagicEffect(661)
	
			newposition:sendMagicEffect(362)
        --end
    else
        Position(pos):sendMagicEffect(CONST_ME_BLOCKHIT)
    end
    return true
end

local reboundArea = {
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
    {0, 1, 1, 1, 0},
    {0, 0, 3, 0, 0},
    {0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0},
}

local combatrebound = Combat()
combatrebound:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combatrebound:setParameter(COMBAT_PARAM_AGGRESSIVE, true)
combatrebound:setParameter(COMBAT_PARAM_EFFECT, 6)
combatrebound:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combatrebound:setParameter(COMBAT_PARAM_USECHARGES, true)
combatrebound:setArea(createCombatArea(reboundArea))

function onGetFormulaValuesRebound(player, skill, attack, factor)
    local power = skill * attack 
	local level = player:getLevel()

	local min = ((level / 5) + (power * 0.060) + attack) * 1.6
    local max = ((level / 5) + (power * 0.0705) + attack * 1.3) * 1.8
	return -min, -max
end
combatrebound:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValuesRebound")

local function castSpellRebound(creatureId, variant, min)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combatrebound:execute(creature, variant)
    player:addHealth(min)
end


function onCastSpell(creature, var)
  

	if not creature  then
		return false
	end	
	
    local animationArea = { -- The start of each frame needs to have a 2 or 3 in it to indicate the player/target position
        { -- NOT DIAGONAL        DIRECTION_NORTH / DIRECTION_EAST / DIRECTION_SOUTH / DIRECTION_WEST
            { -- ONE HAND
                { -- SWING (R to L)
                    {
                        {0, 2, 1},
                    },
                    {
                        {0, 1, 0},
                    },
                    {
                        {1, 0, 0},

                    }
                },
                { -- SWING (L to R)
                    {
                        {1, 2, 0},

                    },
                    {
                        {0, 1, 0},

                    },
                    {
                        {0, 0, 1},
                    }
                }
            },
            { -- TWO HAND
                { -- SWING (R to L)
                    {
                        {0, 2, 0},
                        {0, 0, 1}
                    },
                    {
                        {0, 0, 1},
                        {0, 0, 0}
                    },
                    {
                        {0, 1, 0},
                        {0, 0, 0}
                    },
                    {
                        {1, 0, 0},
                        {0, 0, 0}
                    },
                    {
                        {0, 0, 0},
                        {1, 0, 0}
                    }
                },
                { -- SWING (L to R)
                    {
                        {0, 2, 0},
                        {1, 0, 0}
                    },
                    {
                        {1, 0, 0},
                        {0, 0, 0}
                    },
                    {
                        {0, 1, 0},
                        {0, 0, 0}
                    },
                    {
                        {0, 0, 1},
                        {0, 0, 0}
                    },
                    {
                        {0, 0, 0},
                        {0, 0, 1}
                    }
                }
            },
            { -- LANCE
                { -- SWING (Only 1 direction)
                    {
                        {0, 0, 0},
                        {0, 0, 0},
                        {1, 2, 1}
                    },
                    {
                        {0, 0, 0},
                        {0, 0, 0},
                        {0, 1, 0}
                    },
                    {
                        {0, 0, 0},
                        {0, 1, 0},
                        {0, 0, 0}
                    },
                    {
                        {0, 1, 0},
                        {1, 0, 1},
                        {0, 0, 0}
                    }
                }
            }
        },
        { -- DIAGONAL            DIRECTION_NORTHWEST / DIRECTION_NORTHEAST / DIRECTION_SOUTHEST / DIRECTION_SOUTHWEST
            { -- ONE HAND
                { -- SWING (R to L)
                    {
                        {0, 0, 0},
                        {0, 2, 1},
                        {0, 0, 0}
                    },
                    {
                        {0, 0, 0},
                        {0, 1, 0},
                        {0, 0, 0}
                    },
                    {
                        {0, 0, 0},
                        {0, 0, 0},
                        {0, 1, 0}
                    }
                },
                { -- SWING (L to R)
                    {
                        {0, 0, 0},
                        {0, 2, 0},
                        {0, 1, 0}
                    },
                    {
                        {0, 0, 0},
                        {0, 1, 0},
                        {0, 0, 0}
                    },
                    {
                        {0, 0, 0},
                        {0, 0, 1},
                        {0, 0, 0}
                    }
                }
            },
            { -- TWO HAND
                { -- SWING (R to L)
                    {
                        {0, 0, 2, 0, 1},
                        {0, 0, 0, 0, 0},
                        {0, 0, 0, 0, 0}
                    },
                    {
                        {0, 0, 0, 1, 0},
                        {0, 0, 0, 0, 0},
                        {0, 0, 0, 0, 0}
                    },
                    {
                        {0, 0, 1, 0, 0},
                        {0, 0, 0, 0, 0},
                        {0, 0, 0, 0, 0}
                    },
                    {
                        {0, 0, 0, 0, 0},
                        {0, 0, 1, 0, 0},
                        {0, 0, 0, 0, 0}
                    },
                    {
                        {0, 0, 0, 0, 0},
                        {0, 0, 0, 0, 0},
                        {0, 0, 1, 0, 0}
                    }
                },
                { -- SWING (L to R)
                    {
                        {0, 0, 2, 0, 0},
                        {0, 0, 0, 0, 0},
                        {0, 0, 1, 0, 0}
                    },
                    {
                        {0, 0, 0, 0, 0},
                        {0, 0, 1, 0, 0},
                        {0, 0, 0, 0, 0}
                    },
                    {
                        {0, 0, 1, 0, 0},
                        {0, 0, 0, 0, 0},
                        {0, 0, 0, 0, 0}
                    },
                    {
                        {0, 0, 0, 1, 0},
                        {0, 0, 0, 0, 0},
                        {0, 0, 0, 0, 0}
                    },
                    {
                        {0, 0, 0, 0, 1},
                        {0, 0, 0, 0, 0},
                        {0, 0, 0, 0, 0}
                    }
                }
            },
            { -- LANCE
                { -- SWING (Only 1 direction)
                    {
                        {0, 0, 0, 0},
                        {0, 0, 0, 0},
                        {0, 0, 2, 1},
                        {0, 0, 1, 0}
                    },
                    {
                        {0, 0, 0, 0},
                        {0, 0, 0, 0},
                        {0, 0, 1, 0},
                        {0, 0, 0, 0}
                    },
                    {
                        {0, 0, 0, 0},
                        {0, 0, 1, 0},
                        {0, 1, 0, 0},
                        {0, 0, 0, 0}
                    },
                    {
                        {0, 0, 0, 0},
                        {0, 1, 0, 0},
                        {0, 0, 0, 0},
                        {0, 0, 0, 0}
                    }
                }
            }
        }
    }
    -- Defaults
    local animationType = 1 -- Default (straight or diagonal)
    local player = Player(creature)
    local target = player:getTarget()
    local creaturePos = creature:getPosition()
    local direction = creature:getDirection()
    local damageModifer = 1 -- Default (varies for special animations)
    local weapon = 0
    local attack = 0
    local skill = 0
    local swing = 1 -- Default (animation variants)
    local directionalX = 0
    local directionalY = 0
    local range = 1
    local distance = 0
    local delay = 60 -- Time between animations in ms
    
    -- Get config spell based on weapon
    for i = 1,#checkWeaponSlots do -- Check what weapon is being used
        if player:getSlotItem(checkWeaponSlots[i]) ~= nil then
            local weaponLiteral = player:getSlotItem(checkWeaponSlots[i]) -- weapon object
            local itemType = ItemType(weaponLiteral:getId()) -- itemtype object
            local weaponType = itemType:getWeaponType()
            if weaponType > 0 then
                if isInArray({WEAPON_SWORD, WEAPON_CLUB, WEAPON_AXE}, weaponType) then
                    -- Get weapon info
                    attack = itemType:getAttack()
                    if weaponLiteral:getAttribute(ITEM_ATTRIBUTE_ATTACK) > attack then -- If custom item with added attack
                        attack = weaponLiteral:getAttribute(ITEM_ATTRIBUTE_ATTACK)
                    end
                    
                    -- Get skill to check
                    if weaponType == WEAPON_SWORD then
                        skill = player:getSkillLevel(SKILL_SWORD)
                    elseif weaponType == WEAPON_AXE then
                        skill = player:getSkillLevel(SKILL_SWORD)
                    elseif weaponType == WEAPON_CLUB then
                        skill = player:getSkillLevel(SKILL_SWORD)
                    end
                    
                    -- Determine animation based on weapontype
                    local positionType = itemType:getSlotPosition() -- How many hands
                    if positionType == 48 then -- ONE
                        weapon = 1 -- animation(1)
                    elseif positionType == 2096 then -- TWO
                        weapon = 2 -- animation(2)
                    end
                    if isInArray(lanceWeapons, itemType:getId()) then
                        weapon = 3 -- animation(3)
                        if positionType == 2096 then -- Two handed lances get extra damage because of smaller area
                            damageModifer = 1.5
                        end
                    end
                    
                    -- If normal ONE or TWO hander, roll a swing direction
                    if weapon < 3 then
                        swing = math.random(1,2)
                    end
                    
                    -- Creature targeted
                    if target then -- Make sure its in range before doing targeted changes
                        distance = creaturePos:getDistance(target:getPosition())
                        if distance <= range and target:getHealth() > 0 then
                            creaturePos = target:getPosition() -- Change position to monster
                            local playerPos = player:getPosition() -- Get player position
                            local diagonal = false
                            -- Adjust DIRECTION based on target location rather than player direction
                            if creaturePos.x > playerPos.x then
                                if creaturePos.y > playerPos.y then
                                    direction = DIRECTION_SOUTHEAST
                                    diagonal = true
                                elseif creaturePos.y < playerPos.y then
                                    direction = DIRECTION_NORTHEAST
                                    diagonal = true
                                elseif creaturePos.y == playerPos.y then
                                    direction = DIRECTION_EAST
                                end
                            elseif creaturePos.x < playerPos.x then
                                if creaturePos.y > playerPos.y then
                                    direction = DIRECTION_SOUTHWEST
                                    diagonal = true
                                elseif creaturePos.y < playerPos.y then
                                    direction = DIRECTION_NORTHWEST
                                    diagonal = true
                                elseif creaturePos.y == playerPos.y then
                                    direction = DIRECTION_WEST
                                end
                            elseif creaturePos.x == playerPos.x then
                                if creaturePos.y > playerPos.y then
                                    direction = DIRECTION_SOUTH
                                else
                                    direction = DIRECTION_NORTH
                                end
                            end
                            if diagonal then
                                animationType = 2
                            end
                        else -- Targeted, but not in range
                            target = false
                            local nextPos = player:getPosition():getNextPosition(player:getDirection(), 1)
                            if Tile(nextPos) and Tile(nextPos):hasProperty(CONST_PROP_BLOCKPROJECTILE) then -- If directional tile is not valid
                                creature:sendCancelMessage(RETURNVALUE_NOTENOUGHROOM)
                                creaturePos:sendMagicEffect(CONST_ME_POFF)
                                return false
                            else
                                var = Variant(nextPos) -- Change spell cast position back to directional pos and continue with spell
                            end
                        end
                    end
                    -- Rotate area based on DIRECTION
                    for i = 1, #animationArea[animationType][weapon][swing] do
                        if direction == DIRECTION_EAST or direction == DIRECTION_NORTHEAST then
                            animationArea[animationType][weapon][swing][i] = rotate_CW_90(animationArea[animationType][weapon][swing][i])
                            if not target then
                                directionalX = 1
                            end
                        elseif direction == DIRECTION_SOUTH or direction == DIRECTION_SOUTHEAST then
                            animationArea[animationType][weapon][swing][i] = rotate_180(animationArea[animationType][weapon][swing][i])
                            if not target then
                                directionalY = 1
                            end
                        elseif direction == DIRECTION_WEST or direction == DIRECTION_SOUTHWEST then
                            animationArea[animationType][weapon][swing][i] = rotate_CCW_90(animationArea[animationType][weapon][swing][i])
                            if not target then
                                directionalX = -1
                            end
                        else
                            if not target then
                                directionalY = -1
                            end
                        end
                    end
                end
            end
        end
    end
    
    -- No weapon
    if weapon == 0 then
        creature:sendCancelMessage("You need to have a weapon equipped to use this spell.")
        creaturePos:sendMagicEffect(CONST_ME_POFF)
        return false
    end
    
    -- Damage formula
    local skill = player:getEffectiveSkillLevel(SKILL_SWORD)
    local attack = getMeleeAttack(player:getId())
	local power = skill * attack 
    local level = player:getLevel()
    local magic = player:getMagicLevel()

    local min = ((level / 5) + (power * 0.060) + attack) * 1.6
    local max = ((level / 5) + (power * 0.0705) + attack * 1.3) * 1.8
    combats[weapon]:setFormula(COMBAT_FORMULA_SKILL, 0, min, 0, max)
    
    -- Collate animation
    local centre = {}
    local damagearea = {}
    for j = 1, #animationArea[animationType][weapon][swing] do
        for k,v in ipairs(animationArea[animationType][weapon][swing][j]) do
            for i = 1, #v do
                if v[i] == 3 or v[i] == 2 then
                    centre.Row = k
                    centre.Column = i
                    if v[i] == 3 then
                        table.insert(damagearea, centre)
                    end
                elseif v[i] == 1 then
                    local darea = {}
                    darea.Row = k
                    darea.Column = i
                    darea.Delay = j * delay
                    table.insert(damagearea, darea)
                end
            end
        end --print(centre.Column .. "," .. centre.Row)
    end
    
    -- Do Animation
    for i = 1,#damagearea do
        local damagepos = Position(creaturePos)
        
        -- Compare with centrepos
        local modifierx = damagearea[i].Column - centre.Column
        local modifiery = damagearea[i].Row - centre.Row -- print(damagearea[i].Column .. "," .. damagearea[i].Row)
        
        -- Adjust pos, account for direction
        damagepos.x = damagepos.x + modifierx + directionalX -- print("x " .. modifierx .. " " .. "y " .. modifiery)
        damagepos.y = damagepos.y + modifiery + directionalY -- print("Damage: " .. damagepos.x .. "," .. damagepos.y .. "," .. damagepos.z)
        
        -- Animate
        local animationDelay = damagearea[i].Delay or 0
        addEvent(animation, animationDelay, damagepos) -- player:getPosition()
    end
    
    -- Execute Damage
    combats[weapon]:execute(creature, var)
    local LifebloodStrike = creature:getStorageValue(PassiveSkills.LifebloodStrike) or 0
    if LifebloodStrike > 0 then
        min = min * (1 + (LifebloodStrike / 100))
        
    end
    local extrahealing = creature:getSpecialSkill(SPECIALSKILL_EXTRAHEALING)
    if extrahealing > 0 then
        min = min * (1 + (extrahealing / 100))
    end

    local ReboundStrike = creature:getStorageValue(PassiveSkills.ReboundStrike)
    if ReboundStrike > 0 and math.random(1, 100) <= ReboundStrike then
        addEvent(castSpellRebound, 500, creature.uid, var, min)
    end
	creature:addHealth(min)

    return true
end