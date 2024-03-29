-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "SplashPotionController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "SplashPotionController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ReplicatedStorage__2 = v2.ReplicatedStorage;
local l__Workspace__3 = v2.Workspace;
local l__EffectUtil__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__SoundManager__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		if p3.projectile == "sleep_splash_potion" then
			local v6 = l__ReplicatedStorage__2.Assets.Effects.Potion.SleepSplashPotion:Clone();
			v6.CFrame = CFrame.new(p3.position);
			v6.Parent = l__Workspace__3;
			l__EffectUtil__4:playEffects({ v6 }, nil, {
				destroyAfterSec = 3
			});
			l__SoundManager__5:playSound(l__GameSound__6.SMOKE_GRENADE_POP, {
				position = p3.position
			});
			return;
		end;
		if p3.projectile == "poison_splash_potion" then
			local v7 = l__ReplicatedStorage__2.Assets.Effects.Potion.PoisonSplashPotion:Clone();
			v7.CFrame = CFrame.new(p3.position);
			v7.Parent = l__Workspace__3;
			l__EffectUtil__4:playEffects({ v7 }, nil, {
				destroyAfterSec = 3
			});
			l__SoundManager__5:playSound(l__GameSound__6.SMOKE_GRENADE_POP, {
				position = p3.position
			});
			return;
		end;
		if p3.projectile == "heal_splash_potion" then
			local v8 = l__ReplicatedStorage__2.Assets.Effects.Potion.HealSplashPotion:Clone();
			v8.CFrame = CFrame.new(p3.position);
			v8.Parent = l__Workspace__3;
			l__EffectUtil__4:playEffects({ v8 }, nil, {
				destroyAfterSec = 3
			});
			l__SoundManager__5:playSound(l__GameSound__6.SMOKE_GRENADE_POP, {
				position = p3.position
			});
		end;
	end);
end;
local v9 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
