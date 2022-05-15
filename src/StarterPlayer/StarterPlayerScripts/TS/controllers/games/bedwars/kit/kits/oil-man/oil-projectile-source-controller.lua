
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "OilProjectileController";
	end, 
	__index = v3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = v3;
local l__Maid__2 = v2.Maid;
function v4.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "OilProjectileController";
	p1.Client = {};
	p1.eatingMaid = l__Maid__2.new();
end;
local l__ClientSyncEvents__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__SoundManager__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__ClientSyncEvents__3.ProjectileLaunched:connect(function(p3)
		if p3.projectileType == "oil_projectile" then
			l__SoundManager__4:playSound(l__GameSound__5.GOO_SPIT, {
				position = p3.origin, 
				rollOffMaxDistance = 150
			});
		end;
	end);
end;
local l__ItemType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v4.isRelevantItem(p4, p5)
	return p5.itemType == l__ItemType__6.OIL_CONSUMABLE;
end;
local l__Players__7 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__GameAnimationUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v4.onStartCharging(p6)
	local v6 = {};
	local v7 = l__Players__7.LocalPlayer.Character;
	if v7 ~= nil then
		v7 = v7:GetPrimaryPartCFrame().Position;
	end;
	v6.position = v7;
	v6.parent = l__Players__7.LocalPlayer.Character;
	v6.rollOffMaxDistance = 100;
	local v8 = l__SoundManager__4:playSound(l__GameSound__5.GOO_EAT, v6);
	if v8 then
		v8.Looped = true;
		p6.eatingMaid:GiveTask(function()
			v8:Stop();
			v8:Destroy();
		end);
	end;
	local v9 = l__GameAnimationUtil__8.playAnimation(l__Players__7.LocalPlayer, l__AnimationType__9.OIL_EAT, {
		looped = true
	});
	if v9 then
		p6.eatingMaid:GiveTask(function()
			v9:Stop();
		end);
	end;
end;
function v4.onStopCharging(p7)
	p7.eatingMaid:DoCleaning();
end;
function v4.onLaunch(p8)
	l__GameAnimationUtil__8.playAnimation(l__Players__7.LocalPlayer, l__AnimationType__9.OIL_SPIT, {
		looped = false
	});
end;
function v4.onStartReload(p9)

end;
function v4.onMaxCharge(p10)

end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v4.new());
return nil;

