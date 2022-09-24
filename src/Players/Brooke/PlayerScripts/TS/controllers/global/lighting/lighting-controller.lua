-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = v1.import(script, script.Parent, "default-lighting-constants");
local v5 = setmetatable({}, {
	__tostring = function()
		return "LightingController";
	end, 
	__index = l__KnitController__3
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local l__ModifierGroup__1 = v2.ModifierGroup;
local l__Lighting__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Lighting;
local u3 = v4.DefaultLightingProperties;
local l__GroupModifierBehavior__4 = v2.GroupModifierBehavior;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__PlaceUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u7 = v4.DefaultAtmosphereProperties;
function v5.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "LightingController";
	p1.lightingModifier = l__ModifierGroup__1.new(l__Lighting__2, {
		baseProperties = u3, 
		behavior = l__GroupModifierBehavior__4.Merge
	});
	p1.sunRayModifier = l__ModifierGroup__1.new(l__Lighting__2:FindFirstChildOfClass("SunRaysEffect") or u5("SunRaysEffect", {
		Parent = l__Lighting__2
	}), {
		baseProperties = {
			Intensity = 0.04, 
			Spread = 1
		}, 
		behavior = l__GroupModifierBehavior__4.Merge
	});
	p1.skyModifier = l__ModifierGroup__1.new(l__Lighting__2:FindFirstChildOfClass("Sky") or u5("Sky", {
		Parent = l__Lighting__2
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
	p1.colorCorrectionModifier = l__ModifierGroup__1.new(l__Lighting__2:FindFirstChildOfClass("ColorCorrectionEffect") or u5("ColorCorrectionEffect", {
		Parent = l__Lighting__2
	}), {
		baseProperties = {
			TintColor = Color3.fromRGB(255, 255, 255), 
			Contrast = 0.05, 
			Saturation = 0
		}, 
		behavior = l__GroupModifierBehavior__4.Merge
	});
	if not l__PlaceUtil__6.isLobbyServer() then
		p1.atmosphereModifier = l__ModifierGroup__1.new(l__Lighting__2:FindFirstChildOfClass("Atmosphere") or u5("Atmosphere", {
			Parent = l__Lighting__2
		}), {
			baseProperties = u7, 
			behavior = l__GroupModifierBehavior__4.Merge
		});
	end;
end;
function v5.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
end;
function v5.getAtmosphereModifier(p3)
	if not p3.atmosphereModifier then
		p3.atmosphereModifier = l__ModifierGroup__1.new(l__Lighting__2:FindFirstChildOfClass("Atmosphere") or u5("Atmosphere", {
			Parent = l__Lighting__2
		}), {
			baseProperties = u7, 
			behavior = l__GroupModifierBehavior__4.Merge
		});
	end;
	return p3.atmosphereModifier;
end;
local v7 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
