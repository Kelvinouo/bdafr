-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "LobbyLightingController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
local l__Lighting__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Lighting;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "LobbyLightingController";
	local l__Sky__6 = l__Lighting__2:FindFirstChild("Sky");
	l__Sky__6.CelestialBodiesShown = false;
	l__Sky__6.MoonAngularSize = 30;
	l__Sky__6.MoonTextureId = "rbxasset://sky/moon.jpg";
	l__Sky__6.SkyboxBk = "rbxassetid://9122141090";
	l__Sky__6.SkyboxDn = "rbxassetid://9122141778";
	l__Sky__6.SkyboxFt = "rbxassetid://9122142359";
	l__Sky__6.SkyboxLf = "rbxassetid://9122142961";
	l__Sky__6.SkyboxRt = "rbxassetid://9122143459";
	l__Sky__6.SkyboxUp = "rbxassetid://9122144063";
	l__Sky__6.StarCount = 3000;
	l__Sky__6.SunAngularSize = 21;
	l__Sky__6.SunTextureId = "rbxasset://sky/sun.jpg";
	u3("Atmosphere", {
		Density = 0.171, 
		Offset = 0.09200000017881393, 
		Color = Color3.fromRGB(198, 198, 198), 
		Decay = Color3.fromRGB(104, 112, 124), 
		Glare = 0, 
		Haze = 0, 
		Parent = l__Lighting__2
	});
	u3("BloomEffect", {
		Enabled = true, 
		Intensity = 1, 
		Size = 24, 
		Threshold = 2, 
		Parent = l__Lighting__2
	});
	u3("ColorCorrectionEffect", {
		Brightness = 0.1, 
		Contrast = 0.2, 
		Saturation = 0.02, 
		TintColor = Color3.fromRGB(255, 255, 255), 
		Parent = l__Lighting__2
	});
end;
local l__KnitClient__4 = v2.KnitClient;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__KnitClient__4.Controllers.LightingController.lightingModifier:addModifier(10, {
		Ambient = Color3.fromRGB(91, 91, 91), 
		Brightness = 2, 
		ColorShift_Bottom = Color3.fromRGB(0, 0, 0), 
		ColorShift_Top = Color3.fromRGB(0, 0, 0), 
		EnvironmentDiffuseScale = 0, 
		EnvironmentSpecularScale = 0.1, 
		OutdoorAmbient = Color3.fromRGB(201, 201, 201), 
		ShadowSoftness = 0.1, 
		ClockTime = 12.856, 
		GeographicLatitude = 40.118, 
		ExposureCompensation = 0
	});
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
