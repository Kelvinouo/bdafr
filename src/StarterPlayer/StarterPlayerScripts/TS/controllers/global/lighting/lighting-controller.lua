-- Script Hash: 0a3a59170dd549b1f638f559d2a5c479423838a7fe8cce846a80d55616f901d96dcfa1bfe1e6e9cb798df5ac352ba643
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "LightingController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
local l__ModifierGroup__2 = v2.ModifierGroup;
local l__Lighting__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Lighting;
local l__GroupModifierBehavior__4 = v2.GroupModifierBehavior;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "LightingController";
	p1.lightingModifier = l__ModifierGroup__2.new(l__Lighting__3, {
		baseProperties = {
			Ambient = Color3.fromRGB(89, 60, 86), 
			Brightness = 2, 
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0), 
			ColorShift_Top = Color3.fromRGB(117, 57, 57), 
			EnvironmentDiffuseScale = 0.1, 
			EnvironmentSpecularScale = 0.1, 
			GlobalShadows = true, 
			OutdoorAmbient = Color3.fromRGB(216, 191, 161), 
			ShadowSoftness = 0.2, 
			ClockTime = 14, 
			GeographicLatitude = -7, 
			ExposureCompensation = 0.05
		}, 
		behavior = l__GroupModifierBehavior__4.Merge
	});
	p1.atmosphereModifier = l__ModifierGroup__2.new(l__Lighting__3:FindFirstChildOfClass("Atmosphere") or u5("Atmosphere", {
		Parent = l__Lighting__3
	}), {
		baseProperties = {
			Density = 0.25, 
			Offset = 0, 
			Color = Color3.fromRGB(198, 198, 198), 
			Decay = Color3.fromRGB(104, 112, 124), 
			Glare = 0, 
			Haze = 0
		}, 
		behavior = l__GroupModifierBehavior__4.Merge
	});
	p1.sunRayModifier = l__ModifierGroup__2.new(l__Lighting__3:FindFirstChildOfClass("SunRaysEffect") or u5("SunRaysEffect", {
		Parent = l__Lighting__3
	}), {
		baseProperties = {
			Intensity = 0.04, 
			Spread = 1
		}, 
		behavior = l__GroupModifierBehavior__4.Merge
	});
	p1.skyModifier = l__ModifierGroup__2.new(l__Lighting__3:FindFirstChildOfClass("Sky") or u5("Sky", {
		Parent = l__Lighting__3
	}), {
		baseProperties = {
			CelestialBodiesShown = true, 
			StarCount = 0, 
			SkyboxBk = "rbxassetid://7018684000", 
			SkyboxDn = "rbxassetid://6334928194", 
			SkyboxFt = "rbxassetid://7018684000", 
			SkyboxLf = "rbxassetid://7018684000", 
			SkyboxRt = "rbxassetid://7018684000", 
			SkyboxUp = "rbxassetid://7018689553"
		}, 
		behavior = l__GroupModifierBehavior__4.Merge
	});
	p1.colorCorrectionModifier = l__ModifierGroup__2.new(l__Lighting__3:FindFirstChildOfClass("ColorCorrectionEffect") or u5("ColorCorrectionEffect", {
		Parent = l__Lighting__3
	}), {
		baseProperties = {
			TintColor = Color3.fromRGB(255, 255, 255), 
			Contrast = 0.05, 
			Saturation = 0
		}, 
		behavior = l__GroupModifierBehavior__4.Merge
	});
end;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
