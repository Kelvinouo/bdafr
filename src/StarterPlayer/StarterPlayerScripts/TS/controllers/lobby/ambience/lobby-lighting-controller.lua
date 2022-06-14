-- Script Hash: b4bf64b69a58d3f3ac39ae09ab9875fbcefa3e7e31be13ac1abb753ee4b977d84b8bf4689dc55551858e897bf76a88dd
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "LobbyLightingController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
local l__ModifierGroup__2 = v2.ModifierGroup;
local l__Lighting__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Lighting;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__GroupModifierBehavior__5 = v2.GroupModifierBehavior;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "LobbyLightingController";
	p1.colorCorrectionModifier = l__ModifierGroup__2.new(l__Lighting__3:FindFirstChildOfClass("ColorCorrectionEffect") or u4("ColorCorrectionEffect", {
		Parent = l__Lighting__3
	}), {
		baseProperties = {
			TintColor = Color3.fromRGB(255, 255, 255), 
			Contrast = 0.05, 
			Saturation = 0
		}, 
		behavior = l__GroupModifierBehavior__5.Merge
	});
	u4("BloomEffect", {
		Enabled = true, 
		Intensity = 1, 
		Size = 24, 
		Threshold = 2, 
		Parent = l__Lighting__3
	});
end;
local l__KnitClient__6 = v3.KnitClient;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__KnitClient__6.Controllers.LightingController.lightingModifier:addModifier(10, {
		Ambient = Color3.fromRGB(165, 165, 165), 
		Brightness = 2, 
		ColorShift_Bottom = Color3.fromRGB(146, 190, 255), 
		ColorShift_Top = Color3.fromRGB(228, 249, 255), 
		EnvironmentDiffuseScale = 0, 
		EnvironmentSpecularScale = 0, 
		OutdoorAmbient = Color3.fromRGB(104, 104, 104), 
		ShadowSoftness = 0, 
		ClockTime = 11.5, 
		GeographicLatitude = 46, 
		ExposureCompensation = 0
	});
	l__KnitClient__6.Controllers.LightingController.atmosphereModifier:addModifier(10, {
		Density = 0.171, 
		Offset = 0.09200000017881393, 
		Color = Color3.fromRGB(198, 198, 198), 
		Decay = Color3.fromRGB(104, 112, 124), 
		Glare = 0, 
		Haze = 0
	});
	l__KnitClient__6.Controllers.LightingController.skyModifier:addModifier(10, {
		CelestialBodiesShown = true, 
		MoonAngularSize = 30, 
		MoonTextureId = "rbxasset://sky/moon.jpg", 
		SkyboxBk = "rbxassetid://9122141090", 
		SkyboxDn = "rbxassetid://9122141778", 
		SkyboxFt = "rbxassetid://9122142359", 
		SkyboxLf = "rbxassetid://9122142961", 
		SkyboxRt = "rbxassetid://9122143459", 
		SkyboxUp = "rbxassetid://9122144063", 
		StarCount = 3000, 
		SunAngularSize = 21, 
		SunTextureId = "rbxasset://sky/sun.jpg"
	});
	p2.colorCorrectionModifier:addModifier(10, {
		Brightness = 0.1, 
		Contrast = 0.2, 
		Saturation = 0.2, 
		TintColor = Color3.fromRGB(255, 255, 255)
	});
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
