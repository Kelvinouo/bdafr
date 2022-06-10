-- bedwars item meta

local v12 = {
    ["wood_pickaxe"] = {
        ["firstPerson"] = {
            ["verticalOffset"] = -0.8,
        },
        ["image"] = "rbxassetid://6875481046",
        ["breakBlock"] = {
            ["stone"] = 5,
        },
        ["displayName"] = "Wood Pickaxe",
    },
    ["fishing_rod"] = {
        ["image"] = "rbxassetid://7807308581",
        ["firstPerson"] = {
            ["verticalOffset"] = -1,
        },
        ["projectileSource"] = {
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://7806060976",
            },
            ["fireDelaySec"] = 0,
        },
        ["kitItem"] = true,
        ["displayName"] = "Fishing Rod",
    },
    ["fake_bed"] = {
        ["image"] = "rbxassetid://7911164143",
        ["block"] = {
            ["breakType"] = "wood",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["blastProof"] = true,
            ["disableInventoryPickup"] = true,
            ["seeThrough"] = true,
            ["health"] = 18,
        },
        ["displayName"] = "Fake Bed",
    },
    ["portal_gun"] = {
        ["image"] = "rbxassetid://9378655884",
        ["projectileSource"] = {
            ["thirdPerson"] = {
                ["fireAnimation"] = 138,
                ["aimAnimation"] = 137,
            },
            ["projectileType"] = function projectileType() end,
            ["activeReload"] = true,
            ["fireDelaySec"] = 3,
        },
        ["displayName"] = "Portal Gun",
    },
    ["clay_dark_green"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 13,
                    ["blockId"] = 159,
                },
                [2] = {
                    ["blockData"] = 1,
                    ["blockId"] = 18,
                },
            },
            ["health"] = 8,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7844417777",
                    [2] = "rbxassetid://7844417777",
                    [3] = "rbxassetid://7844417777",
                    [4] = "rbxassetid://7844417777",
                    [5] = "rbxassetid://7844417777",
                    [6] = "rbxassetid://7844417777",
                },
            },
        },
        ["image"] = "rbxassetid://7884367424",
        ["displayName"] = "Dark Green Clay",
    },
    ["speed_boots"] = {
        ["armor"] = {
            ["damageReductionMultiplier"] = 0.08,
            ["slot"] = 2,
        },
        ["image"] = "rbxassetid://7911163144",
        ["displayName"] = "Speed Boots",
    },
    ["duck_spawn_egg"] = {
        ["image"] = "rbxassetid://8732031366",
        ["consumable"] = {
            ["soundOverride"] = "None",
            ["consumeTime"] = 0.1,
            ["disableAnimation"] = true,
            ["cancelOnDamage"] = true,
        },
        ["displayName"] = "Spawn Egg",
    },
    ["watering_can"] = {
        ["image"] = "rbxassetid://6915423754",
        ["displayName"] = "Watering Can",
    },
    ["wood_plank_spruce"] = {
        ["footstepSound"] = 2,
        ["block"] = {
            ["breakType"] = "wood",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 1,
                    ["blockId"] = 5,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7884373345",
                    [2] = "rbxassetid://7884373345",
                    [3] = "rbxassetid://7884373345",
                    [4] = "rbxassetid://7884373345",
                    [5] = "rbxassetid://7884373345",
                    [6] = "rbxassetid://7884373345",
                },
            },
            ["health"] = 30,
        },
        ["image"] = "rbxassetid://7884373190",
        ["displayName"] = "Spruce Wood Plank",
    },
    ["paint_shotgun"] = {
        ["image"] = "rbxassetid://9135902677",
        ["firstPerson"] = {
            ["holdAnimation"] = 122,
        },
        ["displayName"] = "Paint Blaster",
    },
    ["boba_pearl"] = {
        ["image"] = "rbxassetid://9194313932",
        ["hotbarFillRight"] = true,
        ["displayName"] = "Boba Pearl",
    },
    ["telepearl"] = {
        ["projectileSource"] = {
            ["fireDelaySec"] = 0.15,
            ["maxStrengthChargeSec"] = 0.25,
            ["ammoItemTypes"] = {
                [1] = "telepearl",
            },
            ["minStrengthScalar"] = 0.7692307692307692,
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://6866223756",
            },
            ["firstPerson"] = {
                ["fireAnimation"] = 6,
            },
        },
        ["image"] = "rbxassetid://6874950144",
        ["displayName"] = "Telepearl",
    },
    ["wool_blue"] = {
        ["footstepSound"] = 3,
        ["block"] = {
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7884373711",
                    [2] = "rbxassetid://7884373711",
                    [3] = "rbxassetid://7884373711",
                    [4] = "rbxassetid://7884373711",
                    [5] = "rbxassetid://7884373711",
                    [6] = "rbxassetid://7884373711",
                },
            },
            ["breakType"] = "wool",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function breakSound() end,
            ["health"] = 10,
            ["blastResistance"] = 0.8,
            ["wool"] = true,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 11,
                    ["blockId"] = 35,
                },
                [2] = {
                    ["blockData"] = 3,
                    ["blockId"] = 35,
                },
            },
        },
        ["image"] = "rbxassetid://7923577182",
        ["displayName"] = "Blue Wool",
    },
    ["emerald_dao"] = {
        ["image"] = "rbxassetid://8665071630",
        ["daoSword"] = {
            ["armorMultiplier"] = 0.7,
            ["dashDamage"] = 33.6,
        },
        ["firstPerson"] = {
            ["scale"] = 0.8,
            ["verticalOffset"] = -1.2,
        },
        ["skins"] = {
            [1] = "tiger",
        },
        ["sword"] = {
            ["daoDash"] = true,
            ["attackSpeed"] = 0.3,
            ["damage"] = 55,
        },
        ["kitItem"] = true,
        ["displayName"] = "Emerald Dao",
    },
    ["vending_machine"] = {
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function breakSound() end,
            ["collectionServiceTags"] = {
                [1] = "VendingMachine",
            },
            ["seeThrough"] = true,
            ["health"] = 20,
        },
        ["displayName"] = "Vending Machine",
    },
    ["melon_seeds"] = {
        ["image"] = "rbxassetid://6956387796",
        ["placesBlock"] = {
            ["blockType"] = "melon",
        },
        ["displayName"] = "Melon Seeds",
    },
    ["purple_lucky_block"] = {
        ["block"] = {
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://8105570571",
                    [2] = "rbxassetid://8105570571",
                    [3] = "rbxassetid://8105570571",
                    [4] = "rbxassetid://8105570571",
                    [5] = "rbxassetid://8105570571",
                    [6] = "rbxassetid://8105570571",
                },
            },
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function breakSound() end,
            ["blastProof"] = true,
            ["disableInventoryPickup"] = true,
            ["luckyBlock"] = {
                ["rarity"] = 500,
            },
            ["health"] = 30,
        },
        ["image"] = "rbxassetid://8105570365",
        ["displayName"] = "Purple Lucky Block",
    },
    ["apple"] = {
        ["skins"] = {
            [1] = "spirit",
        },
        ["image"] = "rbxassetid://6985765179",
        ["consumable"] = {
            ["requiresMissingHealth"] = true,
            ["consumeTime"] = 0.1,
        },
        ["displayName"] = "Health Apple",
    },
    ["magma_block"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["placeSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockId"] = 213,
                },
            },
            ["blastProof"] = true,
            ["breakType"] = "stone",
            ["health"] = 10,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://9439108691",
                    [2] = "rbxassetid://9439108691",
                    [3] = "rbxassetid://9439108691",
                    [4] = "rbxassetid://9439108691",
                    [5] = "rbxassetid://9439108691",
                    [6] = "rbxassetid://9439108691",
                },
            },
            ["collectionServiceTags"] = {
                [1] = "MagmaBlock",
            },
            ["breakSound"] = function () end,
            ["breakableOnlyByHosts"] = true,
        },
        ["image"] = "rbxassetid://9439108582",
        ["displayName"] = "Magma Block",
    },
    ["iron_dao"] = {
        ["image"] = "rbxassetid://8665071395",
        ["daoSword"] = {
            ["armorMultiplier"] = 0.8,
            ["dashDamage"] = 25.2,
        },
        ["firstPerson"] = {
            ["scale"] = 0.8,
            ["verticalOffset"] = -1.2,
        },
        ["skins"] = {
            [1] = "tiger",
        },
        ["sword"] = {
            ["daoDash"] = true,
            ["attackSpeed"] = 0.3,
            ["damage"] = 30,
        },
        ["kitItem"] = true,
        ["displayName"] = "Iron Dao",
    },
    ["void_chestplate"] = {
        ["armor"] = {
            ["damageReductionMultiplier"] = 0.36,
            ["slot"] = 1,
        },
        ["image"] = "rbxassetid://9866786852",
        ["displayName"] = "Void Chestplate",
    },
    ["double_edge_sword"] = {
        ["firstPerson"] = {
            ["scale"] = 0.8,
            ["verticalOffset"] = -1.2,
        },
        ["image"] = "rbxassetid://8995895533",
        ["sword"] = {
            ["attackSpeed"] = 0.3,
            ["damage"] = 35,
        },
        ["displayName"] = "Double Edge Sword",
    },
    ["large_rock"] = {
        ["image"] = "rbxassetid://7681398025",
        ["projectileSource"] = {
            ["fireDelaySec"] = 0.4,
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://6866062104",
            },
            ["ammoItemTypes"] = {
                [1] = "large_rock",
            },
        },
        ["displayName"] = "Large Rock (Very)",
    },
    ["tactical_crossbow"] = {
        ["image"] = "rbxassetid://7051149016",
        ["kitItem"] = true,
        ["projectileSource"] = {
            ["fireDelaySec"] = 1.15,
            ["projectileType"] = function projectileType() end,
            ["hitSounds"] = {
                [1] = {
                    [1] = "rbxassetid://6866062188",
                },
            },
            ["reload"] = {
                ["reloadSound"] = {
                    [1] = "rbxassetid://6869254094",
                },
            },
            ["ammoItemTypes"] = {
                [1] = "firework_arrow",
                [2] = "arrow",
            },
            ["walkSpeedMultiplier"] = 0.35,
            ["thirdPerson"] = {
                ["fireAnimation"] = 117,
                ["aimAnimation"] = 116,
            },
            ["launchSound"] = {
                [1] = "rbxassetid://6866062104",
            },
            ["firstPerson"] = {
                ["fireAnimation"] = 9,
                ["aimAnimation"] = 8,
            },
        },
        ["displayName"] = "Tactical Crossbow",
    },
    ["wool_yellow"] = {
        ["footstepSound"] = 3,
        ["block"] = {
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7923579645",
                    [2] = "rbxassetid://7923579645",
                    [3] = "rbxassetid://7923579645",
                    [4] = "rbxassetid://7923579645",
                    [5] = "rbxassetid://7923579645",
                    [6] = "rbxassetid://7923579645",
                },
            },
            ["breakType"] = "wool",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function breakSound() end,
            ["health"] = 10,
            ["blastResistance"] = 0.8,
            ["wool"] = true,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 4,
                    ["blockId"] = 35,
                },
            },
        },
        ["image"] = "rbxassetid://7923579520",
        ["displayName"] = "Yellow Wool",
    },
    ["sand"] = {
        ["footstepSound"] = 3,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 0,
                    ["blockId"] = 12,
                },
            },
            ["health"] = 8,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7843856590",
                    [2] = "rbxassetid://7843856590",
                    [3] = "rbxassetid://7843856590",
                    [4] = "rbxassetid://7843856590",
                    [5] = "rbxassetid://7843856590",
                    [6] = "rbxassetid://7843856590",
                },
            },
        },
        ["image"] = "rbxassetid://7884370902",
        ["displayName"] = "Sand",
    },
    ["juggernaut_boots"] = {
        ["armor"] = {
            ["damageReductionMultiplier"] = 0.22,
            ["slot"] = 2,
        },
        ["image"] = "rbxassetid://8730011123",
        ["displayName"] = "Juggernaut Boots",
    },
    ["wool_pink"] = {
        ["footstepSound"] = 3,
        ["block"] = {
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7923578642",
                    [2] = "rbxassetid://7923578642",
                    [3] = "rbxassetid://7923578642",
                    [4] = "rbxassetid://7923578642",
                    [5] = "rbxassetid://7923578642",
                    [6] = "rbxassetid://7923578642",
                },
            },
            ["breakType"] = "wool",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function breakSound() end,
            ["health"] = 10,
            ["blastResistance"] = 0.8,
            ["wool"] = true,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 6,
                    ["blockId"] = 35,
                },
            },
        },
        ["image"] = "rbxassetid://7923578533",
        ["displayName"] = "Pink Wool",
    },
    ["melon"] = {
        ["block"] = {
            ["breakType"] = "wood",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["denyPlaceOn"] = true,
            ["placedBy"] = {
                ["itemType"] = "melon_seeds",
            },
            ["seeThrough"] = true,
            ["health"] = 5,
        },
        ["image"] = "rbxassetid://6915428682",
        ["displayName"] = "Melon",
    },
    ["wool_orange"] = {
        ["footstepSound"] = 3,
        ["block"] = {
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7923578418",
                    [2] = "rbxassetid://7923578418",
                    [3] = "rbxassetid://7923578418",
                    [4] = "rbxassetid://7923578418",
                    [5] = "rbxassetid://7923578418",
                    [6] = "rbxassetid://7923578418",
                },
            },
            ["breakType"] = "wool",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function breakSound() end,
            ["health"] = 10,
            ["blastResistance"] = 0.8,
            ["wool"] = true,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 1,
                    ["blockId"] = 35,
                },
            },
        },
        ["image"] = "rbxassetid://7923578297",
        ["displayName"] = "Orange Wool",
    },
    ["stone_pickaxe"] = {
        ["firstPerson"] = {
            ["verticalOffset"] = -0.8,
        },
        ["image"] = "rbxassetid://6875481184",
        ["breakBlock"] = {
            ["stone"] = 8,
        },
        ["displayName"] = "Stone Pickaxe",
    },
    ["clay_gray"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 9,
                    ["blockId"] = 159,
                },
            },
            ["health"] = 8,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7872905160",
                    [2] = "rbxassetid://7872905160",
                    [3] = "rbxassetid://7872905160",
                    [4] = "rbxassetid://7872905160",
                    [5] = "rbxassetid://7872905160",
                    [6] = "rbxassetid://7872905160",
                },
            },
        },
        ["image"] = "rbxassetid://7884367563",
        ["displayName"] = "Gray Clay",
    },
    ["iron_chestplate"] = {
        ["armor"] = {
            ["damageReductionMultiplier"] = 0.32,
            ["slot"] = 1,
        },
        ["image"] = "rbxassetid://6874272631",
        ["displayName"] = "Iron Chestplate",
    },
    ["juggernaut_crate"] = {
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["collectionServiceTags"] = {
                [1] = "juggernaut-crate",
            },
            ["health"] = 20,
        },
        ["displayName"] = "Juggernaut Crate",
    },
    ["shield_axolotl"] = {
        ["image"] = "rbxassetid://7863780357",
        ["displayName"] = "Shield Axolotl",
    },
    ["dirt"] = {
        ["footstepSound"] = 0,
        ["block"] = {
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7852097294",
                    [2] = "rbxassetid://7852097294",
                    [3] = "rbxassetid://7852097294",
                    [4] = "rbxassetid://7852097294",
                    [5] = "rbxassetid://7852097294",
                    [6] = "rbxassetid://7852097294",
                },
            },
            ["breakType"] = "grass",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
        },
        ["image"] = "rbxassetid://7884368936",
        ["displayName"] = "Dirt",
    },
    ["snap_trap"] = {
        ["image"] = "rbxassetid://7805515071",
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function breakSound() end,
            ["collectionServiceTags"] = {
                [1] = "snap_trap",
            },
            ["seeThrough"] = true,
            ["health"] = 18,
        },
        ["displayName"] = "Snap Trap",
    },
    ["ice_sword"] = {
        ["image"] = "rbxassetid://8164577874",
        ["firstPerson"] = {
            ["scale"] = 0.8,
            ["verticalOffset"] = -1.2,
        },
        ["skins"] = {
            [1] = "tiger_brawler",
        },
        ["sword"] = {
            ["attackSpeed"] = 0.3,
            ["damage"] = 47,
        },
        ["kitItem"] = true,
        ["displayName"] = "Ice Sword",
    },
    ["clay_pink"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 6,
                    ["blockId"] = 159,
                },
                [2] = {
                    ["blockData"] = 2,
                    ["blockId"] = 159,
                },
                [3] = {
                    ["blockData"] = 6,
                    ["blockId"] = 251,
                },
            },
            ["health"] = 8,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7872906593",
                    [2] = "rbxassetid://7872906593",
                    [3] = "rbxassetid://7872906593",
                    [4] = "rbxassetid://7872906593",
                    [5] = "rbxassetid://7872906593",
                    [6] = "rbxassetid://7872906593",
                },
            },
        },
        ["image"] = "rbxassetid://7884368035",
        ["displayName"] = "Pink Clay",
    },
    ["diorite"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 3,
                    ["blockId"] = 1,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://9072525496",
                    [2] = "rbxassetid://9072525496",
                    [3] = "rbxassetid://9072525496",
                    [4] = "rbxassetid://9072525496",
                    [5] = "rbxassetid://9072525496",
                    [6] = "rbxassetid://9072525496",
                },
            },
        },
        ["image"] = "rbxassetid://9072525407",
        ["displayName"] = "Diorite",
    },
    ["obsidian"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockId"] = 49,
                },
            },
            ["blastResistance"] = 10,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://8105570170",
                    [2] = "rbxassetid://8105570170",
                    [3] = "rbxassetid://8105570170",
                    [4] = "rbxassetid://8105570170",
                    [5] = "rbxassetid://8105570170",
                    [6] = "rbxassetid://8105570170",
                },
            },
            ["health"] = 150,
        },
        ["image"] = "rbxassetid://8105569883",
        ["displayName"] = "Obsidian",
    },
    ["crit_star"] = {
        ["consumable"] = {
            ["animationOverride"] = 167,
            ["consumeTime"] = 0.1,
        },
        ["image"] = "rbxassetid://9866757805",
        ["displayName"] = "Crit Star",
    },
    ["oil_consumable"] = {
        ["projectileSource"] = {
            ["walkSpeedMultiplier"] = 0.5,
            ["ammoItemTypes"] = {
                [1] = "oil_consumable",
            },
            ["minStrengthScalar"] = 0.25,
            ["projectileType"] = function projectileType() end,
            ["maxStrengthChargeSec"] = 0.25,
            ["fireDelaySec"] = 1.5,
        },
        ["image"] = "rbxassetid://7808151981",
        ["kitItem"] = true,
        ["displayName"] = "Oil Blob",
    },
    ["brick"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockId"] = 45,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7843690742",
                    [2] = "rbxassetid://7843690742",
                    [3] = "rbxassetid://7843690742",
                    [4] = "rbxassetid://7843690742",
                    [5] = "rbxassetid://7843690742",
                    [6] = "rbxassetid://7843690742",
                },
            },
        },
        ["image"] = "rbxassetid://7884366460",
        ["displayName"] = "Brick",
    },
    ["camera_turret"] = {
        ["image"] = "rbxassetid://7290567966",
        ["skins"] = {
            [1] = "lunar",
        },
        ["block"] = {
            ["placeSound"] = function () end,
            ["breakSound"] = function breakSound() end,
            ["breakType"] = "stone",
            ["health"] = 25,
            ["seeThrough"] = true,
            ["disableInventoryPickup"] = true,
            ["projectileSource"] = {
                ["fireDelaySec"] = 0.2,
                ["relativeOverride"] = {
                    ["relX"] = 0,
                    ["relY"] = 0,
                    ["relZ"] = 0,
                },
                ["projectileType"] = function projectileType() end,
                ["launchSound"] = {
                    [1] = "rbxassetid://7290187805",
                },
                ["hitSounds"] = {
                    [1] = {
                        [1] = "rbxassetid://6866062188",
                    },
                },
            },
            ["unbreakableByTeammates"] = true,
            ["collectionServiceTags"] = {
                [1] = "engineer-turret",
            },
        },
        ["kitItem"] = true,
        ["displayName"] = "Camera Turret",
    },
    ["diamond_dao"] = {
        ["image"] = "rbxassetid://8665071845",
        ["daoSword"] = {
            ["armorMultiplier"] = 0.75,
            ["dashDamage"] = 30,
        },
        ["firstPerson"] = {
            ["scale"] = 0.8,
            ["verticalOffset"] = -1.2,
        },
        ["skins"] = {
            [1] = "tiger",
        },
        ["sword"] = {
            ["daoDash"] = true,
            ["attackSpeed"] = 0.3,
            ["damage"] = 42,
        },
        ["kitItem"] = true,
        ["displayName"] = "Diamond Dao",
    },
    ["taser"] = {
        ["image"] = "rbxassetid://7911162966",
        ["sword"] = {
            ["attackSpeed"] = 6,
            ["swingAnimations"] = {
                [1] = 1,
            },
            ["knockbackMultiplier"] = {
                ["vertical"] = 0,
                ["horizontal"] = 0,
            },
            ["swingSounds"] = {
            },
            ["damage"] = 1,
        },
        ["displayName"] = "Taser",
    },
    ["diamond_block"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function breakSound() end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockId"] = 57,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7861529819",
                    [2] = "rbxassetid://7861529819",
                    [3] = "rbxassetid://7861529819",
                    [4] = "rbxassetid://7861529819",
                    [5] = "rbxassetid://7861529819",
                    [6] = "rbxassetid://7861529819",
                },
            },
        },
        ["image"] = "rbxassetid://7884368860",
        ["displayName"] = "Diamond Block",
    },
    ["kresh"] = {
        ["footstepSound"] = 0,
        ["block"] = {
            ["breakType"] = "grass",
            ["placeSound"] = function () end,
            ["breakSound"] = function breakSound() end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 2,
                    ["blockId"] = 3,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://9839889319",
                    [2] = "rbxassetid://9839889255",
                    [3] = "rbxassetid://9839889255",
                    [4] = "rbxassetid://9839889255",
                    [5] = "rbxassetid://9839889255",
                    [6] = "rbxassetid://9839889255",
                },
            },
        },
        ["image"] = "rbxassetid://9839889168",
        ["displayName"] = "Kresh",
    },
    ["iron_boots"] = {
        ["armor"] = {
            ["damageReductionMultiplier"] = 0.12,
            ["slot"] = 2,
        },
        ["image"] = "rbxassetid://6874272718",
        ["displayName"] = "Iron Boots",
    },
    ["concrete_green"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 13,
                    ["blockId"] = 251,
                },
            },
            ["health"] = 8,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://8537949581",
                    [2] = "rbxassetid://8537949581",
                    [3] = "rbxassetid://8537949581",
                    [4] = "rbxassetid://8537949581",
                    [5] = "rbxassetid://8537949581",
                    [6] = "rbxassetid://8537949581",
                },
            },
        },
        ["image"] = "rbxassetid://8537949134",
        ["displayName"] = "GREEN CONCRETE",
    },
    ["personal_chest"] = {
        ["footstepSound"] = 2,
        ["image"] = "rbxassetid://8164577594",
        ["block"] = {
            ["breakType"] = "wood",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["seeThrough"] = true,
            ["collectionServiceTags"] = {
                [1] = "chest",
                [2] = "personal-chest",
            },
            ["minecraftConversions"] = {
                [1] = {
                    ["blockId"] = 130,
                },
            },
            ["health"] = 30,
        },
        ["displayName"] = "Personal Chest",
    },
    ["wood_bow"] = {
        ["skins"] = {
            [1] = "demon_empress_vanessa",
        },
        ["projectileSource"] = {
            ["chargeBeginSound"] = {
                [1] = "rbxassetid://6866062236",
            },
            ["multiShotChargeTime"] = 0.8,
            ["fireDelaySec"] = 0.6,
            ["projectileType"] = function projectileType() end,
            ["hitSounds"] = {
                [1] = {
                    [1] = "rbxassetid://6866062188",
                },
            },
            ["thirdPerson"] = {
                ["aimAnimation"] = 113,
                ["fireAnimation"] = 114,
                ["drawAnimation"] = 115,
            },
            ["ammoItemTypes"] = {
                [1] = "firework_arrow",
                [2] = "arrow",
            },
            ["walkSpeedMultiplier"] = 0.35,
            ["maxStrengthChargeSec"] = 0.65,
            ["launchSound"] = {
                [1] = "rbxassetid://6866062104",
            },
            ["minStrengthScalar"] = 0.3333333333333333,
        },
        ["image"] = "rbxassetid://6869295332",
        ["displayName"] = "Bow",
    },
    ["andesite"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 5,
                    ["blockId"] = 1,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://9072525162",
                    [2] = "rbxassetid://9072525162",
                    [3] = "rbxassetid://9072525162",
                    [4] = "rbxassetid://9072525162",
                    [5] = "rbxassetid://9072525162",
                    [6] = "rbxassetid://9072525162",
                },
            },
        },
        ["image"] = "rbxassetid://9072552631",
        ["displayName"] = "ANDESITE",
    },
    ["iron"] = {
        ["displayNameColor"] = Color3.new(1, 1, 1),
        ["image"] = "rbxassetid://6850537969",
        ["hotbarFillRight"] = true,
        ["displayName"] = "Iron",
    },
    ["bedrock"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["health"] = 10,
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["blastProof"] = true,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockId"] = 7,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://9207284200",
                    [2] = "rbxassetid://9207284200",
                    [3] = "rbxassetid://9207284200",
                    [4] = "rbxassetid://9207284200",
                    [5] = "rbxassetid://9207284200",
                    [6] = "rbxassetid://9207284200",
                },
            },
            ["breakableOnlyByHosts"] = true,
        },
        ["image"] = "rbxassetid://9207283973",
        ["displayName"] = "Bedrock",
    },
    ["frying_pan"] = {
        ["firstPerson"] = {
            ["scale"] = 0.8,
        },
        ["image"] = "rbxassetid://9253246741",
        ["sword"] = {
            ["chargedAttack"] = {
                ["bonusKnockback"] = 1.5,
                ["maxChargeTimeSec"] = 1,
                ["bonusDamage"] = 4,
            },
            ["knockbackMultiplier"] = {
                ["horizontal"] = 1,
            },
            ["attackSpeed"] = 0.3,
            ["damage"] = 18,
        },
        ["displayName"] = "Frying Pan",
    },
    ["marble"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7861531930",
                    [2] = "rbxassetid://7861531930",
                    [3] = "rbxassetid://7861531930",
                    [4] = "rbxassetid://7861531930",
                    [5] = "rbxassetid://7861531930",
                    [6] = "rbxassetid://7861531930",
                },
            },
            ["health"] = 8,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 0,
                    ["blockId"] = 155,
                },
            },
        },
        ["image"] = "rbxassetid://6594536339",
        ["displayName"] = "Marble",
    },
    ["raven"] = {
        ["kitItem"] = true,
        ["image"] = "rbxassetid://7343272003",
        ["displayName"] = "Raven",
    },
    ["drone"] = {
        ["image"] = "rbxassetid://9507317177",
        ["maxStackSize"] = 1,
        ["kitItem"] = true,
        ["guidedProjectileSource"] = {
            ["guidedProjectile"] = "drone",
        },
        ["displayName"] = "Drone",
    },
    ["andesite_polished"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 6,
                    ["blockId"] = 1,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://9072552916",
                    [2] = "rbxassetid://9072552916",
                    [3] = "rbxassetid://9072552916",
                    [4] = "rbxassetid://9072552916",
                    [5] = "rbxassetid://9072552916",
                    [6] = "rbxassetid://9072552916",
                },
            },
        },
        ["image"] = "rbxassetid://9072552793",
        ["displayName"] = "Polished Andesite",
    },
    ["diamond_chestplate"] = {
        ["armor"] = {
            ["damageReductionMultiplier"] = 0.32,
            ["slot"] = 1,
        },
        ["image"] = "rbxassetid://6874272898",
        ["displayName"] = "Diamond Chestplate",
    },
    ["tnt"] = {
        ["footstepSound"] = 3,
        ["block"] = {
            ["breakType"] = "wool",
            ["placeSound"] = function () end,
            ["breakSound"] = function breakSound() end,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7843883559",
                    [2] = "rbxassetid://7843883559",
                    [3] = "rbxassetid://7843883483",
                    [4] = "rbxassetid://7843883483",
                    [5] = "rbxassetid://7843883483",
                    [6] = "rbxassetid://7843883483",
                },
            },
            ["health"] = 1,
        },
        ["image"] = "rbxassetid://7884372237",
        ["displayName"] = "TNT",
    },
    ["invisibility_potion"] = {
        ["crafting"] = {
        },
        ["image"] = "rbxassetid://7836794914",
        ["consumable"] = {
            ["consumeTime"] = 0.1,
            ["potion"] = true,
            ["statusEffect"] = {
                ["duration"] = 60,
                ["statusEffectType"] = "invisibility",
            },
        },
        ["displayName"] = "Invisiblity Potion",
    },
    ["ice"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockId"] = 79,
                },
                [2] = {
                    ["blockId"] = 174,
                },
                [3] = {
                    ["blockId"] = 212,
                },
            },
            ["health"] = 8,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7873314621",
                    [2] = "rbxassetid://7873314621",
                    [3] = "rbxassetid://7873314621",
                    [4] = "rbxassetid://7873314621",
                    [5] = "rbxassetid://7873314621",
                    [6] = "rbxassetid://7873314621",
                },
            },
        },
        ["image"] = "rbxassetid://7884369431",
        ["displayName"] = "Ice",
    },
    ["marble_pillar"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 2,
                    ["blockId"] = 155,
                },
            },
            ["health"] = 8,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7843830538",
                    [2] = "rbxassetid://7843830538",
                    [3] = "rbxassetid://7843819529",
                    [4] = "rbxassetid://7843819529",
                    [5] = "rbxassetid://7843819529",
                    [6] = "rbxassetid://7843819529",
                },
            },
        },
        ["image"] = "rbxassetid://7884370206",
        ["displayName"] = "Marble Pillar",
    },
    ["clay_purple"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
            },
            ["health"] = 8,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7872906885",
                    [2] = "rbxassetid://7872906885",
                    [3] = "rbxassetid://7872906885",
                    [4] = "rbxassetid://7872906885",
                    [5] = "rbxassetid://7872906885",
                    [6] = "rbxassetid://7872906885",
                },
            },
        },
        ["image"] = "rbxassetid://7884368099",
        ["displayName"] = "Purple Clay",
    },
    ["enchant_table"] = {
        ["block"] = {
            ["breakType"] = "wood",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["collectionServiceTags"] = {
                [1] = "enchant-table",
            },
            ["health"] = 20,
        },
        ["displayName"] = "Enchant Table",
    },
    ["teleport_block"] = {
        ["image"] = "rbxassetid://9369048721",
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["collectionServiceTags"] = {
                [1] = "teleport_block",
            },
            ["health"] = 8,
            ["seeThrough"] = true,
        },
        ["displayName"] = "Teleport Block",
    },
    ["galactite_brick"] = {
        ["footstepSound"] = 4,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function breakSound() end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockId"] = 112,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://9839888790",
                    [2] = "rbxassetid://9839888790",
                    [3] = "rbxassetid://9839888790",
                    [4] = "rbxassetid://9839888790",
                    [5] = "rbxassetid://9839888790",
                    [6] = "rbxassetid://9839888790",
                },
            },
        },
        ["image"] = "rbxassetid://9839888714",
        ["displayName"] = "Galactite Brick",
    },
    ["throwing_knife"] = {
        ["image"] = "rbxassetid://8479269961",
        ["projectileSource"] = {
            ["multiShotCount"] = 3,
            ["fireDelaySec"] = 0.8,
            ["multiShot"] = true,
            ["ammoItemTypes"] = {
                [1] = "throwing_knife",
            },
            ["maxStrengthChargeSec"] = 0.4,
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://6866062104",
            },
            ["multiShotDelay"] = 0.2,
        },
        ["displayName"] = "Throwing Knife",
    },
    ["emerald_chestplate"] = {
        ["armor"] = {
            ["damageReductionMultiplier"] = 0.4,
            ["slot"] = 1,
        },
        ["image"] = "rbxassetid://6931675868",
        ["displayName"] = "Emerald Chestplate",
    },
    ["carrot_rocket"] = {
        ["image"] = "rbxassetid://9133691017",
        ["hotbarFillRight"] = true,
        ["displayName"] = "Carrot Rocket",
    },
    ["metal_detector"] = {
        ["image"] = "rbxassetid://9378643217",
        ["kitItem"] = true,
        ["displayName"] = "Metal Detector",
    },
    ["fisherman_coral"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["blastResistance"] = 5,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7843775572",
                    [2] = "rbxassetid://7843775572",
                    [3] = "rbxassetid://7843775572",
                    [4] = "rbxassetid://7843775572",
                    [5] = "rbxassetid://7843775572",
                    [6] = "rbxassetid://7843775572",
                },
            },
            ["health"] = 210,
        },
        ["image"] = "rbxassetid://7884369108",
        ["displayName"] = "Coral",
    },
    ["golden_bow"] = {
        ["projectileSource"] = {
            ["chargeBeginSound"] = {
                [1] = "rbxassetid://6866062236",
            },
            ["fireDelaySec"] = 0.3,
            ["projectileType"] = function projectileType() end,
            ["hitSounds"] = {
                [1] = {
                    [1] = "rbxassetid://6866062188",
                },
            },
            ["ammoItemTypes"] = {
                [1] = "arrow",
            },
            ["walkSpeedMultiplier"] = 0.25,
            ["maxStrengthChargeSec"] = 0.5,
            ["launchSound"] = {
                [1] = "rbxassetid://6866062104",
            },
            ["minStrengthScalar"] = 0.25,
        },
        ["image"] = "rbxassetid://8479270340",
        ["displayName"] = "Golden Bow",
    },
    ["wizard_staff"] = {
        ["kitItem"] = true,
        ["cooldownId"] = "wizard_staff",
        ["multiProjectileSource"] = {
            ["lightning_strike"] = {
                ["cooldownId"] = "wizard_staff",
                ["fireDelaySec"] = 10,
                ["projectileType"] = function projectileType() end,
                ["thirdPerson"] = {
                    ["fireAnimation"] = 17,
                },
                ["firstPerson"] = {
                    ["fireAnimation"] = 6,
                },
            },
            ["electric_orb"] = {
                ["cooldownId"] = "wizard_staff",
                ["fireDelaySec"] = 10,
                ["projectileType"] = function projectileType() end,
                ["thirdPerson"] = {
                    ["fireAnimation"] = 18,
                },
                ["firstPerson"] = {
                    ["fireAnimation"] = 6,
                },
            },
        },
        ["image"] = "rbxassetid://7265547954",
        ["displayName"] = "Wizard Staff",
    },
    ["guided_missile"] = {
        ["firstPerson"] = {
            ["scale"] = 0.7,
        },
        ["image"] = "rbxassetid://8042313266",
        ["guidedProjectileSource"] = {
            ["guidedProjectile"] = "guided_missile",
            ["consumeItem"] = "guided_missile",
        },
        ["displayName"] = "Guided Missile",
    },
    ["banana_peel"] = {
        ["image"] = "rbxassetid://7681234378",
        ["projectileSource"] = {
            ["maxStrengthChargeSec"] = 0.25,
            ["ammoItemTypes"] = {
                [1] = "banana_peel",
            },
            ["minStrengthScalar"] = 0.7692307692307692,
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://6760544639",
            },
            ["fireDelaySec"] = 0.4,
        },
        ["displayName"] = "Banana Peel",
    },
    ["juggernaut_helmet"] = {
        ["armor"] = {
            ["damageReductionMultiplier"] = 0.26,
            ["slot"] = 0,
        },
        ["image"] = "rbxassetid://8730010634",
        ["displayName"] = "Juggernaut Helmet",
    },
    ["bear_claws"] = {
        ["firstPerson"] = {
            ["scale"] = 0.8,
        },
        ["image"] = "rbxassetid://9434318163",
        ["sword"] = {
            ["attackSpeed"] = 0.8,
            ["swingAnimations"] = {
                [1] = 142,
            },
            ["respectAttackSpeedForEffects"] = true,
            ["respectAttackSpeedOnServer"] = true,
            ["chargedAttack"] = {
                ["bonusKnockback"] = 0.1,
                ["ignoreEffectsOnFullyCharged"] = true,
                ["maxChargeTimeSec"] = 1,
                ["bonusDamage"] = 15,
            },
            ["knockbackMultiplier"] = {
                ["horizontal"] = 0.1,
            },
            ["firstPersonSwingAnimations"] = {
                [1] = 142,
            },
            ["swingSounds"] = {
                [1] = "rbxassetid://9416877011",
            },
            ["damage"] = 45,
        },
        ["displayName"] = "Bear Claw",
    },
    ["birch_log"] = {
        ["footstepSound"] = 2,
        ["block"] = {
            ["breakType"] = "wood",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 2,
                    ["blockId"] = 17,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7884366353",
                    [2] = "rbxassetid://7884366353",
                    [3] = "rbxassetid://7843683271",
                    [4] = "rbxassetid://7843683271",
                    [5] = "rbxassetid://7843683271",
                    [6] = "rbxassetid://7843683271",
                },
            },
            ["health"] = 30,
        },
        ["image"] = "rbxassetid://7884365859",
        ["displayName"] = "Birch Log",
    },
    ["sleep_splash_potion"] = {
        ["maxStackSize"] = 2,
        ["image"] = "rbxassetid://9134319146",
        ["projectileSource"] = {
            ["fireDelaySec"] = 0.4,
            ["maxStrengthChargeSec"] = 1,
            ["walkSpeedMultiplier"] = 0.4,
            ["ammoItemTypes"] = {
                [1] = "sleep_splash_potion",
            },
            ["minStrengthScalar"] = 0.3333333333333333,
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://6866062104",
            },
            ["firstPerson"] = {
            },
        },
        ["displayName"] = "Sleep Splash Potion",
    },
    ["lucky_block"] = {
        ["block"] = {
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7843804042",
                    [2] = "rbxassetid://7843804042",
                    [3] = "rbxassetid://7843804042",
                    [4] = "rbxassetid://7843804042",
                    [5] = "rbxassetid://7843804042",
                    [6] = "rbxassetid://7843804042",
                },
            },
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function breakSound() end,
            ["blastProof"] = true,
            ["disableInventoryPickup"] = true,
            ["luckyBlock"] = {
                ["rarity"] = 1,
            },
            ["health"] = 15,
        },
        ["image"] = "rbxassetid://7884369916",
        ["displayName"] = "Lucky Block",
    },
    ["red_sand"] = {
        ["footstepSound"] = 3,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 1,
                    ["blockId"] = 12,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://9072732694",
                    [2] = "rbxassetid://9072732694",
                    [3] = "rbxassetid://9072732694",
                    [4] = "rbxassetid://9072732694",
                    [5] = "rbxassetid://9072732694",
                    [6] = "rbxassetid://9072732694",
                },
            },
        },
        ["image"] = "rbxassetid://9072732616",
        ["displayName"] = "Red Sand",
    },
    ["snow"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockId"] = 78,
                },
                [2] = {
                    ["blockId"] = 80,
                },
            },
            ["health"] = 8,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7843870529",
                    [2] = "rbxassetid://7843870529",
                    [3] = "rbxassetid://7843870529",
                    [4] = "rbxassetid://7843870529",
                    [5] = "rbxassetid://7843870529",
                    [6] = "rbxassetid://7843870529",
                },
            },
        },
        ["image"] = "rbxassetid://7884371442",
        ["displayName"] = "Snow",
    },
    ["cannon"] = {
        ["image"] = "rbxassetid://7121221753",
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function breakSound() end,
            ["collectionServiceTags"] = {
                [1] = "cannon",
            },
            ["seeThrough"] = true,
            ["health"] = 8,
        },
        ["displayName"] = "Cannon",
    },
    ["clay_dark_brown"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 7,
                    ["blockId"] = 159,
                },
            },
            ["health"] = 8,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7872904623",
                    [2] = "rbxassetid://7872904623",
                    [3] = "rbxassetid://7872904623",
                    [4] = "rbxassetid://7872904623",
                    [5] = "rbxassetid://7872904623",
                    [6] = "rbxassetid://7872904623",
                },
            },
        },
        ["image"] = "rbxassetid://7884367299",
        ["displayName"] = "Dark Brown Clay",
    },
    ["twirlblade"] = {
        ["image"] = "rbxassetid://8795403035",
        ["sword"] = {
            ["attackSpeed"] = 1,
            ["knockbackMultiplier"] = {
                ["horizontal"] = 1.1,
            },
            ["respectAttackSpeedForEffects"] = true,
            ["swingSounds"] = {
            },
            ["respectAttackSpeedOnServer"] = true,
            ["firstPersonSwingAnimations"] = {
                [1] = 110,
                [2] = 111,
            },
            ["attackRange"] = 18,
            ["swingAnimations"] = {
                [1] = 106,
                [2] = 107,
            },
            ["setLastAttackOnEveryHit"] = true,
            ["cooldown"] = {
                ["cooldownBar"] = {
                    ["color"] = Color3.new(0.701961, 0.0196078, 0.0196078),
                },
            },
            ["damage"] = 50,
        },
        ["displayName"] = "Twirlblade",
    },
    ["carrot"] = {
        ["block"] = {
            ["breakType"] = "wood",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["denyPlaceOn"] = true,
            ["placedBy"] = {
                ["itemType"] = "carrot_seeds",
            },
            ["seeThrough"] = true,
            ["health"] = 5,
        },
        ["image"] = "rbxassetid://3677675280",
        ["displayName"] = "Carrot",
    },
    ["vacuum"] = {
        ["projectileSource"] = {
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://7806060367",
            },
            ["fireDelaySec"] = 0,
        },
        ["image"] = "rbxassetid://7813758517",
        ["kitItem"] = true,
        ["displayName"] = "Vacuum",
    },
    ["void_crystal"] = {
        ["displayNameColor"] = Color3.new(1, 0.333333, 1),
        ["image"] = "rbxassetid://9866758117",
        ["hotbarFillRight"] = true,
        ["displayName"] = "Void Crystal",
    },
    ["clay_tan"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 0,
                    ["blockId"] = 172,
                },
            },
            ["health"] = 8,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7872907469",
                    [2] = "rbxassetid://7872907469",
                    [3] = "rbxassetid://7872907469",
                    [4] = "rbxassetid://7872907469",
                    [5] = "rbxassetid://7872907469",
                    [6] = "rbxassetid://7872907469",
                },
            },
        },
        ["image"] = "rbxassetid://7884368312",
        ["displayName"] = "Tan Clay",
    },
    ["leather_helmet"] = {
        ["armor"] = {
            ["damageReductionMultiplier"] = 0.08,
            ["slot"] = 0,
        },
        ["image"] = "rbxassetid://6855466216",
        ["displayName"] = "Leather Helmet",
    },
    ["stone"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockId"] = 3,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7861533820",
                    [2] = "rbxassetid://7861533820",
                    [3] = "rbxassetid://7861533820",
                    [4] = "rbxassetid://7861533820",
                    [5] = "rbxassetid://7861533820",
                    [6] = "rbxassetid://7861533820",
                },
            },
        },
        ["image"] = "rbxassetid://7884371892",
        ["displayName"] = "Stone",
    },
    ["slate_brick"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 11,
                    ["blockId"] = 159,
                },
            },
            ["health"] = 8,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://9072526507",
                    [2] = "rbxassetid://9072526507",
                    [3] = "rbxassetid://9072526507",
                    [4] = "rbxassetid://9072526507",
                    [5] = "rbxassetid://9072526507",
                    [6] = "rbxassetid://9072526507",
                },
            },
        },
        ["image"] = "rbxassetid://9072553631",
        ["displayName"] = "Slate Brick",
    },
    ["void_boots"] = {
        ["armor"] = {
            ["damageReductionMultiplier"] = 0.18,
            ["slot"] = 2,
        },
        ["image"] = "rbxassetid://9866786979",
        ["displayName"] = "Void Boots",
    },
    ["iron_block"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function breakSound() end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockId"] = 42,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7852098030",
                    [2] = "rbxassetid://7852098030",
                    [3] = "rbxassetid://7852098030",
                    [4] = "rbxassetid://7852098030",
                    [5] = "rbxassetid://7852098030",
                    [6] = "rbxassetid://7852098030",
                },
            },
        },
        ["image"] = "rbxassetid://7884369517",
        ["displayName"] = "Iron Block",
    },
    ["clay_red"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 14,
                    ["blockId"] = 159,
                },
                [2] = {
                    ["blockData"] = 14,
                    ["blockId"] = 251,
                },
            },
            ["health"] = 8,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7872907119",
                    [2] = "rbxassetid://7872907119",
                    [3] = "rbxassetid://7872907119",
                    [4] = "rbxassetid://7872907119",
                    [5] = "rbxassetid://7872907119",
                    [6] = "rbxassetid://7872907119",
                },
            },
        },
        ["image"] = "rbxassetid://7884368246",
        ["displayName"] = "Red Clay",
    },
    ["flamethrower"] = {
        ["cooldownId"] = "flamethrower_use",
        ["kitItem"] = true,
        ["image"] = "rbxassetid://7343272403",
        ["displayName"] = "Flamethrower",
    },
    ["iron_helmet"] = {
        ["armor"] = {
            ["damageReductionMultiplier"] = 0.16,
            ["slot"] = 0,
        },
        ["image"] = "rbxassetid://6874272559",
        ["displayName"] = "Iron Helmet",
    },
    ["vitality_star"] = {
        ["consumable"] = {
            ["animationOverride"] = 167,
            ["consumeTime"] = 0.1,
        },
        ["image"] = "rbxassetid://9866757969",
        ["displayName"] = "Vitality Star",
    },
    ["clay_light_green"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 5,
                    ["blockId"] = 159,
                },
            },
            ["health"] = 8,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7872906008",
                    [2] = "rbxassetid://7872906008",
                    [3] = "rbxassetid://7872906008",
                    [4] = "rbxassetid://7872906008",
                    [5] = "rbxassetid://7872906008",
                    [6] = "rbxassetid://7872906008",
                },
            },
        },
        ["image"] = "rbxassetid://7884367872",
        ["displayName"] = "Light Green Clay",
    },
    ["emerald_block"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function breakSound() end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockId"] = 133,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7843773857",
                    [2] = "rbxassetid://7843773857",
                    [3] = "rbxassetid://7843773857",
                    [4] = "rbxassetid://7843773857",
                    [5] = "rbxassetid://7843773857",
                    [6] = "rbxassetid://7843773857",
                },
            },
        },
        ["image"] = "rbxassetid://7884369019",
        ["displayName"] = "Emerald Block",
    },
    ["emerald"] = {
        ["displayNameColor"] = Color3.new(0.333333, 1, 0.333333),
        ["image"] = "rbxassetid://6850538075",
        ["hotbarFillRight"] = true,
        ["displayName"] = "Emerald",
    },
    ["baseball_bat"] = {
        ["sword"] = {
            ["attackSpeed"] = 6,
            ["swingSounds"] = {
            },
            ["setLastAttackOnEveryHit"] = true,
            ["knockbackMultiplier"] = {
                ["horizontal"] = 5,
            },
            ["respectAttackSpeedForEffects"] = true,
            ["damage"] = 100,
        },
        ["displayName"] = "Baseball Bat",
    },
    ["impulse_grenade"] = {
        ["image"] = "rbxassetid://7681106844",
        ["projectileSource"] = {
            ["fireDelaySec"] = 0.4,
            ["maxStrengthChargeSec"] = 1,
            ["walkSpeedMultiplier"] = 0.4,
            ["ammoItemTypes"] = {
                [1] = "impulse_grenade",
            },
            ["minStrengthScalar"] = 0.3333333333333333,
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://6866062104",
            },
            ["firstPerson"] = {
            },
        },
        ["displayName"] = "Impulse Grenade",
    },
    ["wool_cyan"] = {
        ["footstepSound"] = 3,
        ["block"] = {
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7861535702",
                    [2] = "rbxassetid://7861535702",
                    [3] = "rbxassetid://7861535702",
                    [4] = "rbxassetid://7861535702",
                    [5] = "rbxassetid://7861535702",
                    [6] = "rbxassetid://7861535702",
                },
            },
            ["breakType"] = "wool",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function breakSound() end,
            ["health"] = 10,
            ["blastResistance"] = 0.8,
            ["wool"] = true,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 9,
                    ["blockId"] = 35,
                },
            },
        },
        ["image"] = "rbxassetid://7923577311",
        ["displayName"] = "Cyan Wool",
    },
    ["miner_pickaxe"] = {
        ["kitItem"] = true,
        ["skins"] = {
            [1] = "space",
        },
        ["firstPerson"] = {
            ["verticalOffset"] = -0.8,
        },
        ["breakBlock"] = {
            ["stone"] = 30,
        },
        ["displayName"] = "Miner Pickaxe",
    },
    ["granite_polished"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 2,
                    ["blockId"] = 1,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://9072553427",
                    [2] = "rbxassetid://9072553427",
                    [3] = "rbxassetid://9072553427",
                    [4] = "rbxassetid://9072553427",
                    [5] = "rbxassetid://9072553427",
                    [6] = "rbxassetid://9072553427",
                },
            },
        },
        ["image"] = "rbxassetid://9072553350",
        ["displayName"] = "Polished Granite",
    },
    ["wood_plank_birch"] = {
        ["footstepSound"] = 2,
        ["block"] = {
            ["breakType"] = "wood",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 2,
                    ["blockId"] = 5,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7884372538",
                    [2] = "rbxassetid://7884372538",
                    [3] = "rbxassetid://7884372538",
                    [4] = "rbxassetid://7884372538",
                    [5] = "rbxassetid://7884372538",
                    [6] = "rbxassetid://7884372538",
                },
            },
            ["health"] = 30,
        },
        ["image"] = "rbxassetid://7884372418",
        ["displayName"] = "Birch Wood Plank",
    },
    ["grappling_hook"] = {
        ["image"] = "rbxassetid://9499344892",
        ["projectileSource"] = {
            ["fireDelaySec"] = 0.1,
            ["thirdPerson"] = {
                ["fireAnimation"] = 138,
                ["aimAnimation"] = 137,
            },
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://9499222342",
            },
            ["waitForHit"] = true,
        },
        ["displayName"] = "Grapple Hook",
    },
    ["charge_shield"] = {
        ["cooldownId"] = "charge_shield",
        ["image"] = "rbxassetid://7745351893",
        ["firstPerson"] = {
            ["scale"] = 0.8,
        },
        ["displayName"] = "Charge Shield",
    },
    ["shrink_potion"] = {
        ["crafting"] = {
        },
        ["image"] = "rbxassetid://7911163448",
        ["consumable"] = {
            ["potion"] = true,
            ["consumeTime"] = 0.1,
        },
        ["displayName"] = "Shrink Potion",
    },
    ["stopwatch"] = {
        ["cooldownId"] = "stopwatch",
        ["image"] = "rbxassetid://7871761250",
        ["consumable"] = {
            ["soundOverride"] = "None",
            ["consumeTime"] = 0.1,
            ["disableAnimation"] = true,
        },
        ["displayName"] = "Stopwatch",
    },
    ["void_sword"] = {
        ["image"] = "rbxassetid://9873021357",
        ["sword"] = {
            ["attackSpeed"] = 0.3,
            ["damage"] = 50,
        },
        ["firstPerson"] = {
            ["scale"] = 0.8,
            ["verticalOffset"] = -1.2,
        },
        ["displayName"] = "Void Sword",
    },
    ["wool_green"] = {
        ["footstepSound"] = 3,
        ["block"] = {
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7923577768",
                    [2] = "rbxassetid://7923577768",
                    [3] = "rbxassetid://7923577768",
                    [4] = "rbxassetid://7923577768",
                    [5] = "rbxassetid://7923577768",
                    [6] = "rbxassetid://7923577768",
                },
            },
            ["breakType"] = "wool",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function breakSound() end,
            ["health"] = 10,
            ["blastResistance"] = 0.8,
            ["wool"] = true,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 5,
                    ["blockId"] = 35,
                },
            },
        },
        ["image"] = "rbxassetid://7923577655",
        ["displayName"] = "Green Wool",
    },
    ["spear"] = {
        ["image"] = "rbxassetid://7808151805",
        ["maxStackSize"] = 5,
        ["projectileSource"] = {
            ["minStrengthScalar"] = 0.7692307692307692,
            ["ammoItemTypes"] = {
                [1] = "spear",
            },
            ["walkSpeedMultiplier"] = 0.2,
            ["projectileType"] = function projectileType() end,
            ["maxStrengthChargeSec"] = 0.25,
            ["fireDelaySec"] = 0.7,
        },
        ["kitItem"] = true,
        ["displayName"] = "Spear",
    },
    ["flower"] = {
        ["image"] = "rbxassetid://9134545166",
        ["displayName"] = "Flower",
    },
    ["heal_splash_potion"] = {
        ["maxStackSize"] = 2,
        ["image"] = "rbxassetid://9135912233",
        ["projectileSource"] = {
            ["fireDelaySec"] = 0.4,
            ["maxStrengthChargeSec"] = 1,
            ["walkSpeedMultiplier"] = 0.4,
            ["ammoItemTypes"] = {
                [1] = "heal_splash_potion",
            },
            ["minStrengthScalar"] = 0.3333333333333333,
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://6866062104",
            },
            ["firstPerson"] = {
            },
        },
        ["displayName"] = "Heal Splash Potion",
    },
    ["stone_dao"] = {
        ["image"] = "rbxassetid://8665071212",
        ["daoSword"] = {
            ["armorMultiplier"] = 0.8,
            ["dashDamage"] = 21.599999999999998,
        },
        ["firstPerson"] = {
            ["scale"] = 0.8,
            ["verticalOffset"] = -1.2,
        },
        ["skins"] = {
            [1] = "tiger",
        },
        ["sword"] = {
            ["daoDash"] = true,
            ["attackSpeed"] = 0.3,
            ["damage"] = 25,
        },
        ["kitItem"] = true,
        ["displayName"] = "Stone Dao",
    },
    ["infernal_shield"] = {
        ["firstPerson"] = {
            ["scale"] = 0.8,
        },
        ["image"] = "rbxassetid://7051149149",
        ["kitItem"] = true,
        ["displayName"] = "Infernal Shield",
    },
    ["carrot_seeds"] = {
        ["image"] = "rbxassetid://6956387835",
        ["placesBlock"] = {
            ["blockType"] = "carrot",
        },
        ["displayName"] = "Carrot Seeds",
    },
    ["poison_splash_potion"] = {
        ["maxStackSize"] = 2,
        ["image"] = "rbxassetid://9135917252",
        ["projectileSource"] = {
            ["fireDelaySec"] = 0.4,
            ["maxStrengthChargeSec"] = 1,
            ["walkSpeedMultiplier"] = 0.4,
            ["ammoItemTypes"] = {
                [1] = "poison_splash_potion",
            },
            ["minStrengthScalar"] = 0.3333333333333333,
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://6866062104",
            },
            ["firstPerson"] = {
            },
        },
        ["displayName"] = "Poison Splash Potion",
    },
    ["emerald_boots"] = {
        ["armor"] = {
            ["damageReductionMultiplier"] = 0.2,
            ["slot"] = 2,
        },
        ["image"] = "rbxassetid://6931675942",
        ["displayName"] = "Emerald Boots",
    },
    ["heal_banner"] = {
        ["image"] = "rbxassetid://9557924389",
        ["block"] = {
            ["denyPlaceOn"] = true,
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function breakSound() end,
            ["maxPlaced"] = 1,
            ["breakType"] = "stone",
            ["health"] = 40,
            ["disableInventoryPickup"] = true,
            ["collectionServiceTags"] = {
                [1] = "flag-kit",
            },
            ["unbreakableByTeammates"] = true,
            ["seeThrough"] = true,
        },
        ["displayName"] = "Heal Banner",
    },
    ["balloon"] = {
        ["maxStackSize"] = 6,
        ["image"] = "rbxassetid://7122143895",
        ["cooldownId"] = "balloon",
        ["displayName"] = "Balloons",
    },
    ["wool_white"] = {
        ["footstepSound"] = 3,
        ["block"] = {
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7923579370",
                    [2] = "rbxassetid://7923579370",
                    [3] = "rbxassetid://7923579370",
                    [4] = "rbxassetid://7923579370",
                    [5] = "rbxassetid://7923579370",
                    [6] = "rbxassetid://7923579370",
                },
            },
            ["breakType"] = "wool",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function breakSound() end,
            ["health"] = 10,
            ["blastResistance"] = 0.8,
            ["wool"] = true,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 0,
                    ["blockId"] = 35,
                },
            },
        },
        ["image"] = "rbxassetid://7923579263",
        ["displayName"] = "White Wool",
    },
    ["tesla_trap"] = {
        ["image"] = "rbxassetid://7498163110",
        ["block"] = {
            ["seeThrough"] = true,
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function breakSound() end,
            ["disableInventoryPickup"] = true,
            ["collectionServiceTags"] = {
                [1] = "tesla-trap",
            },
            ["maxPlaced"] = 2,
            ["health"] = 18,
        },
        ["displayName"] = "Tesla Coil Trap",
    },
    ["zipline"] = {
        ["image"] = "rbxassetid://7051148904",
        ["projectileSource"] = {
            ["fireDelaySec"] = 0.15,
            ["maxStrengthChargeSec"] = 0.25,
            ["ammoItemTypes"] = {
                [1] = "zipline",
            },
            ["minStrengthScalar"] = 0.7692307692307692,
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://6866223756",
            },
            ["firstPerson"] = {
                ["fireAnimation"] = 9,
                ["aimAnimation"] = 8,
            },
        },
        ["displayName"] = "Zipline Launcher",
    },
    ["warrior_chestplate"] = {
        ["armor"] = {
            ["damageReductionMultiplier"] = 0.44,
            ["slot"] = 1,
        },
        ["image"] = "rbxassetid://7343992770",
        ["displayName"] = "Warrior Chestplate",
    },
    ["turtle_shell"] = {
        ["image"] = "rbxassetid://9006935204",
        ["maxStackSize"] = 1,
        ["displayName"] = "Turtle Shell",
    },
    ["damage_axolotl"] = {
        ["image"] = "rbxassetid://7863780231",
        ["displayName"] = "Damage Axolotl",
    },
    ["heat_seeking_rock"] = {
        ["firstPerson"] = {
            ["scale"] = 0.7,
        },
        ["image"] = "rbxassetid://7681398025",
        ["guidedProjectileSource"] = {
            ["guidedProjectile"] = "heat_seeking_rock",
            ["consumeItem"] = "heat_seeking_rock",
        },
        ["displayName"] = "Heat Seeking Rock",
    },
    ["clay_black"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 15,
                    ["blockId"] = 159,
                },
                [2] = {
                    ["blockData"] = 7,
                    ["blockId"] = 35,
                },
                [3] = {
                    ["blockData"] = 15,
                    ["blockId"] = 251,
                },
            },
            ["health"] = 8,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7872903497",
                    [2] = "rbxassetid://7872903497",
                    [3] = "rbxassetid://7872903497",
                    [4] = "rbxassetid://7872903497",
                    [5] = "rbxassetid://7872903497",
                    [6] = "rbxassetid://7872903497",
                },
            },
        },
        ["image"] = "rbxassetid://7884367004",
        ["displayName"] = "Black Clay",
    },
    ["diamond_boots"] = {
        ["armor"] = {
            ["damageReductionMultiplier"] = 0.16,
            ["slot"] = 2,
        },
        ["image"] = "rbxassetid://6874272964",
        ["displayName"] = "Diamond Boots",
    },
    ["flag"] = {
        ["footstepSound"] = 2,
        ["block"] = {
            ["denyPlaceOn"] = true,
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["blastProof"] = true,
            ["breakType"] = "wood",
            ["health"] = 18,
            ["disableInventoryPickup"] = true,
            ["collectionServiceTags"] = {
                [1] = "flag",
            },
            ["seeThrough"] = true,
        },
        ["displayName"] = "Flag",
    },
    ["red_sandstone"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 0,
                    ["blockId"] = 179,
                },
            },
            ["health"] = 8,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7843853920",
                    [2] = "rbxassetid://7843853920",
                    [3] = "rbxassetid://7843853920",
                    [4] = "rbxassetid://7843853920",
                    [5] = "rbxassetid://7843853920",
                    [6] = "rbxassetid://7843853920",
                },
            },
        },
        ["image"] = "rbxassetid://7884370687",
        ["displayName"] = "Red Sandstone",
    },
    ["void_axe"] = {
        ["firstPerson"] = {
            ["verticalOffset"] = -1.2,
        },
        ["kitItem"] = true,
        ["image"] = "rbxassetid://8322058718",
        ["displayName"] = "Void Axe",
    },
    ["juggernaut_chestplate"] = {
        ["armor"] = {
            ["damageReductionMultiplier"] = 0.42,
            ["slot"] = 1,
        },
        ["image"] = "rbxassetid://8730010865",
        ["displayName"] = "Juggernaut Chestplate",
    },
    ["crook"] = {
        ["displayName"] = "Crook",
    },
    ["carrot_cannon"] = {
        ["image"] = "rbxassetid://9134613651",
        ["projectileSource"] = {
            ["multiShotCount"] = 4,
            ["fireDelaySec"] = 1,
            ["projectileType"] = function projectileType() end,
            ["launchScreenShake"] = true,
            ["thirdPerson"] = {
                ["fireAnimation"] = 123,
            },
            ["firstPerson"] = {
                ["fireAnimation"] = 125,
            },
            ["walkSpeedMultiplier"] = 0.6,
            ["launchSoundConfig"] = {
                ["pitch"] = NumberRange.new(0.949999988079071, 1.0499999523162842),
            },
            ["ammoItemTypes"] = {
                [1] = "carrot_rocket",
            },
            ["multiShot"] = true,
            ["activeReload"] = true,
            ["launchSound"] = {
                [1] = "rbxassetid://9135893336",
            },
            ["multiShotDelay"] = 0.1,
        },
        ["thirdPerson"] = {
            ["holdAnimation"] = 124,
        },
        ["firstPerson"] = {
            ["holdAnimation"] = 126,
        },
        ["displayName"] = "Carrot Cannon",
    },
    ["emerald_sword"] = {
        ["firstPerson"] = {
            ["scale"] = 0.8,
            ["verticalOffset"] = -1.2,
        },
        ["image"] = "rbxassetid://6931677551",
        ["sword"] = {
            ["attackSpeed"] = 0.3,
            ["damage"] = 55,
        },
        ["displayName"] = "Emerald Sword",
    },
    ["void_helmet"] = {
        ["armor"] = {
            ["damageReductionMultiplier"] = 0.22,
            ["slot"] = 0,
        },
        ["image"] = "rbxassetid://9866786767",
        ["displayName"] = "Void Helmet",
    },
    ["baguette"] = {
        ["firstPerson"] = {
            ["scale"] = 0.8,
        },
        ["image"] = "rbxassetid://7392211056",
        ["sword"] = {
            ["swingSounds"] = {
                [1] = "rbxassetid://7396760496",
            },
            ["knockbackMultiplier"] = {
                ["horizontal"] = 1.3,
            },
            ["attackSpeed"] = 0.3,
            ["damage"] = 1,
        },
        ["displayName"] = "Knockback Baguette",
    },
    ["bee"] = {
        ["kitItem"] = true,
        ["image"] = "rbxassetid://7343272839",
        ["displayName"] = "Bee",
    },
    ["stone_brick"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["blastResistance"] = 2.8,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockId"] = 98,
                },
                [2] = {
                    ["blockData"] = 6,
                    ["blockId"] = 1,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7843883344",
                    [2] = "rbxassetid://7843883344",
                    [3] = "rbxassetid://7843883344",
                    [4] = "rbxassetid://7843883344",
                    [5] = "rbxassetid://7843883344",
                    [6] = "rbxassetid://7843883344",
                },
            },
            ["health"] = 75,
        },
        ["image"] = "rbxassetid://7884372079",
        ["displayName"] = "Stone Brick",
    },
    ["speed_potion"] = {
        ["crafting"] = {
        },
        ["image"] = "rbxassetid://7836794566",
        ["consumable"] = {
            ["potion"] = true,
            ["consumeTime"] = 0.1,
        },
        ["displayName"] = "Speed Potion",
    },
    ["wood_plank_maple"] = {
        ["footstepSound"] = 2,
        ["block"] = {
            ["breakType"] = "wood",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 4,
                    ["blockId"] = 5,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7884372866",
                    [2] = "rbxassetid://7884372866",
                    [3] = "rbxassetid://7884372866",
                    [4] = "rbxassetid://7884372866",
                    [5] = "rbxassetid://7884372866",
                    [6] = "rbxassetid://7884372866",
                },
            },
            ["health"] = 30,
        },
        ["image"] = "rbxassetid://7884372787",
        ["displayName"] = "Maple Wood Plank",
    },
    ["bed"] = {
        ["footstepSound"] = 2,
        ["block"] = {
            ["disableInventoryPickup"] = true,
            ["breakType"] = "wood",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["blastProof"] = true,
            ["collectionServiceTags"] = {
                [1] = "bed",
            },
            ["seeThrough"] = true,
            ["health"] = 18,
        },
        ["displayName"] = "Bed",
    },
    ["wood_plank_oak"] = {
        ["footstepSound"] = 2,
        ["block"] = {
            ["breakType"] = "wood",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["blastResistance"] = 2.5,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockId"] = 5,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7884373088",
                    [2] = "rbxassetid://7884373088",
                    [3] = "rbxassetid://7884373088",
                    [4] = "rbxassetid://7884373088",
                    [5] = "rbxassetid://7884373088",
                    [6] = "rbxassetid://7884373088",
                },
            },
            ["health"] = 30,
        },
        ["image"] = "rbxassetid://7884372987",
        ["displayName"] = "Oak Plank",
    },
    ["snowball"] = {
        ["image"] = "rbxassetid://7911163294",
        ["projectileSource"] = {
            ["minStrengthScalar"] = 0.7692307692307692,
            ["ammoItemTypes"] = {
                [1] = "snowball",
            },
            ["maxStrengthChargeSec"] = 0.25,
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://8165640372",
            },
            ["fireDelaySec"] = 0.15,
        },
        ["displayName"] = "Snowball",
    },
    ["diorite_polished"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 4,
                    ["blockId"] = 1,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://9072553173",
                    [2] = "rbxassetid://9072553173",
                    [3] = "rbxassetid://9072553173",
                    [4] = "rbxassetid://9072553173",
                    [5] = "rbxassetid://9072553173",
                    [6] = "rbxassetid://9072553173",
                },
            },
        },
        ["image"] = "rbxassetid://9072553104",
        ["displayName"] = "Polished Diorite",
    },
    ["boba_blaster"] = {
        ["thirdPerson"] = {
            ["holdAnimation"] = 135,
        },
        ["image"] = "rbxassetid://9188763408",
        ["projectileSource"] = {
            ["fireDelaySec"] = 0.3,
            ["projectileType"] = function projectileType() end,
            ["thirdPerson"] = {
                ["fireAnimation"] = 136,
            },
            ["minStrengthScalar"] = 0.7692307692307692,
            ["ammoItemTypes"] = {
                [1] = "boba_pearl",
            },
            ["maxStrengthChargeSec"] = 0.6,
            ["activeReload"] = true,
            ["launchSound"] = {
                [1] = "rbxassetid://9185484755",
            },
            ["walkSpeedMultiplier"] = 0.4,
        },
        ["displayName"] = "Boba Blaster",
    },
    ["hickory_log"] = {
        ["footstepSound"] = 2,
        ["block"] = {
            ["breakType"] = "wood",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 3,
                    ["blockId"] = 17,
                },
                [2] = {
                    ["blockData"] = 0,
                    ["blockId"] = 162,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7843787701",
                    [2] = "rbxassetid://7843787701",
                    [3] = "rbxassetid://7843782693",
                    [4] = "rbxassetid://7843782693",
                    [5] = "rbxassetid://7843782693",
                    [6] = "rbxassetid://7843782693",
                },
            },
            ["health"] = 30,
        },
        ["image"] = "rbxassetid://7884369330",
        ["displayName"] = "Hickory Log",
    },
    ["iron_pickaxe"] = {
        ["firstPerson"] = {
            ["verticalOffset"] = -0.8,
        },
        ["image"] = "rbxassetid://6875481325",
        ["breakBlock"] = {
            ["stone"] = 12,
        },
        ["displayName"] = "Iron Pickaxe",
    },
    ["clay_yellow"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 4,
                    ["blockId"] = 159,
                },
            },
            ["health"] = 8,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7872908082",
                    [2] = "rbxassetid://7872908082",
                    [3] = "rbxassetid://7872908082",
                    [4] = "rbxassetid://7872908082",
                    [5] = "rbxassetid://7872908082",
                    [6] = "rbxassetid://7872908082",
                },
            },
        },
        ["image"] = "rbxassetid://7884368673",
        ["displayName"] = "Yellow Clay",
    },
    ["robbery_ball"] = {
        ["image"] = "rbxassetid://7977038485",
        ["projectileSource"] = {
            ["fireDelaySec"] = 0.15,
            ["maxStrengthChargeSec"] = 0.25,
            ["ammoItemTypes"] = {
                [1] = "robbery_ball",
            },
            ["minStrengthScalar"] = 0.7692307692307692,
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://6866223756",
            },
            ["firstPerson"] = {
                ["fireAnimation"] = 6,
            },
        },
        ["displayName"] = "Robbery Ball",
    },
    ["leather_boots"] = {
        ["armor"] = {
            ["damageReductionMultiplier"] = 0.04,
            ["slot"] = 2,
        },
        ["image"] = "rbxassetid://6855466456",
        ["displayName"] = "Leather Boots",
    },
    ["feather_bow"] = {
        ["skins"] = {
            [1] = "demon_empress_vanessa",
        },
        ["projectileSource"] = {
            ["chargeBeginSound"] = {
                [1] = "rbxassetid://6866062236",
            },
            ["fireDelaySec"] = 1,
            ["projectileType"] = function projectileType() end,
            ["hitSounds"] = {
                [1] = {
                    [1] = "rbxassetid://6866062188",
                },
            },
            ["ammoItemTypes"] = {
                [1] = "arrow",
            },
            ["walkSpeedMultiplier"] = 0.25,
            ["maxStrengthChargeSec"] = 0.9,
            ["launchSound"] = {
                [1] = "rbxassetid://6866062104",
            },
            ["minStrengthScalar"] = 0.25,
        },
        ["image"] = "rbxassetid://6869295332",
        ["displayName"] = "Feather Bow",
    },
    ["chest"] = {
        ["footstepSound"] = 2,
        ["image"] = "rbxassetid://8562772907",
        ["block"] = {
            ["breakType"] = "wood",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["seeThrough"] = true,
            ["collectionServiceTags"] = {
                [1] = "chest",
            },
            ["minecraftConversions"] = {
                [1] = {
                    ["blockId"] = 54,
                },
            },
            ["health"] = 30,
        },
        ["displayName"] = "Chest",
    },
    ["bee_net"] = {
        ["kitItem"] = true,
        ["image"] = "rbxassetid://7343519004",
        ["displayName"] = "Bee Net",
    },
    ["smoke_bomb"] = {
        ["kitItem"] = true,
        ["maxStackSize"] = 1,
        ["consumable"] = {
            ["cancelOnDamage"] = true,
            ["consumeTime"] = 0.1,
        },
        ["image"] = "rbxassetid://8532898334",
        ["displayName"] = "Smoke Bomb",
    },
    ["rocket_launcher"] = {
        ["image"] = "rbxassetid://7680994780",
        ["projectileSource"] = {
            ["activeReload"] = true,
            ["maxStrengthChargeSec"] = 0.25,
            ["ammoItemTypes"] = {
                [1] = "rocket_launcher_missile",
            },
            ["minStrengthScalar"] = 0.7692307692307692,
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://7681584765",
            },
            ["fireDelaySec"] = 2.2,
        },
        ["displayName"] = "Rocket Launcher",
    },
    ["rocket_launcher_missile"] = {
        ["image"] = "rbxassetid://7682148316",
        ["hotbarFillRight"] = true,
        ["displayName"] = "Rocket",
    },
    ["forcefield_potion"] = {
        ["image"] = "rbxassetid://8795406077",
        ["consumable"] = {
            ["cancelOnDamage"] = true,
            ["consumeTime"] = 0.1,
        },
        ["displayName"] = "Forcefield potion",
    },
    ["zipline_base"] = {
        ["image"] = "rbxassetid://7051148904",
        ["block"] = {
            ["breakType"] = "wood",
            ["placeSound"] = function () end,
            ["breakSound"] = function breakSound() end,
            ["blastProof"] = true,
            ["seeThrough"] = true,
            ["disableInventoryPickup"] = true,
            ["health"] = 20,
        },
        ["displayName"] = "Zipline Base",
    },
    ["jump_boots"] = {
        ["armor"] = {
            ["damageReductionMultiplier"] = 0.08,
            ["slot"] = 2,
        },
        ["image"] = "rbxassetid://7911163797",
        ["displayName"] = "Jump Boots",
    },
    ["emerald_helmet"] = {
        ["armor"] = {
            ["damageReductionMultiplier"] = 0.24,
            ["slot"] = 0,
        },
        ["image"] = "rbxassetid://6931675766",
        ["displayName"] = "Emerald Helmet",
    },
    ["giant_potion"] = {
        ["crafting"] = {
        },
        ["image"] = "rbxassetid://7911163626",
        ["consumable"] = {
            ["potion"] = true,
            ["consumeTime"] = 0.1,
        },
        ["displayName"] = "Giant Potion",
    },
    ["oak_log"] = {
        ["footstepSound"] = 2,
        ["block"] = {
            ["breakType"] = "wood",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockId"] = 17,
                },
                [2] = {
                    ["blockId"] = 35,
                },
                [3] = {
                    ["blockData"] = 8,
                    ["blockId"] = 159,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7884370351",
                    [2] = "rbxassetid://7884370351",
                    [3] = "rbxassetid://7843832942",
                    [4] = "rbxassetid://7843832942",
                    [5] = "rbxassetid://7843832942",
                    [6] = "rbxassetid://7843832942",
                },
            },
            ["health"] = 30,
        },
        ["image"] = "rbxassetid://7884370279",
        ["displayName"] = "Oak Log",
    },
    ["leather_chestplate"] = {
        ["armor"] = {
            ["damageReductionMultiplier"] = 0.16,
            ["slot"] = 1,
        },
        ["image"] = "rbxassetid://6876833204",
        ["displayName"] = "Leather Chestplate",
    },
    ["stone_slab"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 8,
                    ["blockId"] = 43,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://8105570960",
                    [2] = "rbxassetid://8105570960",
                    [3] = "rbxassetid://8105570960",
                    [4] = "rbxassetid://8105570960",
                    [5] = "rbxassetid://8105570960",
                    [6] = "rbxassetid://8105570960",
                },
            },
        },
        ["image"] = "rbxassetid://8105570787",
        ["displayName"] = "Stone Slab",
    },
    ["warrior_helmet"] = {
        ["armor"] = {
            ["damageReductionMultiplier"] = 0.2,
            ["slot"] = 0,
        },
        ["image"] = "rbxassetid://7343992908",
        ["displayName"] = "Warrior Helmet",
    },
    ["ember"] = {
        ["image"] = "rbxassetid://7343272545",
        ["kitItem"] = true,
        ["keepOnDeath"] = true,
        ["displayName"] = "Ember",
    },
    ["brewing_cauldron"] = {
        ["crafting"] = {
            ["recipes"] = {
                [1] = {
                    ["timeToCraft"] = 4,
                    ["ingredients"] = {
                        [1] = "mushrooms",
                        [2] = "mushrooms",
                        [3] = "mushrooms",
                    },
                    ["result"] = "sleep_splash_potion",
                },
                [2] = {
                    ["timeToCraft"] = 7,
                    ["ingredients"] = {
                        [1] = "thorns",
                        [2] = "thorns",
                        [3] = "flower",
                    },
                    ["result"] = "mini_shield",
                },
                [3] = {
                    ["timeToCraft"] = 5,
                    ["ingredients"] = {
                        [1] = "thorns",
                        [2] = "mushrooms",
                        [3] = "mushrooms",
                    },
                    ["result"] = "poison_splash_potion",
                },
                [4] = {
                    ["timeToCraft"] = 5,
                    ["ingredients"] = {
                        [1] = "flower",
                        [2] = "flower",
                        [3] = "flower",
                    },
                    ["result"] = "heal_splash_potion",
                },
            },
        },
        ["image"] = "rbxassetid://9134530108",
        ["block"] = {
            ["seeThrough"] = true,
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function breakSound() end,
            ["disableInventoryPickup"] = true,
            ["collectionServiceTags"] = {
                [1] = "brewing_cauldron",
            },
            ["unbreakableByTeammates"] = true,
            ["health"] = 25,
        },
        ["displayName"] = "Brewing Cauldron",
    },
    ["beehive"] = {
        ["block"] = {
            ["seeThrough"] = true,
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function breakSound() end,
            ["disableInventoryPickup"] = true,
            ["collectionServiceTags"] = {
                [1] = "beehive",
            },
            ["unbreakableByTeammates"] = true,
            ["health"] = 25,
        },
        ["kitItem"] = true,
        ["image"] = "rbxassetid://7343272692",
        ["displayName"] = "Beehive",
    },
    ["void_portal"] = {
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function breakSound() end,
            ["collectionServiceTags"] = {
                [1] = "VoidPortal",
            },
            ["seeThrough"] = true,
            ["health"] = 20,
        },
        ["displayName"] = "Void Portal",
    },
    ["diamond_pickaxe"] = {
        ["firstPerson"] = {
            ["verticalOffset"] = -0.8,
        },
        ["image"] = "rbxassetid://6875481462",
        ["breakBlock"] = {
            ["stone"] = 20,
        },
        ["displayName"] = "Diamond Pickaxe",
    },
    ["kobblak"] = {
        ["footstepSound"] = 4,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function breakSound() end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockId"] = 216,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://9859003198",
                    [2] = "rbxassetid://9859003198",
                    [3] = "rbxassetid://9859003106",
                    [4] = "rbxassetid://9859003106",
                    [5] = "rbxassetid://9859003106",
                    [6] = "rbxassetid://9859003106",
                },
            },
        },
        ["image"] = "rbxassetid://9859002988",
        ["displayName"] = "Kobblak",
    },
    ["player_vacuum"] = {
        ["image"] = "rbxassetid://9679750852",
        ["displayName"] = "Vacuum",
    },
    ["santa_bomb"] = {
        ["kitItem"] = true,
        ["maxStackSize"] = 3,
        ["projectileSource"] = {
            ["maxStrengthChargeSec"] = 1,
            ["walkSpeedMultiplier"] = 0.4,
            ["ammoItemTypes"] = {
                [1] = "santa_bomb",
            },
            ["minStrengthScalar"] = 0.3333333333333333,
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://6866223756",
            },
            ["fireDelaySec"] = 0.4,
        },
        ["image"] = "rbxassetid://8273495195",
        ["displayName"] = "Santa Strafe",
    },
    ["helicopter_deploy"] = {
        ["image"] = "rbxassetid://9559559860",
        ["consumable"] = {
            ["consumeTime"] = 0.1,
            ["disableAnimation"] = true,
            ["soundOverride"] = "None",
        },
        ["displayName"] = "Minicopter",
    },
    ["big_shield"] = {
        ["image"] = "rbxassetid://7863380423",
        ["consumable"] = {
            ["consumeTime"] = 0.1,
        },
        ["displayName"] = "Big Shield",
    },
    ["invisible_landmine"] = {
        ["image"] = "rbxassetid://9434319010",
        ["block"] = {
            ["placeSound"] = function () end,
            ["breakSound"] = function breakSound() end,
            ["maxPlaced"] = 6,
            ["breakType"] = "stone",
            ["health"] = 25,
            ["seeThrough"] = true,
            ["collectionServiceTags"] = {
                [1] = "invisible-landmine",
            },
            ["unbreakableByTeammates"] = true,
            ["disableInventoryPickup"] = true,
        },
        ["displayName"] = "Invisible Landmine",
    },
    ["damage_banner"] = {
        ["image"] = "rbxassetid://9557924197",
        ["block"] = {
            ["denyPlaceOn"] = true,
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function breakSound() end,
            ["maxPlaced"] = 1,
            ["breakType"] = "stone",
            ["health"] = 40,
            ["disableInventoryPickup"] = true,
            ["collectionServiceTags"] = {
                [1] = "flag-kit",
            },
            ["unbreakableByTeammates"] = true,
            ["seeThrough"] = true,
        },
        ["displayName"] = "Fire Banner",
    },
    ["tablet"] = {
        ["skins"] = {
            [1] = "lunar",
        },
        ["kitItem"] = true,
        ["image"] = "rbxassetid://7290617886",
        ["displayName"] = "Tablet",
    },
    ["infernal_saber"] = {
        ["image"] = "rbxassetid://9620506030",
        ["firstPerson"] = {
            ["scale"] = 0.8,
            ["verticalOffset"] = -1.2,
        },
        ["sword"] = {
            ["knockbackMultiplier"] = {
                ["horizontal"] = 0.5,
            },
            ["chargedAttack"] = {
                ["maxChargeTimeSec"] = 0.5,
                ["walkSpeedMultiplier"] = 0.85,
            },
            ["attackSpeed"] = 0.3,
            ["damage"] = 36,
        },
        ["kitItem"] = true,
        ["displayName"] = "Infernal Saber",
    },
    ["light_sword"] = {
        ["image"] = "rbxassetid://9620517732",
        ["firstPerson"] = {
            ["scale"] = 0.8,
        },
        ["sword"] = {
            ["chargedAttack"] = {
                ["chargeSlowDelay"] = 0.25,
                ["minCharge"] = 0.5,
                ["maxChargeTimeSec"] = 1,
                ["walkSpeedMultiplier"] = 0.5,
            },
            ["attackSpeed"] = 0.3,
            ["firstPersonChargedSwingAnimation"] = {
                [1] = 151,
            },
            ["knockbackMultiplier"] = {
                ["horizontal"] = 1,
            },
            ["chargedSwingAnimation"] = {
                [1] = 150,
            },
            ["damage"] = 42,
        },
        ["projectileSource"] = {
            ["maxStrengthChargeSec"] = 1,
            ["projectileType"] = function projectileType() end,
            ["walkSpeedMultiplier"] = 0.5,
            ["fireDelaySec"] = 0.3,
        },
        ["displayName"] = "Light Sword",
    },
    ["jump_potion"] = {
        ["image"] = "rbxassetid://7836794681",
        ["consumable"] = {
            ["potion"] = true,
            ["consumeTime"] = 0.1,
        },
        ["displayName"] = "Jump Potion",
    },
    ["mushrooms"] = {
        ["image"] = "rbxassetid://9134534696",
        ["displayName"] = "Mushrooms",
    },
    ["spruce_log"] = {
        ["footstepSound"] = 2,
        ["block"] = {
            ["breakType"] = "wood",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 1,
                    ["blockId"] = 17,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7884371731",
                    [2] = "rbxassetid://7884371731",
                    [3] = "rbxassetid://7843877369",
                    [4] = "rbxassetid://7843877369",
                    [5] = "rbxassetid://7843877369",
                    [6] = "rbxassetid://7843877369",
                },
            },
            ["health"] = 30,
        },
        ["image"] = "rbxassetid://7884371618",
        ["displayName"] = "Spruce Log",
    },
    ["thorns"] = {
        ["image"] = "rbxassetid://9134549615",
        ["displayName"] = "Thorns",
    },
    ["void_block"] = {
        ["footstepSound"] = 4,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function breakSound() end,
            ["collectionServiceTags"] = {
                [1] = "void_block",
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://9871962653",
                    [2] = "rbxassetid://9871962545",
                    [3] = "rbxassetid://9871962545",
                    [4] = "rbxassetid://9871962545",
                    [5] = "rbxassetid://9871962545",
                    [6] = "rbxassetid://9871962545",
                },
            },
        },
        ["image"] = "rbxassetid://9871961934",
        ["displayName"] = "Void Rock",
    },
    ["grass"] = {
        ["footstepSound"] = 0,
        ["block"] = {
            ["breakType"] = "grass",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockId"] = 2,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7911371279",
                    [2] = "rbxassetid://7843778275",
                    [3] = "rbxassetid://7911371120",
                    [4] = "rbxassetid://7911371120",
                    [5] = "rbxassetid://7911371120",
                    [6] = "rbxassetid://7911371120",
                },
            },
        },
        ["image"] = "rbxassetid://7911370722",
        ["displayName"] = "Grass",
    },
    ["cobblestone"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockId"] = 4,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://8296848659",
                    [2] = "rbxassetid://8296848659",
                    [3] = "rbxassetid://8296848659",
                    [4] = "rbxassetid://8296848659",
                    [5] = "rbxassetid://8296848659",
                    [6] = "rbxassetid://8296848659",
                },
            },
        },
        ["image"] = "rbxassetid://8296848529",
        ["displayName"] = "Cobbletone",
    },
    ["stone_player_block"] = {
        ["footstepSound"] = 0,
        ["block"] = {
            ["breakType"] = "grass",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://8536406963",
                },
            },
            ["seeThrough"] = true,
            ["health"] = 6,
            ["disableInventoryPickup"] = true,
        },
        ["displayName"] = "Stone Player Block",
    },
    ["broken_enchant_table"] = {
        ["block"] = {
            ["breakType"] = "wood",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["collectionServiceTags"] = {
                [1] = "broken-enchant-table",
            },
            ["health"] = 20,
        },
        ["displayName"] = "Broken Enchant Table",
    },
    ["iron_sword"] = {
        ["firstPerson"] = {
            ["scale"] = 0.8,
            ["verticalOffset"] = -1.2,
        },
        ["image"] = "rbxassetid://6875481281",
        ["sword"] = {
            ["attackSpeed"] = 0.3,
            ["damage"] = 30,
        },
        ["displayName"] = "Iron Sword",
    },
    ["clay_blue"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 11,
                    ["blockId"] = 251,
                },
            },
            ["health"] = 8,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7872903756",
                    [2] = "rbxassetid://7872903756",
                    [3] = "rbxassetid://7872903756",
                    [4] = "rbxassetid://7872903756",
                    [5] = "rbxassetid://7872903756",
                    [6] = "rbxassetid://7872903756",
                },
            },
        },
        ["image"] = "rbxassetid://7884367119",
        ["displayName"] = "Blue Clay",
    },
    ["firework_arrow"] = {
        ["image"] = "rbxassetid://8665953060",
        ["hotbarFillRight"] = true,
        ["displayName"] = "Firework Arrow",
    },
    ["granite"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 1,
                    ["blockId"] = 1,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://9072525939",
                    [2] = "rbxassetid://9072525939",
                    [3] = "rbxassetid://9072525939",
                    [4] = "rbxassetid://9072525939",
                    [5] = "rbxassetid://9072525939",
                    [6] = "rbxassetid://9072525939",
                },
            },
        },
        ["image"] = "rbxassetid://9072553261",
        ["displayName"] = "Granite",
    },
    ["wood_dao"] = {
        ["image"] = "rbxassetid://8665070999",
        ["daoSword"] = {
            ["armorMultiplier"] = 0.8,
            ["dashDamage"] = 18,
        },
        ["firstPerson"] = {
            ["scale"] = 0.8,
            ["verticalOffset"] = -1.2,
        },
        ["skins"] = {
            [1] = "tiger",
        },
        ["sword"] = {
            ["daoDash"] = true,
            ["attackSpeed"] = 0.3,
            ["damage"] = 20,
        },
        ["kitItem"] = true,
        ["displayName"] = "Wood Dao",
    },
    ["lasso"] = {
        ["projectileSource"] = {
            ["firstPerson"] = {
                ["fireAnimation"] = 6,
                ["aimAnimation"] = 15,
            },
            ["maxStrengthChargeSec"] = 0.5,
            ["minStrengthScalar"] = 0.5,
            ["fireDelaySec"] = 10,
            ["walkSpeedMultiplier"] = 0.25,
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://7192289548",
            },
            ["hitSounds"] = {
                [1] = {
                    [1] = "rbxassetid://7192289603",
                },
            },
        },
        ["kitItem"] = true,
        ["image"] = "rbxassetid://7192710930",
        ["displayName"] = "Lasso",
    },
    ["time_bomb_potion"] = {
        ["crafting"] = {
            ["recipe"] = {
                ["timeToCraft"] = 3,
                ["ingredients"] = {
                    [1] = "emerald_block",
                    [2] = "emerald_block",
                    [3] = "emerald_block",
                },
                ["result"] = "time_bomb_potion",
            },
        },
        ["image"] = "rbxassetid://9135921093",
        ["consumable"] = {
            ["potion"] = true,
            ["consumeTime"] = 0.1,
        },
        ["displayName"] = "Time Bomb Potion",
    },
    ["pie"] = {
        ["skins"] = {
            [1] = "spirit",
        },
        ["image"] = "rbxassetid://6985761399",
        ["consumable"] = {
            ["consumeTime"] = 0.1,
        },
        ["displayName"] = "Speed Pie",
    },
    ["diamond_helmet"] = {
        ["armor"] = {
            ["damageReductionMultiplier"] = 0.2,
            ["slot"] = 0,
        },
        ["image"] = "rbxassetid://6874272793",
        ["displayName"] = "Diamond Helmet",
    },
    ["knockback_fish"] = {
        ["firstPerson"] = {
            ["scale"] = 0.8,
        },
        ["image"] = "rbxassetid://7976208326",
        ["sword"] = {
            ["swingSounds"] = {
                [1] = "rbxassetid://7396760496",
            },
            ["knockbackMultiplier"] = {
                ["horizontal"] = 2,
            },
            ["attackSpeed"] = 0.3,
            ["damage"] = 1,
        },
        ["displayName"] = "Knockback Fish",
    },
    ["mass_hammer"] = {
        ["image"] = "rbxassetid://8938480294",
        ["sword"] = {
            ["attackSpeed"] = 1.5,
            ["knockbackMultiplier"] = {
                ["vertical"] = 1.2,
                ["horizontal"] = 1.2,
            },
            ["respectAttackSpeedForEffects"] = true,
            ["respectAttackSpeedOnServer"] = true,
            ["attackRange"] = 15,
            ["swingSounds"] = {
            },
            ["setLastAttackOnEveryHit"] = true,
            ["cooldown"] = {
                ["cooldownBar"] = {
                    ["color"] = Color3.new(0.631373, 0.380392, 0.0588235),
                },
            },
            ["damage"] = 35,
        },
        ["displayName"] = "Mass Hammer",
    },
    ["battle_axe"] = {
        ["image"] = "rbxassetid://8795403259",
        ["sword"] = {
            ["attackSpeed"] = 2,
            ["knockbackMultiplier"] = {
                ["horizontal"] = 2,
            },
            ["respectAttackSpeedForEffects"] = true,
            ["respectAttackSpeedOnServer"] = true,
            ["attackRange"] = 21,
            ["swingSounds"] = {
            },
            ["setLastAttackOnEveryHit"] = true,
            ["cooldown"] = {
                ["cooldownBar"] = {
                    ["color"] = Color3.new(0.94902, 0.811765, 0.0392157),
                },
            },
            ["damage"] = 50,
        },
        ["displayName"] = "Battle Axe",
    },
    ["smoke_block"] = {
        ["kitItem"] = true,
        ["footstepSound"] = 0,
        ["block"] = {
            ["seeThrough"] = true,
            ["breakType"] = "grass",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["health"] = 6,
            ["collectionServiceTags"] = {
                [1] = "smoke_block",
            },
            ["maxPlaced"] = 20,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://8536406963",
                },
            },
        },
        ["image"] = "rbxassetid://8538034673",
        ["displayName"] = "Smoke Block",
    },
    ["diamond"] = {
        ["displayNameColor"] = Color3.new(0.333333, 1, 1),
        ["image"] = "rbxassetid://6850538161",
        ["hotbarFillRight"] = true,
        ["displayName"] = "Diamond",
    },
    ["scythe"] = {
        ["firstPerson"] = {
            ["scale"] = 0.8,
            ["verticalOffset"] = -1.2,
        },
        ["image"] = "rbxassetid://8479270510",
        ["sword"] = {
            ["idleAnimation"] = 83,
            ["knockbackMultiplier"] = {
                ["vertical"] = 2,
                ["horizontal"] = 1.3,
            },
            ["swingAnimations"] = {
                [1] = 84,
            },
            ["attackSpeed"] = 1,
            ["damage"] = 70,
        },
        ["displayName"] = "Scythe",
    },
    ["tornado_launcher"] = {
        ["thirdPerson"] = {
        },
        ["image"] = "rbxassetid://9193792144",
        ["projectileSource"] = {
            ["launchScreenShake"] = true,
            ["fireDelaySec"] = 3,
            ["thirdPerson"] = {
                ["fireAnimation"] = 138,
                ["aimAnimation"] = 137,
            },
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://9252994838",
            },
            ["activeReload"] = true,
        },
        ["displayName"] = "Tornado Launcher",
    },
    ["slime_block"] = {
        ["footstepSound"] = 3,
        ["image"] = "rbxassetid://8273432599",
        ["block"] = {
            ["elasticity"] = {
                ["elasticityPercent"] = 0.7,
                ["bounceSound"] = "rbxassetid://6857999096",
            },
            ["breakType"] = "wool",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function breakSound() end,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7843866346",
                    [2] = "rbxassetid://7843866346",
                    [3] = "rbxassetid://7843866346",
                    [4] = "rbxassetid://7843866346",
                    [5] = "rbxassetid://7843866346",
                    [6] = "rbxassetid://7843866346",
                },
            },
            ["health"] = 1,
            ["fallDamageMultiplier"] = 0,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockId"] = 165,
                },
            },
        },
        ["displayName"] = "Slime Block",
    },
    ["hammer"] = {
        ["kitItem"] = true,
        ["image"] = "rbxassetid://6955848801",
        ["fortifiesBlock"] = {
        },
        ["displayName"] = "Hammer",
    },
    ["wool_purple"] = {
        ["footstepSound"] = 3,
        ["block"] = {
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7923578873",
                    [2] = "rbxassetid://7923578873",
                    [3] = "rbxassetid://7923578873",
                    [4] = "rbxassetid://7923578873",
                    [5] = "rbxassetid://7923578873",
                    [6] = "rbxassetid://7923578873",
                },
            },
            ["breakType"] = "wool",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function breakSound() end,
            ["health"] = 10,
            ["blastResistance"] = 0.8,
            ["wool"] = true,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 10,
                    ["blockId"] = 35,
                },
            },
        },
        ["image"] = "rbxassetid://7923578762",
        ["displayName"] = "Purple Wool",
    },
    ["popup_cube"] = {
        ["image"] = "rbxassetid://7976208116",
        ["projectileSource"] = {
            ["maxStrengthChargeSec"] = 0.25,
            ["ammoItemTypes"] = {
                [1] = "popup_cube",
            },
            ["minStrengthScalar"] = 0.7692307692307692,
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://6760544639",
            },
            ["fireDelaySec"] = 0.4,
        },
        ["displayName"] = "Popup Tower",
    },
    ["wood_sword"] = {
        ["firstPerson"] = {
            ["scale"] = 0.8,
            ["verticalOffset"] = -1.2,
        },
        ["image"] = "rbxassetid://6875480974",
        ["sword"] = {
            ["attackSpeed"] = 0.3,
            ["damage"] = 20,
        },
        ["displayName"] = "Wood Sword",
    },
    ["ceramic"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["blastProof"] = true,
            ["health"] = 1,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7852095211",
                    [2] = "rbxassetid://7852095211",
                    [3] = "rbxassetid://7852095211",
                    [4] = "rbxassetid://7852095211",
                    [5] = "rbxassetid://7852095211",
                    [6] = "rbxassetid://7852095211",
                },
            },
        },
        ["image"] = "rbxassetid://7884366622",
        ["displayName"] = "Blastproof Ceramic",
    },
    ["stone_axe"] = {
        ["firstPerson"] = {
            ["verticalOffset"] = -0.8,
        },
        ["image"] = "rbxassetid://6875481224",
        ["breakBlock"] = {
            ["wood"] = 8,
        },
        ["displayName"] = "Stone Axe",
    },
    ["frosted_snowball"] = {
        ["projectileSource"] = {
            ["minStrengthScalar"] = 0.7692307692307692,
            ["ammoItemTypes"] = {
                [1] = "frosted_snowball",
            },
            ["maxStrengthChargeSec"] = 0.25,
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://8165640372",
            },
            ["fireDelaySec"] = 0.15,
        },
        ["image"] = "rbxassetid://7911163294",
        ["kitItem"] = true,
        ["displayName"] = "Frosted Snowball",
    },
    ["spirit"] = {
        ["image"] = "rbxassetid://7498308261",
        ["maxStackSize"] = 5,
        ["projectileSource"] = {
            ["maxStrengthChargeSec"] = 0.25,
            ["ammoItemTypes"] = {
                [1] = "spirit",
            },
            ["minStrengthScalar"] = 0.7692307692307692,
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://6866223756",
            },
            ["fireDelaySec"] = 0.6,
        },
        ["kitItem"] = true,
        ["displayName"] = "Spirit",
    },
    ["gumdrop_bounce_pad"] = {
        ["image"] = "rbxassetid://8270466544",
        ["kitItem"] = true,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["collectionServiceTags"] = {
                [1] = "launch-pad",
            },
            ["seeThrough"] = true,
            ["health"] = 1,
        },
        ["displayName"] = "Gumdrop Bounce Pad",
    },
    ["sandstone"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 0,
                    ["blockId"] = 24,
                },
            },
            ["health"] = 8,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7872908360",
                    [2] = "rbxassetid://7872908360",
                    [3] = "rbxassetid://7872908360",
                    [4] = "rbxassetid://7872908360",
                    [5] = "rbxassetid://7872908360",
                    [6] = "rbxassetid://7872908360",
                },
            },
        },
        ["image"] = "rbxassetid://7884371048",
        ["displayName"] = "Sandstone",
    },
    ["galactite"] = {
        ["footstepSound"] = 4,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function breakSound() end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockId"] = 87,
                },
            },
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://9839888622",
                    [2] = "rbxassetid://9839888622",
                    [3] = "rbxassetid://9839888622",
                    [4] = "rbxassetid://9839888622",
                    [5] = "rbxassetid://9839888622",
                    [6] = "rbxassetid://9839888622",
                },
            },
        },
        ["image"] = "rbxassetid://9839887907",
        ["displayName"] = "Galactite",
    },
    ["guitar"] = {
        ["skins"] = {
            [1] = "rockstar",
        },
        ["kitItem"] = true,
        ["image"] = "rbxassetid://7085044606",
        ["displayName"] = "Guitar",
    },
    ["diamond_sword"] = {
        ["firstPerson"] = {
            ["scale"] = 0.8,
            ["verticalOffset"] = -1.2,
        },
        ["image"] = "rbxassetid://6875481413",
        ["sword"] = {
            ["attackSpeed"] = 0.3,
            ["damage"] = 42,
        },
        ["displayName"] = "Diamond Sword",
    },
    ["wood_crossbow"] = {
        ["skins"] = {
            [1] = "demon_empress_vanessa",
        },
        ["projectileSource"] = {
            ["multiShotChargeTime"] = 1.3,
            ["fireDelaySec"] = 1.15,
            ["projectileType"] = function projectileType() end,
            ["hitSounds"] = {
                [1] = {
                    [1] = "rbxassetid://6866062188",
                },
            },
            ["reload"] = {
                ["reloadSound"] = {
                    [1] = "rbxassetid://6869254094",
                },
            },
            ["ammoItemTypes"] = {
                [1] = "firework_arrow",
                [2] = "arrow",
            },
            ["walkSpeedMultiplier"] = 0.35,
            ["thirdPerson"] = {
                ["fireAnimation"] = 117,
                ["aimAnimation"] = 116,
            },
            ["launchSound"] = {
                [1] = "rbxassetid://6866062104",
            },
            ["firstPerson"] = {
                ["fireAnimation"] = 9,
                ["aimAnimation"] = 8,
            },
        },
        ["image"] = "rbxassetid://6869295265",
        ["displayName"] = "Crossbow",
    },
    ["break_speed_axolotl"] = {
        ["image"] = "rbxassetid://7863779927",
        ["displayName"] = "Break Speed Axolotl",
    },
    ["swap_ball"] = {
        ["image"] = "rbxassetid://7681107021",
        ["projectileSource"] = {
            ["fireDelaySec"] = 0.15,
            ["maxStrengthChargeSec"] = 0.25,
            ["ammoItemTypes"] = {
                [1] = "swap_ball",
            },
            ["minStrengthScalar"] = 0.7692307692307692,
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://6866223756",
            },
            ["firstPerson"] = {
                ["fireAnimation"] = 6,
            },
        },
        ["displayName"] = "Swap Ball",
    },
    ["wood_axe"] = {
        ["firstPerson"] = {
            ["verticalOffset"] = -0.8,
        },
        ["image"] = "rbxassetid://6875481089",
        ["breakBlock"] = {
            ["wood"] = 4,
        },
        ["displayName"] = "Wood Axe",
    },
    ["jade_hammer"] = {
        ["firstPerson"] = {
            ["verticalOffset"] = -1.2,
        },
        ["kitItem"] = true,
        ["image"] = "rbxassetid://7343272236",
        ["displayName"] = "Jade Hammer",
    },
    ["smoke_grenade"] = {
        ["image"] = "rbxassetid://7681033200",
        ["projectileSource"] = {
            ["fireDelaySec"] = 0.4,
            ["maxStrengthChargeSec"] = 1,
            ["walkSpeedMultiplier"] = 0.4,
            ["ammoItemTypes"] = {
                [1] = "smoke_grenade",
            },
            ["minStrengthScalar"] = 0.3333333333333333,
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://6866062104",
            },
            ["firstPerson"] = {
            },
        },
        ["displayName"] = "Smoke Grenade",
    },
    ["big_head_potion"] = {
        ["image"] = "rbxassetid://9192325186",
        ["consumable"] = {
            ["potion"] = true,
            ["consumeTime"] = 0.1,
        },
        ["displayName"] = "Big Head Potion",
    },
    ["wool_red"] = {
        ["footstepSound"] = 3,
        ["block"] = {
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7852365915",
                    [2] = "rbxassetid://7852365915",
                    [3] = "rbxassetid://7852365915",
                    [4] = "rbxassetid://7852365915",
                    [5] = "rbxassetid://7852365915",
                    [6] = "rbxassetid://7852365915",
                },
            },
            ["breakType"] = "wool",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function breakSound() end,
            ["health"] = 10,
            ["blastResistance"] = 0.8,
            ["wool"] = true,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 14,
                    ["blockId"] = 35,
                },
            },
        },
        ["image"] = "rbxassetid://7923579098",
        ["displayName"] = "Red Wool",
    },
    ["black_hole_bomb"] = {
        ["image"] = "rbxassetid://7976208473",
        ["projectileSource"] = {
            ["maxStrengthChargeSec"] = 0.25,
            ["ammoItemTypes"] = {
                [1] = "black_hole_bomb",
            },
            ["minStrengthScalar"] = 0.7692307692307692,
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://6760544639",
            },
            ["fireDelaySec"] = 0.4,
        },
        ["displayName"] = "Black Hole",
    },
    ["dino_deploy"] = {
        ["image"] = "rbxassetid://9855535867",
        ["consumable"] = {
            ["consumeTime"] = 0.1,
            ["disableAnimation"] = true,
            ["soundOverride"] = "None",
        },
        ["displayName"] = "Dino",
    },
    ["big_wood_sword"] = {
        ["firstPerson"] = {
        },
        ["image"] = "rbxassetid://6875480974",
        ["sword"] = {
            ["knockbackMultiplier"] = {
                ["vertical"] = 2,
            },
            ["attackSpeed"] = 0.3,
            ["damage"] = 20,
        },
        ["displayName"] = "Big Wood Sword",
    },
    ["rageblade"] = {
        ["image"] = "rbxassetid://7051149237",
        ["kitItem"] = true,
        ["skins"] = {
            [1] = "deep_void",
            [2] = "victorious",
        },
        ["sword"] = {
            ["attackSpeed"] = 0.24,
            ["damage"] = 65,
        },
        ["firstPerson"] = {
            ["scale"] = 0.8,
            ["verticalOffset"] = -1.2,
        },
        ["displayName"] = "Rageblade",
    },
    ["health_regen_axolotl"] = {
        ["image"] = "rbxassetid://7863780097",
        ["displayName"] = "Health Regen Axolotl",
    },
    ["shears"] = {
        ["image"] = "rbxassetid://7261638571",
        ["breakBlock"] = {
            ["wool"] = 5,
        },
        ["displayName"] = "Shears",
    },
    ["stone_sword"] = {
        ["firstPerson"] = {
            ["scale"] = 0.8,
            ["verticalOffset"] = -1.2,
        },
        ["image"] = "rbxassetid://6875481137",
        ["sword"] = {
            ["attackSpeed"] = 0.3,
            ["damage"] = 25,
        },
        ["displayName"] = "Stone Sword",
    },
    ["clay_white"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 0,
                    ["blockId"] = 251,
                },
                [2] = {
                    ["blockData"] = 0,
                    ["blockId"] = 159,
                },
            },
            ["health"] = 8,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7872907773",
                    [2] = "rbxassetid://7872907773",
                    [3] = "rbxassetid://7872907773",
                    [4] = "rbxassetid://7872907773",
                    [5] = "rbxassetid://7872907773",
                    [6] = "rbxassetid://7872907773",
                },
            },
        },
        ["image"] = "rbxassetid://7884368439",
        ["displayName"] = "White Clay",
    },
    ["lucky_block_trap"] = {
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function breakSound() end,
            ["blastProof"] = true,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7843813175",
                    [2] = "rbxassetid://7843813175",
                    [3] = "rbxassetid://7843813175",
                    [4] = "rbxassetid://7843813175",
                    [5] = "rbxassetid://7843813175",
                    [6] = "rbxassetid://7843813175",
                },
            },
            ["disableInventoryPickup"] = true,
            ["health"] = 15,
        },
        ["image"] = "rbxassetid://7884370012",
        ["displayName"] = "Lucky Block Trap",
    },
    ["iron_axe"] = {
        ["firstPerson"] = {
            ["verticalOffset"] = -0.8,
        },
        ["image"] = "rbxassetid://6875481370",
        ["breakBlock"] = {
            ["wood"] = 12,
        },
        ["displayName"] = "Iron Axe",
    },
    ["arrow"] = {
        ["image"] = "rbxassetid://6869295400",
        ["hotbarFillRight"] = true,
        ["displayName"] = "Arrow",
    },
    ["clay_light_brown"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 12,
                    ["blockId"] = 159,
                },
                [2] = {
                    ["blockData"] = 12,
                    ["blockId"] = 251,
                },
                [3] = {
                    ["blockData"] = 1,
                    ["blockId"] = 3,
                },
            },
            ["health"] = 8,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7872905675",
                    [2] = "rbxassetid://7872905675",
                    [3] = "rbxassetid://7872905675",
                    [4] = "rbxassetid://7872905675",
                    [5] = "rbxassetid://7872905675",
                    [6] = "rbxassetid://7872905675",
                },
            },
        },
        ["image"] = "rbxassetid://7884367792",
        ["displayName"] = "Light Brown Clay",
    },
    ["throwable_bridge"] = {
        ["projectileSource"] = {
            ["ammoItemTypes"] = {
                [1] = "throwable_bridge",
            },
            ["minStrengthScalar"] = 0.7692307692307692,
            ["projectileType"] = function projectileType() end,
            ["maxStrengthChargeSec"] = 0.25,
            ["fireDelaySec"] = 0.15,
        },
        ["displayName"] = "Portable Bridge",
    },
    ["mini_shield"] = {
        ["image"] = "rbxassetid://7863380185",
        ["consumable"] = {
            ["consumeTime"] = 0.1,
        },
        ["displayName"] = "Mini Shield",
    },
    ["warrior_boots"] = {
        ["armor"] = {
            ["damageReductionMultiplier"] = 0.08,
            ["slot"] = 2,
        },
        ["image"] = "rbxassetid://7343993019",
        ["displayName"] = "Warrior Boots",
    },
    ["diamond_axe"] = {
        ["firstPerson"] = {
            ["verticalOffset"] = -0.8,
        },
        ["image"] = "rbxassetid://6883832539",
        ["breakBlock"] = {
            ["wood"] = 17,
        },
        ["displayName"] = "Diamond Axe",
    },
    ["fireball"] = {
        ["projectileSource"] = {
            ["thirdPerson"] = {
                ["fireAnimation"] = 1,
            },
            ["fireDelaySec"] = 1,
            ["maxStrengthChargeSec"] = 0.25,
            ["ammoItemTypes"] = {
                [1] = "fireball",
            },
            ["minStrengthScalar"] = 0.7692307692307692,
            ["projectileType"] = function projectileType() end,
            ["launchSound"] = {
                [1] = "rbxassetid://7192289445",
            },
            ["firstPerson"] = {
                ["fireAnimation"] = 6,
            },
        },
        ["image"] = "rbxassetid://7192711008",
        ["displayName"] = "Fireball",
    },
    ["clay"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockId"] = 82,
                },
            },
            ["health"] = 8,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7861526072",
                    [2] = "rbxassetid://7861526072",
                    [3] = "rbxassetid://7861526072",
                    [4] = "rbxassetid://7861526072",
                    [5] = "rbxassetid://7861526072",
                    [6] = "rbxassetid://7861526072",
                },
            },
        },
        ["image"] = "rbxassetid://7884366829",
        ["displayName"] = "Clay",
    },
    ["defense_banner"] = {
        ["image"] = "rbxassetid://9557924054",
        ["block"] = {
            ["denyPlaceOn"] = true,
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function breakSound() end,
            ["maxPlaced"] = 1,
            ["breakType"] = "stone",
            ["health"] = 40,
            ["disableInventoryPickup"] = true,
            ["collectionServiceTags"] = {
                [1] = "flag-kit",
            },
            ["unbreakableByTeammates"] = true,
            ["seeThrough"] = true,
        },
        ["displayName"] = "Defense Banner",
    },
    ["hang_glider"] = {
        ["image"] = "rbxassetid://8216181054",
        ["maxStackSize"] = 1,
        ["spawnCommandDisabled"] = false,
        ["firstPerson"] = {
            ["scale"] = 0.7,
        },
        ["displayName"] = "Hang Glider",
    },
    ["glass"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function () end,
            ["breakSound"] = function () end,
            ["seeThrough"] = true,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockId"] = 20,
                },
                [2] = {
                    ["blockData"] = 0,
                    ["blockId"] = 95,
                },
                [3] = {
                    ["blockData"] = 1,
                    ["blockId"] = 95,
                },
                [4] = {
                    ["blockData"] = 2,
                    ["blockId"] = 95,
                },
                [5] = {
                    ["blockData"] = 3,
                    ["blockId"] = 95,
                },
                [6] = {
                    ["blockData"] = 4,
                    ["blockId"] = 95,
                },
                [7] = {
                    ["blockData"] = 5,
                    ["blockId"] = 95,
                },
                [8] = {
                    ["blockData"] = 6,
                    ["blockId"] = 95,
                },
                [9] = {
                    ["blockData"] = 7,
                    ["blockId"] = 95,
                },
                [10] = {
                    ["blockData"] = 8,
                    ["blockId"] = 95,
                },
                [11] = {
                    ["blockData"] = 9,
                    ["blockId"] = 95,
                },
                [12] = {
                    ["blockData"] = 10,
                    ["blockId"] = 95,
                },
                [13] = {
                    ["blockData"] = 11,
                    ["blockId"] = 95,
                },
                [14] = {
                    ["blockData"] = 12,
                    ["blockId"] = 95,
                },
                [15] = {
                    ["blockData"] = 13,
                    ["blockId"] = 95,
                },
                [16] = {
                    ["blockData"] = 14,
                    ["blockId"] = 95,
                },
                [17] = {
                    ["blockData"] = 15,
                    ["blockId"] = 95,
                },
            },
            ["health"] = 1,
        },
        ["image"] = "rbxassetid://6909521321",
        ["displayName"] = "Glass",
    },
    ["clay_orange"] = {
        ["footstepSound"] = 1,
        ["block"] = {
            ["breakType"] = "stone",
            ["placeSound"] = function placeSound() end,
            ["breakSound"] = function () end,
            ["minecraftConversions"] = {
                [1] = {
                    ["blockData"] = 1,
                    ["blockId"] = 159,
                },
                [2] = {
                    ["blockData"] = 1,
                    ["blockId"] = 251,
                },
            },
            ["health"] = 8,
            ["greedyMesh"] = {
                ["textures"] = {
                    [1] = "rbxassetid://7872906273",
                    [2] = "rbxassetid://7872906273",
                    [3] = "rbxassetid://7872906273",
                    [4] = "rbxassetid://7872906273",
                    [5] = "rbxassetid://7872906273",
                    [6] = "rbxassetid://7872906273",
                },
            },
        },
        ["image"] = "rbxassetid://7884367973",
        ["displayName"] = "Orange Clay",
    },
}

return {
    getItemMeta = function(p1)
        return v12[p1]
    end
};
