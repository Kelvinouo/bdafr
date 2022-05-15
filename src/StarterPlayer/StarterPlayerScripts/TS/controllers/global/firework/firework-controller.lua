
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
local u1 = l__KnitController__4;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "FireworkController";
end;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
end;
local l__ReplicatedStorage__2 = v3.ReplicatedStorage;
local l__FireworkType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local l__RandomUtil__4 = v2.RandomUtil;
local l__GameQueryUtil__5 = v2.GameQueryUtil;
local l__Workspace__6 = v3.Workspace;
local l__EffectUtil__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__SoundManager__9 = v2.SoundManager;
function v5.playFireworkEffect(p3, p4, p5, p6)
	local v7 = nil;
	v7 = l__ReplicatedStorage__2.Assets.Effects.Fireworks;
	local v8 = nil;
	if p5 == l__FireworkType__3.NORMAL then
		v8 = l__RandomUtil__4.fromList(v7.Firework_1, v7.Firework_2, v7.Firework_3);
	elseif p5 == l__FireworkType__3.SPARKS then
		v8 = l__RandomUtil__4.fromList(v7.Firework_4);
	elseif p5 == l__FireworkType__3.HEART then
		v8 = l__RandomUtil__4.fromList(v7.FireworkHearts_1);
	else
		error("Unknown firework type:", p5);
	end;
	local v9 = v8:Clone();
	v9.CanCollide = false;
	v9.CanQuery = false;
	v9.Anchored = true;
	v9.Transparency = 1;
	l__GameQueryUtil__5:setQueryIgnored(v9, true);
	v9.Parent = l__Workspace__6;
	v9.CFrame = CFrame.new(p4);
	local v10 = {};
	local v11 = p6;
	if v11 ~= nil then
		v11 = v11.sizeMultiplier;
	end;
	v10.sizeMultiplier = v11;
	l__EffectUtil__7:playEffects(v9:GetChildren(), nil, v10);
	local v12 = {
		position = p4, 
		rollOffMaxDistance = 1000
	};
	local v13 = p6;
	if v13 ~= nil then
		v13 = v13.volumeMultiplier;
	end;
	v12.volumeMultiplier = v13;
	l__SoundManager__9:playSound(l__RandomUtil__4.fromList(l__GameSound__8.FIREWORK_EXPLODE_1, l__GameSound__8.FIREWORK_EXPLODE_2, l__GameSound__8.FIREWORK_EXPLODE_3), v12);
	local u10 = l__RandomUtil__4.fromList(l__GameSound__8.FIREWORK_CRACKLE_1, l__GameSound__8.FIREWORK_CRACKLE_2, l__GameSound__8.FIREWORK_CRACKLE_3);
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
		l__SoundManager__9:playSound(u10, v14);
	end);
	task.delay(8, function()
		v9:Destroy();
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;

