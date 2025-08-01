
npcTaskList = {
        ["Sheriff Gordon"] = {2,3,4,5,6},
        ["Gaelia"] = {7},
        ["Elder Hjalmar"] = {8,9}, 
        ["Seer Valeria"] = {10},
        ["Paladin Aric"] = {11},  
        ["Ranger Captain Dain"] = {12,13,14,15}, 
        ["Edrin the Hermit"] = {16},  
        ["Darian"] = {17,18,19}, 
        ["Old Man"] = {20, 21,22,23,28}, -- Forgotten Library questline
        ["Old Man Garrek"] = {24},
        ["Gerald the Grave Robber"] = {25,26,27},
        ["Lily"] = {28,29}, 
        ["Old Sailor Grevis"] = {30},
        ["The Whispering Fog"] = {30,31,32,33,34,35},
        ["The Guardian of the Forgotten"] = {35},
        ["Dream-Seeker Alran"] = {36,37,38,39,40,41,42,43}, 
        ["Farmer Mabel"] = {44},
        ["Farmer Cluckington"] = {45},
        ["Lucy Steelgard"] = {46,48,49,50,51},
        ["Chriss"] = {47},
        ["Desert Scout Nahim"] = {52,53,54},
        ["Hermit of Wyrmfang"] = {55,56},
        ["Rukk Stonegaze"] = {57,58,59,60},
        ["Salim the Lookout"] = {63},
        ["Draya the Waterkeeper"] = {64,65,66,67,68},
        ["Kelro the Pale"] = {69},
        ["Dastan"] = {70,71,72,73},

        

        
        

        


}

--TASK_FREE = 0
--TASK_START = 1
--TASK_COMPLETED = 2
--TASK_REWARD_RECEIVED = 3

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
        taskDescription = "A desperate mother has asked for your help. Her two children, Lina and Emmet, are trapped in a farmhouse to the east, surrounded by invading forest creatures. Find and rescue them before it\'s too late.",
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
    taskDescription = "Elder Hjalmar has discovered that a powerful goblin chieftain, Garnak the Warlord, is preparing an assault on the Dwarven stronghold. You must find and defeat him before it\'s too late.",
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
                starageTaskId = Mainquest.threeseals
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
         outfits = {},
    },
    taskZoneName = "Shadow Hollow",
    taskSource = "Seer Valeria",
    taskHint = "Seek out the three Ancient Seals deep in Shadow Hollow and activate them."
},
[11] = {
    taskNumber = 11,
    taskName = "The Rogue\'s Gambit",
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
         outfits = {},
    },
    taskZoneName = "Shadow Hollow",
    taskSource = "Paladin Aric",
    taskHint = "Vael the Betrayer lurks in the deepest part of Shadow Hollow."
},

[12] = {
    taskNumber = 12,
    taskName = "The Broken Pact",
    taskDescription = "Ranger Captain Dain has warned of elven hostility. He believes an outcast elf might know more. Find and speak to the outcast east in the woods.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Spoke to the Outcast Elf",
                starageTaskId = Mainquest.brokenpact
            }
        }
    },
    preRequiredStorages = {40021}, -- Must complete the previous quest before starting this one
    taskGoalCnt = 1, -- Speak to the Outcast Elf
    taskMinLvl = 10,
    taskRepeat = false,
    taskStorageId = 40023,
    taskStorageCnt = 40024,
    taskRewards = {
        experience = 5000,
        items = {
            [1] = {
                name = "platinum coin",
                itemSid = 2152,
                itemCnt = 5
            }
        },
        outfits = {},
    },
    taskZoneName = "Verdant Grove",
    taskSource = "Ranger Captain Dain",
    taskHint = "The Outcast Elf hides east deep in the woods, away from his kin."
},

[13] = {
    taskNumber = 13,
    taskName = "Stolen Rites",
    taskDescription = "Ranger Captain Dain has discovered that the elves have begun performing dark rituals using stolen relics. Recover the artifacts before they complete their rites.",
    taskGoals = {
       
        items = {
            [1] = {
                name = "Ancient Corrupted Relic",
                itemId = 27632, -- Example item ID
            }
        }
    },
    preRequiredStorages = {40023}, -- Must complete "The Broken Pact" first
    taskGoalCnt = 3, -- Recover 3 stolen relics
    taskMinLvl = 12,
    taskRepeat = false,
    taskStorageId = 40025,
    taskStorageCnt = 40026,
    taskRewards = {
        experience = 7000,
        items = {
            [1] = {
                name = "platinum coin",
                itemSid = 2152,
                itemCnt = 8
            },
            [2] = {
                name = "Enchanted Elven Charm",
                itemSid = 11234,
                itemCnt = 1
            }
        },
        outfits = {},
    },
    taskZoneName = "Verdant Grove",
    taskSource = "Ranger Captain Dain",
    taskHint = "The relics are held by Elven Ritualists deep within the Verdant Grove."
},

[14] = {
    taskNumber = 14,
    taskName = "The Corrupted Heart",
    taskDescription = "Ranger Captain Dain believes the elves’ corruption is linked to an ancient artifact. An Elven High Priest is rumored to possess it. Retrieve the artifact and uncover the truth.",
    taskGoals = {
        storages = {

        },
        items = {
            [1] = {
                name = "Corrupted Heart",
                itemId = 15431, -- Example item ID
            }
        }
    },
    preRequiredStorages = {40025}, -- Must complete "Stolen Rites" first
    taskGoalCnt = 1, -- Recover 1 Corrupted Elven Relic
    taskMinLvl = 15,
    taskRepeat = false,
    taskStorageId = 40027,
    taskStorageCnt = 40028,
    taskRewards = {
        experience = 10000,
        items = {
            [1] = {
                name = "platinum coin",
                itemSid = 2152,
                itemCnt = 10
            },
            [2] = {
                name = "Corrupted Heart",
                itemSid = 15431,
                itemCnt = 1
            }
        },
        outfits = {},
    },
    taskZoneName = "Verdant Grove",
    taskSource = "Ranger Captain Dain",
    taskHint = "The Elven High Priest performs dark rituals in the heart of the forest."
},

[15] = {
    taskNumber = 15,
    taskName = "Purging the Taint",
    taskDescription = "Ranger Captain Dain has instructed you to take the corrupted relic to Vendel Pass, where a sacred basin lies. Seek out Elder Sylwen for guidance.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Cleansed the Corrupted Heart",
                starageTaskId = Mainquest.purgingtaint
            }
        }
    },
    preRequiredStorages = {40027}, -- Must complete "The Corrupted Heart" first
    taskGoalCnt = 1, -- Cleanse the relic
    taskMinLvl = 18,
    taskRepeat = false,
    taskStorageId = 40029,
    taskStorageCnt = 40030,
    taskRewards = {
        experience = 12000,
        items = {
            [1] = {
                name = "crystal coin",
                itemSid = 2160,
                itemCnt = 2
            },
            [2] = {
                name = "Blessed Elven Amulet",
                itemSid = 11236,
                itemCnt = 1
            }
        },
        outfits = {},
    },
    taskZoneName = "Vendel Pass",
    taskSource = "Ranger Captain Dain",
    taskHint = "The sacred basin lies on the second floor of the shrine in Vendel Pass."
},

[16] = {
    taskNumber = 16,
    taskName = "The Old Man\'s Request",
    taskDescription = "Edrin, an elderly hermit, needs strong elderwood logs to repair his home. He can no longer gather them himself and seeks your help.",
    taskGoals = {
        items = {
            [1] = {
                name = "Elderwood Log",
                itemId = 39967, -- Example item ID
            }
        }
    },
    preRequiredStorages = {}, -- Open-world, no pre-requisites
    taskGoalCnt = 20, -- Collect 20 Elderwood Logs
    taskMinLvl = 8,
    taskRepeat = false,
    taskStorageId = 40031,
    taskStorageCnt = 40032,
    taskRewards = {
        experience = 5000,
        items = {
            [1] = {
                name = "gold coin",
                itemSid = 2148,
                itemCnt = 100
            },
            [2] = {
                name = "Companion: Forest Spriggan",
                itemSid = 9200, -- Example pet companion ID
                itemCnt = 1
            }
        },
        outfits = {},
    },
    taskZoneName = "Deepwoods",
    taskSource = "Edrin the Hermit",
    taskHint = "Elderwood trees grow near the cliffs at the edge of the Deepwoods."
},

