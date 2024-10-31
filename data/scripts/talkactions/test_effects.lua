local talk = TalkAction("/af", "!af")

function talk.onSay(player, words, param)
	if player:getGroup():getAccess() and param ~= "" then
		local split = param:split(",")
		player:attachEffectById(split[1], true)
	else
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "wrong id")
	end
	return false
end

talk:separator(" ")
talk:register()


local talk2 = TalkAction("/df", "!df")

function talk2.onSay(player, words, param)
	if player:getGroup():getAccess() and param ~= "" then
		player:detachEffectById(param)
	else
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "wrong id")
	end
	return false
end

talk2:separator(" ")
talk2:register()


--[[
player:setMapShader(shaderName, [temporary])
player:getMapShader()

creature:setShader(shaderName)
creature:getShader()
creature:detachEffectById(effectId)
creature:attachEffectById(effectId, [temporary])

]]
--