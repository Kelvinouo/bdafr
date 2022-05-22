-- Script Hash: 54b06775b62b29043bca7e74e9c803d69666c558fd4c8e12cdc105bd421077963dfccb0dbfd79b5585216f9547a327de
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
local u2 = l__KnitController__2;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "LeaderboardController";
	p1.leaderboardNamespace = l__default__3.Client:GetNamespace("Leaderboard");
end;
u1.KnitStart = v1.async(function(p2)
	v1.await(p2.leaderboardNamespace:WaitFor("OnLeaderboardsUpdate")):Connect(function(p3)
		return p2:updateLeaderboardStore(p3);
	end);
	p2:updateLeaderboardStore((v1.await(v1.await(p2.leaderboardNamespace:WaitFor("RequestLeaderboardData")):CallServerAsync())));
end);
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function u1.updateLeaderboardStore(p4, p5)
	l__ClientStore__4:dispatch({
		type = "UpdateAllLeaderboards", 
		leaderboards = p5
	});
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	LeaderboardController = u2
};
return u1;
