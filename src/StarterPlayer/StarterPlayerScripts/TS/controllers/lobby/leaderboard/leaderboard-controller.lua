-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "LeaderboardController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
function u1.constructor(p1, ...)
	l__KnitController__2.constructor(p1, ...);
	p1.Name = "LeaderboardController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
u1.KnitStart = v1.async(function(p2)
	local v5 = l__default__2.Client:GetNamespace("Leaderboard");
	v1.await(v5:WaitFor("OnLeaderboardsUpdate")):Connect(function(p3)
		return p2:updateLeaderboardStore(p3);
	end);
	p2:updateLeaderboardStore((v1.await(v1.await(v5:WaitFor("RequestLeaderboardData")):CallServerAsync())));
end);
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function u1.updateLeaderboardStore(p4, p5)
	l__ClientStore__3:dispatch({
		type = "UpdateAllLeaderboards", 
		leaderboards = p5
	});
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	LeaderboardController = u1
};
