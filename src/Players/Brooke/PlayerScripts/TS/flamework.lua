-- Script Hash: 261960944b432b9f1c0362a78d48ba9022d6ef449943dc35da66c7a93ea7e98e8279aaa8bf30c15000c5f0635baa7085
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Flamework__1 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__PlaceUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
return {
	setup = function(p1)
		local function v2(p2)
			l__Flamework__1.registerExternalClass(p2);
		end;
		for v3, v4 in ipairs(p1) do
			v2(v4, v3 - 1, p1);
		end;
		l__Flamework__1._addPaths({ "StarterPlayer", "StarterPlayerScripts", "TS", "controllers", "global" });
		l__Flamework__1._addPaths({ "ReplicatedStorage", "TS", "strollers" });
		if l__PlaceUtil__2.isLobbyServer() then
			l__Flamework__1._addPaths({ "StarterPlayer", "StarterPlayerScripts", "TS", "controllers", "lobby" });
		end;
		if l__PlaceUtil__2.isGameServer() then
			l__Flamework__1._addPaths({ "StarterPlayer", "StarterPlayerScripts", "TS", "controllers", "game" });
			l__Flamework__1._addPaths({ "StarterPlayer", "StarterPlayerScripts", "TS", "controllers", "games", "bedwars" });
		end;
		l__Flamework__1.ignite();
	end
};
