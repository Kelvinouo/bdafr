-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ColorUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__PlaceId__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "place-id").PlaceId;
local l__GlickoCategory__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "glicko-category").GlickoCategory;
local l__RankCategory__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-category").RankCategory;
local l__Theme__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__GameType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local l__Maps__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-list").Maps;
local l__MapType__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-type").MapType;
local l__QueueType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local l__TeamColorHex__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex;
local u1 = {
	[l__QueueType__10.BEDWARS_TEST] = {
		title = "BedWars (Testing)", 
		eventText = "<font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__6.mcGreen) .. "\"><b>POPULAR!!</b></font>", 
		teams = { {
				id = "1", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Blue"
			}, {
				id = "2", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.red, 
				displayName = "Red"
			}, {
				id = "3", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.green, 
				displayName = "Green"
			}, {
				id = "4", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.yellow, 
				displayName = "Yellow"
			} }, 
		maps = { "to4_Factory" }, 
		queueSize = {
			min = 1, 
			max = 4
		}, 
		disableInCustom = true, 
		placeId = l__PlaceId__3.GAME_MEGA, 
		game = l__GameType__7.BEDWARS
	}, 
	[l__QueueType__10.BEDWARS_TO1] = {
		title = "BedWars (Solo)", 
		teams = { {
				id = "1", 
				maxPlayers = 1, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Blue"
			}, {
				id = "2", 
				maxPlayers = 1, 
				colorHex = l__TeamColorHex__11.red, 
				displayName = "Red"
			}, {
				id = "3", 
				maxPlayers = 1, 
				colorHex = l__TeamColorHex__11.green, 
				displayName = "Green"
			}, {
				id = "4", 
				maxPlayers = 1, 
				colorHex = l__TeamColorHex__11.yellow, 
				displayName = "Yellow"
			}, {
				id = "5", 
				maxPlayers = 1, 
				colorHex = l__TeamColorHex__11.orange, 
				displayName = "Orange"
			}, {
				id = "6", 
				maxPlayers = 1, 
				colorHex = l__TeamColorHex__11.pink, 
				displayName = "Pink"
			}, {
				id = "7", 
				maxPlayers = 1, 
				colorHex = l__TeamColorHex__11.cyan, 
				displayName = "Cyan"
			}, {
				id = "8", 
				maxPlayers = 1, 
				colorHex = l__TeamColorHex__11.purple, 
				displayName = "Purple"
			} }, 
		maps = l__Maps__8[l__MapType__9.BEDWARS_DOUBLES], 
		queueSize = {
			min = 1, 
			max = 1
		}, 
		disableInCustom = true, 
		placeId = l__PlaceId__3.GAME_MICRO, 
		game = l__GameType__7.BEDWARS
	}, 
	[l__QueueType__10.BEDWARS_TO2] = {
		title = "BedWars (Doubles)", 
		teams = { {
				id = "1", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Blue"
			}, {
				id = "2", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.red, 
				displayName = "Red"
			}, {
				id = "3", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.green, 
				displayName = "Green"
			}, {
				id = "4", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.yellow, 
				displayName = "Yellow"
			}, {
				id = "5", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.orange, 
				displayName = "Orange"
			}, {
				id = "6", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.pink, 
				displayName = "Pink"
			}, {
				id = "7", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.cyan, 
				displayName = "Cyan"
			}, {
				id = "8", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.purple, 
				displayName = "Purple"
			} }, 
		maps = l__Maps__8[l__MapType__9.BEDWARS_DOUBLES], 
		queueSize = {
			min = 1, 
			max = 2
		}, 
		disabled = false, 
		disabledMessage = "DISABLED", 
		placeId = l__PlaceId__3.GAME, 
		game = l__GameType__7.BEDWARS
	}, 
	[l__QueueType__10.BEDWARS_TO4] = {
		title = "BedWars (Squads)", 
		eventText = "<font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__6.mcGreen) .. "\"><b>POPULAR!!</b></font>", 
		teams = { {
				id = "1", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Blue"
			}, {
				id = "2", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.red, 
				displayName = "Red"
			}, {
				id = "3", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.green, 
				displayName = "Green"
			}, {
				id = "4", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.yellow, 
				displayName = "Yellow"
			} }, 
		maps = l__Maps__8[l__MapType__9.BEDWARS_SQUADS], 
		queueSize = {
			min = 1, 
			max = 4
		}, 
		placeId = l__PlaceId__3.GAME, 
		game = l__GameType__7.BEDWARS
	}, 
	[l__QueueType__10.BEDWARS_20v20] = {
		title = "BedWars (30v30)", 
		eventText = "\240\159\154\128 <font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__6.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\154\128", 
		teams = { {
				id = "1", 
				maxPlayers = 30, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Blue"
			}, {
				id = "2", 
				maxPlayers = 30, 
				colorHex = l__TeamColorHex__11.red, 
				displayName = "Red"
			} }, 
		maps = l__Maps__8[l__MapType__9.BEDWARS_THIRTY_VS_THIRTY], 
		queueSize = {
			min = 1, 
			max = 8
		}, 
		ignorePlayFabTeamMatching = true, 
		placeId = l__PlaceId__3.GAME_MEGA, 
		game = l__GameType__7.BEDWARS
	}, 
	[l__QueueType__10.BEDWARS_20v20_LB] = {
		title = "Lucky Block (30v30)", 
		eventText = "\226\156\168 <font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__6.mcAqua) .. "\">LIMITED TIME MODE!</font> \226\156\168", 
		teams = { {
				id = "1", 
				maxPlayers = 30, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Blue"
			}, {
				id = "2", 
				maxPlayers = 30, 
				colorHex = l__TeamColorHex__11.red, 
				displayName = "Red"
			} }, 
		maps = l__Maps__8[l__MapType__9.BEDWARS_THIRTY_VS_THIRTY], 
		queueSize = {
			min = 1, 
			max = 8
		}, 
		ignorePlayFabTeamMatching = true, 
		placeId = l__PlaceId__3.GAME_MEGA, 
		game = l__GameType__7.BEDWARS, 
		luckyBlock = true
	}, 
	[l__QueueType__10.BEDWARS_DISASTERS_20v20] = {
		title = "Disasters (30v30)", 
		eventText = "\240\159\154\128 <font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__6.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\154\128", 
		teams = { {
				id = "1", 
				maxPlayers = 30, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Blue"
			}, {
				id = "2", 
				maxPlayers = 30, 
				colorHex = l__TeamColorHex__11.red, 
				displayName = "Red"
			} }, 
		maps = l__Maps__8[l__MapType__9.BEDWARS_THIRTY_VS_THIRTY], 
		queueSize = {
			min = 1, 
			max = 8
		}, 
		ignorePlayFabTeamMatching = true, 
		placeId = l__PlaceId__3.GAME_MEGA, 
		game = l__GameType__7.BEDWARS, 
		disasters = true, 
		disabled = true
	}, 
	[l__QueueType__10.BEDWARS_MEGA] = {
		title = "Bed Royale (100 PLAYERS)", 
		eventText = "\240\159\154\128 <font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__6.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\154\128", 
		teams = { {
				id = "1", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Blue Alpha"
			}, {
				id = "2", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.red, 
				displayName = "Red Alpha"
			}, {
				id = "3", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.green, 
				displayName = "Green Alpha"
			}, {
				id = "4", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.yellow, 
				displayName = "Yellow Alpha"
			}, {
				id = "5", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.orange, 
				displayName = "Orange Alpha"
			}, {
				id = "6", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.pink, 
				displayName = "Pink Alpha"
			}, {
				id = "7", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.cyan, 
				displayName = "Cyan Alpha"
			}, {
				id = "8", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.purple, 
				displayName = "Purple Alpha"
			}, {
				id = "9", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.lightBlue + 10, 
				displayName = "Blue Beta"
			}, {
				id = "10", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.red + 10, 
				displayName = "Red Beta"
			}, {
				id = "11", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.green + 10, 
				displayName = "Green Beta"
			}, {
				id = "12", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.yellow + 10, 
				displayName = "Yellow Beta"
			}, {
				id = "13", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.orange + 10, 
				displayName = "Orange Beta"
			}, {
				id = "14", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.pink + 10, 
				displayName = "Pink Beta"
			}, {
				id = "15", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.cyan + 10, 
				displayName = "Cyan Beta"
			}, {
				id = "16", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.purple + 10, 
				displayName = "Purple Beta"
			}, {
				id = "17", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.lightBlue + 20, 
				displayName = "Blue Charlie"
			}, {
				id = "18", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.red + 20, 
				displayName = "Red Charlie"
			}, {
				id = "19", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.green + 20, 
				displayName = "Green Charlie"
			}, {
				id = "20", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.yellow + 20, 
				displayName = "Yellow Charlie"
			}, {
				id = "21", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.orange + 20, 
				displayName = "Orange Charlie"
			}, {
				id = "22", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.pink + 20, 
				displayName = "Pink Charlie"
			}, {
				id = "23", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.cyan + 20, 
				displayName = "Cyan Charlie"
			}, {
				id = "24", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.purple + 20, 
				displayName = "Purple Charlie"
			} }, 
		maps = l__Maps__8[l__MapType__9.ROYALE], 
		queueSize = {
			min = 1, 
			max = 4
		}, 
		ignorePlayFabTeamMatching = true, 
		matchStartTime = 60, 
		placeId = l__PlaceId__3.GAME_MEGA, 
		game = l__GameType__7.BEDWARS
	}, 
	[l__QueueType__10.BEDWARS_DUELS] = {
		title = "Duels (2v2)", 
		eventText = "\240\159\165\179 <font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__6.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\165\179", 
		teams = { {
				id = "1", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Blue"
			}, {
				id = "2", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.red, 
				displayName = "Red"
			} }, 
		maps = l__Maps__8[l__MapType__9.BEDWARS_DUELS], 
		queueSize = {
			min = 1, 
			max = 2
		}, 
		disableLeaderboardProgression = true, 
		placeId = l__PlaceId__3.GAME_MICRO, 
		disabled = false, 
		game = l__GameType__7.BEDWARS
	}, 
	[l__QueueType__10.BEDWARS_LUCKY_BLOCK] = {
		title = "Lucky Block (Squads)", 
		teams = { {
				id = "1", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Blue"
			}, {
				id = "2", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.red, 
				displayName = "Red"
			}, {
				id = "3", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.green, 
				displayName = "Green"
			}, {
				id = "4", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.yellow, 
				displayName = "Yellow"
			} }, 
		maps = l__Maps__8[l__MapType__9.BEDWARS_SQUADS], 
		queueSize = {
			min = 1, 
			max = 4
		}, 
		disableLeaderboardProgression = true, 
		placeId = l__PlaceId__3.GAME, 
		game = l__GameType__7.BEDWARS, 
		luckyBlock = true
	}, 
	[l__QueueType__10.BEDWARS_LUCKY_BLOCK_TO2] = {
		title = "Lucky Block (Doubles)", 
		teams = { {
				id = "1", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Blue"
			}, {
				id = "2", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.red, 
				displayName = "Red"
			}, {
				id = "3", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.green, 
				displayName = "Green"
			}, {
				id = "4", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.yellow, 
				displayName = "Yellow"
			}, {
				id = "5", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.orange, 
				displayName = "Orange"
			}, {
				id = "6", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.pink, 
				displayName = "Pink"
			}, {
				id = "7", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.cyan, 
				displayName = "Cyan"
			}, {
				id = "8", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.purple, 
				displayName = "Purple"
			} }, 
		maps = l__Maps__8[l__MapType__9.BEDWARS_DOUBLES], 
		queueSize = {
			min = 1, 
			max = 2
		}, 
		disableLeaderboardProgression = true, 
		placeId = l__PlaceId__3.GAME, 
		game = l__GameType__7.BEDWARS, 
		luckyBlock = true
	}, 
	[l__QueueType__10.BEDWARS_RANKED_BETA] = {
		title = "Ranked (Squads)", 
		eventText = "BETA SEASON", 
		teams = { {
				id = "1", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Blue"
			}, {
				id = "2", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.red, 
				displayName = "Red"
			}, {
				id = "3", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.green, 
				displayName = "Green"
			}, {
				id = "4", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.yellow, 
				displayName = "Yellow"
			} }, 
		maps = l__Maps__8[l__MapType__9.BEDWARS_SQUADS], 
		queueSize = {
			min = 1, 
			max = 4
		}, 
		disableInCustom = true, 
		glickoCategory = l__GlickoCategory__4.RANKED_BETA, 
		rankCategory = l__RankCategory__5.RANKED_BETA, 
		placeId = l__PlaceId__3.GAME, 
		game = l__GameType__7.BEDWARS
	}, 
	[l__QueueType__10.BEDWARS_RANKED_S4] = {
		title = "Ranked (Squads)", 
		eventText = "SEASON 4", 
		teams = { {
				id = "1", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Blue"
			}, {
				id = "2", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.red, 
				displayName = "Red"
			}, {
				id = "3", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.green, 
				displayName = "Green"
			}, {
				id = "4", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.yellow, 
				displayName = "Yellow"
			} }, 
		maps = l__Maps__8[l__MapType__9.BEDWARS_SQUADS], 
		queueSize = {
			min = 1, 
			max = 4
		}, 
		disableInCustom = true, 
		glickoCategory = l__GlickoCategory__4.RANKED_S4, 
		rankCategory = l__RankCategory__5.RANKED_S4, 
		placeId = l__PlaceId__3.GAME, 
		game = l__GameType__7.BEDWARS
	}, 
	[l__QueueType__10.BEDWARS_RANKED_S5] = {
		title = "Ranked (Squads)", 
		eventText = "SEASON 5", 
		teams = { {
				id = "1", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Blue"
			}, {
				id = "2", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.red, 
				displayName = "Red"
			}, {
				id = "3", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.green, 
				displayName = "Green"
			}, {
				id = "4", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.yellow, 
				displayName = "Yellow"
			} }, 
		maps = l__Maps__8[l__MapType__9.BEDWARS_SQUADS], 
		queueSize = {
			min = 1, 
			max = 4
		}, 
		disableInCustom = true, 
		minWinReq = 100, 
		glickoCategory = l__GlickoCategory__4.RANKED_S5, 
		rankCategory = l__RankCategory__5.RANKED_S5, 
		placeId = l__PlaceId__3.GAME, 
		game = l__GameType__7.BEDWARS
	}, 
	[l__QueueType__10.BEDWARS_VOICE_CHAT] = {
		title = "BedWars (Squads)", 
		eventText = "\240\159\148\138 VOICE CHAT ONLY \240\159\148\138", 
		teams = { {
				id = "1", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Blue"
			}, {
				id = "2", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.red, 
				displayName = "Red"
			}, {
				id = "3", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.green, 
				displayName = "Green"
			}, {
				id = "4", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.yellow, 
				displayName = "Yellow"
			} }, 
		maps = l__Maps__8[l__MapType__9.BEDWARS_SQUADS], 
		queueSize = {
			min = 1, 
			max = 4
		}, 
		voiceChatOnly = true, 
		disableInCustom = true, 
		game = l__GameType__7.BEDWARS, 
		placeId = l__PlaceId__3.GAME
	}, 
	[l__QueueType__10.INFECTED] = {
		title = "\226\154\160 Infected \226\154\160", 
		eventText = "\240\159\167\159\226\128\141\226\153\128\239\184\143 <font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__6.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\167\159\226\128\141\226\153\130\239\184\143", 
		teams = { {
				id = "1", 
				maxPlayers = 30, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Humans"
			}, {
				id = "2", 
				maxPlayers = 5, 
				colorHex = l__TeamColorHex__11.red, 
				displayName = "Infected"
			} }, 
		maps = l__Maps__8[l__MapType__9.INFECTED], 
		queueSize = {
			min = 1, 
			max = 16
		}, 
		disableLeaderboardProgression = true, 
		game = l__GameType__7.INFECTED, 
		ignorePlayFabTeamMatching = true, 
		ignoreBaseStats = true, 
		placeId = l__PlaceId__3.GAME_MEGA, 
		winConInfoHud = "Win at 12:00"
	}, 
	[l__QueueType__10.SKYWARS_TO2] = {
		title = "SkyWars (Doubles)", 
		eventText = "\226\154\148\239\184\143 <font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__6.mcRed) .. "\">FAST PACED!</font> \226\154\148\239\184\143", 
		teams = { {
				id = "1", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Blue"
			}, {
				id = "2", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.red, 
				displayName = "Red"
			}, {
				id = "3", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.green, 
				displayName = "Green"
			}, {
				id = "4", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.yellow, 
				displayName = "Yellow"
			}, {
				id = "5", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.orange, 
				displayName = "Orange"
			}, {
				id = "6", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.pink, 
				displayName = "Pink"
			}, {
				id = "7", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.cyan, 
				displayName = "Cyan"
			}, {
				id = "8", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.purple, 
				displayName = "Purple"
			}, {
				id = "9", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.black, 
				displayName = "Black"
			}, {
				id = "10", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.gray, 
				displayName = "Gray"
			}, {
				id = "11", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.lime, 
				displayName = "Lime"
			}, {
				id = "12", 
				maxPlayers = 2, 
				colorHex = l__TeamColorHex__11.brown, 
				displayName = "Brown"
			} }, 
		maps = l__Maps__8[l__MapType__9.SKYWARS], 
		queueSize = {
			min = 1, 
			max = 2
		}, 
		disabled = false, 
		game = l__GameType__7.SKYWARS, 
		noKits = true, 
		alivePlayersCountHud = true, 
		placeId = l__PlaceId__3.GAME
	}, 
	[l__QueueType__10.SKYWARS_TO4] = {
		title = "SkyWars (Squads)", 
		eventText = "\226\154\148\239\184\143 <font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__6.mcGreen) .. "\">FAST PACED!</font> \226\154\148\239\184\143", 
		teams = { {
				id = "1", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Blue"
			}, {
				id = "2", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.red, 
				displayName = "Red"
			}, {
				id = "3", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.green, 
				displayName = "Green"
			}, {
				id = "4", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.yellow, 
				displayName = "Yellow"
			}, {
				id = "5", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.orange, 
				displayName = "Orange"
			}, {
				id = "6", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.pink, 
				displayName = "Pink"
			}, {
				id = "7", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.cyan, 
				displayName = "Cyan"
			}, {
				id = "8", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.purple, 
				displayName = "Purple"
			} }, 
		maps = l__Maps__8[l__MapType__9.SKYWARS_SQUADS], 
		queueSize = {
			min = 1, 
			max = 4
		}, 
		disabled = false, 
		game = l__GameType__7.SKYWARS, 
		noKits = true, 
		alivePlayersCountHud = true, 
		placeId = l__PlaceId__3.GAME
	}, 
	[l__QueueType__10.SURVIVAL] = {
		title = "Penguin Survival V2", 
		eventText = "\240\159\144\167 <font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__6.mcPink) .. "\">Limited Time Event!</font> \240\159\144\167", 
		teams = { {
				id = "1", 
				maxPlayers = 10, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Alive"
			} }, 
		maps = l__Maps__8[l__MapType__9.PVE], 
		queueSize = {
			min = 1, 
			max = 10
		}, 
		disabled = false, 
		noKits = false, 
		game = l__GameType__7.SURVIVAL, 
		disableLeaderboardProgression = true, 
		ignorePlayFabTeamMatching = true, 
		ignoreBaseStats = true, 
		placeId = l__PlaceId__3.GAME, 
		winConInfoHud = "Win at Wave 10", 
		disableInCustom = false
	}, 
	[l__QueueType__10.JUGGERNAUT_TDM] = {
		title = "Juggernaut TDM", 
		eventText = "\240\159\154\168 <font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__6.mcRed) .. "\">LIMITED TIME MODE!</font> \240\159\154\168", 
		teams = { {
				id = "1", 
				maxPlayers = 30, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Blue"
			}, {
				id = "2", 
				maxPlayers = 30, 
				colorHex = l__TeamColorHex__11.red, 
				displayName = "Red"
			} }, 
		maps = {}, 
		queueSize = {
			min = 1, 
			max = 8
		}, 
		ignorePlayFabTeamMatching = true, 
		placeId = l__PlaceId__3.GAME_MEGA, 
		game = l__GameType__7.JUGGERNAUT, 
		winConInfoHud = "Ends at 10:00", 
		scoresHud = true, 
		disableInCustom = true
	}, 
	[l__QueueType__10.BEDWARS_DISASTERS_TO4] = {
		title = "Disasters (Squads)", 
		eventText = "\240\159\148\165 <font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__6.mcRed) .. "\">LIMITED TIME MODE!</font> \240\159\148\165", 
		teams = { {
				id = "1", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Blue"
			}, {
				id = "2", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.red, 
				displayName = "Red"
			}, {
				id = "3", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.green, 
				displayName = "Green"
			}, {
				id = "4", 
				maxPlayers = 4, 
				colorHex = l__TeamColorHex__11.yellow, 
				displayName = "Yellow"
			} }, 
		maps = l__Maps__8[l__MapType__9.BEDWARS_SQUADS], 
		queueSize = {
			min = 1, 
			max = 4
		}, 
		placeId = l__PlaceId__3.GAME, 
		game = l__GameType__7.BEDWARS, 
		disasters = true
	}, 
	[l__QueueType__10.FLAG_CAPTURE] = {
		title = "Capture the Flag", 
		eventText = "\240\159\154\168 <font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__6.mcRed) .. "\">LIMITED TIME MODE!</font> \240\159\154\168", 
		teams = { {
				id = "1", 
				maxPlayers = 12, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Blue"
			}, {
				id = "2", 
				maxPlayers = 12, 
				colorHex = l__TeamColorHex__11.yellow, 
				displayName = "Yellow"
			} }, 
		maps = l__Maps__8[l__MapType__9.FLAG_CAPTURE_MAP_TYPE], 
		queueSize = {
			min = 1, 
			max = 12
		}, 
		noKits = true, 
		placeId = l__PlaceId__3.GAME, 
		game = l__GameType__7.FLAG_CAPTURE, 
		noTopHud = true, 
		winConInfoHud = "Ends at 20:00"
	}, 
	[l__QueueType__10.GUN_GAME] = {
		title = "Gun Game", 
		eventText = "\240\159\148\165 <font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__6.mcGreen) .. "\"><b>LIMITED TIME MODE!</b></font> \240\159\148\165", 
		teams = { {
				id = "1", 
				maxPlayers = 1, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Blue Alpha"
			}, {
				id = "2", 
				maxPlayers = 1, 
				colorHex = l__TeamColorHex__11.red, 
				displayName = "Red Alpha"
			}, {
				id = "3", 
				maxPlayers = 1, 
				colorHex = l__TeamColorHex__11.green, 
				displayName = "Green Alpha"
			}, {
				id = "4", 
				maxPlayers = 1, 
				colorHex = l__TeamColorHex__11.yellow, 
				displayName = "Yellow Alpha"
			}, {
				id = "5", 
				maxPlayers = 1, 
				colorHex = l__TeamColorHex__11.orange, 
				displayName = "Orange Alpha"
			}, {
				id = "6", 
				maxPlayers = 1, 
				colorHex = l__TeamColorHex__11.pink, 
				displayName = "Pink Alpha"
			}, {
				id = "7", 
				maxPlayers = 1, 
				colorHex = l__TeamColorHex__11.cyan, 
				displayName = "Cyan Alpha"
			}, {
				id = "8", 
				maxPlayers = 1, 
				colorHex = l__TeamColorHex__11.purple, 
				displayName = "Purple Alpha"
			}, {
				id = "9", 
				maxPlayers = 1, 
				colorHex = l__TeamColorHex__11.lightBlue + 10, 
				displayName = "Blue Beta"
			}, {
				id = "10", 
				maxPlayers = 1, 
				colorHex = l__TeamColorHex__11.red + 10, 
				displayName = "Red Beta"
			}, {
				id = "11", 
				maxPlayers = 1, 
				colorHex = l__TeamColorHex__11.green + 10, 
				displayName = "Green Beta"
			}, {
				id = "12", 
				maxPlayers = 1, 
				colorHex = l__TeamColorHex__11.yellow + 10, 
				displayName = "Yellow Beta"
			} }, 
		maps = l__Maps__8[l__MapType__9.GUN_GAME], 
		ignorePlayFabTeamMatching = true, 
		queueSize = {
			min = 1, 
			max = 6
		}, 
		noKits = true, 
		placeId = l__PlaceId__3.GAME, 
		game = l__GameType__7.GUN_GAME, 
		noTopHud = true, 
		autoQueue = true
	}, 
	[l__QueueType__10.ROYALE] = {
		title = "Battle Royale", 
		eventText = "\240\159\154\167 <font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__6.mcAqua) .. "\">PUBLIC BETA!</font> \240\159\154\167", 
		teams = {}, 
		maps = {}, 
		queueSize = {
			min = 1, 
			max = 4
		}, 
		ignorePlayFabTeamMatching = true, 
		placeId = l__PlaceId__3.ROYALE, 
		game = l__GameType__7.BEDWARS, 
		disabled = false, 
		disableInCustom = true, 
		disableLeaderboardProgression = true
	}, 
	[l__QueueType__10.TNT_WARS] = {
		title = "TNT Wars", 
		eventText = "\240\159\148\165 <font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__6.mcGreen) .. "\"><b>LIMITED TIME MODE!</b></font> \240\159\148\165", 
		placeId = l__PlaceId__3.GAME, 
		game = l__GameType__7.TNT_WARS, 
		teams = { {
				id = "1", 
				maxPlayers = 8, 
				colorHex = l__TeamColorHex__11.lightBlue, 
				displayName = "Blue"
			}, {
				id = "2", 
				maxPlayers = 8, 
				colorHex = l__TeamColorHex__11.yellow, 
				displayName = "Yellow"
			} }, 
		maps = l__Maps__8[l__MapType__9.TNT_WARS], 
		queueSize = {
			min = 1, 
			max = 8
		}, 
		noKits = true, 
		noTopHud = true
	}
};
return {
	getQueueMeta = function(p1)
		return u1[p1];
	end, 
	StudioQueueType = l__QueueType__10.BEDWARS_TO4, 
	QueueMeta = u1
};
