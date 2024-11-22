local cfg = {
storage = 15001, -- Esse script usa storages, então ponha uma que ainda não esteja sendo usada
TYPE = COMBAT_PHYSICALDAMAGE, -- Que tipo de combat?
EFFECT = CONST_ME_DRAWBLOOD, -- Que tipo de efeito?
DISTANCEEFFECT = CONST_ANI_PIERCINGBOLT, -- Que tipo de efeito de distancia?
level = 50, -- Level necessário
voc = {3, 7, 1, 4, 2}, -- Vocação(ões) necessária(s)
damage = 1000, -- Dano
extraBullets = 2, -- Balas extras. Com 2 irá atirar 3 balas
range = 4, -- Range das balas extras
}
 
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, cfg.TYPE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, cfg.EFFECT)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, cfg.DISTANCEEFFECT)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 1, 0, 1, 0)
setCombatFormula(combat, COMBAT_PARAM_BLOCKARMOR, true)
 
function onUseWeapon(cid, var)
doCombat(cid, combat, var)
 
if getPlayerLevel(cid) >= cfg.level and isInArray(cfg.voc, getPlayerVocation(cid)) or getPlayerGroupId(cid) > 2 then
 
local target = getCreatureTarget(cid)
local level = getPlayerLevel(cid)
local dlevel = getPlayerSkill(cid, 4)
local atkMin = (level/5)
local atkMax = (0.08*0.75*dlevel*cfg.damage+atkMin)
local pPos = getCreaturePosition(cid)
local tPos = getCreaturePosition(target)
 
if getDistanceBetween(pPos, tPos) > cfg.range then
return false
end
 
local function doMimicsShoot(pos)
local hm = getPlayerStorageValue(cid, cfg.storage)
local creature = getTopCreature({x = pos.x, y = pos.y, z = pos.z, stackpos = STACKPOS_TOP_CREATURE})
 
if creature == getTopCreature(pPos) then 
 
return end
 

 
if creature.type == 1 then
atkMin = (atkMin/2)
atkMax = (atkMax/2)
end
 
local percent90 = (math.random(1,10))
 
if percent90 > 1 then
 

doSendDistanceShoot(pPos, pos, cfg.DISTANCEEFFECT)
doAreaCombatHealth(cid, cfg.TYPE, pos, area, -atkMin, -atkMax, cfg.EFFECT)
 
else
 

doSendDistanceShoot(pPos, pos, cfg.DISTANCEEFFECT)
doSendMagicEffect(pos, CONST_ME_POFF)
end
end

 
local tab = {
{x=tPos.x-1, y=tPos.y, z=tPos.z},
{x=tPos.x+1, y=tPos.y, z=tPos.z},
{x=tPos.x, y=tPos.y+1, z=tPos.z},
{x=tPos.x, y=tPos.y-1, z=tPos.z},
{x=tPos.x-1, y=tPos.y-1, z=tPos.z},
{x=tPos.x+1, y=tPos.y-1, z=tPos.z},
{x=tPos.x+1, y=tPos.y+1, z=tPos.z},
{x=tPos.x-1, y=tPos.y+1, z=tPos.z},
}
 
setPlayerStorageValue(cid, cfg.storage, 0)
 
for i = 1, #tab do
doMimicsShoot(tab) 
end
end
end