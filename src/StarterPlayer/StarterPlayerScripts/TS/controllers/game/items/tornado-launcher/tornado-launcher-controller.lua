-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__HandKnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "TornadoLauncherController";
	end, 
	__index = l__HandKnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p1)
	l__HandKnitController__2.constructor(p1);
	p1.Name = "TornadoLauncherController";
end;
local l__ClientSyncEvents__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Flamework__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__getItemMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ItemType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__SoundManager__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__KnitClient__8 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__AnimationType__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v3.KnitStart(p2)
	l__HandKnitController__2.KnitStart(p2);
	l__ClientSyncEvents__1.ProjectileRender:connect(function(p3)
		if p3.projectile.Name == "tornado_missile" then
			p3.cframe = p3.cframe * CFrame.Angles(0, p3.totalTime * 5 * 2 * math.pi, 0);
		end;
	end);
	l__ClientSyncEvents__1.ProjectileLaunched:connect(function(p4)
		if p4:isLocalShooter() and p4.projectileType == "tornado_missile" then
			l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__3.TORNADO_LAUNCHER, l__getItemMeta__4(l__ItemType__5.TORNADO_LAUNCHER).projectileSource.fireDelaySec);
		end;
	end);
	l__ClientSyncEvents__1.ProjectileLaunched:connect(function(p5)
		if p5.projectileType == "tornado_missile" then
			local v5 = l__SoundManager__6:createSound(l__GameSound__7.TORNADO_LOOP);
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
	l__KnitClient__8.Controllers.PreloadController:preloadForItemType(l__ItemType__5.TORNADO_LAUNCHER, {
		animations = { l__AnimationType__9.TORNADO_LAUNCHER_SHOOT, l__AnimationType__9.TORNADO_LAUNCHER_HOLD }, 
		sounds = { l__GameSound__7.TORNADO_LAUNCHER_SHOOT, l__GameSound__7.TORNADO_LOOP }
	});
end;
function v3.isRelevantItem(p6, p7)
	return p7.itemType == l__ItemType__5.TORNADO_LAUNCHER;
end;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v3.onEnable(p8, p9, p10)
	p8:setupYield(function()
		local v6 = u10.new();
		v6:GiveTask(l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__3.TORNADO_LAUNCHER));
		return function()
			v6:DoCleaning();
		end;
	end);
end;
function v3.onDisable(p11)

end;
local v7 = l__KnitClient__8.CreateController(v3.new());
return nil;
