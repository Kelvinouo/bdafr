
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "rodux").src);
local v3 = {
	Inventory = v1.import(script, script.Parent.Parent, "controllers", "global", "inventory", "reducers", "inventory-reducer").InventoryReducer, 
	App = v1.import(script, script.Parent, "rodux", "reducers", "app-reducer").AppReducer, 
	Game = v1.import(script, script.Parent, "rodux", "reducers", "games", "game-reducer").GameReducer, 
	Bedwars = v1.import(script, script.Parent, "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer, 
	Kit = v1.import(script, script.Parent, "rodux", "reducers", "games", "kit-reducer").KitReducer, 
	Leaderboard = v1.import(script, script.Parent, "rodux", "reducers", "leaderboard-reducer").LeaderboardReducer, 
	TabList = v1.import(script, script.Parent, "rodux", "reducers", "tab-list-reducer").TabListReducer, 
	Locker = v1.import(script, script.Parent, "rodux", "reducers", "locker-reducer").LockerReducer, 
	BattlePass = v1.import(script, script.Parent, "rodux", "reducers", "battle-pass-reducer").BattlePassReducer, 
	Settings = v1.import(script, script.Parent, "rodux", "reducers", "settings-reducer").SettingsReducer, 
	SocialConnections = v1.import(script, script.Parent, "rodux", "reducers", "social-connections-reducer").SocialConnectionsReducer, 
	GameUpdates = v1.import(script, script.Parent, "rodux", "reducers", "game-updates-reducer").GameUpdatesReducer, 
	CustomMatch = v1.import(script, script.Parent, "rodux", "reducers", "games", "custom-match-reducer").CustomMatchReducer, 
	Clans = v1.import(script, script.Parent, "rodux", "reducers", "clan-reducer").ClansReducer, 
	ThemedEvent = v1.import(script, script.Parent, "rodux", "reducers", "games", "themed-event-reducer").ThemedEventReducer
};
for v4, v5 in pairs(v1.import(script, v1.getModule(script, "@easy-games", "lobby").out).LobbyClientReducerMap) do
	v3[v4] = v5;
end;
for v6, v7 in pairs(v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameCoreReducerMap) do
	v3[v6] = v7;
end;
local v8 = v2.combineReducers(v3);
return {
	StoreReducer = v8, 
	ClientStore = v2.Store.new(v8, {})
};

