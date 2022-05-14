-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__HandKnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "TornadoLauncherController";
	end, 
	__index = l__HandKnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__HandKnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "TornadoLauncherController";
end;
local l__ClientSyncEvents__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Flamework__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__getItemMeta__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ItemType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__SoundManager__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__KnitClient__9 = v2.KnitClient;
local l__AnimationType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__ClientSyncEvents__2.ProjectileRender:connect(function(p3)
		if p3.projectile.Name == "tornado_missile" then
			p3.cframe = p3.cframe * CFrame.Angles(0, p3.totalTime * 5 * 2 * math.pi, 0);
		end;
	end);
	l__ClientSyncEvents__2.ProjectileLaunched:connect(function(p4)
		if p4:isLocalShooter() and p4.projectileType == "tornado_missile" then
			l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__4.TORNADO_LAUNCHER, l__getItemMeta__5(l__ItemType__6.TORNADO_LAUNCHER).projectileSource.fireDelaySec);
		end;
	end);
	l__ClientSyncEvents__2.ProjectileLaunched:connect(function(p5)
		if p5.projectileType == "tornado_missile" then
			local v6 = l__SoundManager__7:createSound(l__GameSound__8.TORNADO_LOOP);
			if v6 then
				v6.Looped = true;
				v6.Parent = p5.projectile.PrimaryPart;
				v6:Play();
				return;
			end;
		else
			return;
		end;
		return nil;
	end);
	l__KnitClient__9.Controllers.PreloadController:preloadForItemType(l__ItemType__6.TORNADO_LAUNCHER, {
		animations = { l__AnimationType__10.TORNADO_LAUNCHER_SHOOT, l__AnimationType__10.TORNADO_LAUNCHER_HOLD }, 
		sounds = { l__GameSound__8.TORNADO_LAUNCHER_SHOOT, l__GameSound__8.TORNADO_LOOP }
	});
end;
function v4.isRelevantItem(p6, p7)
	return p7.itemType == l__ItemType__6.TORNADO_LAUNCHER;
end;
local l__Maid__11 = v2.Maid;
function v4.onEnable(p8, p9, p10)
	p8:setupYield(function()
		local v7 = l__Maid__11.new();
		v7:GiveTask(l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__4.TORNADO_LAUNCHER));
		return function()
			v7:DoCleaning();
		end;
	end);
end;
function v4.onDisable(p11)

end;
u1 = l__KnitClient__9.CreateController;
u1 = u1(v4.new());
return nil;
