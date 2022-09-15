-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "MatchController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "signal"));
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "MatchController";
	p1.queueTypeSignal = u1.new();
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__default__2.Client:WaitFor("RemoteName"):expect():Connect(function(p3)
		p2.queueType = p3.queueType;
		p2.queueTypeSignal:Fire();
	end);
end;
v3.getQueueType = v1.async(function(p4)
	if p4.queueType then
		return p4.queueType;
	end;
	p4.queueTypeSignal:Wait();
	return p4.queueType;
end);
local v5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
