-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "MageIceController";
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
	p1.Name = "MageIceController";
end;
local l__ClientSyncEvents__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Players__2 = v2.Players;
local l__EntityUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__StatusEffectUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local l__StatusEffectType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__ClientSyncEvents__1.LocalProjectileImpact:connect(function(p3)
		if p3.projectile.Name ~= "mage_spell_ice" then
			return nil;
		end;
		local v6 = l__Players__2:GetPlayerByUserId(p3.projectile:GetAttribute("ProjectileShooter"));
		if not v6 then
			return nil;
		end;
		local v7 = l__EntityUtil__3:getEntity(v6);
		if v7 ~= nil then
			v7 = v7:getInstance();
		end;
		if not v7 then
			return nil;
		end;
		if l__StatusEffectUtil__4:isActive(v7, l__StatusEffectType__5.MAGE_ICE_ELEMENT) then
			p2:playIceSpikeEffect(v6, p3.hitPosition);
		end;
	end);
end;
local l__ReplicatedStorage__6 = v2.ReplicatedStorage;
local l__EffectUtil__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v4.playIceSpikeEffect(p4, p5, p6)
	local v8 = p5.Character;
	if v8 ~= nil then
		v8 = v8:GetPivot();
	end;
	if not v8 then
		return nil;
	end;
	local v9 = l__ReplicatedStorage__6.Assets.Effects.SnowBlast:Clone();
	v9.Transparency = 1;
	v9:PivotTo((v8:Lerp(CFrame.new(p6), 0.95)));
	l__EffectUtil__7:playEffects({ v9 }, nil);
end;
local v10 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
