-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__HandKnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "GlitchGrenadeLauncherController";
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
	p1.Name = "GlitchGrenadeLauncherController";
end;
local l__ItemType__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v3.isRelevantItem(p2, p3)
	return p3.itemType == l__ItemType__1.GLITCH_GRENADE_LAUNCHER;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Flamework__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
function v3.onEnable(p4, p5, p6)
	p4:setupYield(function()
		local v5 = u2.new();
		v5:GiveTask(l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__4.GLITCH_GRENADE_LAUNCHER));
		return function()
			v5:DoCleaning();
		end;
	end);
end;
function v3.onDisable(p7)

end;
local l__KnitClient__5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__AnimationType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ClientSyncEvents__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__getItemMeta__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function v3.KnitStart(p8)
	l__HandKnitController__2.KnitStart(p8);
	l__KnitClient__5.Controllers.PreloadController:preloadForItemType(l__ItemType__1.GLITCH_GRENADE_LAUNCHER, {
		animations = { l__AnimationType__6.ROCKET_LAUNCHER_IDLE, l__AnimationType__6.ROCKET_LAUNCHER_SHOT }, 
		sounds = { l__GameSound__7.CARROT_LAUNCHER_FIRE }
	});
	l__ClientSyncEvents__8.ProjectileLaunched:connect(function(p9)
		if p9:isLocalShooter() and p9.projectileType == "glitch_stun_grenade" then
			l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__4.GLITCH_GRENADE_LAUNCHER, l__getItemMeta__9(l__ItemType__1.GLITCH_GRENADE_LAUNCHER).projectileSource.fireDelaySec);
		end;
	end);
end;
local v6 = l__KnitClient__5.CreateController(v3.new());
return nil;
