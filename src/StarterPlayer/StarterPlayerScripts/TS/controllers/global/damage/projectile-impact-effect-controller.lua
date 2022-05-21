-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "ProjectileImpactEffectController";
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
	p1.Name = "ProjectileImpactEffectController";
end;
local l__ReplicatedStorage__2 = v2.ReplicatedStorage;
local l__Workspace__3 = v2.Workspace;
local l__GameQueryUtil__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__ClientSyncEvents__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__ProjectileMeta__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta;
local l__EffectUtil__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	task.spawn(function()
		l__ReplicatedStorage__2:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("HitEffect");
		p2.defaultEffectPart = l__ReplicatedStorage__2.Assets.Effects.ProjectileImpactDefault:Clone();
		p2.defaultEffectPart.Anchored = true;
		p2.defaultEffectPart.Parent = l__Workspace__3;
		l__GameQueryUtil__4:setQueryIgnored(p2.defaultEffectPart, true);
	end);
	l__ClientSyncEvents__5.LocalProjectileImpact:connect(function(p3)
		local v6 = l__ProjectileMeta__6[p3.projectile.Name];
		if v6.impactParticles and p3.hitEntity == nil and v6.impactParticles == "default" and p2.defaultEffectPart then
			p2.defaultEffectPart.CFrame = CFrame.new(p3.hitPosition);
			l__EffectUtil__7:playEffects({ p2.defaultEffectPart }, nil);
		end;
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
