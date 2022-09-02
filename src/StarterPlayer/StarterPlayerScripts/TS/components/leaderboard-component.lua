-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes");
local v3 = setmetatable({}, {
	__tostring = function()
		return "LeaderboardComponent";
	end
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local l__GetAttribute__1 = v2.GetAttribute;
local u2 = v2.Attribute.new("LeaderboardName", v1.import(script, v1.getModule(script, "@rbxts", "t").lib.ts).t.string);
local l__ClientStore__3 = v1.import(script, script.Parent.Parent, "ui", "store").ClientStore;
local l__CreateRoduxApp__4 = v1.import(script, script.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__LeaderboardUIWrapper__5 = v1.import(script, script.Parent.Parent, "controllers", "lobby", "leaderboard", "ui", "leaderboard-core").LeaderboardUIWrapper;
function v3.constructor(p1, p2)
	local u6 = l__GetAttribute__1(p2, u2);
	while l__ClientStore__3:getState().Leaderboard.leaderboards[u6] == nil do
		wait(0.1);	
	end;
	p1.roactTree = l__CreateRoduxApp__4("LeaderboardApp", l__LeaderboardUIWrapper__5, {
		LeaderboardName = u6
	}, {}, {
		Parent = p2
	});
end;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
function v3.Destroy(p3)
	u7.unmount(p3.roactTree);
end;
v3.Tag = "Leaderboard";
return v3;