[17] = {
    taskNumber = 17,
    taskName = "Eternal Love",
    taskDescription = "Darian grieves for his lost wife, Elyria, who rests in a tomb near the Cursed Cathedral. He speaks in sorrow but does not ask for help directly. She loved red roses in life—perhaps placing one at her grave will bring him peace.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Paid Respects to Elyria",
                starageTaskId = Mainquest.eternallove
            }
        }
    },
    preRequiredStorages = {}, -- No pre-requisites
    taskGoalCnt = 1, -- Visit Elyria’s grave to complete
    taskMinLvl = 12,
    taskRepeat = false,
    taskStorageId = 40035,
    taskStorageCnt = 40036,
    taskRewards = {
        experience = 7500,
        items = {
            [1] = {
                name = "gold coin",
                itemSid = 2148,
                itemCnt = 150
            },
            [2] = {
                name = "Cursed Signet",
                itemSid = 7708, -- A memento of Elyria
                itemCnt = 1
            }
        },
        outfits = {},
    },
    taskZoneName = "Cursed Cathedral Grounds",
    taskSource = "Darian",
    taskHint = "A lone grave stands near the cathedral ruins. A red rose placed there may bring peace."
},
[18] = {
    taskNumber = 18,
    taskName = "The Cursed Signet",
    taskDescription = "Darian has entrusted you with the Cursed Signet a gift from Lucella that sealed Elyria\'s fate. The only way to break its hold is to cast it into an enchanted witch\'s cauldron, hidden somewhere in the ruins. The ritual must be done correctly, or the curse may persist.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Destroyed the Cursed Signet",
                starageTaskId = Mainquest.cursedsignet
            }
        }
    },
    preRequiredStorages = {40035}, -- Requires completion of "Eternal Love"
    taskGoalCnt = 1, -- Destroy the ring at the cauldron
    taskMinLvl = 14,
    taskRepeat = false,
    taskStorageId = 40037,
    taskStorageCnt = 40038,
    taskRewards = {
        experience = 10000,
        items = {
            [1] = {
                name = "gold coin",
                itemSid = 2148,
                itemCnt = 250
            },
            [2] = {
                name = "Elyria's Blessing",
                itemSid = 9212, -- A charm that carries Elyria's lingering warmth
                itemCnt = 1
            }
        },
        outfits = {},
    },
    taskZoneName = "Witch’s Ritual Grounds",
    taskSource = "Darian",
    taskHint = "An old cauldron hidden within the ruins may hold the key to breaking the curse."
},

[19] = {
    taskNumber = 19,
    taskName = "Lucella, the Weaving Dread",
    taskDescription = "Darian has gathered his strength. The time has come to end Lucella\'s influence once and for all. Her lair lies deep within the ruined cathedral, where she waits, weaving the last threads of her dark web. Reach her lair, defeat her, and cleanse this land of her corruption.",
    taskGoals = {
        monsters = {
            [1] = {
                name = "Lucella",
                spriteId = 9275 -- Example sprite ID
            }
        }
    },
    preRequiredStorages = {40037}, -- Requires completion of "The Cursed Signet"
    taskGoalCnt = 1, -- Kill Lucella
    taskMinLvl = 16,
    taskRepeat = false,
    taskStorageId = 40039,
    taskStorageCnt = 40040,
    taskRewards = {
        experience = 20000,
        items = {
            [1] = {
                name = "gold coin",
                itemSid = 2148,
                itemCnt = 500
            },
            [2] = {
                name = "Lucella’s Severed Veil",
                itemSid = 9213, -- A relic from Lucella’s shroud of power
                itemCnt = 1
            }
        },
        outfits = {},
    },
    taskZoneName = "Lucella’s Web",
    taskSource = "Darian",
    taskHint = "Lucella waits within the ruined cathedral, her lair hidden behind veils of shadow. Seek her out and end her dark reign."
},

[20] = {
    taskNumber = 20,
    taskName = "The Whispering Librarian",
    taskDescription = "A strange old man, who claims to clean the forgotten library, has asked for your help. A girl named Lily is trapped within, sealed by a Blood Flower Seal. He insists she must be freed. But something about him feels... off.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Located Lily's Seal",
                starageTaskId = Mainquest.findlily
            }
        }
    },
    preRequiredStorages = {}, -- No prerequisites
    taskGoalCnt = 1, -- Find the Blood Flower Seal
    taskMinLvl = 15,
    taskRepeat = false,
    taskStorageId = 40041,
    taskStorageCnt = 40042,
    taskRewards = {
        experience = 12000,
        items = {
            [1] = {
                name = "gold coin",
                itemSid = 2148,
                itemCnt = 200
            },
            [2] = {
                name = "Old Library Key",
                itemSid = 9214, -- A rusted key to deeper areas of the library
                itemCnt = 1
            }
        },
        outfits = {},
    },
    taskZoneName = "Forgotten Library",
    taskSource = "Old Librarian",
    taskHint = "The Blood Flower Seal binds Lily somewhere deep inside the Forgotten Library.",
},

[21] = {
    taskNumber = 21,
    taskName = "The Ribbon Beneath the Roots",
    taskDescription = "The Whispering Librarian insists that Lily\'s old ribbon must be recovered to weaken the seal binding her. It was buried long ago beneath the roots of an ancient tree in the swamp. But why was it hidden?",
    taskGoals = {
        items = {
            [1] = {
                name = "Lily\'s Ribbon",
                itemId = 18449, -- Unique quest item
            }
        }
    },
    preRequiredStorages = {40041}, -- Requires "The Whispering Librarian" completion
    taskGoalCnt = 1, -- Obtain the ribbon
    taskMinLvl = 15,
    taskRepeat = false,
    taskStorageId = 40043,
    taskStorageCnt = 40044,
    taskRewards = {
        experience = 8500,
        items = {
            [1] = {
                name = "gold coin",
                itemSid = 2148,
                itemCnt = 100
            }
        },
        outfits = {},
    },
    taskZoneName = "Swamp of Forgotten Voices",
    taskSource = "The Whispering Librarian",
    taskHint = "An ancient tree in the swamp hides the ribbon, entangled in its roots.",
},
[22] = {
    taskNumber = 22,
    taskName = "A Faded Letter",
    taskDescription = "Deep within the ruins of Lily\'s childhood home lies a forgotten letter. The Librarian believes it holds power over her fate. But the house has been abandoned for years... hasn’t it?",
    taskGoals = {
        items = {
            [1] = {
                name = "Faded Letter",
                itemId = 14326, -- Unique quest item
            }
        }
    },
    preRequiredStorages = {40041}, -- Requires "The Whispering Librarian" completion
    taskGoalCnt = 1, -- Obtain the letter
    taskMinLvl = 15,
    taskRepeat = false,
    taskStorageId = 40045,
    taskStorageCnt = 40046,
    taskRewards = {
        experience = 9000,
        items = {
            [1] = {
                name = "gold coin",
                itemSid = 2148,
                itemCnt = 120
            }
        },
        outfits = {},
    },
    taskZoneName = "Ruins of the Forsaken Home",
    taskSource = "The Whispering Librarian",
    taskHint = "The letter is locked within the ruined house, waiting to be found.",
},
[23] = {
    taskNumber = 23,
    taskName = "Shattered Reflections",
    taskDescription = "Somewhere in the Forgotten Library, a broken mirror remains. The Librarian claims it must be recovered, but something about his urgency feels... wrong.",
    taskGoals = {
        items = {
            [1] = {
                name = "Shattered Mirror",
                itemId = 40096, -- Unique quest item
            }
        }
    },
    preRequiredStorages = {40041}, -- Requires "The Whispering Librarian" completion
    taskGoalCnt = 1, -- Obtain the mirror
    taskMinLvl = 15,
    taskRepeat = false,
    taskStorageId = 40047,
    taskStorageCnt = 40048,
    taskRewards = {
        experience = 9500,
        items = {
            [1] = {
                name = "gold coin",
                itemSid = 2148,
                itemCnt = 150
            }
        },
        outfits = {},
    },
    taskZoneName = "Forgotten Library",
    taskSource = "The Whispering Librarian",
    taskHint = "The mirror lies shattered in the Forgotten Library, yet its reflection lingers.",
},
[24] = {
    taskNumber = 24,
    taskName = "The Debt Collector",
    taskDescription = "Old Man Garrek is furious after being tricked into funding an \'Invisible Armor\' scam. He wants his 10 platinum coins back from Merchant Tobias. Retrieve the debt and return to Garrek.",
    taskGoals = {
        items = {
            [1] = {
                name = "Platinum Coins",
                itemId = 2152, -- Platinum Coin ID
            }
        }
    },
    preRequiredStorages = {}, -- No pre-requirement
    taskGoalCnt = 10, -- Collect 10 platinum coins from Tobias
    taskMinLvl = 5, -- Open-world, low-level quest
    taskRepeat = false,
    taskStorageId = 40051,
    taskStorageCnt = 40052,
    taskRewards = {
        experience = 3000,
        items = {
            [1] = {
                name = "gold coin",
                itemSid = 2148,
                itemCnt = 100
            }
        },
        outfits = {},
    },
    taskZoneName = "Garona",
    taskSource = "Old Man Garrek",
    taskHint = "Merchant Tobias owes Garrek 10 platinum coins. Retrieve the debt."
},
[25] = {
    taskNumber = 25,
    taskName = "Grave Consequences",
    taskDescription = "Gerald the Grave Robber insists there\'s a priceless heirloom buried in an old grave. Dig it up and retrieve the item... but beware, not all the dead rest peacefully.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Summoned the Guardian",
                starageTaskId = Mainquest.graverobber
            }
        }
    },
    preRequiredStorages = {}, -- Open-world quest, no pre-requisites
    taskGoalCnt = 1, -- Trigger the event once
    taskMinLvl = 10, -- Low-level, open-world quest
    taskRepeat = false,
    taskStorageId = 40053,
    taskStorageCnt = 40054,
    taskRewards = {
        experience = 7500,
        items = {
            [1] = {
                name = "gold coin",
                itemSid = 2148,
                itemCnt = 100
            },
            [2] = {
                name = "Rusty Spoon",
                itemSid = 2159, -- Junk item as a hilarious "heirloom"
                itemCnt = 1
            }
        },
        outfits = {},
    },
    taskZoneName = "Old Graveyard",
    taskSource = "Gerald the Grave Robber",
    taskHint = "Find the marked grave in the Old Graveyard and dig up the 'heirloom'."
},

