-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "StomperRelicEffectsController";
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
	p1.Name = "StomperRelicEffectsController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__2 = v2.Players;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__default__1.Client:WaitFor("RemoteName"):expect():Connect(function(p3)
		if p3.player == l__Players__2.LocalPlayer then
			p2:playLocalEffects();
		end;
		p2:playEffects(p3.pos);
		p2:playSound(p3.player, p3.pos);
	end);
end;
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function v4.playLocalEffects(p4)
	l__KnitClient__3.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -2, 0), {
		cycles = 2, 
		duration = 0.25
	});
end;
local l__ReplicatedStorage__4 = v2.ReplicatedStorage;
local l__Workspace__5 = v2.Workspace;
local l__EffectUtil__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v4.playEffects(p5, p6)
	local v6 = l__ReplicatedStorage__4.Assets.Effects.Stomper:Clone();
	if not v6.PrimaryPart then
		return nil;
	end;
	v6:SetPrimaryPartCFrame(p6);
	v6.Parent = l__Workspace__5;
	l__EffectUtil__6:playEffects({ v6 }, nil);
	task.delay(0.5, function()
		v6:Destroy();
	end);
end;
local l__SoundManager__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.playSound(p7, p8, p9)
	local v7 = {};
	if p8 == l__Players__2.LocalPlayer then
		local v8 = nil;
	else
		v8 = p9.Position;
	end;
	v7.position = v8;
	l__SoundManager__7:playSound(l__GameSound__8.STOMPER_HIT, v7);
end;
local v9 = l__KnitClient__3.CreateController(v4.new());
return nil;
