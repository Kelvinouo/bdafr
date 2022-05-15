
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "LassoController";
	end, 
	__index = v3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local u2 = v3;
local l__Maid__3 = v2.Maid;
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "LassoController";
	p1.stopChargingMaid = l__Maid__3.new();
end;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
end;
local l__ItemType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function u1.isRelevantItem(p3, p4)
	return p4.itemType == l__ItemType__4.LASSO;
end;
local l__GameAnimationUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__Players__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__AnimationType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__SoundManager__8 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function u1.onStartCharging(p5)
	local v6 = l__GameAnimationUtil__5.playAnimation(l__Players__6.LocalPlayer, l__AnimationType__7.LASSO_CHARGE, {
		looped = true
	});
	if v6 then
		local u10 = true;
		v1.Promise.defer(function()
			while v1.Promise.delay(0.5):await() and u10 do
				l__SoundManager__8:playSound(l__GameSound__9.LASSO_SWING);			
			end;
		end);
		p5.stopChargingMaid:GiveTask(function()
			u10 = false;
			return u10;
		end);
		p5.stopChargingMaid:GiveTask(function()
			v6:Stop();
		end);
	end;
end;
function u1.onStopCharging(p6)
	p6.stopChargingMaid:DoCleaning();
end;
function u1.onLaunch(p7)
	return true;
end;
function u1.onStartReload(p8)

end;
u2 = v2.KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;

