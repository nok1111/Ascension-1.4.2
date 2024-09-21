table.serialize = function(x, recur)
  local t = type(x)
  recur = recur or {}

  if t == nil then
    return "nil"
  elseif t == "string" then
	return string.format("%q", x)
  elseif t == "number" then
	return tostring(x)
  elseif t == "boolean" then
	return t and "true" or "false"
  elseif getmetatable(x) then
	error("Can not serialize a table that has a metatable associated with it.")
  elseif t == "table" then
    if(table.contains(recur, x)) then
	  error("Can not serialize recursive tables.")
	end
	table.insert(recur, x)

	local s = "{"
	for k, v in pairs(x) do
	  s = s .. "[" .. table.serialize(k, recur) .. "]"
	  s = s .. " = " .. table.serialize(v, recur) .. ","
	end
	s = s .. "}"
	return s
  else
	error("Can not serialize value of type '" .. t .. "'.")
  end
end