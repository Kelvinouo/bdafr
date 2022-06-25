-- Script Hash: 169d66416ae7e8534bf7d935b30034a0f8c1b3236a0435c728bc170a2c9c229366bf44e7caf2bbd1c6b311be3339c281
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "LassoController";
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
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "LassoController";
	p1.stopChargingMaid = u3.new();
end;
local l__ClientSyncEvents__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Flamework__5 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__getItemMeta__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ItemType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
	l__ClientSyncEvents__4.ProjectileLaunched:connect(function(p3)
		if p3:isLocalShooter() and p3.projectileType == "lasso" then
			l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__6.LASSO_THROW, l__getItemMeta__7(l__ItemType__8.LASSO).projectileSource.fireDelaySec);
		end;
	end);
end;
function u1.isRelevantItem(p4, p5)
	return p5.itemType == l__ItemType__8.LASSO;
end;
function u1.onEnable(p6, p7, p8)
	u2.onEnable(p6, p7, p8);
	p6:setupYield(function()
		local v5 = u3.new();
		v5:GiveTask(l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__6.LASSO_THROW));
		return function()
			v5:DoCleaning();
		end;
	end);
end;
local l__GameAnimationUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__Players__10 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__AnimationType__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__SoundManager__12 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function u1.onStartCharging(p9)
	local v6 = l__GameAnimationUtil__9.playAnimation(l__Players__10.LocalPlayer, l__AnimationType__11.LASSO_CHARGE, {
		looped = true
	});
	if v6 then
		local u14 = true;
		v1.Promise.defer(function()
			while v1.Promise.delay(0.5):await() and u14 do
				l__SoundManager__12:playSound(l__GameSound__13.LASSO_SWING);			
			end;
		end);
		p9.stopChargingMaid:GiveTask(function()
			u14 = false;
			return u14;
		end);
		p9.stopChargingMaid:GiveTask(function()
			v6:Stop();
		end);
	end;
end;
function u1.onStopCharging(p10)
	p10.stopChargingMaid:DoCleaning();
end;
function u1.onLaunch(p11)
	return true;
end;
function u1.onStartReload(p12)

end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
