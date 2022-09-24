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
function v7.constructor(p1)
	l__KnitController__6.constructor(p1);
	p1.Name = "VoidRiseController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__2 = v2.SoundManager;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__4 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__Linear__5 = v4.Linear;
local l__KnitClient__6 = v3.KnitClient;
local l__InQuad__7 = v4.InQuad;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__9 = v5.Workspace;
local l__GameQueryUtil__10 = v2.GameQueryUtil;
local l__Lighting__11 = v5.Lighting;
local l__RunService__12 = v5.RunService;
function v7.KnitStart(p2)
	l__KnitController__6.KnitStart(p2);
	l__default__1.Client:GetNamespace("Disaster"):OnEvent("VoidRise", function(p3)
		local v9 = l__SoundManager__2:playSound(l__GameSound__3.RAVEN_SPACE_AMBIENT);
		v9.Looped = true;
		v9.Volume = 0;
		l__default__4(1, l__Linear__5, function(p4)
			v9.Volume = p4;
			return v9.Volume;
		end, 0, 0.3);
		local u13 = l__KnitClient__6.Controllers.LightingController:getAtmosphereModifier():addModifier(30, {
			Color = Color3.fromRGB(0, 0, 0), 
			Density = 0, 
			Haze = 0
		});
		l__default__4(2, l__InQuad__7, function(p5)
			local v10 = {};
			for v11, v12 in pairs(u13:getProperties()) do
				v10[v11] = v12;
			end;
			v10.Haze = p5 * 2;
			u13:setProperties(v10);
		end, 0, 1);
		local v13 = u8("Part", {
			Anchored = true, 
			Position = Vector3.new(0, p3.startingLevel, 0), 
			Size = Vector3.new(2000, 2, 2000), 
			CanCollide = false, 
			Reflectance = -1, 
			Color = Color3.fromRGB(0, 0, 0), 
			CastShadow = false, 
			TopSurface = Enum.SurfaceType.Smooth, 
			BottomSurface = Enum.SurfaceType.Smooth, 
			Parent = l__Workspace__9
		});
		l__GameQueryUtil__10:setQueryIgnored(v13, true);
		local u14 = u8("ColorCorrectionEffect", {
			Parent = l__Lighting__11
		});
		local u15 = l__default__4((p3.endTime - l__Workspace__9:GetServerTimeNow()) * 0.9, l__Linear__5, function(p6)
			v13.Position = Vector3.new(0, p6, 0);
		end, p3.startingLevel, p3.endLevel);
		local u16 = l__RunService__12.Heartbeat:Connect(function()
			if l__Workspace__9.CurrentCamera.CFrame.Position.Y < v13.Position.Y then
				u14.Saturation = -0.8;
				u14.TintColor = Color3.fromRGB(83, 83, 83);
				local v14 = {};
				for v15, v16 in pairs(u13:getProperties()) do
					v14[v15] = v16;
				end;
				v14.Density = 0.9;
				u13:setProperties(v14);
				return;
			end;
			u14.Saturation = 0;
			u14.TintColor = Color3.fromRGB(255, 255, 255);
			local v17 = {};
			for v18, v19 in pairs(u13:getProperties()) do
				v17[v18] = v19;
			end;
			v17.Density = 0.1;
			u13:setProperties(v17);
		end);
		task.delay(p3.endTime - l__Workspace__9:GetServerTimeNow(), function()
			u13:destroy();
			u15:Cancel();
			v13:Destroy();
			v9:Destroy();
			u16:Disconnect();
			u14:Destroy();
		end);
	end);
end;
local v20 = v3.KnitClient.CreateController(v7.new());
return nil;
