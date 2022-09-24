-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "MageFireController";
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
	p1.Name = "MageFireController";
	p1.maid = u1.new();
end;
local l__ClientSyncEvents__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Players__3 = v2.Players;
local l__EntityUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__StatusEffectUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local l__StatusEffectType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__ClientSyncEvents__2.LocalProjectileImpact:connect(function(p3)
		if p3.projectile.Name ~= "mage_spell_fire" then
			return nil;
		end;
		local v6 = l__Players__3:GetPlayerByUserId(p3.projectile:GetAttribute("ProjectileShooter"));
		if not v6 then
			return nil;
		end;
		local v7 = l__EntityUtil__4:getEntity(v6);
		if v7 ~= nil then
			v7 = v7:getInstance();
		end;
		if not v7 then
			return nil;
		end;
		local v8 = p3.hitEntity;
		if v8 ~= nil then
			v8 = v8:getInstance();
		end;
		if not v8 then
			return nil;
		end;
		if l__StatusEffectUtil__5:isActive(v7, l__StatusEffectType__6.MAGE_FIRE_ELEMENT) then
			p2:playFireElementExplosion(v6, p3.hitPosition);
			p2:applyBurnParticles(v8);
		end;
	end);
end;
local l__ReplicatedStorage__7 = v2.ReplicatedStorage;
local l__EffectUtil__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v4.playFireElementExplosion(p4, p5, p6)
	local v9 = l__ReplicatedStorage__7.Assets.Effects.Explosion:Clone();
	v9.Transparency = 1;
	v9:PivotTo(CFrame.new(p6));
	l__EffectUtil__8:playEffects({ v9 }, nil, {
		sizeMultiplier = 0.5, 
		particleMultiplier = 0.5
	});
	task.delay(1.5, function()
		v9:Destroy();
	end);
end;
local l__CollectionService__9 = v2.CollectionService;
local l__SoundManager__10 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__BalanceFile__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
function v4.applyBurnParticles(p7, p8)
	if p8.PrimaryPart == nil then
		return nil;
	end;
	local v10 = p8 == l__Players__3.LocalPlayer.Character;
	local l__UpperTorso__11 = p8:FindFirstChild("UpperTorso");
	if not l__UpperTorso__11 then
		return nil;
	end;
	local v12 = {};
	local v13, v14, v15 = ipairs(l__ReplicatedStorage__7.Assets.Effects.Burn:GetChildren());
	while true do
		v13(v14, v15);
		if not v13 then
			break;
		end;
		v15 = v13;
		local v16 = v14:Clone();
		v16.Parent = l__UpperTorso__11;
		if v10 and (v16:IsA("ParticleEmitter") or v16:IsA("Beam")) then
			l__CollectionService__9:AddTag(v16, "FirstPersonHidden");
		end;
		table.insert(v12, v16);	
	end;
	local v17 = {};
	if v10 then
		local v18 = nil;
	else
		v18 = p8.PrimaryPart.Position;
	end;
	v17.position = v18;
	if v10 then
		local v19 = nil;
	else
		v19 = p8.PrimaryPart;
	end;
	v17.parent = v19;
	local v20 = l__SoundManager__10:playSound(l__GameSound__11.BURN_LOOP, v17);
	if v20 then
		v20.Looped = true;
	end;
	p7.maid:GiveTask(function()
		if v20 ~= nil then
			v20:Stop();
		end;
		local function v21(p9)
			if not p9:IsA("ParticleEmitter") then
				p9:Destroy();
				return;
			end;
			p9.Enabled = false;
			task.delay(0.5, function()
				p9:Destroy();
			end);
		end;
		local v22, v23, v24 = ipairs(v12);
		while true do
			v22(v23, v24);
			if not v22 then
				break;
			end;
			v24 = v22;
			v21(v23, v22 - 1, v12);		
		end;
	end);
	task.delay(l__BalanceFile__12.MAGE_BURN_DURATION, function()
		p7.maid:DoCleaning();
	end);
end;
local v25 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
