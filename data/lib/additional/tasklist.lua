
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
                name = "Lucella, the Weaving Dread",
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
                starageName = "Entered Eldenmere's Fog",
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
    taskHint = "Seek out Edwin’s gravestone in the northern part of Elden Cemetery."
},
[32] = {
    taskNumber = 32,
    taskName = "Echoes of the Forgotten: Seraphine",
    taskDescription = "The second whisper calls to you. Seek out the gravestone of Seraphine the Silent in Elden Cemetery.",
    taskGoals = {
        storages = {
            [1] = { starageName = "Found Seraphine's Name", starageTaskId = Mainquest.nameseraphine }
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
            [1] = { starageName = "Found Marek's Name", starageTaskId = Mainquest.namemarek }
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
    taskHint = "Seek out Marek’s gravestone in the eastern part of Elden Cemetery."
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
    taskHint = "Channel energy into the spectral braziers while surviving Marek’s fury."
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
    taskGoalCnt = 1,
    taskMinLvl = 15,
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
    preRequiredStorages = {40080}, -- Must have completed "Dream Spores"
    taskGoalCnt = 1,
    taskMinLvl = 15,
    taskRepeat = false,
    taskStorageId = 40081, -- Quest start
    taskStorageCnt = 40082, -- Quest complete
    taskRewards = {
        experience = 9500,
        items = {
            [1] = { name = "gold coin", itemSid = 2148, itemCnt = 120 }
        }
         outfits = {}
    },
    taskZoneName = "Fungal Tunnels",
    taskSource = "Dream-Seeker Alran",
    taskHint = "Seek out a glowing root cluster deep beneath the marshlands."
},
[38] = {
    taskNumber = 38,
    taskName = "Whispers of the Machine",
    taskDescription = "Deep beneath the swamp, you've uncovered a strange, humming machine entwined in ancient roots. Dream-Seeker Alran believes it may be a remnant of an older civilization. Investigate the device further and report any discoveries.",
    taskGoals = {
        storages = {
            [1] = {
                starageName = "Investigated the Machine",
                starageTaskId = Mainquest.investigatemachine
            }
        }
    },
    preRequiredStorages = {40083}, -- Must have completed "Echoes Beneath the Swamp"
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
        }
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
    preRequiredStorages = {40086},
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
    taskDescription = "A second anomaly was found growing near the old tunnels — a creature known as the Bloomheart, drawing energy from the machine's core. Destroy it before it spreads spores across the island.",
    taskGoals = {
        monsters = {
            [1] = {
                name = "Bloomheart",
                spriteId = 1102
            }
        }
    },
    preRequiredStorages = {40088},
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
    taskHint = "Bloomheart resides in the fungal bloom chamber near the heart of the machine's energy well."
}




}


