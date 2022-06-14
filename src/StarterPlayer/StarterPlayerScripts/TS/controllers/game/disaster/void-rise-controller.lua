-- Script Hash: fa3d79ff4ef3942c6bc1cf26d383c9c7c951aa7b5807a1f2f3ec88296e9480e9401de0f5bfc8aa6eb87bc3bdf8c338a0
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v7 = setmetatable({}, {
	__tostring = function()
		return "VoidRiseController";
	end, 
	__index = l__KnitController__6
});
v7.__index = v7;
function v7.new(...)
	local v8 = setmetatable({}, v7);
	return v8:constructor(...) and v8;
end;
local u1 = l__KnitController__6;
function v7.constructor(p1)
	u1.constructor(p1);
	p1.Name = "VoidRiseController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__3 = v2.SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__5 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__Linear__6 = v4.Linear;
local l__KnitClient__7 = v3.KnitClient;
local l__InQuad__8 = v4.InQuad;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__10 = v5.Workspace;
local l__GameQueryUtil__11 = v2.GameQueryUtil;
local l__Lighting__12 = v5.Lighting;
local l__RunService__13 = v5.RunService;
function v7.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:GetNamespace("Disaster"):OnEvent("VoidRise", function(p3)
		local v9 = l__SoundManager__3:playSound(l__GameSound__4.RAVEN_SPACE_AMBIENT);
		v9.Looped = true;
		v9.Volume = 0;
		l__default__5(1, l__Linear__6, function(p4)
			v9.Volume = p4;
			return v9.Volume;
		end, 0, 0.3);
		local u14 = l__KnitClient__7.Controllers.LightingController.atmosphereModifier:addModifier(30, {
			Color = Color3.fromRGB(0, 0, 0), 
			Density = 0, 
			Haze = 0
		});
		l__default__5(2, l__InQuad__8, function(p5)
			local v10 = {};
			for v11, v12 in pairs(u14:getProperties()) do
				v10[v11] = v12;
			end;
			v10.Haze = p5 * 2;
			u14:setProperties(v10);
		end, 0, 1);
		local v13 = u9("Part", {
			Anchored = true, 
			Position = Vector3.new(0, p3.startingLevel, 0), 
			Size = Vector3.new(2000, 2, 2000), 
			CanCollide = false, 
			Reflectance = -1, 
			Color = Color3.fromRGB(0, 0, 0), 
			CastShadow = false, 
			TopSurface = Enum.SurfaceType.Smooth, 
			BottomSurface = Enum.SurfaceType.Smooth, 
			Parent = l__Workspace__10
		});
		l__GameQueryUtil__11:setQueryIgnored(v13, true);
		local u15 = u9("ColorCorrectionEffect", {
			Parent = l__Lighting__12
		});
		local u16 = l__default__5((p3.endTime - l__Workspace__10:GetServerTimeNow()) * 0.9, l__Linear__6, function(p6)
			v13.Position = Vector3.new(0, p6, 0);
		end, p3.startingLevel, p3.endLevel);
		local u17 = l__RunService__13.Heartbeat:Connect(function()
			if l__Workspace__10.CurrentCamera.CFrame.Position.Y < v13.Position.Y then
				u15.Saturation = -0.8;
				u15.TintColor = Color3.fromRGB(83, 83, 83);
				local v14 = {};
				for v15, v16 in pairs(u14:getProperties()) do
					v14[v15] = v16;
				end;
				v14.Density = 0.9;
				u14:setProperties(v14);
				return;
			end;
			u15.Saturation = 0;
			u15.TintColor = Color3.fromRGB(255, 255, 255);
			local v17 = {};
			for v18, v19 in pairs(u14:getProperties()) do
				v17[v18] = v19;
			end;
			v17.Density = 0.1;
			u14:setProperties(v17);
		end);
		task.delay(p3.endTime - l__Workspace__10:GetServerTimeNow(), function()
			u14:destroy();
			u16:Cancel();
			v13:Destroy();
			v9:Destroy();
			u17:Disconnect();
			u15:Destroy();
		end);
	end);
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(v7.new());
return nil;
