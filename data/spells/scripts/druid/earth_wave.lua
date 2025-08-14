local config = {
    speed = 150,
    mfx = 230,
    dfx = 111,
    element = COMBAT_EARTHDAMAGE,
    xradius = 3,
    yradius = 3
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, config.element)
combat:setParameter(COMBAT_PARAM_EFFECT, config.mfx)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

function onGetFormulaValues(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = magic * attack 
    local level = player:getLevel()


    local min = ((level / 5) + (power * 0.08) + (attack * 3) + 185)
    local max = ((level / 5) + (power * 0.09) + (attack * 3.5) + 200)
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
    local player = Player(creature)
    if not player then return false end

    function onCreatureHit2(self, hitCreature)
        combat:execute(Creature(self.casterId), numberToVariant(hitCreature:getId()))
    end
 
    function onCreatureHit(self, hitCreature)
        local hitCreatureDirection = hitCreature:getDirection()
        local hitCreaturePosition = hitCreature:getPosition()
        combat:execute(Creature(self.casterId), numberToVariant(hitCreature:getId()))

        SkillShot:new({
            onCreatureHit = onCreatureHit2,
            animation = 118,
            effect = 256,
            casterId = creature:getId(),
            chain = {
                ChainElement:new({direction = ChainElementDirections.forward, delay = 0, ignore = true}),
                ChainElement:new({direction = ChainElementDirections.forward, delay = 600, steps = 2}),
                ChainElement:new({direction = ChainElementDirections.forward, delay = 600, steps = 2}),
                ChainElement:new({direction = ChainElementDirections.forward, delay = 600, steps = 2}),
                ChainElement:new({direction = ChainElementDirections.backward, delay = 600, steps = 2}),
                ChainElement:new({direction = ChainElementDirections.backward, delay = 600, steps = 2})
            }
        }):fire({customStartCoordinates = {x = hitCreaturePosition.x, y = hitCreaturePosition.y, z = hitCreaturePosition.z}, customDirection = hitCreatureDirection})
    end

    local skillShot = SkillShot:new({
        stopOnHit = false,
        onCreatureHit = onCreatureHit,
        animation = 118,
        effect = 256,
        casterId = creature:getId(),
        chain = {
            ChainElement:new({direction = ChainElementDirections.forward, delay = 0}),
            ChainElement:new({direction = ChainElementDirections.forward, delay = 600}),
            ChainElement:new({direction = ChainElementDirections.forward, delay = 600}),
            ChainElement:new({direction = ChainElementDirections.backward, delay = 600}),
            ChainElement:new({direction = ChainElementDirections.backward, delay = 600})
        }
    })

    local skillShot2 = SkillShot:new({
        stopOnHit = false,
        onCreatureHit = onCreatureHit,
        animation = 118,
        effect = 256,
        casterId = creature:getId(),
        chain = {
            ChainElement:new({direction = ChainElementDirections.forwardleft, delay = 0}),
            ChainElement:new({direction = ChainElementDirections.forwardleft, delay = 600}),
            ChainElement:new({direction = ChainElementDirections.forwardleft, delay = 600}),
            ChainElement:new({direction = ChainElementDirections.backwardright, delay = 600}),
            ChainElement:new({direction = ChainElementDirections.backwardright, delay = 600})
        }
    })

    local skillShot3 = SkillShot:new({
        stopOnHit = false,
        onCreatureHit = onCreatureHit,
        animation = 118,
        effect = 256,
        casterId = creature:getId(),
        chain = {
            ChainElement:new({direction = ChainElementDirections.forwardright, delay = 0}),
            ChainElement:new({direction = ChainElementDirections.forwardright, delay = 600}),
            ChainElement:new({direction = ChainElementDirections.forwardright, delay = 600}),
            ChainElement:new({direction = ChainElementDirections.backwardleft, delay = 600}),
            ChainElement:new({direction = ChainElementDirections.backwardleft, delay = 600})
        }
    })

    skillShot:fire()
    skillShot2:fire()
    skillShot3:fire()
    return true
end

SkillShot = {
    chain = {},
    onCreatureHit = function(self, hitCreature) end,
    onTileCreaturesHit = function(self, hitCreatureIdList) end,

    onHit = function(self, hitCreatureIdList)
        self:onTileCreaturesHit(hitCreatureIdList)
        for _, hitCreatureId in ipairs(hitCreatureIdList) do
            local hitCreature = Creature(hitCreatureId)
            if hitCreature then self:onCreatureHit(hitCreature) end
        end
    end,

    onChain = function(self, currentChain)
        local caster = Creature(self.casterId)
        if not caster then return end
        local chain = self.chain[currentChain]
        local positionAdjustment = chain:getPositionAdjustment(self.direction)
        local fromPos = Position(self.coordinates)
        self.coordinates.x = self.coordinates.x + positionAdjustment.x
        self.coordinates.y = self.coordinates.y + positionAdjustment.y

        local toPos = Position(self.coordinates)
        local toTile = Tile(toPos)

        if not toTile then return end

        if toTile:hasProperty(CONST_PROP_BLOCKPROJECTILE) or toTile:hasFlag(TILESTATE_PROTECTIONZONE) then return end

        if chain.ignore then
            self:nextChain(currentChain)
            return
        end

        fromPos:sendDistanceEffect(toPos, self.animation)
        toPos:sendMagicEffect(self.effect)

        local creatures = Tile(toPos):getCreatures()
        local hitCreatureIdList = {}
        if creatures and #creatures > 0 then
            for _, creature in pairs(creatures) do
                if creature:isMonster() and not creature:getMaster() or (creature:isPlayer() and not creature:getGroup():hasFlag(PlayerFlag_CannotBeAttacked)) then
                    hitCreatureIdList[#hitCreatureIdList + 1] = creature:getId()
                end
            end
        end

        if #hitCreatureIdList > 0 then
            self:onHit(hitCreatureIdList)
            if self.stopOnHit then return end
        end

        self:nextChain(currentChain)
    end,

    nextChain = function (self, currentChain)
        local nextChain = currentChain + 1
        if #self.chain < nextChain then return end
        addEvent(self.onChain, self.chain[nextChain].delay, self, nextChain)
    end,

    fire = function(self, args)
        args = args or {}
        local creature = Creature(self.casterId)
        if not creature then return end
        self.direction = creature:getDirection()
        if args.customDirection then
            self.direction = args.customDirection
        end
        local creaturePosition = creature:getPosition()
        self.coordinates = {
            x = creaturePosition.x,
            y = creaturePosition.y,
            z = creaturePosition.z
        }
        if args.customStartCoordinates then
            self.coordinates = args.customStartCoordinates
        end
        self:nextChain(0)
    end,

    new = function(self, args)
        local animation = args.animation or CONST_ANI_NONE
        local effect = args.effect or CONST_ME_NONE
        local onTileCreaturesHit = args.onTileCreaturesHit or self.onTileCreaturesHit
        local onCreatureHit = args.onCreatureHit or self.onCreatureHit
        local stopOnHit = false
        local chain = args.chain or self.chain
        if args.stopOnHit then stopOnHit = true end

        local instance = {
            casterId = args.casterId,
            chain = chain,
            onCreatureHit = onCreatureHit,
            onTileCreaturesHit = onTileCreaturesHit,
            stopOnHit = stopOnHit,
            animation = animation,
            effect = effect
        }
        setmetatable(instance, self)
        self.__index = self
        return instance
    end
}

ChainElementDirections = {
    none = 0,
    forward = 1,
    left = 2,
    right = 3,
    backward = 4,
    forwardleft = 5,
    forwardright = 6,
    backwardleft = 7,
    backwardright = 8
}

PositionAdjustmentMap = {
    [DIRECTION_NORTH] = {
        [ChainElementDirections.none] = {x = 0, y = 0},
        [ChainElementDirections.forward] = {x = 0, y = -1},
        [ChainElementDirections.left] = {x = -1, y = 0},
        [ChainElementDirections.right] = {x = 1, y = 0},
        [ChainElementDirections.backward] = {x = 0, y = 1},
        [ChainElementDirections.forwardleft] = {x = -1, y = -1},
        [ChainElementDirections.forwardright] = {x = 1, y = -1},
        [ChainElementDirections.backwardleft] = {x = -1, y = 1},
        [ChainElementDirections.backwardright] = {x = 1, y = 1}
    },
    [DIRECTION_SOUTH] = {
        [ChainElementDirections.none] = {x = 0, y = 0},
        [ChainElementDirections.forward] = {x = 0, y = 1},
        [ChainElementDirections.left] = {x = 1, y = 0},
        [ChainElementDirections.right] = {x = -1, y = 0},
        [ChainElementDirections.backward] = {x = 0, y = -1},
        [ChainElementDirections.forwardleft] = {x = 1, y = 1},
        [ChainElementDirections.forwardright] = {x = -1, y = 1},
        [ChainElementDirections.backwardleft] = {x = 1, y = -1},
        [ChainElementDirections.backwardright] = {x = -1, y = -1}
    },
    [DIRECTION_WEST] = {
        [ChainElementDirections.none] = {x = 0, y = 0},
        [ChainElementDirections.forward] = {x = -1, y = 0},
        [ChainElementDirections.left] = {x = 0, y = 1},
        [ChainElementDirections.right] = {x = 0, y = -1},
        [ChainElementDirections.backward] = {x = 1, y = 0},
        [ChainElementDirections.forwardleft] = {x = -1, y = 1},
        [ChainElementDirections.forwardright] = {x = -1, y = -1},
        [ChainElementDirections.backwardleft] = {x = 1, y = 1},
        [ChainElementDirections.backwardright] = {x = 1, y = -1}
    },
    [DIRECTION_EAST] = {
        [ChainElementDirections.none] = {x = 0, y = 0},
        [ChainElementDirections.forward] = {x = 1, y = 0},
        [ChainElementDirections.left] = {x = 0, y = -1},
        [ChainElementDirections.right] = {x = 0, y = 1},
        [ChainElementDirections.backward] = {x = -1, y = 0},
        [ChainElementDirections.forwardleft] = {x = 1, y = -1},
        [ChainElementDirections.forwardright] = {x = 1, y = 1},
        [ChainElementDirections.backwardleft] = {x = -1, y = -1},
        [ChainElementDirections.backwardright] = {x = -1, y = 1}
    }
}

ChainElement = {
    direction = ChainElementDirections.forward,
    delay = 0,
    steps = 1,
    getPositionAdjustment = function(self, casterDirection)
        local coordinates = PositionAdjustmentMap[casterDirection][self.direction]
        return {x = coordinates.x * self.steps, y = coordinates.y * self.steps}
    end,

    new = function(self, args)
        local steps = args.steps or self.steps
        local ignore = false
        local direction = args.direction or self.direction
        local delay = args.delay or self.delay
        if args.ignore then ignore = true end
        local instance = {direction = direction, delay = delay, steps = steps, ignore = ignore}
        setmetatable(instance, self)
        self.__index = self
        return instance
    end
}
