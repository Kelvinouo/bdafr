-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "HeavenlySwordMobileController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
local u2 = l__KnitController__2;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "HeavenlySwordMobileController";
end;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
end;
local l__SwordController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "sword", "sword-controller").SwordController;
local l__AnimationType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.mobileHandler(p3, p4, p5, p6)
	l__SwordController__3:heavenlySwordMobileHandler();
	local v5 = p4:GetAttribute("LumenUpgraded");
	if v5 == 0 or v5 ~= v5 or v5 == "" or not v5 or p6 < 1 then
		p3:playAnimation(l__AnimationType__4.HEAVENLY_SWORD_SWING);
	end;
end;
local l__AnimationUtil__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).AnimationUtil;
local l__Players__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__GameAnimationUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
function u1.playAnimation(p7, p8)
	local v6 = l__AnimationUtil__5.playAnimation(l__Players__6.LocalPlayer, l__GameAnimationUtil__7.getAssetId(p8));
	if v6 ~= nil then
		v6:AdjustSpeed(1);
	end;
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	HeavenlySwordMobileController = u2
};
return u1;
