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
local l__ModifierGroup__1 = v2.ModifierGroup;
local l__Lighting__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Lighting;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__GroupModifierBehavior__4 = v2.GroupModifierBehavior;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "LobbyLightingController";
	p1.colorCorrectionModifier = l__ModifierGroup__1.new(l__Lighting__2:FindFirstChildOfClass("ColorCorrectionEffect") or u3("ColorCorrectionEffect", {
		Parent = l__Lighting__2
	}), {
		baseProperties = {
			TintColor = Color3.fromRGB(255, 255, 255), 
			Contrast = 0.05, 
			Saturation = 0
		}, 
		behavior = l__GroupModifierBehavior__4.Merge
	});
	u3("BloomEffect", {
		Enabled = true, 
		Intensity = 0.8, 
		Size = 6, 
		Threshold = 2, 
		Parent = l__Lighting__2
	});
end;
local l__KnitClient__5 = v3.KnitClient;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__KnitClient__5.Controllers.LightingController.lightingModifier:addModifier(10, {
		Ambient = Color3.fromRGB(131, 102, 89), 
		Brightness = 2, 
		ColorShift_Bottom = Color3.fromRGB(146, 190, 255), 
		ColorShift_Top = Color3.fromRGB(228, 249, 255), 
		EnvironmentDiffuseScale = 0.2, 
		EnvironmentSpecularScale = 0.4, 
		OutdoorAmbient = Color3.fromRGB(104, 104, 104), 
		ShadowSoftness = 0, 
		ClockTime = 12.93, 
		GeographicLatitude = 35, 
		ExposureCompensation = 0
	});
	l__KnitClient__5.Controllers.LightingController.atmosphereModifier:addModifier(10, {
		Density = 0.171, 
		Offset = 0.09200000017881393, 
		Color = Color3.fromRGB(198, 198, 198), 
		Decay = Color3.fromRGB(104, 112, 124), 
		Glare = 0, 
		Haze = 0
	});
	l__KnitClient__5.Controllers.LightingController.skyModifier:addModifier(10, {
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
	l__KnitClient__5.Controllers.LightingController.sunRayModifier:addModifier(10, {
		Intensity = 0.04, 
		Spread = 1
	});
	p2.colorCorrectionModifier:addModifier(10, {
		Brightness = 0.1, 
		Contrast = 0.2, 
		Saturation = 0.1, 
		TintColor = Color3.fromRGB(255, 255, 255)
	});
end;
local v7 = v3.KnitClient.CreateController(v5.new());
return nil;
