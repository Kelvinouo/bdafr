-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "status-effect", "handlers", "client-status-effect-handler").ClientStatusEffectHandler;
local v5 = setmetatable({}, {
	__tostring = function()
		return "SmokeStatusEffectHandler";
	end, 
	__index = v4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = v4;
function v5.constructor(p1, ...)
	u1.constructor(p1, ...);
end;
local l__Players__2 = v3.Players;
local l__SoundManager__3 = v2.SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ReplicatedStorage__5 = v3.ReplicatedStorage;
local l__ClientSyncEvents__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__BlockEngineClientEvents__7 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out.client["block-engine-client-events"]).BlockEngineClientEvents;
function v5.onApply(p2, p3, p4)
	local v7 = false;
	if p3 == l__Players__2.LocalPlayer.Character then
		v7 = l__Players__2.LocalPlayer.Character;
	end;
	local v8 = {};
	if v7 then
		local v9 = nil;
	else
		local v10 = p3.PrimaryPart;
		if v10 ~= nil then
			v10 = v10.Position;
		end;
		v9 = v10;
	end;
	v8.position = v9;
	l__SoundManager__3:playSound(l__GameSound__4.USE_SMOKE_CHARGE, v8);
	local v11 = {};
	if v7 then
		local v12 = nil;
	else
		local v13 = p3.PrimaryPart;
		if v13 ~= nil then
			v13 = v13.Position;
		end;
		v12 = v13;
	end;
	v11.position = v12;
	if v7 then
		local v14 = nil;
	else
		v14 = p3.PrimaryPart;
	end;
	v11.parent = v14;
	local v15 = l__SoundManager__3:playSound(l__GameSound__4.SMOKE_CHARGE_LOOP, v11);
	if v15 then
		v15.Looped = true;
		p2.maid:GiveTask(function()
			v15:Destroy();
		end);
	end;
	p2:playSmokePuff(p3);
	task.delay(0.08, function()
		p2:playSmokePuff(p3);
	end);
	local v16 = l__ReplicatedStorage__5.Assets.Effects.SmokeTrail:Clone();
	local l__PrimaryPart__17 = p3.PrimaryPart;
	if not l__PrimaryPart__17 then
		return nil;
	end;
	v16.Parent = l__PrimaryPart__17;
	p2.maid:GiveTask(function()
		v16:Destroy();
	end);
	if v7 then
		p2.maid:GiveTask(l__ClientSyncEvents__6.PerformCombat:connect(function(p5)
			p5:setCancelled(true);
		end));
		p2.maid:GiveTask(l__BlockEngineClientEvents__7.DamageBlock:connect(function(p6)
			p6:setCancelled(true);
		end));
		p2.maid:GiveTask(l__BlockEngineClientEvents__7.PlaceBlock:connect(function(p7)
			p7:setCancelled(true);
		end));
	end;
end;
function v5.onRemove(p8, p9, p10)
	p8:playSmokePuff(p9);
	task.delay(0.08, function()
		p8:playSmokePuff(p9);
	end);
end;
local l__Workspace__8 = v3.Workspace;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__GameQueryUtil__10 = v2.GameQueryUtil;
local l__EffectUtil__11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v5.playSmokePuff(p11, p12)
	local v18 = l__ReplicatedStorage__5.Assets.Effects.SmokePuff:Clone();
	local v19 = {};
	local v20 = p12.PrimaryPart;
	if v20 ~= nil then
		v20 = v20.CFrame;
	end;
	v19.CFrame = v20;
	v19.Anchored = true;
	v19.CanQuery = false;
	v19.CanCollide = false;
	v19.Transparency = 1;
	v19.Parent = l__Workspace__8;
	local v21 = u9("Part", v19);
	l__GameQueryUtil__10:setQueryIgnored(v21, true);
	v18.Parent = v21;
	l__EffectUtil__11:playEffects({ v18 }, p12);
	task.delay(5, function()
		v21:Destroy();
	end);
end;
u1 = {
	SmokeStatusEffectHandler = v5
};
return v4;
