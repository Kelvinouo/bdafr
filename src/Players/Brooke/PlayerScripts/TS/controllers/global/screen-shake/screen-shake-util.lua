-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = {};
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ConstantManager.registerConstants(script, {
	Duration = 0.25, 
	Magnitude = 0.4, 
	TotalCycles = 5
});
local l__default__3 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__Linear__4 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
local u5 = nil;
local l__RunService__6 = v2.RunService;
local l__Workspace__7 = v2.Workspace;
local function v4(p1, p2)
	local v5 = u1.new();
	local v6 = p2;
	if v6 ~= nil then
		v6 = v6.duration;
	end;
	local v7 = v6;
	if v7 == nil then
		v7 = u2.Duration;
	end;
	local u8 = 0;
	local u9 = l__default__3(v7, l__Linear__4, function(p3)
		local v8 = p2;
		if v8 ~= nil then
			v8 = v8.cycles;
		end;
		u8 = u5(p3, v8);
	end, 0, 1);
	v5:GiveTask(function()
		return u9:Cancel();
	end);
	local v9 = "screen-shake" .. tostring(math.random());
	l__RunService__6:BindToRenderStep(v9, Enum.RenderPriority.Camera.Value + 1, function()
		if not l__Workspace__7.CurrentCamera then
			return nil;
		end;
		local v10 = p2;
		if v10 ~= nil then
			v10 = v10.magnitude;
		end;
		local v11 = v10;
		if v11 == nil then
			v11 = u2.Magnitude;
		end;
		l__Workspace__7.CurrentCamera.CFrame = CFrame.new(l__Workspace__7.CurrentCamera.CFrame * (Vector3.new(p1.X, p1.Y, 0).Unit * (u8 * v11))) * (l__Workspace__7.CurrentCamera.CFrame - l__Workspace__7.CurrentCamera.CFrame.Position);
	end);
	v5:GiveTask(function()
		return l__RunService__6:UnbindFromRenderStep(v9);
	end);
	task.spawn(function()
		u9:Wait();
		v5:DoCleaning();
	end);
	return v5;
end;
v3.shakeScreenDirection = v4;
u5 = function(p4, p5)
	if p5 == nil then
		p5 = u2.TotalCycles;
	end;
	local v12 = p4 * math.pi * p5;
	return math.sin(v12) / math.pow(v12, 0.5);
end;
v3.getShakeMagnitude = u5;
function v3.shake(p6, p7, p8)
	if not l__Workspace__7.CurrentCamera then
		return nil;
	end;
	local v13 = l__Workspace__7.CurrentCamera:WorldToScreenPoint(p6);
	local v14 = l__Workspace__7.CurrentCamera:WorldToScreenPoint(p6 + p7.Unit);
	return v4(Vector2.new(v14.X - v13.X, -(v14.Y - v13.Y)), p8);
end;
return {
	ScreenShakeUtil = v3
};
