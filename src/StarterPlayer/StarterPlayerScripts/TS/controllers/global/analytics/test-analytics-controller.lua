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
function v3.constructor(p1, ...)
	l__KnitController__2.constructor(p1, ...);
	p1.Name = "TestAnalyticsController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ReplicatedStorage__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ReplicatedStorage;
function v3.KnitStart(p2)
	local function u3()
		task.wait(math.random(20, 60));
		l__default__1.Client:Get("RemoteName"):SendToServer();
	end;
	task.defer(function()
		task.wait(20);
		local l__GA_Event__5 = l__ReplicatedStorage__2:FindFirstChild("GA_Event");
		if not l__GA_Event__5 then
			return u3();
		end;
		l__ReplicatedStorage__2.ChildRemoved:Connect(function(p3)
			if p3 == l__GA_Event__5 then
				task.wait(math.random(20, 60));
				l__default__1.Client:Get("RemoteName"):SendToServer();
			end;
		end);
	end);
end;
local v6 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
