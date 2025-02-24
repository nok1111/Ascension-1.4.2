
function onReconnect(player)
-- update jobs
	ProfessionSystem:sendJobs(player)
--- Ancestral Task
	player:sendTasksData()
	return true
end