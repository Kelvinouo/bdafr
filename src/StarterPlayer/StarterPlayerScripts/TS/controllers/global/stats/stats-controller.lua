-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "StatsController";
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
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "StatsController";
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function u1.KnitStart(p2)
	l__default__3.Client:WaitFor("RemoteName"):andThen(function(p3)
		local v5 = p3:CallServer();
		l__ClientStore__4:dispatch({
			type = "SetStats", 
			globalStats = v5.globalStats, 
			queues = v5.queues, 
			rankStats = v5.rankStats
		});
	end);
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