[26] = {
    taskNumber = 26,
    taskName = "Wrong Body, Wrong Grave",
    taskDescription = "The grave robber insists he buried the wrong body in the wrong grave. Find the correct grave and retrieve the corpse... or whatever\'s left of it.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Found the Wrong Grave",
                starageTaskId = Mainquest.wronggrave
            }
        }
    },
    preRequiredStorages = {40053},
    taskGoalCnt = 1,
    taskMinLvl = 10,
    taskRepeat = false,
    taskStorageId = 40055,
    taskStorageCnt = 40056,
    taskRewards = {
        experience = 7500,
        items = {
            [1] = {
                name = "gold coin",
                itemSid = 2148,
                itemCnt = 100
            },
            [2] = {
                name = "Bone Charm",
                itemSid = 9201,
                itemCnt = 1
            }
        },
        outfits = {},
    },
    taskZoneName = "Graveyard of the Lost",
    taskSource = "Gerald the Grave Robber",
    taskHint = "Dig carefully. You might wake something up."
},

[27] = {
    taskNumber = 27,
    taskName = "I See Dead People... Now",
    taskDescription = "After retrieving the corpse, Gerald has been seeing unsettling visions. He believes the dead person is haunting him. Find a way to cleanse the spirit... or convince it to move on. Rumors speak of a cursed place in the west, once a thriving forest, now reduced to the Ashen Grove, a land of scorched trees and lingering embers. Perhaps you\'ll find answers there.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Banished the Haunting Spirit",
                starageTaskId = Mainquest.hauntingspirit
            }
        }
    },
    preRequiredStorages = {40055},
    taskGoalCnt = 1,
    taskMinLvl = 12,
    taskRepeat = false,
    taskStorageId = 40057,
    taskStorageCnt = 40058,
    taskRewards = {
        experience = 9000,
        items = {
            [1] = {
                name = "gold coin",
                itemSid = 2148,
                itemCnt = 150
            },
            [2] = {
                name = "Spirit Ward Amulet",
                itemSid = 9202,
                itemCnt = 1
            }
        },
        outfits = {},
    },
    taskZoneName = "Graveyard of the Lost",
    taskSource = "Gerald the Grave Robber",
    taskHint = "Find a way to put the spirit to rest before Gerald loses his mind."
},

[28] = {
    taskNumber = 28,
    taskName = "The Summoning of Lily",
    taskDescription = "You have gathered Lily\'s Ribbon, the Faded Letter, and the Shattered Mirror. Now, use them to summon Lily at the Forgotten Library’s ritual site. But be careful... something else might answer the call.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Summoned Lily",
                starageTaskId = Mainquest.summonlily
            }
        }
    },
    preRequiredStorages = {40043, 40045, 40047}, -- Requires having collected the three items
    taskGoalCnt = 1,
    taskMinLvl = 15,
    taskRepeat = false,
    taskStorageId = 40059,
    taskStorageCnt = 40060,
    taskRewards = {
        experience = 15000,
        items = {
            [1] = {
                name = "gold coin",
                itemSid = 2148,
                itemCnt = 200
            },
            [2] = {
                name = "Lily's Tear",
                itemSid = 9203,
                itemCnt = 1
            }
        },
        outfits = {},
    },
    taskZoneName = "Forgotten Library",
    taskSource = "Old Librarian",
    taskHint = "Find the Lily\'s coffin in the last flor of the Forgotten Library and free lily."
},
[29] = {
    taskNumber = 29,
    taskName = "Malrith, the Hungering Shade",
    taskDescription = "The time has come. Malrith, the Hungering Shade, has awakened, drawn by Lily\'s release. His form lurks in the depths of the Forgotten Library, feeding on the souls of the damned. Slay him before he consumes everything.",
    taskGoals = {
        monsters = {
            [1] = {
                name = "Malrith, the Hungering Shade",
                spriteId = 9876 -- Adjust to match sprite ID
            }
        }
    },
    preRequiredStorages = {40059}, -- Requires summoning Lily
    taskGoalCnt = 1, -- Kill Malrith
    taskMinLvl = 20, -- Recommended level
    taskRepeat = false,
    taskStorageId = 40061, -- Next sequential storage ID
    taskStorageCnt = 40062, -- Next sequential counter
    taskRewards = {
        experience = 35000,
        items = {
            [1] = {
                name = "gold coin",
                itemSid = 2148,
                itemCnt = 500
            },
            [2] = {
                name = "Malrith\'s Cursed Veil",
                itemSid = 9215, -- Custom quest item
                itemCnt = 1
            }
        },
        outfits = {},
    },
    taskZoneName = "Forgotten Library - Shadow Vault",
    taskSource = "Lily",
    taskHint = "Malrith lurks in the depths of the Forgotten Library, waiting to devour all who dare to face him."
},
[30] = {
    taskNumber = 30,
    taskName = "Echoes in the Fog",
    taskDescription = "Old Sailor Grevis spoke of an abandoned town to the north, Eldenmere. He claims those who enter never return the same. Travel there and uncover the truth.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Entered Eldenmere\'s Fog",
                starageTaskId = Mainquest.eldenshadow
            }
        }
    },
    preRequiredStorages = {}, -- No pre-requisites
    taskGoalCnt = 1, -- Entering the fog completes the quest
    taskMinLvl = 10,
    taskRepeat = false,
    taskStorageId = 40063, -- Storage tracking quest state
    taskStorageCnt = 40064, -- Completion tracker
    taskRewards = {
        experience = 7500,
        items = {
            [1] = {
                name = "gold coin",
                itemSid = 2148,
                itemCnt = 100
            },
            [2] = {
                name = "Old Sailor's Compass",
                itemSid = 9205, -- Unique quest item
                itemCnt = 1
            }
        },
        outfits = {},
    },
    taskZoneName = "Eldenmere Ruins",
    taskSource = "Old Sailor Grevis",
    taskHint = "Step into the fog north of the village and listen carefully."
},
[31] = {
    taskNumber = 31,
    taskName = "Echoes of the Forgotten: Edwin",
    taskDescription = "The first whisper calls out to you. Seek out the gravestone of Edwin the Watchful in Elden Cemetery.",
    taskGoals = {
        storages = {
            [1] = { starageName = "Found Edwin's Name", starageTaskId = Mainquest.nameedwin }
        }
    },
    preRequiredStorages = {40063}, -- Must have triggered the fog event first
    taskGoalCnt = 1,
    taskMinLvl = 15,
    taskRepeat = false,
    taskStorageId = 40069,
    taskStorageCnt = 40070,
    taskRewards = {
        experience = 3500,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 50 }
        },
         outfits = {},
    },
    taskZoneName = "Elden Cemetery",
    taskSource = "The Whispering Fog",
    taskHint = "Seek out Edwin\'s gravestone in the northern part of Elden Cemetery."
},
[32] = {
    taskNumber = 32,
    taskName = "Echoes of the Forgotten: Seraphine",
    taskDescription = "The second whisper calls to you. Seek out the gravestone of Seraphine the Silent in Elden Cemetery.",
    taskGoals = {
        storages = {
            [1] = { starageName = "Found Seraphine\'s Name", starageTaskId = Mainquest.nameseraphine }
        }
    },
    preRequiredStorages = {40063}, -- Must have completed Edwin’s step
    taskGoalCnt = 1,
    taskMinLvl = 15,
    taskRepeat = false,
    taskStorageId = 40071,
    taskStorageCnt = 40072,
    taskRewards = {
        experience = 3500,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 50 }
        },
         outfits = {},
    },
    taskZoneName = "Elden Cemetery",
    taskSource = "The Whispering Fog",
    taskHint = "Seek out Seraphine’s gravestone in the western part of Elden Cemetery."
},
[33] = {
    taskNumber = 33,
    taskName = "Echoes of the Forgotten: Marek",
    taskDescription = "The final whisper calls to you. Seek out the gravestone of Marek the Cursed in Elden Cemetery.",
    taskGoals = {
        storages = {
            [1] = { starageName = "Found Marek\'s Name", starageTaskId = Mainquest.namemarek }
        }
    },
    preRequiredStorages = {40063}, -- Must have completed Seraphine’s step
    taskGoalCnt = 1,
    taskMinLvl = 15,
    taskRepeat = false,
    taskStorageId = 40073,
    taskStorageCnt = 40074,
    taskRewards = {
        experience = 4000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 60 }
        },
         outfits = {},
    },
    taskZoneName = "Elden Cemetery",
    taskSource = "The Whispering Fog",
    taskHint = "Seek out Marek\'s gravestone in the eastern part of Elden Cemetery."
},
[34] = {
    taskNumber = 34,
    taskName = "Binding the Forgotten",
    taskDescription = "Marek refuses to be sealed. You must channel energy into the three spectral braziers around the Forgotten Altar while fighting off his wrath.",
    taskGoals = {
        storages = {
            [1] = { starageName = "Completed the Binding Ritual", starageTaskId = Mainquest.bindingritual }
        }
    },
    preRequiredStorages = {40073}, -- Must have completed Marek’s step
    taskGoalCnt = 1, -- The three braziers must be activated
    taskMinLvl = 15,
    taskRepeat = false,
    taskStorageId = 40075,
    taskStorageCnt = 40076,
    taskRewards = {
        experience = 7000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 100 },
            [2] = { name = "Ancient Spirit Ward", itemSid = 9205, itemCnt = 1 } -- Special Item
        },
         outfits = {},
    },
    taskZoneName = "Elden Cemetery",
    taskSource = "The Whispering Fog",
    taskHint = "Channel energy into the spectral braziers while surviving Marek\'s fury."
},
[35] = {
    taskNumber = 35,
    taskName = "The Nameless and the Watcher",
    taskDescription = "The Guardian of the Forgotten speaks of an entity that devours names, erasing souls from history. Speak the names of the lost at the ritual site to grant them peace.",
    taskGoals = {
        storages = {
            [1] = { starageName = "Spoke the Names", starageTaskId = Mainquest.spokenames }
        }
    },
    preRequiredStorages = {40075}, -- Must have completed the brazier ritual
    taskGoalCnt = 3,
    taskMinLvl = 15,
    taskRepeat = false,
    taskStorageId = 40077,
    taskStorageCnt = 40078,
    taskRewards = {
        experience = 7500,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 150 },
            [2] = { name = "The Remembered Sigil", itemSid = 9215, itemCnt = 1 } -- Future use
        },
         outfits = {},
    },
    taskZoneName = "Elden Cemetery - The Sealed Crypt",
    taskSource = "The Guardian of the Forgotten",
    taskHint = "Speak the names of the lost to complete the ritual."
},

