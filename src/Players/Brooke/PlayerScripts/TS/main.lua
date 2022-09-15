-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__GameCoreClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameCoreClient;
local l__LobbyClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "lobby").out).LobbyClient;
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "log").out);
local l__default__5 = v4.default;
local v6 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__7 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
local l__AbilityMeta__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local l__QueueMeta__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local l__GameThemeOverrides__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").GameThemeOverrides;
local l__PlaceUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
l__default__5.SetLogger(v4.Logger:configure():WriteTo(l__default__5.RobloxOutput()):Create());
v1.async(function()
	local v12 = v1.await(v1.Promise.new(function(p1)
		p1(v1.import(script, script.Parent, "ui", "store"));
	end));
	local v13 = l__GameCoreClient__2.new(l__PlaceUtil__11.isProduction(), v12.ClientStore, {
		abilityMeta = l__AbilityMeta__8, 
		uiThemeOverrides = l__GameThemeOverrides__10
	});
	local v14 = l__LobbyClient__3.new(l__QueueMeta__9, v12.ClientStore);
	v13:registerApps(v1.await(v1.Promise.new(function(p2)
		p2(v1.import(script, script.Parent, "ui", "apps"));
	end)).AppConfiguration);
	v1.await(v1.Promise.new(function(p3)
		p3(v1.import(script, script.Parent, "knit"));
	end)).setup();
	local v15 = v1.await(v1.Promise.new(function(p4)
		p4(v1.import(script, script.Parent, "flamework"));
	end));
	local v16 = {};
	local v17 = #v16;
	local v18 = v13:getFlameworkDependencies();
	local v19 = #v18;
	table.move(v18, 1, v19, v17 + 1, v16);
	local v20 = v14:getFlameworkDependencies();
	table.move(v20, 1, #v20, v17 + v19 + 1, v16);
	v15.setup(v16);
	v6("BoolValue", {
		Parent = l__Workspace__7, 
		Value = true, 
		Name = "ClientFlameReady"
	});
end)();
