-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BattlePassSeason__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-seasons").BattlePassSeason;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__LobbyGadgetType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType;
return {
	LobbyGadgetMeta = {
		[l__LobbyGadgetType__4.NONE] = {
			name = "None"
		}, 
		[l__LobbyGadgetType__4.HANG_GLIDER] = {
			name = "Hang Glider", 
			items = { {
					itemType = l__ItemType__3.HANG_GLIDER, 
					amount = 1, 
					refillable = true
				} }
		}, 
		[l__LobbyGadgetType__4.RAGEBLADE] = {
			name = "Rageblade", 
			items = { {
					itemType = l__ItemType__3.RAGEBLADE
				} }, 
			unlockedInBattlePass = true, 
			battlepassSeason = l__BattlePassSeason__2.season3
		}, 
		[l__LobbyGadgetType__4.SNOW_BALL] = {
			name = "Snow Ball", 
			items = { {
					itemType = l__ItemType__3.SNOWBALL, 
					amount = 3, 
					refillable = true
				} }, 
			unlockedInBattlePass = true, 
			battlepassSeason = l__BattlePassSeason__2.season3
		}, 
		[l__LobbyGadgetType__4.JUMP_BOOTS] = {
			name = "Jump Boots", 
			items = { {
					itemType = l__ItemType__3.JUMP_BOOTS
				} }, 
			unlockedInBattlePass = true, 
			battlepassSeason = l__BattlePassSeason__2.season3
		}, 
		[l__LobbyGadgetType__4.SPEED_BOOTS] = {
			name = "Speed Boots", 
			items = { {
					itemType = l__ItemType__3.SPEED_BOOTS
				} }, 
			unlockedInBattlePass = true, 
			battlepassSeason = l__BattlePassSeason__2.season3
		}, 
		[l__LobbyGadgetType__4.JADE_HAMMER] = {
			name = "Jade Hammer", 
			items = { {
					itemType = l__ItemType__3.JADE_HAMMER
				} }, 
			unlockedInBattlePass = true, 
			battlepassSeason = l__BattlePassSeason__2.season4
		}, 
		[l__LobbyGadgetType__4.FREIYA_ICE_SWORD] = {
			name = "Freiya Ice Sword", 
			items = { {
					itemType = l__ItemType__3.ICE_SWORD
				} }, 
			unlockedInBattlePass = true, 
			battlepassSeason = l__BattlePassSeason__2.season4
		}, 
		[l__LobbyGadgetType__4.RAVEN] = {
			name = "Raven", 
			items = { {
					itemType = l__ItemType__3.RAVEN, 
					amount = 1, 
					refillable = true
				} }, 
			unlockedInBattlePass = true, 
			battlepassSeason = l__BattlePassSeason__2.season4
		}, 
		[l__LobbyGadgetType__4.INFERNAL_SABER] = {
			name = "Infernal Saber", 
			items = { {
					itemType = l__ItemType__3.HELL_SABER, 
					amount = 1
				} }
		}, 
		[l__LobbyGadgetType__4.LIGHT_SWORD] = {
			name = "Light Sword", 
			items = { {
					itemType = l__ItemType__3.HEAVENLY_SWORD, 
					amount = 1
				} }
		}, 
		[l__LobbyGadgetType__4.GRAPPLING_HOOK] = {
			name = "Grappling Hook", 
			items = { {
					itemType = l__ItemType__3.GRAPPLING_HOOK, 
					amount = 1
				} }
		}, 
		[l__LobbyGadgetType__4.VOID_SWORD] = {
			name = "Void Sword", 
			items = { {
					itemType = l__ItemType__3.VOID_SWORD, 
					amount = 1
				} }
		}, 
		[l__LobbyGadgetType__4.SCYTHE] = {
			name = "Scythe", 
			items = { {
					itemType = l__ItemType__3.SCYTHE, 
					amount = 1
				} }
		}, 
		[l__LobbyGadgetType__4.BLUNDERBUSS] = {
			name = "Blunderbuss", 
			image = "rbxassetid://10722841562", 
			items = { {
					itemType = l__ItemType__3.BLUNDERBUSS, 
					amount = 1
				} }
		}, 
		[l__LobbyGadgetType__4.CUTLASS_GHOST] = {
			name = "Ghost Cutlass", 
			image = "rbxassetid://10729541018", 
			items = { {
					itemType = l__ItemType__3.CUTLASS_GHOST, 
					amount = 1
				} }
		}
	}
};