[36] = {
    taskNumber = 36,
    taskName = "Dream Spores",
    taskDescription = "Dream-Seeker Alran spoke of strange spores drifting through the city, whispering of a forgotten land. Gather a few and see where they lead.",
    taskGoals = {
        items = {
            [1] = {
                name = "Dream Spore",
                itemId = 7251, -- Example item ID for Dream Spore
                itemCnt = 5
            }
        }
    },
    preRequiredStorages = {},
    taskGoalCnt = 10,
    taskMinLvl = 10,
    taskRepeat = false,
    taskStorageId = 40079, -- Quest start
    taskStorageCnt = 40080, -- Quest complete
    taskRewards = {
        experience = 8500,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 100 },
            [2] = { name = "Spore-Linked Talisman", itemSid = 9206, itemCnt = 1 }
        },
        outfits = {}
    },
    taskZoneName = "Sporeveil Outskirts",
    taskSource = "Dream-Seeker Alran",
    taskHint = "Collect spores scattered near the edges of the city and swamplands."
},
[37] = {
    taskNumber = 37,
    taskName = "Echoes Beneath the Swamp",
    taskDescription = "Strange vibrations pulse from the roots below the swamp. Dream-Seeker Alran believes they are echoes of something older. Find and investigate one of the deep-rooted fungal masses underground.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Investigated Fungal Root Cluster",
                starageTaskId = Mainquest.investigateroot
            }
        }
    },
    preRequiredStorages = {40079}, -- Must have completed "Dream Spores"
    taskGoalCnt = 1,
    taskMinLvl = 15,
    taskRepeat = false,
    taskStorageId = 40081, -- Quest start
    taskStorageCnt = 40082, -- Quest complete
    taskRewards = {
        experience = 9500,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 120 }
        },
         outfits = {}
    },
    taskZoneName = "Fungal Tunnels",
    taskSource = "Dream-Seeker Alran",
    taskHint = "Seek out a glowing root cluster deep beneath the marshlands."
},
[38] = {
    taskNumber = 38,
    taskName = "Whispers of the Machine",
    taskDescription = "Deep beneath the swamp, you\'ve uncovered a strange, humming machine entwined in ancient roots. Dream-Seeker Alran believes it may be a remnant of an older civilization. Investigate the device further and report any discoveries.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Investigated the Machine",
                starageTaskId = Mainquest.investigatemachine
            }
        }
    },
    preRequiredStorages = {40081}, -- Must have completed "Echoes Beneath the Swamp"
    taskGoalCnt = 1,
    taskMinLvl = 15,
    taskRepeat = false,
    taskStorageId = 40083, -- Quest start
    taskStorageCnt = 40084, -- Quest complete
    taskRewards = {
        experience = 10000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 150 },
            [2] = { name = "Ancient Circuit Fragment", itemSid = 29742, itemCnt = 1 } -- Example item reward
        },
        outfits = {}
    },
    taskZoneName = "Fungal Tunnels - Lower Depths",
    taskSource = "Dream-Seeker Alran",
    taskHint = "Search the lower tunnels beneath the swamp to uncover the secrets of the ancient machine."
},
[39] = {
    taskNumber = 39,
    taskName = "Fungal Sentinel",
    taskDescription = "While examining the strange machine, Dream-Seeker Alran sensed an unnatural guardian stirring. Defeat the Fungal Sentinel, a monstrous being protecting the roots entwined around the device.",
    taskGoals = {
        monsters = {
            [1] = {
                name = "Fungal Sentinel",
                spriteId = 1101
            }
        }
    },
    preRequiredStorages = {40083},
    taskGoalCnt = 1,
    taskMinLvl = 16,
    taskRepeat = false,
    taskStorageId = 40087,
    taskStorageCnt = 40088,
    taskRewards = {
        experience = 12000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 150 },
            [2] = { name = "Sporeshard Medallion", itemSid = 29743, itemCnt = 1 }
        },
        outfits = {}
    },
    taskZoneName = "Rooted Caverns",
    taskSource = "Dream-Seeker Alran",
    taskHint = "The Fungal Sentinel is said to guard the lower roots beneath the swamp machinery."
},

[40] = {
    taskNumber = 40,
    taskName = "Heart of the Bloom",
    taskDescription = "A second anomaly was found growing near the old tunnels - a creature known as the Bloomheart, drawing energy from the machine\'s core. Destroy it before it spreads spores across the island.",
    taskGoals = {
        monsters = {
            [1] = {
                name = "Bloomheart",
                spriteId = 1102
            }
        }
    },
    preRequiredStorages = {40087},
    taskGoalCnt = 1,
    taskMinLvl = 16,
    taskRepeat = false,
    taskStorageId = 40089,
    taskStorageCnt = 40090,
    taskRewards = {
        experience = 13000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 200 },
            [2] = { name = "Verdant Core Fragment", itemSid = 29744, itemCnt = 1 }
        },
        outfits = {}
    },
    taskZoneName = "Blooming Depths",
    taskSource = "Dream-Seeker Alran",
    taskHint = "Bloomheart resides in the fungal bloom chamber near the heart of the machine\'s energy well."
},
[41] = {
    taskNumber = 41,
    taskName = "Stones of Resonance",
    taskDescription = "A strange pulse emanates from underground tunnels near the western beer shop. Investigate the tunnel system and stabilize the energy from four ancient stones that seem to power a mysterious machine.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Energy Stabilized",
                starageTaskId = Mainquest.stonestabilized
            }
        }
    },
    preRequiredStorages = {40089}, -- Must have completed previous task
    taskGoalCnt = 4, -- Click 4 different stones
    taskMinLvl = 15,
    taskRepeat = false,
    taskStorageId = 40091, -- Task start
    taskStorageCnt = 40092, -- Task completion
    taskRewards = {
        experience = 9500,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 120 }
        },
        outfits = {}
    },
    taskZoneName = "Sporeveil Underground",
    taskSource = "Dream-Seeker Alran",
    taskHint = "Seek out the 4 power stones and stabilize their energy underground."
},
[42] = {
    taskNumber = 42,
    taskName = "Awakening the Sporegate",
    taskDescription = "With the energy of the stones stabilized, Dream-Seeker Alran believes the ancient machine hidden underground is a Sporegate a teleportation construct. Align its core and bring the gate back to life.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Sporegate Core Activated",
                starageTaskId = Mainquest.sporegateactivated
            }
        }
    },
    preRequiredStorages = {40091}, -- Must have completed the previous task
    taskGoalCnt = 1,
    taskMinLvl = 15,
    taskRepeat = false,
    taskStorageId = 40093,
    taskStorageCnt = 40094,
    taskRewards = {
        experience = 10000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 150 }
        },
        outfits = {}
    },
    taskZoneName = "Sporeveil Underground",
    taskSource = "Dream-Seeker Alran",
    taskHint = "Find and activate the Sporegate control mechanism."
},

