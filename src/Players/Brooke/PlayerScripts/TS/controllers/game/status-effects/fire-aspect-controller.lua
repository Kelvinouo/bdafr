-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "FireAspectController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "FireAspectController";
end;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__StatusEffectType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local u4 = v1.import(script, script.Parent.Parent.Parent, "global", "status-effect", "handlers", "client-status-effect-handler").ClientStatusEffectHandler;
local l__Players__5 = v2.Players;
local l__ReplicatedStorage__6 = v2.ReplicatedStorage;
local l__CollectionService__7 = v2.CollectionService;
local l__SoundManager__8 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	local l__StatusEffectController__6 = l__KnitClient__2.Controllers.StatusEffectController;
	local v7 = setmetatable({}, {
		__tostring = function()
			return "Anonymous";
		end, 
		__index = u4
	});
	v7.__index = v7;
	function v7.new(...)
		local v8 = setmetatable({}, v7);
		return v8:constructor(...) and v8;
	end;
	local u11 = u4;
	function v7.constructor(p3, ...)
		u11.constructor(p3, ...);
	end;
	function v7.onApply(p4, p5, p6)
		if p5.PrimaryPart == nil then
			return nil;
		end;
		local v9 = p5 == l__Players__5.LocalPlayer.Character;
		local l__UpperTorso__10 = p5:FindFirstChild("UpperTorso");
		if not l__UpperTorso__10 then
			return nil;
		end;
		local v11 = {};
		for v12, v13 in ipairs(l__ReplicatedStorage__6.Assets.Effects.Burn:GetChildren()) do
			local v14 = v13:Clone();
			v14.Parent = l__UpperTorso__10;
			if v9 and (v14:IsA("ParticleEmitter") or v14:IsA("Beam")) then
				l__CollectionService__7:AddTag(v14, "FirstPersonHidden");
			end;
			table.insert(v11, v14);
		end;
		local v15 = {};
		if v9 then
			local v16 = nil;
		else
			v16 = p5.PrimaryPart.Position;
		end;
		v15.position = v16;
		if v9 then
			local v17 = nil;
		else
			v17 = p5.PrimaryPart;
		end;
		v15.parent = v17;
		local v18 = l__SoundManager__8:playSound(l__GameSound__9.BURN_LOOP, v15);
		if v18 then
			v18.Looped = true;
		end;
		p4.maid:GiveTask(function()
			if v18 ~= nil then
				v18:Stop();
			end;
			local function v19(p7)
				if not p7:IsA("ParticleEmitter") then
					p7:Destroy();
					return;
				end;
				p7.Enabled = false;
				task.delay(3, function()
					p7:Destroy();
				end);
			end;
			for v20, v21 in ipairs(v11) do
				v19(v21, v20 - 1, v11);
			end;
		end);
	end;
	function v7.onRemove(p8, p9, p10)

	end;
	u11 = l__StatusEffectController__6.setHandler;
	u11(l__StatusEffectController__6, l__StatusEffectType__3.BURN, v7);
	u11 = l__default__10.Client;
	u11 = u11.OnEvent;
	u11(u11, "FireAspectHit", function(p11)
		if p11.to.PrimaryPart == nil then
			return nil;
		end;
		local v22 = p11.to == l__Players__5.LocalPlayer.Character;
		local v23 = {};
		if v22 then
			local v24 = nil;
		else
			v24 = p11.to.PrimaryPart.Position;
		end;
		v23.position = v24;
		if v22 then
			local v25 = nil;
		else
			v25 = p11.to.PrimaryPart;
		end;
		v23.parent = v25;
		l__SoundManager__8:playSound(l__GameSound__9.BURN_HIT, v23);
		local l__UpperTorso__26 = p11.to:FindFirstChild("UpperTorso");
		if not l__UpperTorso__26 then
			return nil;
		end;
		local v27 = {};
		if v22 then
			local v28 = nil;
		else
			v28 = l__UpperTorso__26.Position;
		end;
		v27.position = v28;
		l__SoundManager__8:playSound(l__GameSound__9.BURN_HIT, v27);
		local v29 = {};
		for v30, v31 in ipairs(l__ReplicatedStorage__6.Assets.Effects.FireHit:Clone():GetChildren()) do
			v31.Parent = l__UpperTorso__26;
			table.insert(v29, v31);
		end;
		task.delay(5, function()
			for v32, v33 in ipairs(v29) do
				v33:Destroy();
			end;
		end);
	end);
end;
u1 = l__KnitClient__2.CreateController;
u1 = u1(v4.new());
return nil;
