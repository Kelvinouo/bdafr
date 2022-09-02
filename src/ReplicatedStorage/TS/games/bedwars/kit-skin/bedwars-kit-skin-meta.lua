-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__DevProduct__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "devproduct").DevProduct;
local l__BedwarsKit__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__BedwarsKitSkin__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
return {
	BedwarsKitSkinMeta = {
		[l__BedwarsKitSkin__5.DEFAULT] = {
			name = "", 
			kit = nil, 
			renderImage = ""
		}, 
		[l__BedwarsKitSkin__5.BARBARIAN_DEEP_VOID] = {
			name = "Deep Void Barbarian", 
			kit = l__BedwarsKit__4.BARBARIAN, 
			itemSkins = { {
					itemType = l__ItemType__2.RAGEBLADE, 
					name = "deep_void"
				} }, 
			renderImage = "rbxassetid://9166325225"
		}, 
		[l__BedwarsKitSkin__5.BARBARIAN_VICTORIOUS] = {
			name = "Victorious Barbarian", 
			kit = l__BedwarsKit__4.BARBARIAN, 
			itemSkins = { {
					itemType = l__ItemType__2.RAGEBLADE, 
					name = "victorious"
				} }, 
			renderImage = "rbxassetid://9192775228"
		}, 
		[l__BedwarsKitSkin__5.AXOLOTL_REINDEER] = {
			name = "Reindeer Trainer Amy", 
			kit = l__BedwarsKit__4.AXOLOTL, 
			renderImage = "rbxassetid://9224797101"
		}, 
		[l__BedwarsKitSkin__5.TRIPLE_SHOT_DEMON_EMPRESS] = {
			name = "Demon Empress Vanessa", 
			kit = l__BedwarsKit__4.TRIPLE_SHOT, 
			product = {
				priceRobux = 799, 
				devProductId = l__DevProduct__3.TRIPLE_SHOT_DEMON_EMPRESS
			}, 
			itemSkins = { {
					itemType = l__ItemType__2.FEATHER_BOW, 
					name = "demon_empress_vanessa"
				}, {
					itemType = l__ItemType__2.WOOD_BOW, 
					name = "demon_empress_vanessa"
				}, {
					itemType = l__ItemType__2.WOOD_CROSSBOW, 
					name = "demon_empress_vanessa"
				} }, 
			renderImage = "rbxassetid://9166325649"
		}, 
		[l__BedwarsKitSkin__5.VULCAN_LUNAR] = {
			name = "Lunar Vulcan", 
			kit = l__BedwarsKit__4.VULCAN, 
			itemSkins = { {
					itemType = l__ItemType__2.TABLET, 
					name = "lunar"
				}, {
					itemType = l__ItemType__2.CAMERA_TURRET, 
					name = "lunar"
				} }, 
			renderImage = "rbxassetid://9166325906"
		}, 
		[l__BedwarsKitSkin__5.FREIYA_TIGER_BRAWLER] = {
			name = "Tiger Brawler Freiya", 
			kit = l__BedwarsKit__4.ICE_QUEEN, 
			itemSkins = { {
					itemType = l__ItemType__2.ICE_SWORD, 
					name = "tiger_brawler"
				} }, 
			renderImage = "rbxassetid://9166325781"
		}, 
		[l__BedwarsKitSkin__5.DASHER_TIGER] = {
			name = "Year of the Tiger Yuzi", 
			kit = l__BedwarsKit__4.DASHER, 
			itemSkins = { {
					itemType = l__ItemType__2.WOOD_DAO, 
					name = "tiger"
				}, {
					itemType = l__ItemType__2.STONE_DAO, 
					name = "tiger"
				}, {
					itemType = l__ItemType__2.IRON_DAO, 
					name = "tiger"
				}, {
					itemType = l__ItemType__2.DIAMOND_DAO, 
					name = "tiger"
				}, {
					itemType = l__ItemType__2.EMERALD_DAO, 
					name = "tiger"
				} }, 
			renderImage = "rbxassetid://9166335120"
		}, 
		[l__BedwarsKitSkin__5.MINER_SPACE] = {
			name = "Space Miner", 
			kit = l__BedwarsKit__4.MINER, 
			itemSkins = { {
					itemType = l__ItemType__2.MINER_PICKAXE, 
					name = "space"
				} }, 
			renderImage = "rbxassetid://9166325362"
		}, 
		[l__BedwarsKitSkin__5.ACADEMY_AERY] = {
			name = "Academy Aery", 
			kit = l__BedwarsKit__4.AERY, 
			renderImage = "rbxassetid://9166325448"
		}, 
		[l__BedwarsKitSkin__5.MELODY_ROCKSTAR] = {
			name = "Rockstar Melody", 
			kit = l__BedwarsKit__4.MELODY, 
			renderImage = "rbxassetid://9252528354", 
			itemSkins = { {
					itemType = l__ItemType__2.GUITAR, 
					name = "rockstar"
				} }, 
			product = {
				devProductId = l__DevProduct__3.ROCKSTAR_MELODY, 
				priceRobux = 799
			}
		}, 
		[l__BedwarsKitSkin__5.BAKER_SPIRIT] = {
			name = "Spirit Baker", 
			kit = l__BedwarsKit__4.BAKER, 
			renderImage = "rbxassetid://9312838776", 
			itemSkins = { {
					itemType = l__ItemType__2.APPLE, 
					name = "spirit"
				}, {
					itemType = l__ItemType__2.PIE, 
					name = "spirit"
				} }
		}, 
		[l__BedwarsKitSkin__5.AXOLOTL_EASTER_BUNNY] = {
			name = "Easter Bunny Amy", 
			kit = l__BedwarsKit__4.AXOLOTL, 
			renderImage = "rbxassetid://9378298315", 
			product = {
				devProductId = l__DevProduct__3.EASTER_BUNNY_AMY, 
				priceRobux = 799
			}
		}, 
		[l__BedwarsKitSkin__5.FARMER_CLETUS_SPIRIT] = {
			name = "Spirit Farmer Cletus", 
			kit = l__BedwarsKit__4.FARMER_CLETUS, 
			renderImage = "rbxassetid://9439139472", 
			product = {
				devProductId = l__DevProduct__3.FARMER_CLETUS_SPIRIT_SKIN, 
				priceRobux = 799
			}
		}, 
		[l__BedwarsKitSkin__5.CYBER_DJ] = {
			name = "DJ Cyber", 
			kit = l__BedwarsKit__4.CYBER, 
			renderImage = "rbxassetid://9742654484", 
			product = {
				devProductId = l__DevProduct__3.CYBER_DJ, 
				priceRobux = 799
			}
		}, 
		[l__BedwarsKitSkin__5.YUZI_VICTORIOUS] = {
			name = "Victorious Yuzi", 
			kit = l__BedwarsKit__4.DASHER, 
			renderImage = "rbxassetid://9966080881", 
			itemSkins = { {
					itemType = l__ItemType__2.WOOD_DAO, 
					name = "victorious"
				}, {
					itemType = l__ItemType__2.STONE_DAO, 
					name = "victorious"
				}, {
					itemType = l__ItemType__2.IRON_DAO, 
					name = "victorious"
				}, {
					itemType = l__ItemType__2.DIAMOND_DAO, 
					name = "victorious"
				}, {
					itemType = l__ItemType__2.EMERALD_DAO, 
					name = "victorious"
				} }
		}, 
		[l__BedwarsKitSkin__5.SPIRIT_ASSASSIN_PRISMATIC] = {
			name = "Prismatic Evelynn", 
			kit = l__BedwarsKit__4.SPIRIT_ASSASSIN, 
			renderImage = "rbxassetid://10406965612"
		}, 
		[l__BedwarsKitSkin__5.HANNAH_GHOST] = {
			name = "Ghost Hannah", 
			kit = l__BedwarsKit__4.HANNAH, 
			renderImage = "rbxassetid://10726577552"
		}, 
		[l__BedwarsKitSkin__5.BIGMAN_SPIRIT] = {
			name = "Spirit Elder Tree", 
			kit = l__BedwarsKit__4.BIGMAN, 
			renderImage = "rbxassetid://10726576554", 
			product = {
				devProductId = l__DevProduct__3.SPIRIT_ELDER_TREE, 
				priceRobux = 799
			}
		}, 
		[l__BedwarsKitSkin__5.DAVEY_GHOST] = {
			name = "Ghost Davey", 
			kit = l__BedwarsKit__4.DAVEY, 
			renderImage = "rbxassetid://10736244575"
		}
	}
};
