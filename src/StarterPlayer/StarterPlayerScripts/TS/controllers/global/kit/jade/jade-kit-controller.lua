-- Script Hash: ee68baa0a09324e68524e9349f7e949db82edef5b7161b4c5dc26678481ce46b92283c6168d51652712cd396856d5201
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__LegacyKitKnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "legacy-kit-controller").LegacyKitKnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "JadeKitController";
	end, 
	__index = l__LegacyKitKnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
local u2 = l__LegacyKitKnitController__2;
local l__BedwarsKit__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function u1.constructor(p1)
	u2.constructor(p1, { l__BedwarsKit__3.JADE });
	p1.Name = "JadeKitController";
end;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
end;
local l__ContentProvider__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ContentProvider;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__GameAnimationUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.onKitEnabled(p3)
	task.spawn(function()
		l__ContentProvider__4:PreloadAsync({ u5("Animation", {
				AnimationId = l__GameAnimationUtil__6.getAssetId(l__AnimationType__7.JADE_HAMMER_SLAM)
			}), u5("Animation", {
				AnimationId = l__GameAnimationUtil__6.getAssetId(l__AnimationType__7.JADE_HAMMER_IDLE)
			}) });
	end);
end;
function u1.onKitDisabled(p4)

end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	JadeKitController = u2
};
return u1;