[43] = {
    taskNumber = 43,
    taskName = "Through the Mycelium Veil",
    taskDescription = "With the Sporegate reactivated, the path to the ancient island of the mycelid beings is open. Step into the portal and begin your journey into the unknown.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Traveled Through the Sporegate",
                starageTaskId = Mainquest.traveledthroughthegate
            }
        }
    },
    preRequiredStorages = {40093}, -- Must have activated the Sporegate
    taskGoalCnt = 1,
    taskMinLvl = 15,
    taskRepeat = false,
    taskStorageId = 40095,
    taskStorageCnt = 40096,
    taskRewards = {
        experience = 11000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 180 }
        },
        outfits = {}
    },
    taskZoneName = "Mycelid Outlands",
    taskSource = "Dream-Seeker Alran",
    taskHint = "Step into the Sporegate and explore what lies beyond."
},
[44] = { -- Next available quest ID
    taskNumber = 44,
    taskName = "Udder Chaos",
    taskDescription = "Milk cows... but some are actually demons in disguise!",
    taskGoals = {
        items = {
            [1] = {
                name = "Demon Milk",
                itemId = 21403 -- Regular egg ID
            }
        }
    },
    
    preRequiredStorages = {}, -- No prerequisites
    taskGoalCnt = 5, -- Milk 10 cows
    taskMinLvl = 1,
    taskRepeat = false,
    taskStorageId = 40097, -- After 40095/40096
    taskStorageCnt = 40098, 
    
    taskRewards = {
        experience = 5000,
        items = {
            [1] = {
                name = "Bucket of Demon Milk",
                itemSid = 2853, -- Bucket ID
                itemCnt = 1
            }
        },
        outfits = {},
    },
    
    taskZoneName = "Funny Farm",
    taskSource = "Farmer Mabel",
    taskHint = "Watch out for cows that growl or have red eyes!"
},


[45] = { -- Next available quest ID
    taskNumber = 45,
    taskName = "Chicken Revolution",
    taskDescription = "Catch rebellious Chickens from the farmville who refuse to lay eggs and demand better working conditions!",
     taskGoals = {
        storages = {
            [1] = {
                starageName = "Chickens Caught",
                starageTaskId = Mainquest.chickenscaught
            }
        }
    },
    
    preRequiredStorages = {}, -- No prerequisites
    taskGoalCnt = 10, -- Collect 8 eggs
    taskMinLvl = 1,
    taskRepeat = false,
    
    -- STORAGE IDs (NEXT AVAILABLE)
    taskStorageId = 40099, -- After 40097/40098
    taskStorageCnt = 40100, 
    
    taskRewards = {
        experience = 8000,
        items = {
            [1] = {
                name = "Chicken Union Membership Card",
                itemSid = 13993, -- Parchment ID
                itemCnt = 1
            },
            [2] = {
                name = "Bag of Organic Feed",
                itemSid = 6541, -- Seed bag ID
                itemCnt = 5
            }
        },
        outfits = {},
    },
    
    taskZoneName = "Free-Range Chicken Coop",
    taskSource = "Farmer Cluckington",
    taskHint = "ask Farmer Cluckington for a broom to hit chickens and catch them safely!"
},
[46] = { -- Next available quest ID
    taskNumber = 46,
    taskName = "Sheepnapped!",
    taskDescription = "Farmer Baaartholomew\'s prize sheep have ‘mysteriously vanished’ (read: staged a jailbreak). Your mission: \'Recruit\' them back—by any means necessary. No questions asked. *Wink*.",
     taskGoals = {
        storages = {
            [1] = {
                starageName = "Sheep \'Persuaded\'",
                starageTaskId = Mainquest.SheepHerding
            }
        }
    },
    
    preRequiredStorages = {}, -- No prerequisites
    taskGoalCnt = 4, -- Collect 8 eggs
    taskMinLvl = 1,
    taskRepeat = false,
    
    -- STORAGE IDs (NEXT AVAILABLE)
    taskStorageId = 40101, -- After 40097/40098
    taskStorageCnt = 40102, 
    
    taskRewards = {
        experience = 8000,
        items = {
            [1] = {
                name = "Chicken Union Membership Card",
                itemSid = 13993, -- Parchment ID
                itemCnt = 1
            },
            [2] = {
                name = "Bag of Organic Feed",
                itemSid = 6541, -- Seed bag ID
                itemCnt = 5
            }
        },
        outfits = {},
    },
    
    taskZoneName = "Mercenary Camp",
    taskSource = "Lucy Steelgard",
    taskHint = "lure and Move Lost sheep inside Mercenary Camp."
},
[47] = { -- Next available quest ID
    taskNumber = 47,
    taskName = "Stand-Up Straw-gger",
    taskDescription = "Phil the scarecrow has decided to abandon his life of agricultural intimidation to pursue his true passion: painfully unfunny comedy. Your mission: Be the world\'s worst laugh track artist. Fake-laugh through at least 5 of his horrific jokes without walking out (or dying of secondhand embarrassment). Warning: Corny puns may cause permanent eye-rolling.",
     taskGoals = {
        storages = {
            [1] = {
                starageName = "Standing Ovations (Mostly Out Of Pity)",
                starageTaskId = Mainquest.philstandup
            }
        }
    },
    
    preRequiredStorages = {}, -- No prerequisites
    taskGoalCnt = 5, -- Collect 8 eggs
    taskMinLvl = 1,
    taskRepeat = false,
    
    -- STORAGE IDs (NEXT AVAILABLE)
    taskStorageId = 40103, -- After 40097/40098
    taskStorageCnt = 40104, 
    
    taskRewards = {
        experience = 8000,
        items = {
            [1] = {
                name = "Chicken Union Membership Card",
                itemSid = 13993, -- Parchment ID
                itemCnt = 1
            },
            [2] = {
                name = "Bag of Organic Feed",
                itemSid = 6541, -- Seed bag ID
                itemCnt = 5
            }
        },
        outfits = {},
    },
    
    taskZoneName = "Free-Range Chicken Coop",
    taskSource = "Chriss - Phil\'s Friend",
    taskHint = "Type \'haha\', \'lol\', or \'laugh\' after each joke - even if it hurts. Phil\'s ego is more fragile than his straw stuffing."
},
[48] = {
    taskNumber = 48,
    taskName = "Steel and Greed",
    taskDescription = "Lucy Steelgard’s dwarven partner, Vornik, went missing while scouting a hog stronghold in the northern mountains. She wants you to find out what happened to him.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Investigated Goblin Hideout",
                starageTaskId = Mainquest.investigatedgoblinhideout
            }
        }
    },
    preRequiredStorages = {}, -- No prerequisites
    taskGoalCnt = 1,
    taskMinLvl = 18,
    taskRepeat = false,
    taskStorageId = 40105, -- Quest start storage
    taskStorageCnt = 40106, -- Completion storage
    taskRewards = {
        experience = 13000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 200 },
            [2] = { name = "Steelgard Token", itemSid = 5806, itemCnt = 1 }
        },
        outfits = {}
    },
    taskZoneName = "Tuskin Mountain - Northern Ridge",
    taskSource = "Lucy Steelgard",
    taskHint = "Search for traces of the goblin stash and signs of Vornik's fate."
},

