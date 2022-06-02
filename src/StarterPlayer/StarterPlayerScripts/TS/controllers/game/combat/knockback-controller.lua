-- Script Hash: d128cac323f7c3652e2baf29c8971f23aeee88ddf77de983fe15d41478e662224c34a0aa5f5ee3d7e34328db39906d73
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "KnockbackController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local u2 = l__KnitController__3;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "KnockbackController";
	p1.lastKnockbackTime = 0;
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__DamageType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
local l__Players__5 = v2.Players;
local l__Workspace__6 = v2.Workspace;
local l__KnockbackUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "knockback-util").KnockbackUtil;
function u1.KnitStart(p2)
	l__default__3.Client:WaitFor("EntityDamageEvent"):andThen(function(p3)
		p3:Connect(function(p4)
			debug.profilebegin("knockback");
			if p4.damageType ~= l__DamageType__4.FALL and p4.entityInstance == l__Players__5.LocalPlayer.Character then
				local l__PrimaryPart__6 = p4.entityInstance.PrimaryPart;
				if l__PrimaryPart__6 then
					local v7 = nil;
					if p4.fromPosition then
						v7 = Vector3.new(p4.fromPosition.X, p4.fromPosition.Y, p4.fromPosition.Z);
					end;
					if v7 == nil and p4.fromEntity and p4.fromEntity.PrimaryPart then
						v7 = p4.fromEntity.PrimaryPart.Position;
					end;
					local v8 = p4.knockbackMultiplier;
					if v8 ~= nil then
						v8 = v8.disabled;
					end;
					if not v8 then
						local v9 = l__Players__5.LocalPlayer.Character.PrimaryPart;
						if v9 ~= nil then
							v9 = v9.AssemblyMass;
						end;
						local v10 = v9;
						if v10 == 0 or v10 ~= v10 or not v10 then
							v10 = 0;
						end;
						if l__Workspace__6:GetServerTimeNow() - p2.lastKnockbackTime <= 0.05 then
							return nil;
						end;
						p2.lastKnockbackTime = l__Workspace__6:GetServerTimeNow();
						l__KnockbackUtil__7.applyKnockback(l__PrimaryPart__6, v10, v7, p4.knockbackMultiplier);
					end;
				end;
			end;
			debug.profileend();
		end);
	end);
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	KnockbackController = u2
};
return u1;
