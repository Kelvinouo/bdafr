-- Script Hash: 94b1d325c8de35e34edad61a7d893dd2788e7dc7f9ce691c59def8145fa84af5aba31d6beb35f21af6858f6c5f42de17
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "VoidWorldLightingController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "VoidWorldLightingController";
	p1.lightingMaid = u2.new();
end;
local l__KnitClient__3 = v2.KnitClient;
local l__WorldId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "world", "world-id").WorldId;
local l__KnitClient__5 = v2.KnitClient;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__KnitClient__3.Controllers.WorldController:watchLocalWorld(function(p3)
		local v6 = p3;
		if v6 ~= nil then
			v6 = v6.Name;
		end;
		if v6 ~= l__WorldId__4.VOID_WORLD then
			p2.lightingMaid:DoCleaning();
			return;
		end;
		p2.lightingMaid:GiveTask(l__KnitClient__5.Controllers.LightingController.lightingModifier:addModifier(20, {
			Ambient = Color3.fromRGB(255, 255, 255), 
			Brightness = 0, 
			ClockTime = 6.3, 
			ExposureCompensation = 0.62
		}));
		p2.lightingMaid:GiveTask(l__KnitClient__5.Controllers.LightingController.atmosphereModifier:addModifier(20, {
			Density = 0.45, 
			Offset = 0, 
			Color = Color3.fromRGB(193, 193, 193), 
			Glare = 0, 
			Haze = 0
		}));
		p2.lightingMaid:GiveTask(l__KnitClient__5.Controllers.LightingController.sunRayModifier:addModifier(20, {
			Intensity = 0.005
		}));
		p2.lightingMaid:GiveTask(l__KnitClient__5.Controllers.LightingController.skyModifier:addModifier(20, {
			SkyboxBk = "rbxassetid://9851144466", 
			SkyboxDn = "rbxassetid://9851144249", 
			SkyboxFt = "rbxassetid://9851144099", 
			SkyboxLf = "rbxassetid://9851143942", 
			SkyboxRt = "rbxassetid://9851143761", 
			SkyboxUp = "rbxassetid://9851143257", 
			CelestialBodiesShown = false, 
			StarCount = 3000
		}));
	end);
end;
u1 = l__KnitClient__3.CreateController;
u1 = u1(v4.new());
return nil;
