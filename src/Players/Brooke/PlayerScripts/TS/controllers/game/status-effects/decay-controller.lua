-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "DecayController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "DecayController";
	p1.maid = u1.new();
	p1.expireTime = 0;
	p1.isPlaying = false;
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ReplicatedStorage__3 = v2.ReplicatedStorage;
local l__EffectUtil__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__Players__5 = v2.Players;
local l__KnitClient__6 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__SoundManager__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__RunService__9 = v2.RunService;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__default__2.Client:Get("RemoteName"):Connect(function(p3)
		p2.expireTime = tick() + p3.duration;
		l__EffectUtil__4:playEffects({ (l__ReplicatedStorage__3.Assets.Effects.DecayVignette:Clone()) }, p3.player.Character, {
			destroyAfterSec = 3
		});
		local v6 = p3.player == l__Players__5.LocalPlayer;
		if v6 then
			v6 = tick();
			if v6 ~= 0 and v6 == v6 and v6 then
				v6 = p2.isPlaying == false;
			end;
		end;
		if v6 ~= 0 and v6 == v6 and v6 then
			p2.maid:GiveTask(l__KnitClient__6.Controllers.VignetteController:createVignette({
				particleEmitters = { l__ReplicatedStorage__3.Assets.Effects.DecayVignette }
			}));
			p2.isPlaying = true;
			l__SoundManager__7:playSound(l__GameSound__8.VOID_HEALTH_DECAY);
			task.delay(3, function()
				p2:cleanUpEffect();
			end);
		end;
	end);
	l__RunService__9.Heartbeat:Connect(function()
		if p2.expireTime < tick() then
			p2.isPlaying = false;
		end;
	end);
	l__default__2.Client:Get("RemoteName"):Connect(function(p4)
		if l__Players__5:GetPlayerFromCharacter(p4.entityInstance) == l__Players__5.LocalPlayer then
			p2:cleanUpEffect();
		end;
	end);
end;
function v4.cleanUpEffect(p5)
	p5.maid:DoCleaning();
end;
local v7 = l__KnitClient__6.CreateController(v4.new());
return nil;
