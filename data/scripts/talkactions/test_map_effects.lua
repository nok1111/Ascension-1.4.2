local mapshader = TalkAction("/amap", "!amap")

function mapshader.onSay(player, words, param)
	if param ~= "" then
		local split = param:split(",")
		player:setMapShader(split[1], true)
	else
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "wrong name")
	end
	return false
end

mapshader:separator(" ")
mapshader:register()


local getmapshader = TalkAction("/gmap", "!gmap")

function getmapshader.onSay(player, words, param)
	if  param ~= "" then
		local mapshaderId = player:getMapShader(param)
		player:say(mapshaderId)
	else
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "wrong id")
	end
	return false
end

getmapshader:separator(" ")
getmapshader:register()


--[[
player:setMapShader(shaderName, [temporary])
player:getMapShader()

creature:setShader(shaderName)
creature:getShader()
creature:detachEffectById(effectId)
creature:attachEffectById(effectId, [temporary])

]]
--