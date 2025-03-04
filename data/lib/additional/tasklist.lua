npcTaskList = {
		["Sheriff Gordon"] = {2,3,4,5,6},
        ["Gaelia"] = {7},
        ["Elder Hjalmar"] = {8,9}, 


    -- Garona

}

playersTasks = {
    [1] = {
        taskNumber = 1,
        taskName = "Sample Quest",
        taskDescription = "sample quest description!",
        taskGoals = {
            monsters = {			                 
                --[[[1] = {
                    name = "Skeleton",
                    spriteId = 1525
                },
				[2] = {
                    name = "Ghoul",
                    spriteId = 1525
                }--]]
            },
            items = {
			--[[1] = {
                    name = "Golden Figurine",
                    itemId = 5799
                    }--]]

            },
            storages = {
                --[[[1] = {
                    starageName = "Light candel",
                    starageTaskId = 12000
                }]]
            }
        },
       -- preRequiredStorages = {40000}, -- The player must have storage 40000 before accepting this task
        taskGoalCnt = 1, --amount ofmonsters, storage value, or items required for this quest
        taskMinLvl = 1, --recommended level
        taskRepeat = false, --not working atm
        taskStorageId = 40001, --storage for quest
        taskStorageCnt = 40002, --second storage
        taskRewards = {
            experience = 600, --or nil
            items = {
                [1] = {
                    name = "grave robber shovel",
                    itemSid = 5710,
                    itemCnt = 1
                },
				[2] = {
                    name = "gold coin",
                    itemSid = 2148,
                    itemCnt = 15
                },
				[3] = {
                    name = "Fame Tome",
                    itemSid = 1982,
                    itemCnt = 2
                },
            },
            outfits = {
                --[1] = {
                  --  name = "Oriental",
                   -- lookType = 146
                },
            },
      taskZoneName = "garona north cave", --info about where the quest is at
	  taskSource = "Grave Robber Lucas", --info about NPC name
	  taskHint = "N/A" --hints for players if necessary
    },
    [2] = {
        taskNumber = 2,
        taskName = "Introduction to Crafting",
        taskDescription = "well lets start with the basics, in order to survive in this world i may suggest learning a crafting job. In order to learn a job go and talk to any carfting related instructor like [Blacksmith Sam], [Alchemist Hana], [The Great Xodet] or [Chef Sam]. You can learn more about this once you talk with them.",
        taskGoals = {
            monsters = {			                 
                --[[[1] = {
                    name = "Skeleton",
                    spriteId = 1525
                },
                [2] = {
                    name = "Ghoul",
                    spriteId = 1525
                }--]]
            },
            items = {
		

            },
            storages = {
               [1] = {
                    starageName = "Learn a Crafting Job.",
                    starageTaskId = Mainquest.learncrafting
                }
            }
        },
        preRequiredStorages = {}, -- The player must have storage 40000 before accepting this task
        taskGoalCnt = 1,
        taskMinLvl = 1,
        taskRepeat = false,
        taskStorageId = 40003,
        taskStorageCnt = 40004,
        taskRewards = {
            experience = 12000, --or nil
            items = {
				[1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 2
                },
                [2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 2
                },
                },
            outfits = {
                --[1] = {
                  --  name = "Oriental",
                   -- lookType = 146
                },
            },
      taskZoneName = "Garona",
	  taskSource = "Sheriff Gordon",
	  taskHint = "Talk to NPC."
    },
    [3] = {
        taskNumber = 3,
        taskName = "Starting Tools",
        taskDescription = "Go find a Lubo [NPC] and buy an expedition bag, ill give you afterwards all the tools you will need in your journey.",
        taskGoals = {
            monsters = {                             
                --[[[1] = {
                    name = "Skeleton",
                    spriteId = 1525
                },
                [2] = {
                    name = "Ghoul",
                    spriteId = 1525
                }--]]
            },
            items = {
            [1] = {
                    name = "Expedition Bag",
                    itemId = 11242
                }

            },
            storages = {
             
            }
        },
        preRequiredStorages = {40003}, -- The player must have storage 40000 before accepting this task
        taskGoalCnt = 1,
        taskMinLvl = 1,
        taskRepeat = false,
        taskStorageId = 40005,
        taskStorageCnt = 40006,
        taskRewards = {
            experience = 12000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemSid = 2148,
                    itemCnt = 4
                },              
                [2] = {
                    name = "Scythe",
                    itemSid = 2550,
                    itemCnt = 1
                },
                [3] = {
                    name = "Rope",
                    itemSid = 2120,
                    itemCnt = 1
                },
                [4] = {
                    name = "Shovel",
                    itemSid = 2554,
                    itemCnt = 1
                },
                [5] = {
                    name = "Pick",
                    itemSid = 2553,
                    itemCnt = 1
                },
                [6] = {
                    name = "Fishing Rod",
                    itemSid = 2580,
                    itemCnt = 1
                }
                },
            outfits = {
                --[1] = {
                  --  name = "Oriental",
                   -- lookType = 146
                },
            },
      taskZoneName = "Garona",
      taskSource = "Sheriff Gordon",
      taskHint = "N/A"
    },
    [4] = {
        taskNumber = 4,
        taskName = "First Strike",
        taskDescription = "Grab a pickaxe and mine your first ores. Prove you have what it takes to be a miner.",
        taskGoals = {
            monsters = {                             
                
            },
            items = {
             [1] = {
                    name = "Copper Ore",
                    itemId = 40034
                }

            },
            storages = {
             --[[ [1] = {
                    starageName = "Survivors Found",
                    starageTaskId = Mainquest.survivor
                }]]
            }
        },
        preRequiredStorages = {40005}, -- The player must have storage 40000 before accepting this task
        taskGoalCnt = 6,
        taskMinLvl = 45,
        taskRepeat = false,
        taskStorageId = 40007,
        taskStorageCnt = 40008,
        taskRewards = {
            experience = 12000, --or nil
            items = {
                [1] = {
                    name = "gold coin",
                    itemSid = 2148,
                    itemCnt = 85
                    },
                },
            outfits = {
                --[1] = {
                  --  name = "Oriental",
                   -- lookType = 146
                },
            },
      taskZoneName = "Thornback Island",
      taskSource = "Magnus Blackwater",
      taskHint = "Sailing"
    },
    [5] = {
        taskNumber = 5,
        taskName = "First Chop",
        taskDescription = "Take an axe and cut down trees for logs. A woodcutters journey begins here.",
        taskGoals = {
            monsters = {                             
              --[[  [1] = {
                    name = "Captain Bloodbane",
                    spriteId = 1525
                },]]
            },
            items = {
             [1] = {
                    name = "Pine Trunk",
                    itemId = 39961
                }
            },
            storages = {
             
            }
        },
        preRequiredStorages = {40005}, -- The player must have storage 40000 before accepting this task
        taskGoalCnt = 10,
        taskMinLvl = 45,
        taskRepeat = false,
        taskStorageId = 40009,
        taskStorageCnt = 40010,
        taskRewards = {
            experience = 12000, --or nil
            items = {
                [1] = {
                    name = "gold coin",
                    itemSid = 2148,
                    itemCnt = 85
                    },
                },
            outfits = {
                --[1] = {
                  --  name = "Oriental",
                   -- lookType = 146
                },
            },
      taskZoneName = "Garona",
      taskSource = "Magnus Blackwater",
      taskHint = "N/a"
    },
    [6] = {
        taskNumber = 6,
        taskName = "First Harvest",
        taskDescription = "Search the wilds for herbs and gather them. Every great herbalist starts with a single leaf.",
        taskGoals = {
            monsters = {                             
              --[[  [1] = {
                    name = "Captain Bloodbane",
                    spriteId = 1525
                },]]
            },
            items = {
             [1] = {
                    name = "Crimson Rose",
                    itemId = 35440
                }
            },
            storages = {
             
            }
        },
        preRequiredStorages = {40005}, -- The player must have storage 40000 before accepting this task
        taskGoalCnt = 6,
        taskMinLvl = 45,
        taskRepeat = false,
        taskStorageId = 40011,
        taskStorageCnt = 40012,
        taskRewards = {
            experience = 12000, --or nil
            items = {
                [1] = {
                    name = "gold coin",
                    itemSid = 2148,
                    itemCnt = 85
                    },
                },
            outfits = {
                --[1] = {
                  --  name = "Oriental",
                   -- lookType = 146
                },
            },
      taskZoneName = "Garona",
      taskSource = "Magnus Blackwater",
      taskHint = "N/a"
    },
      [7] = {
        taskNumber = 7,
        taskName = "Desperate Mother",
        taskDescription = "A desperate mother has asked for your help. Her two children, Lina and Emmet, are trapped in a farmhouse to the east, surrounded by invading forest creatures. Find and rescue them before it's too late.",
        taskGoals = {
            monsters = {                             
              --[[  [1] = {
                    name = "Captain Bloodbane",
                    spriteId = 1525
                },]]
            },
            items = {
             
            },
            storages = {
             [1] = {
                    starageName = "Lina and Emmet found",
                    starageTaskId = Mainquest.childrenfound
                }
            }
        },
        preRequiredStorages = {}, -- The player must have storage 40000 before accepting this task
        taskGoalCnt = 2,
        taskMinLvl = 45,
        taskRepeat = false,
        taskStorageId = 40013,
        taskStorageCnt = 40014,
        taskRewards = {
            experience = 12000, --or nil
            items = {
                [1] = {
                    name = "gold coin",
                    itemSid = 2148,
                    itemCnt = 85
                    },
                },
            outfits = {
                --[1] = {
                  --  name = "Oriental",
                   -- lookType = 146
                },
            },
      taskZoneName = "Garona",
      taskSource = "Gaelia",
      taskHint = "east from gaelia"
    },
[8] = {
    taskNumber = 8,
    taskName = "The Stolen Dwarven Relic",
    taskDescription = "The dwarves have lost a precious artifact—the Runestone of Ankor. Elder Hjalmar has tasked you with recovering it from the goblins who stole it deep in the mines.",
    taskGoals = {
        storages = {
             [1] = {
                    starageName = "Stolen Dwarven Relic",
                    starageTaskId = Mainquest.dwarvenrelic
                }
            }
    },
    preRequiredStorages = {}, -- No pre-requirement to start
    taskGoalCnt = 1, -- Must collect 1 relic
    taskMinLvl = 20,
    taskRepeat = false,
    taskStorageId = 40015, -- Storage tracking the quest
    taskStorageCnt = 40016, -- Storage tracking completion
    taskRewards = {
        experience = 15000, -- Reward XP
        items = {
            [1] = {
                name = "gold coin",
                itemSid = 2148,
                itemCnt = 100
            },
            [2] = {
                name = "Dwarven Pickaxe",
                itemSid = 2552,
                itemCnt = 1
            }
        },
        outfits = {},
    },
    taskZoneName = "Dwarven Mines",
    taskSource = "Elder Hjalmar",
    taskHint = "The relic is in the hands of goblins deep in the mines."
},
[9] = {
    taskNumber = 9,
    taskName = "The Goblin Warlord",
    taskDescription = "Elder Hjalmar has discovered that a powerful goblin chieftain, Garnak the Warlord, is preparing an assault on the Dwarven stronghold. You must find and defeat him before it's too late.",
    taskGoals = {
        monsters = {
            [1] = {
                name = "Garnak the Warlord",
                spriteId = 1050
            }
        }
    },
    preRequiredStorages = {40015}, -- Must have completed "The Stolen Dwarven Relic"
    taskGoalCnt = 1, -- Kill Garnak the Warlord
    taskMinLvl = 20,
    taskRepeat = false,
    taskStorageId = 40017, -- Storage tracking the quest
    taskStorageCnt = 40018, -- Storage tracking completion
    taskRewards = {
        experience = 25000, -- Reward XP
        items = {
            [1] = {
                name = "gold coin",
                itemSid = 2148,
                itemCnt = 150
            },
            [2] = {
                name = "Dwarven Battleaxe",
                itemSid = 2435,
                itemCnt = 1
            }
        },
        outfits = {},
    },
    taskZoneName = "Goblin Lair",
    taskSource = "Elder Hjalmar",
    taskHint = "Garnak the Warlord is hiding deep within the Goblin Lair."
},
[10] = {
    taskNumber = 10,
    taskName = "Echoes of the Past",
    taskDescription = "Seer Valeria has sent you to explore Shadow Hollow and uncover its lost secrets. You must activate the three Ancient Seals hidden within the ruins.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Ancient Seals Activated",
                starageTaskId = 40200
            }
        }
    },
    preRequiredStorages = {}, -- No pre-requirement to start
    taskGoalCnt = 3, -- Activate 3 Ancient Seals
    taskMinLvl = 15,
    taskRepeat = false,
    taskStorageId = 40019,
    taskStorageCnt = 40020,
    taskRewards = {
        experience = 10000,
        items = {
            [1] = {
                name = "gold coin",
                itemSid = 2148,
                itemCnt = 50
            },
            [2] = {
                name = "Shadow Cloak",
                itemSid = 2656,
                itemCnt = 1
            }
        },
    },
    taskZoneName = "Shadow Hollow",
    taskSource = "Seer Valeria",
    taskHint = "Seek out the three Ancient Seals deep in Shadow Hollow and activate them."
},
[11] = {
    taskNumber = 11,
    taskName = "The Rogue's Gambit",
    taskDescription = "Paladin Aric has learned that a dangerous outlaw, Vael the Betrayer, is hiding deep in Shadow Hollow. Find and defeat him before he strikes again.",
    taskGoals = {
        monsters = {
            [1] = {
                name = "Vael the Betrayer",
                spriteId = 1635
            }
        }
    },
    preRequiredStorages = {40019}, -- Must complete "Echoes of the Past" first
    taskGoalCnt = 1, -- Kill Vael the Betrayer
    taskMinLvl = 20,
    taskRepeat = false,
    taskStorageId = 40021,
    taskStorageCnt = 40022,
    taskRewards = {
        experience = 22000,
        items = {
            [1] = {
                name = "gold coin",
                itemSid = 2148,
                itemCnt = 120
            },
            [2] = {
                name = "Rogue’s Hood",
                itemSid = 2660,
                itemCnt = 1
            }
        },
    },
    taskZoneName = "Shadow Hollow",
    taskSource = "Paladin Aric",
    taskHint = "Vael the Betrayer lurks in the deepest part of Shadow Hollow."
},



}


