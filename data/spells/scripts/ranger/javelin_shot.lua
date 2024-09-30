local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 53)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

function onGetFormulaValues(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.045) + (attack * 1.2) + 40
	local max = (level / 5) + (power * 0.085) + (attack * 2.5) + 45
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function getRepelTilesJavelin(cid)
    return 4
end
 
function getNextPosJavelin(creature, target, tiles)
    local cid = creature:getPosition()
    local tar = target:getPosition()
    local x,y,z = (cid.x-tar.x),(cid.y-tar.y),(cid.z-tar.z)
    local newx,newy,newz = tar.x,tar.y,tar.z
    local value = 0
    if math.abs(x) <= 2 and math.abs(y) <= 2 then
        if x == 0 then
            if y < 0 then
                value = 6
            elseif y > 0 then
                value = 2
            end
        elseif y == 0 then
            if x < 0 then
                value = 4
            elseif x > 0 then
                value = 0
            end
        elseif x < 0 then
            if y < 0 then
                value = 5
            elseif y > 0 then
                value = 3
            end
        elseif x > 0 then
            if y < 0 then
                value = 7
            elseif y > 0 then
                value = 1
            end
        end
    elseif (x==3 and math.abs(y) <= 1) or (x==4 and math.abs(y) <=2) then
        value = 0
    elseif (x==-3 and math.abs(y) <= 1) or (x==-4 and math.abs(y) <=2) then
        value = 4
    elseif (y == 3 and math.abs(x) <= 1) or (y == 4 and math.abs(x) <= 2) then
        value = 2
    elseif (y == -3 and math.abs(x) <= 1) or (y == -4 and math.abs(x) <= 2) then
        value = 6
    elseif ((x==-3 or x==-2) and (y==3 or y==2)) or ((x==-3 or x==-4) and (y==3 or y==4)) then
        value = 3
    elseif ((x==-3 or x==-2) and (y==-3 or y==-2)) or ((x==-3 or x==-4) and (y==-3 or y==-4)) then
        value = 5
    elseif ((x==3 or x==2) and (y==3 or y==2)) or ((x==3 or x==4) and (y==3 or y==4)) then
        value = 1
    elseif ((x==3 or x==2) and (y==-3 or y==-2)) or ((x==3 or x==4) and (y==-3 or y==-4)) then
        value = 7
    end

    local places = {
      [0] = {x=newx-tiles, y=newy, z=newz, stackpos = 253},
      [1] = {x=(newx-tiles), y=(newy-tiles), z=newz, stackpos = 253},
      [2] = {x=newx, y=(newy-tiles), z=newz, stackpos = 253},
      [3] = {x=(newx+tiles), y=(newy-tiles), z=newz, stackpos = 253},
      [4] = {x=(newx+tiles), y=newy, z=newz, stackpos = 253},
      [5] = {x=(newx+tiles), y=(newy+tiles), z=newz, stackpos = 253},
      [6] = {x=newx, y=(newy+tiles), z=newz, stackpos = 253},
      [7] = {x=(newx-tiles), y=(newy+tiles), z=newz, stackpos = 253}
    }
    return places[value]
end
 
function doRepelJavelin(cid, target, tiles)
    if queryTileAddThing(target, getNextPosJavelin(cid, target, 1)) == RETURNVALUE_NOERROR then
        repeat
            target:teleportTo(getNextPosJavelin(cid, target, 1), true)
            doSendMagicEffect(getCreaturePosition(target), CONST_ME_POFF)
            tiles = tiles-1
        until tiles == 0 or queryTileAddThing(target, getNextPosJavelin(cid, target, 1)) ~= RETURNVALUE_NOERROR
    end
end
 
function onCastSpell(cid, var)
    targ = cid:getTarget()
    if targ:getPosition():getDistance(cid:getPosition()) > 4 then 
        cid:sendCancelMessage("Target is too far.")
        cid:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false 
    end
	
	
    if (targ:isPlayer(i)) or (targ:isMonster()) then
	tarpos = cid:getTarget():getPosition()
    pos = cid:getPosition()
	combat:execute(cid, var)
    pos:sendDistanceEffect(tarpos, 53)
		if targ:getSpeed() < 1 then 
			cid:sendCancelMessage("target is inmune to movement effects.")
			tarpos:getPosition():sendMagicEffect(CONST_ME_POFF)
			return false 
		end
        if queryTileAddThing(targ, getNextPosJavelin(cid, targ, 1)) == RETURNVALUE_NOERROR then
            if (isPlayer(targ.uid)) or (isMonster(targ.uid)) and getTilePzInfo(getCreaturePosition(cid)) == FALSE then
                doRepelJavelin(cid, Creature(targ.uid), getRepelTilesJavelin(cid))
            end
        else
            doPlayerSendCancel(cid, "Something is in the way to repel the target.")
        end
    else
        doPlayerSendCancel(cid, "There is no target to repel.")
    end
    
    
    return true
end