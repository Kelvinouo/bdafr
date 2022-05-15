
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "RocketLauncherController";
	end, 
	__index = v2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
local u2 = v2;
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "RocketLauncherController";
end;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
end;
local l__GameAnimationUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__Players__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__AnimationType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.onEnable(p3, p4, p5)
	u2.onEnable(p3, p4, p5);
	p3:setupYield(function()
		local u6 = l__GameAnimationUtil__3.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__5.ROCKET_LAUNCHER_IDLE, {
			looped = true
		});
		return function()
			if u6 ~= nil then
				u6:Stop();
			end;
		end;
	end);
end;
function u1.onStartCharging(p6)
	print("rocket-launcher-controller onStartCharging");
end;
function u1.onStopCharging(p7)
	print("rocket-launcher-controller onStopCharging");
end;
function u1.onLaunch(p8)
	task.spawn(function()
		p8.shootAnimation = l__GameAnimationUtil__3.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__5.ROCKET_LAUNCHER_SHOT, {
			looped = false
		});
	end);
	return true;
end;
function u1.onStartReload(p9, p10)
	if p9.shootAnimation and p9.shootAnimation.IsPlaying then
		p9.shootAnimation.Stopped:Wait();
	end;
	if not p10() then
		return nil;
	end;
	local u7 = l__GameAnimationUtil__3.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__5.ROCKET_LAUNCHER_RELOAD, {
		looped = false
	});
	p9.maid:GiveTask(function()
		if u7 ~= nil then
			u7:Stop();
		end;
	end);
end;
local l__ItemType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function u1.isRelevantItem(p11, p12)
	return p12.itemType == l__ItemType__8.ROCKET_LAUNCHER;
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;

