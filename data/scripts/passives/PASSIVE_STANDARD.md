# Passive Effect Standardization Guide

## Structure
```lua
[passive_name] = {
  config = {
    -- Required fields
    vocation = 1,      -- Vocation ID (optional)
    storage = 5000,    -- Storage ID (optional)
    subid = 25961,     -- Condition subid (optional)
    playerOnly = true, -- Only affects players (default: false)
    
    -- Configuration
    chance = 10,       -- Activation chance (1-100)
    cooldown = 1.0,    -- Seconds between activations
    duration = 2000    -- Effect duration in ms
  },
  
  -- Trigger condition (required)
  trigger = function(player, target, damage, origin, damageType)
    return condition_check
  end,
  
  -- Effect implementation (required)
  effect = function(player, target, damage)
    return modified_damage
  end,
  
  -- Visual effects (optional)
  visuals = function(player, target)
    target:sendMagicEffect(CONST_ME_MAGIC_BLUE)
  end
}
```

## Target vs Self Rules

### Self Effects (player)
- Defensive buffs
- Healing/Regeneration
- Self conditions

```lua
effect = function(player, target, damage)
  player:addHealth(100) -- Heals player
  return damage
end
```

### Target Effects (target)
- Offensive abilities
- Debuffs
- Crowd control

```lua
effect = function(player, target, damage)
  target:addCondition(poisonCondition)
  return damage * 1.2
end
```

## Best Practices
1. Keep all configurations in `config` table
2. Return original damage if effect doesn't modify it
3. Use consistent parameter order:
   - player (actor)
   - target (affected creature)
   - damage (amount)
   - origin (damage source)
4. Document special conditions in comments
