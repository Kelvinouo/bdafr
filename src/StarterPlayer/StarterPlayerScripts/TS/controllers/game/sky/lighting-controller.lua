
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
			Ambient = Color3.fromRGB(89, 89, 89), 
			Brightness = 2, 
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0), 
			ColorShift_Top = Color3.fromRGB(0, 0, 0), 
			OutdoorAmbient = Color3.fromRGB(201, 201, 201)
		}, 
		behavior = l__GroupModifierBehavior__4.Merge
	});
	p1.atmosphereModifier = l__ModifierGroup__2.new(l__Lighting__3:FindFirstChildOfClass("Atmosphere") or u5("Atmosphere", {
		Parent = l__Lighting__3
	}), {
		baseProperties = {
			Density = 0.1, 
			Offset = 0.25, 
			Color = Color3.fromRGB(198, 198, 198), 
			Decay = Color3.fromRGB(104, 112, 124), 
			Glare = 0, 
			Haze = 0
		}, 
		behavior = l__GroupModifierBehavior__4.Merge
	});
end;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;