[49] = {
    taskNumber = 49,
    taskName = "Steelgard's Vengeance",
    taskDescription = "After confirming that hogs ambushed and killed her partner, She founds all vornik money was missing staying uncalmed, Lucy Steelgard has asked you to cull their numbers. Hunt down the hogs infesting the northern ridge.",
    taskGoals = {
        monsters = {
            [1] = {
                name = "Mountain Goblin",
                spriteId = 1321
            },
            [2] = {
                name = "Goblin Bruiser",
                spriteId = 1322
            }
        }
    },
    preRequiredStorages = {40094}, -- Must have completed the investigation
    taskGoalCnt = 30, -- Kill 30 goblins
    taskMinLvl = 18,
    taskRepeat = false,
    taskStorageId = 40107, -- Track progress
    taskStorageCnt = 40108, -- Completion
    taskRewards = {
        experience = 16000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 250 },
            [2] = { name = "Steelgard Axe", itemSid = 2429, itemCnt = 1 }
        },
        outfits = {}
    },
    taskZoneName = "Tuskin Mountain - Northern Ridge",
    taskSource = "Lucy Steelgard",
    taskHint = "Slay any goblins you find in the mountain pass. Lucy wants no survivors."
},
[50] = {
    taskNumber = 50,
    taskName = "Gold for the Bold",
    taskDescription = "Lucy Steelgard believes there's a stash of stolen gold deep in the hog camp, since there are traces goblins are part of this kills. While you're already hunting goblins, she wants you to find and loot their hoarded treasure.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Investigated Goblin Hideout",
                starageTaskId = Mainquest.goblinsgold
            }
        }
    },
    preRequiredStorages = {40096}, -- Must have completed goblin slaying quest
    taskGoalCnt = 2, -- Collect both unique items
    taskMinLvl = 18,
    taskRepeat = false,
    taskStorageId = 40109, -- Progress
    taskStorageCnt = 40110, -- Completion
    taskRewards = {
        experience = 18000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 300 },
            [2] = { name = "Steelgard Emblem", itemSid = 9219, itemCnt = 1 } -- A keepsake
        },
        outfits = {}
    },
    taskZoneName = "Tuskin Mountain - Northern Ridge",
    taskSource = "Lucy Steelgard",
    taskHint = "Search crates, barrels, or goblin bosses for their treasure stash."
},
[51] = {
    taskNumber = 51,
    taskName = "No Throne for Thieves",
    taskDescription = "Lucy Steelgard has learned the name of the goblin boss who commands the gold-hungry camp—Grizzltooth the Coin-Eater. Track him down in his throne room and end his reign.",
    taskGoals = {
        monsters = {
            [1] = {
                name = "Grizzltooth the Coin-Eater",
                spriteId = 1087 -- Adjust sprite ID as needed
            }
        }
    },
    preRequiredStorages = {40098}, -- Must have completed the treasure theft
    taskGoalCnt = 1, -- Kill Grizzltooth
    taskMinLvl = 20,
    taskRepeat = false,
    taskStorageId = 40111, -- Progress
    taskStorageCnt = 40112, -- Completion
    taskRewards = {
        experience = 25000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 400 },
            [2] = { name = "Coin-Eater’s Crown", itemSid = 9240, itemCnt = 1 }
        },
        outfits = {
        }
    },
    taskZoneName = "Tuskin Mountain Cavern",
    taskSource = "Lucy Steelgard",
    taskHint = "Grizzltooth commands the goblins from deep within their northern throne room."
},
[52] = {
    taskNumber = 52,
    taskName = "Whispers in the Sand",
    taskDescription = "After crossing into the vast desert, whispers ride with the sandstorms. Locals claim strange figures have been seen watching from the dunes. Investigate by using the telescope at the upper floors.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Desert Figures Investigated",
                starageTaskId = Mainquest.strangesymbols
            }
        }
    },
    preRequiredStorages = {},
    taskGoalCnt = 1,
    taskMinLvl = 20,
    taskRepeat = false,
    taskStorageId = 40113, -- Progress
    taskStorageCnt = 40114, -- Completion
    taskRewards = {
        experience = 12000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 200 },
            [2] = { name = "Windswept Sandals", itemSid = 9208, itemCnt = 1 }
        },
        outfits = {}
    },
    taskZoneName = "Scorched Dunes",
    taskSource = "Desert Scout Nahim",
    taskHint = "look at the distance using the telescope at the upper floors."
},
[53] = {
    taskNumber = 53,
    taskName = "Marks in the Dust",
    taskDescription = "After investigating the dunes, you found a distant fortress with some symbols. Desert Scout Nahim wants you to decipher the patterns and symbol found near the fortress.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Study strange symbols",
                starageTaskId = Mainquest.studytrolls
            }
        }
    },
    preRequiredStorages = {40113}, -- Must have completed "Whispers in the Sand"
    taskGoalCnt = 1,
    taskMinLvl = 20,
    taskRepeat = false,
    taskStorageId = 40115, -- Progress
    taskStorageCnt = 40116, -- Completion
    taskRewards = {
        experience = 14000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 250 },
            [2] = { name = "Sandruned Scarf", itemSid = 9210, itemCnt = 1 }
        },
        outfits = {}
    },
    taskZoneName = "Ancient Pillars - Scorched Dunes",
    taskSource = "Desert Scout Nahim",
    taskHint = "Study the symbols using ancient knowledge books from the library room nearby."
},
[54] = {
    taskNumber = 54,
    taskName = "The Hermit's Warning",
    taskDescription = "A reclusive hermit is said to dwell in a mountain riddled with wyrms. Locals whisper he’s mad—but his visions of a nameless hunger match the shifting signs. Reach the hermit and hear his warning.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Spoken with the Hermit",
                starageTaskId = Mainquest.hermitwarning
            }
        }
    },
    preRequiredStorages = {40115}, -- Must have completed "Marks in the Dust"
    taskGoalCnt = 1,
    taskMinLvl = 20,
    taskRepeat = false,
    taskStorageId = 40117, -- Progress
    taskStorageCnt = 40118, -- Completion
    taskRewards = {
        experience = 16000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 250 },
            [2] = { name = "Desert Cloak", itemSid = 9211, itemCnt = 1 }
        },
        outfits = {}
    },
    taskZoneName = "Wyrmfang Mountain",
    taskSource = "Desert Scout Nahim",
    taskHint = "Climb Wyrmfang Mountain and find the hermit’s cave. Be wary—the wyrms do not sleep."
},
[55] = {
    taskNumber = 55,
    taskName = "Burrowed Threats",
    taskDescription = "The Hermit of Wyrmfang claims the wyrms have grown restless, disturbed by something beneath the sands. Investigate the tunnels northeast of the Hermit's cave and defeat any Wyrms you find.",
    taskGoals = {
        monsters = {
            [1] = {
                name = "Furious Wyrm",
                spriteId = 1101
            }
        }
    },
    preRequiredStorages = {40117}, -- Must have completed Hermit's Warning
    taskGoalCnt = 35, -- Kill 5 Desert Wyrms
    taskMinLvl = 20,
    taskRepeat = false,
    taskStorageId = 40119, -- Progress
    taskStorageCnt = 40120, -- Completion
    taskRewards = {
        experience = 15000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 250 },
            [2] = { name = "Wyrmfang Cloak", itemSid = 9211, itemCnt = 1 }
        },
        outfits = {}
    },
    taskZoneName = "Wyrmfang Mountain",
    taskSource = "Hermit of Wyrmfang",
    taskHint = "Search the eastern tunnels of the Wyrmfang caves and cull the wyrms that dwell within."
},
[56] = {
    taskNumber = 56,
    taskName = "Echoes of the War Drums",
    taskDescription = "The Hermit of Wyrmfang has heard distant war drums echoing from the eastern cliffs. War trolls may be preparing for something. Find what it's happening.",
    taskGoals = {
        storages = {
            [1] = { starageName = "Tribe Opinions Collected", starageTaskId = Mainquest.speakrukk }
        }
    },
    preRequiredStorages = {40119}, -- Must have completed Burrowed Threats
    taskGoalCnt = 1, -- Kill 6 War Trolls
    taskMinLvl = 21,
    taskRepeat = false,
    taskStorageId = 40121, -- Progress
    taskStorageCnt = 40122, -- Completion
    taskRewards = {
        experience = 18000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 300 },
            [2] = { name = "Drumbeater's Charm", itemSid = 9212, itemCnt = 1 }
        },
        outfits = {}
    },
    taskZoneName = "Troll Highlands",
    taskSource = "Hermit of Wyrmfang",
    taskHint = "Follow the echoes past of the Wyrmfang mountain. The trolls grow bold—stop them."
},

[57] = {
    taskNumber = 57,
    taskName = "Voices of Rebellion",
    taskDescription = "A troll named Rukk claims Gor'mhaz the Old has ruled too long. He believes the time for change is now and asks you to speak with members of the tribe about their thoughts.",
    taskGoals = {
        storages = {
            [1] = { starageName = "morga and ghraz opinions", starageTaskId = Mainquest.rukksupport }
        }
    },
    preRequiredStorages = {},
    taskGoalCnt = 2,
    taskMinLvl = 21,
    taskRepeat = false,
    taskStorageId = 40123,
    taskStorageCnt = 40124,
    taskRewards = {
        experience = 10000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 150 }
        },
        outfits = {}
    },
    taskZoneName = "Troll Highlands",
    taskSource = "Rukk Stonegaze",
    taskHint = "Talk to tribe members across the troll encampment. Not everyone trusts Rukk."
},

[58] = {
    taskNumber = 58,
    taskName = "End the Right",
    taskDescription = "The troll clans are stirring with unrest. Before confronting Gor'mhaz the Old, their entrenched leader, you must deal with his most trusted enforcer, Gruma Stormash. As his right hand, she quells dissent and silences rebellion. Removing her will destabilize his control and open a path to the throne.",
    taskGoals = {
        monsters = {
            [1] = {
                name = "Gruma Stormash",
                spriteId = 1125 -- Adjust sprite ID as needed
            }
        }
    },
    preRequiredStorages = {40123}, -- Must have completed "Echoes of the War Drums"
    taskGoalCnt = 1, -- Kill Gor'mhaz
    taskMinLvl = 21,
    taskRepeat = false,
    taskStorageId = 40125, -- Progress
    taskStorageCnt = 40126, -- Completion
    taskRewards = {
        experience = 28000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 350 },
            [2] = { name = "Trollbone Chestplate", itemSid = 9214, itemCnt = 1 }
        },
        outfits = {}
    },
    taskZoneName = "Troll Fortress",
    taskSource = "Rukk Stonegaze",
    taskHint = "Gor'mhaz hides himself, kill his People to force him out."
},

