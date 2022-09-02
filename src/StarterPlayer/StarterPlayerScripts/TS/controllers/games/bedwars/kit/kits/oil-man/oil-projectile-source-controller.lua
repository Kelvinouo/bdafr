-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "OilProjectileController";
	end, 
	__index = v2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v3.constructor(p1, ...)
	v2.constructor(p1, ...);
	p1.Name = "OilProjectileController";
	p1.Client = {};
	p1.eatingMaid = u1.new();
end;
local l__ClientSyncEvents__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__SoundManager__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v3.KnitStart(p2)
	v2.KnitStart(p2);
	l__ClientSyncEvents__2.ProjectileLaunched:connect(function(p3)
		if p3.projectileType == "oil_projectile" then
			l__SoundManager__3:playSound(l__GameSound__4.GOO_SPIT, {
				position = p3.origin, 
				rollOffMaxDistance = 150
			});
		end;
	end);
end;
local l__ItemType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v3.isRelevantItem(p4, p5)
	return p5.itemType == l__ItemType__5.OIL_CONSUMABLE;
end;
local l__Players__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__GameAnimationUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v3.onStartCharging(p6)
	local v5 = {};
	local v6 = l__Players__6.LocalPlayer.Character;
	if v6 ~= nil then
		v6 = v6:GetPrimaryPartCFrame().Position;
	end;
	v5.position = v6;
	v5.parent = l__Players__6.LocalPlayer.Character;
	v5.rollOffMaxDistance = 100;
	local v7 = l__SoundManager__3:playSound(l__GameSound__4.GOO_EAT, v5);
	if v7 then
		v7.Looped = true;
		p6.eatingMaid:GiveTask(function()
			v7:Stop();
			v7:Destroy();
		end);
	end;
	local v8 = l__GameAnimationUtil__7.playAnimation(l__Players__6.LocalPlayer, l__AnimationType__8.OIL_EAT, {
		looped = true
	});
	if v8 then
		p6.eatingMaid:GiveTask(function()
			v8:Stop();
		end);
	end;
end;
function v3.onStopCharging(p7)
	p7.eatingMaid:DoCleaning();
end;
function v3.onLaunch(p8)
	l__GameAnimationUtil__7.playAnimation(l__Players__6.LocalPlayer, l__AnimationType__8.OIL_SPIT, {
		looped = false
	});
end;
function v3.onStartReload(p9)

end;
function v3.onMaxCharge(p10)

end;
local v9 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
