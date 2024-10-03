SpellLib = {
	cid = nil,
	var = nil,
	areaEffect = nil,
	areaSize = nil,
	interval = nil,
	combat = nil,
}

function SpellLib:new(area)
	local obj = {}
	obj.areaEffect = area
	obj.areaSize = #area
	obj.combat = {}
	obj.interval = {}
	for i = 1, obj.areaSize do
		table.insert(obj.combat, createCombatObject())
		if obj.areaEffect[i] ~= 0 then
			setCombatArea(obj.combat[i], createCombatArea(obj.areaEffect[i]))
		end
	end
	setmetatable(obj, self)
	self.__index = self
	return obj
end

function SpellLib:setArea(area)
	self.areaEffect = area
	self.areaSize = #area
end

function SpellLib:setInterval(interval, id)
	if id == nil or id == 0 then
		for i = 1, self:getAreaSize() do
			table.insert(self.interval, interval)
		end
	else
		self.interval[id] = interval
	end
end

function SpellLib:getCombat(res)
	return self.combat[res]
end

function SpellLib:getInterval(id)
	return self.interval[id]
end

function SpellLib:getAreaSize()
	return self.areaSize
end

function SpellLib:doSetCombatParam(param, effect, id)
	if id == nil or id == 0 then
		for i = 1, self:getAreaSize() do
			setCombatParam(self.combat[i], param, effect)
		end
	else
		setCombatParam(self.combat[id], param, effect)
	end
end

function SpellLib:doSetCombatFormula(param, value, id)
	if id == nil or id == 0 then
		for i = 1, self:getAreaSize() do
			setCombatFormula(self.combat[i], param, value[1], value[2], value[3], value[4])
		end
	else
		setCombatFormula(self.combat[id], param, value[1], value[2], value[3], value[4])
	end
end

function SpellLib:doSetCombatCallback(type, callback, id)
	if id == nil or id == 0 then
		for i = 1, self:getAreaSize() do
			setCombatCallback(self.combat[i], type, callback)
		end
	else
		setCombatCallback(self.combat[id], type, callback)
	end
end

function SpellLib:startCombat(param)
	if param.count < self:getAreaSize() then
		param.count = param.count+1

		local result = LUA_NO_ERROR
		local _combat = self.combat[param.count]

		if _combat ~= nil then
			result = doCombat(param.cid, _combat, param.var)
		end

		if (result == LUA_ERROR) --[[or result ~= LUA_ERROR and param.count == 8]] then
			return LUA_ERROR
		end

	else
		return LUA_ERROR
	end

	return LUA_NO_ERROR
end

function haveAmmoEquiped(cid, ammoID, count)
	if ammoID ~= 0 and ammoID ~= 2352 and getPlayerItemCount(cid, ammoID) >= count then
		return true
	end

	return false
end

function formulaSkill(cid, skill, formula, min, max, atk)
    local item = getWeaponEquiped(cid)
	local var = -(formula * item.attack * skill)/1
	return (var*min)*1, (var*max)*1.2
end

function formulaWeaponSkill(cid, formula, min, max)
	local item = getWeaponEquiped(cid)
	local var = -(formula * item.attack * getWeaponSkill(cid, item))/50
	--if weapon.itemid == 2396 then
	--	doPlayerRemoveItem(cid,2396,1)
	--end
	return (var*min)/100, (var*max)/100
end

function formulaWeaponMagic(cid, level, maglevel, minb, maxb, bonus)
	local weapon = getWeaponEquiped(cid)

	local min = -1
	local max = -maglevel

	if weapon ~= nil then
		local bonus = 0

		-- // Checa se a Arma é Ice rapier, se for ele irá remover
		--if weapon.itemid == 2396 then
		--	doPlayerRemoveItem(cid,2396,1)
		--end

		-- // Verifica se a Arma é de duas mãos, se for retorna um bonus extra para o atk
		if weapon.slot_position == SLOT_TWO_HANDED then
			bonus = (weapon.attack*bonus)/100
		end
		-- // Formula do DMG Minumo e Maximo
		if getPlayerVocation(cid) == VOCATION_OVERLORD then
			min = -(minb * (weapon.attack+bonus) * (maglevel/8))
			max = -(maxb * (weapon.attack+bonus) * (maglevel/8))
		else
			min = -(minb * (weapon.attack+bonus) * maglevel)
			max = -(maxb * (weapon.attack+bonus) * maglevel)
		end

		-- // Checa se possui level para utilizar a Arma, se não retorna o damage em  20%
		if level < weapon.reqLevel then
			return (min*20)/100, (max*20)/100
		end
	end
	return min, max
end
