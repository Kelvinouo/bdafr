-- Script Hash: 1d4a8a36590762757e80355551343ce0bcfff13223436a71ea6dbf1da14f1af2122ff340b72d2a7b237bb930c4fd22b9
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "ScreenShakeController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "ScreenShakeController";
end;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
end;
local l__Workspace__2 = v2.Workspace;
function v4.shake(p3, p4, p5, p6)
	if not l__Workspace__2.CurrentCamera then
		return nil;
	end;
	local v6 = l__Workspace__2.CurrentCamera:WorldToScreenPoint(p4);
	local v7 = l__Workspace__2.CurrentCamera:WorldToScreenPoint(p4 + p5.Unit);
	return p3:shakeScreenDirection(Vector2.new(v7.X - v6.X, -(v7.Y - v6.Y)), p6);
end;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ConstantManager.registerConstants(script, {
	Duration = 0.25, 
	Magnitude = 0.4, 
	TotalCycles = 5
});
local l__default__5 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__Linear__6 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
local l__RunService__7 = v2.RunService;
function v4.shakeScreenDirection(p7, p8, p9)
	local v8 = u3.new();
	local v9 = p9;
	if v9 ~= nil then
		v9 = v9.duration;
	end;
	local v10 = v9;
	if v10 == nil then
		v10 = u4.Duration;
	end;
	local u8 = 0;
	local u9 = l__default__5(v10, l__Linear__6, function(p10)
		local v11 = p9;
		if v11 ~= nil then
			v11 = v11.cycles;
		end;
		u8 = p7:getShakeMagnitude(p10, v11);
	end, 0, 1);
	v8:GiveTask(function()
		return u9:Cancel();
	end);
	local v12 = "screen-shake" .. tostring(math.random());
	l__RunService__7:BindToRenderStep(v12, Enum.RenderPriority.Camera.Value + 1, function()
		if not l__Workspace__2.CurrentCamera then
			return nil;
		end;
		local v13 = p9;
		if v13 ~= nil then
			v13 = v13.magnitude;
		end;
		local v14 = v13;
		if v14 == nil then
			v14 = u4.Magnitude;
		end;
		l__Workspace__2.CurrentCamera.CFrame = CFrame.new(l__Workspace__2.CurrentCamera.CFrame * (Vector3.new(p8.X, p8.Y, 0).Unit * (u8 * v14))) * (l__Workspace__2.CurrentCamera.CFrame - l__Workspace__2.CurrentCamera.CFrame.Position);
	end);
	v8:GiveTask(function()
		return l__RunService__7:UnbindFromRenderStep(v12);
	end);
	task.spawn(function()
		u9:Wait();
		v8:DoCleaning();
	end);
	return v8;
end;
function v4.getShakeMagnitude(p11, p12, p13)
	if p13 == nil then
		p13 = u4.TotalCycles;
	end;
	local v15 = p12 * math.pi * p13;
	return math.sin(v15) / math.pow(v15, 0.5);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
