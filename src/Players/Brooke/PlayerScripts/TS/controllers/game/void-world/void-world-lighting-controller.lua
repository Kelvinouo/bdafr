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
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "VoidWorldLightingController";
	p1.lightingMaid = u1.new();
end;
local l__KnitClient__2 = v2.KnitClient;
local l__WorldId__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "world", "world-id").WorldId;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__KnitClient__2.Controllers.WorldController:watchLocalWorld(function(p3)
		local v6 = p3;
		if v6 ~= nil then
			v6 = v6.Name;
		end;
		if v6 ~= l__WorldId__3.VOID_WORLD then
			p2.lightingMaid:DoCleaning();
			return;
		end;
		local v7, v8, v9 = ipairs(p2:applyVoidLighting());
		while true do
			v7(v8, v9);
			if not v7 then
				break;
			end;
			v9 = v7;
			p2.lightingMaid:GiveTask(v8);		
		end;
	end);
end;
local l__KnitClient__4 = v2.KnitClient;
function v4.applyVoidLighting(p4)
	local v10 = {};
	table.insert(v10, (l__KnitClient__4.Controllers.LightingController.lightingModifier:addModifier(20, {
		Ambient = Color3.fromRGB(255, 255, 255), 
		Brightness = 0, 
		ClockTime = 6.3, 
		ExposureCompensation = 0.62
	})));
	table.insert(v10, (l__KnitClient__4.Controllers.LightingController.atmosphereModifier:addModifier(20, {
		Density = 0.45, 
		Offset = 0, 
		Color = Color3.fromRGB(193, 193, 193), 
		Glare = 0, 
		Haze = 0
	})));
	table.insert(v10, (l__KnitClient__4.Controllers.LightingController.sunRayModifier:addModifier(20, {
		Intensity = 0.005
	})));
	table.insert(v10, (l__KnitClient__4.Controllers.LightingController.skyModifier:addModifier(20, {
		SkyboxBk = "rbxassetid://9851144466", 
		SkyboxDn = "rbxassetid://9851144249", 
		SkyboxFt = "rbxassetid://9851144099", 
		SkyboxLf = "rbxassetid://9851143942", 
		SkyboxRt = "rbxassetid://9851143761", 
		SkyboxUp = "rbxassetid://9851143257", 
		CelestialBodiesShown = false, 
		StarCount = 3000
	})));
	return v10;
end;
local v11 = l__KnitClient__2.CreateController(v4.new());
return nil;
