-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__LegacyKitKnitController__2 = v1.import(script, script.Parent.Parent.Parent, "legacy-kit-controller").LegacyKitKnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "PyroKitController";
	end, 
	__index = l__LegacyKitKnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
local l__BedwarsKit__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function u1.constructor(p1)
	l__LegacyKitKnitController__2.constructor(p1, { l__BedwarsKit__2.PYRO });
	p1.Name = "PyroKitController";
end;
function u1.KnitStart(p2)
	l__LegacyKitKnitController__2.KnitStart(p2);
end;
local l__ContentProvider__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ContentProvider;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__GameAnimationUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.onKitEnabled(p3)
	v1.Promise.defer(function()
		l__ContentProvider__3:PreloadAsync({ u4("Animation", {
				AnimationId = l__GameAnimationUtil__5.getAssetId(l__AnimationType__6.FLAMETHROWER_USE)
			}), u4("Animation", {
				AnimationId = l__GameAnimationUtil__5.getAssetId(l__AnimationType__6.FLAMETHROWER_UPGRADE)
			}), u4("Animation", {
				AnimationId = l__GameAnimationUtil__5.getAssetId(l__AnimationType__6.FLAMETHROWER_IDLE)
			}) });
	end);
end;
function u1.onKitDisabled(p4)

end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	PyroKitController = u1
};
