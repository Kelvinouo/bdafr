-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = Color3.fromRGB(237, 74, 74);
local v4 = Color3.fromRGB(0, 0, 0);
local l__HandKnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "TennisRacketController";
	end, 
	__index = l__HandKnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__HandKnitController__5;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "TennisRacketController";
end;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v6.isRelevantItem(p2, p3)
	return p3.itemType == l__ItemType__2.TENNIS_RACKET;
end;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Flamework__4 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
function v6.onEnable(p4, p5, p6)
	p4:setupYield(function()
		local v8 = u3.new();
		v8:GiveTask(l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__5.TENNIS_RACKET));
		return function()
			v8:DoCleaning();
		end;
	end);
end;
function v6.onDisable(p7)

end;
local l__KnitClient__6 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__AnimationType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ClientSyncEvents__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__getItemMeta__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__Workspace__11 = v2.Workspace;
local l__default__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v6.KnitStart(p8)
	u1.KnitStart(p8);
	l__KnitClient__6.Controllers.PreloadController:preloadForItemType(l__ItemType__2.TENNIS_RACKET, {
		animations = { l__AnimationType__7.TENNIS_RACKET_IDLE, l__AnimationType__7.TENNIS_RACKET_HIT }, 
		sounds = { l__GameSound__8.TENNIS_BALL_HIT_1, l__GameSound__8.TENNIS_BALL_HIT_2 }
	});
	l__ClientSyncEvents__9.ProjectileLaunched:connect(function(p9)
		if p9:isLocalShooter() and p9.projectileType == "tennis_ball" then
			l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__5.TENNIS_RACKET, l__getItemMeta__10(l__ItemType__2.TENNIS_RACKET).projectileSource.fireDelaySec, {
				cooldownBar = {
					color = Color3.fromRGB(156, 222, 84)
				}
			});
			local l__Trail__9 = p9.projectile:FindFirstChild("Handle"):FindFirstChild("Trail");
			if l__Trail__9 then
				l__Trail__9.Parent = l__Workspace__11;
			end;
			task.spawn(function()
				wait(3);
				if l__Trail__9 then
					l__Trail__9:Destroy();
				end;
			end);
		end;
	end);
	l__default__12.Client:Get("RemoteName"):Connect(function(p10)
		p8:playExplosion(p10.position);
	end);
end;
local l__ReplicatedStorage__13 = v2.ReplicatedStorage;
local l__EffectUtil__14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__SoundManager__15 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
function v6.playExplosion(p11, p12)
	local v10 = l__ReplicatedStorage__13.Assets.Effects.Explosion:Clone();
	v10.Parent = l__Workspace__11;
	l__EffectUtil__14:playEffects({ v10 }, nil, {
		sizeMultiplier = 0.75
	});
	l__SoundManager__15:playSound(l__GameSound__8.TNT_EXPLODE_1, {
		volumeMultiplier = 1.1, 
		position = p12, 
		rollOffMinDistsance = 50, 
		rollOffMaxDistance = 400
	});
	v10.CFrame = CFrame.new(p12);
	task.delay(1, function()
		v10:Destroy();
	end);
end;
u1 = l__KnitClient__6.CreateController;
u1 = u1(v6.new());
return nil;
