-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "EventMissionsController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "EventMissionsController";
	p1.eventRemotes = l__default__1.Client:GetNamespace("Event");
end;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
end;
function v3.claimMission(p3, p4, p5)
	return p3.eventRemotes:Get("ClaimMission"):CallServer(p4, p5);
end;
local v5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
