-- Script Hash: 7c077aa40c014a19ead3360bb898a065db665cde170430acffb795e7c01f699ef02bc7bcbdee729cb8e894ff953f3847
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "AnalyticsController";
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
	p1.Name = "AnalyticsController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ReplicatedStorage__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ReplicatedStorage;
function v3.KnitStart(p2)
	local function u4()
		task.wait(math.random(20, 60));
		l__default__2.Client:Get("RemoteName"):SendToServer();
	end;
	task.defer(function()
		task.wait(20);
		local l__AnalyticsReportEvent__5 = l__ReplicatedStorage__3:FindFirstChild("AnalyticsReportEvent");
		if not l__AnalyticsReportEvent__5 then
			return u4();
		end;
		l__ReplicatedStorage__3.ChildRemoved:Connect(function(p3)
			if p3 == l__AnalyticsReportEvent__5 then
				u4();
			end;
		end);
	end);
end;
function v3.sendCustomEvent(p4, p5, p6)
	l__default__2.Client:Get("RemoteName"):SendToServer(p5, p6);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