[59] = {
    taskNumber = 59,
    taskName = "Ashes of Tradition",
    taskDescription = "Rukk wants you to destroy the totems that bind the trolls to Gor'mhaz's leadership. Find and use the three ancestral totem relics scattered around the fortress.",
    taskGoals = {
        storages = {
            [1] = { starageName = "totems Destroyed", starageTaskId = Mainquest.relicsbroken }
        }
    },
    preRequiredStorages = {40125},
    taskGoalCnt = 3,
    taskMinLvl = 21,
    taskRepeat = false,
    taskStorageId = 40127,
    taskStorageCnt = 40128,
    taskRewards = {
        experience = 14000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 180 }
        },
        outfits = {}
    },
    taskZoneName = "Troll Fortress",
    taskSource = "Rukk Stonegaze",
    taskHint = "Relics glow faintly near sacred troll grounds."
},

[60] = {
    taskNumber = 60,
    taskName = "End the Old",
    taskDescription = "Rukk demands the death of Gor'mhaz the Old. Track down the elder troll and slay him in the name of change.",
    taskGoals = {
        monsters = {
            [1] = { name = "Gor'mhaz the Old", spriteId = 1112 }
        }
    },
    preRequiredStorages = {40127},
    taskGoalCnt = 1,
    taskMinLvl = 21,
    taskRepeat = false,
    taskStorageId = 40129,
    taskStorageCnt = 40130,
    taskRewards = {
        experience = 18000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 220 }
        },
        outfits = {}
    },
    taskZoneName = "Troll Fortress",
    taskSource = "Rukk Stonegaze",
    taskHint = "kill Gor'mhaz people to force him out."
},

[61] = {
    taskNumber = 61,
    taskName = "The Cracks Beneath",
    taskDescription = "You found strange markings and residual magic under the troll encampment. Investigate the bodies with residual magic for clues to what Rukk is really up to.",
    taskGoals = {
        storages = {
            [1] = { starageName = "Residual Magic Investigated", starageTaskId = Mainquest.residualmagic }
        }
    },
    preRequiredStorages = {40129},
    taskGoalCnt = 4,
    taskMinLvl = 22,
    taskRepeat = false,
    taskStorageId = 40131,
    taskStorageCnt = 40132,
    taskRewards = {
        experience = 12000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 180 }
        },
        outfits = {}
    },
    taskZoneName = "Troll Highlands",
    taskSource = "Spirit of Vengeance",
    taskHint = "Inspect the circle and fallen bodies. Rukk's truth is etched in shadow."
},

[62] = {
    taskNumber = 62,
    taskName = "The Ritual of the Unwritten",
    taskDescription = "You've uncovered Rukk's true allegiance. He serves The Unwritten and plans to take Gor'mhaz body with him. Defeat him before the name of Gor'mhaz is lost forever.",
    taskGoals = {
        monsters = {
            [1] = { name = "Rukk Stonegaze", spriteId = 1113 }
        }
    },
    preRequiredStorages = {40131},
    taskGoalCnt = 1,
    taskMinLvl = 22,
    taskRepeat = false,
    taskStorageId = 40133,
    taskStorageCnt = 40134,
    taskRewards = {
        experience = 30000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 400 },
            [2] = { name = "Rukk's Shattered Sigil", itemSid = 9260, itemCnt = 1 }
        },
        outfits = {}
    },
    taskZoneName = "Unwritten Sanctum",
    taskSource = "Gor'mhaz Spirit",
    taskHint = "Confront Rukk at the altar before the ritual completes."
},
[63] = {
    taskNumber = 63,
    taskName = "Through Dust and Thirst",
    taskDescription = "Najim, a lookout stationed south of the western oasis, has warned you of the dangers in the desert. He insists you reach the oasis and speak with Draya the Waterkeeper.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Reached the Western Oasis",
                starageTaskId = Mainquest.reachdrayaoasis
            }
        }
    },
    preRequiredStorages = {},
    taskGoalCnt = 1,
    taskMinLvl = 10,
    taskRepeat = false,
    taskStorageId = 40135, -- Progress
    taskStorageCnt = 40136, -- Completion
    taskRewards = {
        experience = 1500,
        items = {
            [1] = { name = "water flask", itemSid = 7492, itemCnt = 1 },
            [2] = { name = "desert boots", itemSid = 2640, itemCnt = 1 }
        },
        outfits = {}
    },
    taskZoneName = "Western Oasis",
    taskSource = "Salim the Lookout",
    taskHint = "Follow the trail northwest from Salim’s outpost. The oasis is marked by palm trees and a stone archway."
},
[64] = {
    taskNumber = 64,
    taskName = "Oasis Trouble",
    taskDescription = "Draya the Waterkeeper is concerned about unusual disturbances in the oasis pools. Investigate what’s tainting the water.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Investigated the Oasis Pools",
                starageTaskId = 40138
            }
        }
    },
    preRequiredStorages = {40135},
    taskGoalCnt = 1,
    taskMinLvl = 10,
    taskRepeat = false,
    taskStorageId = 40137, -- Progress
    taskStorageCnt = 40138, -- Completion
    taskRewards = {
        experience = 2000,
        items = {
            [1] = { name = "small emerald", itemSid = 3031, itemCnt = 1 }
        },
        outfits = {}
    },
    taskZoneName = "Western Oasis",
    taskSource = "Draya the Waterkeeper",
    taskHint = "The disturbances seem to originate from the northernmost pool."
},
[65] = {
    taskNumber = 65,
    taskName = "Camels Gone Wild",
    taskDescription = "Camels have gone wild and are disrupting the oasis. Draya has asked you to lure them into the stable before someone gets hurt.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Lured Camels",
                starageTaskId = Mainquest.luredcamels
            }
        }
    },
    preRequiredStorages = {40137},
    taskGoalCnt = 3,
    taskMinLvl = 10,
    taskRepeat = false,
    taskStorageId = 40139, -- Progress
    taskStorageCnt = 40140, -- Completion
    taskRewards = {
        experience = 2500,
        items = {
            [1] = { name = "bundle of dates", itemSid = 3582, itemCnt = 5 }
        },
        outfits = {}
    },
    taskZoneName = "Western Oasis",
    taskSource = "Draya the Waterkeeper",
    taskHint = "The camels love honeycombs."
},
[66] = {
    taskNumber = 66,
    taskName = "Purifying the Oasis", --collect luminous pearls to cleanse the waters  
taskDescription = "The oasis waters have grown murky, and the local murlocs hoard luminous pearls with purifying properties. Slay the creatures and retrieve their pearls to restore the oasis to its former clarity.", 
    taskGoals = {
       items = {
             [1] = {
                    name = "luminous pearl",
                    itemId = 7632
                }
            },
    },
    preRequiredStorages = {40139},
    taskGoalCnt = 10,
    taskMinLvl = 12,
    taskRepeat = false,
    taskStorageId = 40141, -- Progress
    taskStorageCnt = 40142, -- Completion
    taskRewards = {
        experience = 3000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 80 },
            [2] = { name = "pearl", itemSid = 3026, itemCnt = 1 }
        },
        outfits = {}
    },
    taskZoneName = "Western Oasis",
    taskSource = "Draya the Waterkeeper",
    taskHint = "Check the eastern banks of the oasis during or after a sandstorm."
},
[67] = {
    taskNumber = 67,
    taskName = "The Great Oasis Brew-Off",
    taskDescription = "Draya wants to win the annual oasis brew-off. She needs rare desert ingredients gathered quickly before sundown.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Brew Ingredients Collected",
                starageTaskId = 40144
            }
        }
    },
    preRequiredStorages = {40141},
    taskGoalCnt = 1,
    taskMinLvl = 12,
    taskRepeat = false,
    taskStorageId = 40143, -- Progress
    taskStorageCnt = 40144, -- Completion
    taskRewards = {
        experience = 3500,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 100 },
            [2] = { name = "Draya’s Secret Brew", itemSid = 7491, itemCnt = 1 }
        },
        outfits = {}
    },
    taskZoneName = "Western Oasis",
    taskSource = "Draya the Waterkeeper",
    taskHint = "Search the dunes and oasis edges for rare herbs and ingredients."
},
[68] = {
    taskNumber = 68,
    taskName = "Ashes on the Wind",
    taskDescription = "Fires have begun spreading near the oasis. Draya believes desert draptors nesting near the burning cliffs are responsible. Thin their numbers before the oasis goes up in smoke.",
    taskGoals = {
        monsters = {                             
                [1] = {
                    name = "Desert Draptor",
                    spriteId = 1525
                },
            },
    },
    preRequiredStorages = {40141},
    taskGoalCnt = 1,
    taskMinLvl = 13,
    taskRepeat = false,
    taskStorageId = 40145, -- Progress
    taskStorageCnt = 40146, -- Completion
    taskRewards = {
        experience = 4000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 110 },
            [2] = { name = "draptor scale", itemSid = 9025, itemCnt = 1 }
        },
        outfits = {}
    },
    taskZoneName = "Burning Cliffs",
    taskSource = "Draya the Waterkeeper",
    taskHint = "Hunt desert draptors near the scorched cliffs west of the oasis."
},

