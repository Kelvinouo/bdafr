-- Script Hash: 8b7adeb76eadf4e7cb76b42787153c131fbe7b9f0f6c75ca1fe0faa387ace9e67a6ad0576276a7fee42e0905c294c8b0
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__HandKnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "PortalGunController";
	end, 
	__index = l__HandKnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__HandKnitController__2;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "PortalGunController";
end;
local l__ClientSyncEvents__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Flamework__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__getItemMeta__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ItemType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__SoundManager__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__KnitClient__9 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__AnimationType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__ClientSyncEvents__2.ProjectileLaunched:connect(function(p3)
		if p3:isLocalShooter() and p3.projectileType == "portal_projectile" then
			l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__4.PORTAL_GUN, l__getItemMeta__5(l__ItemType__6.PORTAL_GUN).projectileSource.fireDelaySec);
		end;
	end);
	l__ClientSyncEvents__2.ProjectileRender:connect(function(p4)
		if p4.projectile.Name == "portal_projectile" then
			p4.cframe = p4.cframe * CFrame.Angles(0, p4.totalTime * 2 * math.pi, 0);
		end;
	end);
	l__ClientSyncEvents__2.ProjectileLaunched:connect(function(p5)
		if p5.projectileType == "portal_projectile" then
			local v5 = l__SoundManager__7:createSound(l__GameSound__8.TORNADO_LOOP);
			if v5 then
				v5.Looped = true;
				v5.Parent = p5.projectile.PrimaryPart;
				v5:Play();
				return;
			end;
		else
			return;
		end;
		return nil;
	end);
	l__KnitClient__9.Controllers.PreloadController:preloadForItemType(l__ItemType__6.PORTAL_GUN, {
		animations = { l__AnimationType__10.TORNADO_LAUNCHER_SHOOT, l__AnimationType__10.TORNADO_LAUNCHER_HOLD }, 
		sounds = { l__GameSound__8.TORNADO_LAUNCHER_SHOOT, l__GameSound__8.TORNADO_LOOP }
	});
end;
function v3.isRelevantItem(p6, p7)
	return p7.itemType == l__ItemType__6.PORTAL_GUN;
end;
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v3.onEnable(p8, p9, p10)
	p8:setupYield(function()
		local v6 = u11.new();
		v6:GiveTask(l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__4.PORTAL_GUN));
		return function()
			v6:DoCleaning();
		end;
	end);
end;
function v3.onDisable(p11)

end;
u1 = l__KnitClient__9.CreateController;
u1 = u1(v3.new());
return nil;
