-- Script Hash: bea9e2d4f6d81de1374c5cafa78366b76fcd06b946364bb75c7b766af2c140e86853eb6b443861384b354606cacae99e
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "DisasterController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "DisasterController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__default__3 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__ClientSyncEvents__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:GetNamespace("Disaster"):OnEvent("DisasterBegan", function(p3)
		l__default__3.Debug("Received disaster {disastertype}", p3.disasterType);
		l__ClientSyncEvents__4.DisasterBegan:fire(p3.disasterType, p3.endTime);
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
