-- Core API functions implemented in Lua
dofile('data/lib/core/core.lua')

-- Compatibility library for our old Lua API
dofile('data/lib/compat/compat.lua')

-- Debugging helper function for Lua developers
dofile('data/lib/debugging/dump.lua')
dofile('data/lib/debugging/lua_version.lua')

--custom
dofile('data/lib/012-table.lua')
dofile('data/lib/npc_dialog.lua')

dofile('data/lib/additional/tasklist.lua')
dofile('data/lib/additional/tasksystem.lua')
dofile('data/lib/additional/professionSystem.lua')
dofile('data/lib/additional/craftingSystem.lua')
dofile('data/lib/additional/fameSystem.lua')
dofile('data/lib/additional/spell_info.lua')
dofile('data/lib/additional/waypoints_lib.lua')
dofile('data/lib/custom/ancestral_task.lua')
