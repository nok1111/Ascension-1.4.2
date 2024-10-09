function onParsePacket(player, recvbyte, msg)
    ProfessionSystem:sendJobs(player)
    msg:delete()
	
end