[69] = {
    taskNumber = 69,
    taskName = "Whispers Beneath the Sand",
    taskDescription = "Kelro the Pale sent you into the old catacombs to retrieve a crate left behind by a missing smuggler. Be wary—strange echoes are said to haunt those tunnels.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Show sealed bone crate to kelro",
                starageTaskId = Mainquest.kelrocrate
            }
        }
    },
    preRequiredStorages = {},
    taskGoalCnt = 1,
    taskMinLvl = 14,
    taskRepeat = false,
    taskStorageId = 40147, -- Progress
    taskStorageCnt = 40148, -- Completion
    taskRewards = {
        experience = 4500,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 120 },
            [2] = { name = "cursed silver dagger", itemSid = 7745, itemCnt = 1 }
        },
        outfits = {}
    },
    taskZoneName = "Sunken Catacombs",
    taskSource = "Kelro the Pale",
    taskHint = "Search the lowest levels of the western catacombs. The crate may still be near a collapsed hallway."
},
[70] = {
    taskNumber = 70,
    taskName = "Call to Arms",
    taskDescription = "With the ogres pressing from the southern slopes, the mountain town must prepare. Help recruit local fighters and brave souls to bolster the town's defenses.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Soldiers Recruited",
                starageTaskId = Mainquest.soldiersrecruited
            }
        }
    },
    preRequiredStorages = {},
    taskGoalCnt = 6,
    taskMinLvl = 12,
    taskRepeat = false,
    taskStorageId = 40149, -- Progress
    taskStorageCnt = 40150, -- Completion
    taskRewards = {
        experience = 5000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 100 },
            [2] = { name = "recruiter's badge", itemSid = 9230, itemCnt = 1 }
        },
        outfits = {}
    },
    taskZoneName = "Southern Watchpost",
    taskSource = "Dastan",
    taskHint = "Visit nearby camps and ask for volunteers willing to fight for the mountain."
},
[71] = {
    taskNumber = 71,
    taskName = "Forging the Line",
    taskDescription = "The blacksmiths are in dire need of metal to forge weapons and armor for the upcoming siege. Collect enough ogre iron chunks from the nearby ogre camps and deliver them to the smithy in Stonewatch.",
    taskGoals = {
        items = {
            [1] = {
                name = "Ogre Iron Chunk",
                itemId = 8301,
                itemCnt = 8
            }
        }
    },
    preRequiredStorages = {40149}, -- Must have completed "Call to Arms"
    taskGoalCnt = 1,
    taskMinLvl = 14,
    taskRepeat = false,
    taskStorageId = 40151, -- Progress
    taskStorageCnt = 40152, -- Completion
    taskRewards = {
        experience = 4500,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 120 }
        },
        outfits = {}
    },
    taskZoneName = "Stonewatch - Ogre Foothills",
    taskSource = "Dastan",
    taskHint = "Ogre iron is heavy, but necessary. Search the ogre camps and return what you can." 
},
[72] = {
    taskNumber = 72,
    taskName = "Timber for the Wall",
    taskDescription = "With enemy forces preparing to strike, the mountain town needs strong wooden reinforcements. Help gather logs from the northern forest and bring them to the outpost's quartermaster.",
    taskGoals = {
        items = {
            [1] = {
                name = "sturdy log",
                itemId = 9053,
                itemCnt = 20
            }
        }
    },
    preRequiredStorages = {40149}, -- Must have completed Forging the Line
    taskGoalCnt = 1,
    taskMinLvl = 15,
    taskRepeat = false,
    taskStorageId = 40153, -- Progress
    taskStorageCnt = 40154, -- Completion
    taskRewards = {
        experience = 6500,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 100 },
            [2] = { name = "oak shield", itemSid = 2532, itemCnt = 1 }
        },
        outfits = {}
    },
    taskZoneName = "Mountain Outpost",
    taskSource = "Dastan",
    taskHint = "Find sturdy logs near the tree line west of the mountain base. Avoid patrols—they've started targeting supply gatherers."
},
[73] = {
    taskNumber = 73,
    taskName = "Honor the Fallen",
    taskDescription = "Some soldiers were taken during the first wave and executed beyond our walls. Only their bones remain, displayed as trophies in cages by the ogres. Retrieve them and return dignity to the fallen.",
    taskGoals = {
      

      storages = {
            [1] = {
                starageName = "Remains of a Soldier",
                starageTaskId = Mainquest.soldierremains
            }
        }
    },
    preRequiredStorages = {40149}, -- Must have completed "Siege Supply: Fresh Fish"
    taskGoalCnt = 6, -- Collect both items
    taskMinLvl = 20,
    taskRepeat = false,
    taskStorageId = 40155, -- Progress
    taskStorageCnt = 40156, -- Completion
    taskRewards = {
        experience = 8000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 150 },
            [2] = { name = "soldier's badge", itemSid = 9820, itemCnt = 1 } -- Symbolic item
        },
        outfits = {}
    },
    taskZoneName = "Southern Ogre Encampment",
    taskSource = "Dastan",
    taskHint = "Search the ogre side of the battlefield for bone piles and discarded gear."
},
[74] = {
    taskNumber = 74,
    taskName = "Blades in the Night",
    taskDescription = "Commander Eldri believes a saboteur walks among your recruited soldiers. Investigate signs of sabotage and uncover the traitor before it's too late.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Sabotage Marks Discovered",
                starageTaskId = Mainquest.trapsfound
            }
        }
    },
    preRequiredStorages = {}, -- Must have completed "The Fallen Bones"
    taskGoalCnt = 4,
    taskMinLvl = 18,
    taskRepeat = false,
    taskStorageId = 40157,
    taskStorageCnt = 40158,
    taskRewards = {
        experience = 18000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 350 },
            [2] = { name = "steel shield", itemSid = 2509, itemCnt = 1 }
        },
        outfits = {}
    },
    taskZoneName = "Southern Stronghold",
    taskSource = "Commander Eldri",
    taskHint = "Search near camp supplies, the buildings, and the upper road wich leads to the ogre camp for marks of sabotage."
},
[75] = {
    taskNumber = 75,
    taskName = "The Last Roar of Khurzug",
    taskDescription = "Commander Eldri believes the only way to end the siege is to eliminate the ogres' leader, Khurzug the Warhowler. Venture into their lair and put an end to his tyranny.",
    taskGoals = {
        monsters = {
            [1] = {
                name = "Khurzug the Warhowler",
                spriteId = 1094 -- Adjust sprite ID if needed
            }
        }
    },
    preRequiredStorages = {40157}, -- Must have completed "Blades in the Night"
    taskGoalCnt = 1, -- Kill the boss
    taskMinLvl = 24,
    taskRepeat = false,
    taskStorageId = 40159, -- Progress
    taskStorageCnt = 40160, -- Completion
    taskRewards = {
        experience = 35000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 500 },
            [2] = { name = "Khurzug’s Warbanner", itemSid = 9252, itemCnt = 1 }
        },
        outfits = {}
    },
    taskZoneName = "Dungeon",
    taskSource = "Commander Eldri",
    taskHint = "Khurzug’s throne lies deep in the heart of the ogre stronghold to the south. Be prepared for a brutal fight."
},
[76] = {
    taskNumber = 76,
    taskName = "First Impressions at Deadfin",
    taskDescription = "The pirate haven of Deadfin Port is not kind to strangers. To survive, you'll need to earn the trust—or at least the tolerance—of its rowdy denizens. Build your reputation until you are recognized as a friend, not a fool.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Reached Friendly Status with Deadfin Port",
                starageTaskId = Mainquest.reachedFriendlyDeadfin
            }
        }
    },
    preRequiredStorages = {}, -- No prereqs
    taskGoalCnt = 1,
    taskMinLvl = 20,
    taskRepeat = false,
    taskStorageId = 40161, -- Progress
    taskStorageCnt = 40162, -- Completion
    taskRewards = {
        experience = 20000,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 300 },
            [2] = { name = "pirate bandana", itemSid = 6091, itemCnt = 1 }
        },
        outfits = {}
    },
    taskZoneName = "Deadfin Port",
    taskSource = "City Reputation Board",
    taskHint = "Perform tasks, favors, or dirty deeds around Deadfin Port to build enough reputation to be considered a local."
}











}


