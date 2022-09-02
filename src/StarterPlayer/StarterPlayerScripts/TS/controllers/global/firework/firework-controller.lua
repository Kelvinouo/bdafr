-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "FireworkController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "FireworkController";
end;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
end;
local l__ReplicatedStorage__1 = v3.ReplicatedStorage;
local l__FireworkType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local l__RandomUtil__3 = v2.RandomUtil;
local l__GameQueryUtil__4 = v2.GameQueryUtil;
local l__Workspace__5 = v3.Workspace;
local l__EffectUtil__6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__SoundManager__8 = v2.SoundManager;
function v5.playFireworkEffect(p3, p4, p5, p6)
	local v7 = nil;
	v7 = l__ReplicatedStorage__1.Assets.Effects.Fireworks;
	local v8 = nil;
	if p5 == l__FireworkType__2.NORMAL then
		v8 = l__RandomUtil__3.fromList(v7.Firework_1, v7.Firework_2, v7.Firework_3);
	elseif p5 == l__FireworkType__2.SPARKS then
		v8 = l__RandomUtil__3.fromList(v7.Firework_4);
	elseif p5 == l__FireworkType__2.HEART then
		v8 = l__RandomUtil__3.fromList(v7.FireworkHearts_1);
	else
		error("Unknown firework type:", p5);
	end;
	local v9 = v8:Clone();
	v9.CanCollide = false;
	v9.CanQuery = false;
	v9.Anchored = true;
	v9.Transparency = 1;
	l__GameQueryUtil__4:setQueryIgnored(v9, true);
	v9.Parent = l__Workspace__5;
	v9.CFrame = CFrame.new(p4);
	local v10 = {};
	local v11 = p6;
	if v11 ~= nil then
		v11 = v11.sizeMultiplier;
	end;
	v10.sizeMultiplier = v11;
	l__EffectUtil__6:playEffects(v9:GetChildren(), nil, v10);
	local v12 = {
		position = p4, 
		rollOffMaxDistance = 1000
	};
	local v13 = p6;
	if v13 ~= nil then
		v13 = v13.volumeMultiplier;
	end;
	v12.volumeMultiplier = v13;
	l__SoundManager__8:playSound(l__RandomUtil__3.fromList(l__GameSound__7.FIREWORK_EXPLODE_1, l__GameSound__7.FIREWORK_EXPLODE_2, l__GameSound__7.FIREWORK_EXPLODE_3), v12);
	local u9 = l__RandomUtil__3.fromList(l__GameSound__7.FIREWORK_CRACKLE_1, l__GameSound__7.FIREWORK_CRACKLE_2, l__GameSound__7.FIREWORK_CRACKLE_3);
	task.delay(0.4, function()
		local v14 = {
			position = p4, 
			rollOffMaxDistance = 1000
		};
		local v15 = p6;
		if v15 ~= nil then
			v15 = v15.volumeMultiplier;
		end;
		v14.volumeMultiplier = v15;
		l__SoundManager__8:playSound(u9, v14);
	end);
	task.delay(8, function()
		v9:Destroy();
	end);
end;
local v16 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
