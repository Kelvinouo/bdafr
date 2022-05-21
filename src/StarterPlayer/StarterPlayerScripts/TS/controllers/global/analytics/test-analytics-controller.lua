-- Script Hash: 0d37572059a36c3bc9095239ab522e36cc0d930bbe6a617f7182143172fa5d79dab27d2312a12fb9dc70aa40484066e6
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "TestAnalyticsController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
function v3.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "TestAnalyticsController";
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
		local l__GA_Event__5 = l__ReplicatedStorage__3:FindFirstChild("GA_Event");
		if not l__GA_Event__5 then
			return u4();
		end;
		l__ReplicatedStorage__3.ChildRemoved:Connect(function(p3)
			if p3 == l__GA_Event__5 then
				u4();
			end;
		end);
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
