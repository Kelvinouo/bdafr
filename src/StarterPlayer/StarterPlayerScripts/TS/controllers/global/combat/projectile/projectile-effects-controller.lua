-- Script Hash: nil
--[[VARIABLE DEFINITION ANOMALY DETECTED, DECOMPILATION OUTPUT POTENTIALLY INCORRECT]]--
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "ProjectileEffectController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = l__KnitController__4;
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "ProjectileEffectController";
end;
local l__ClientSyncEvents__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Players__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__KnitClient__5 = v3.KnitClient;
local l__default__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ProjectileMeta__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta;
local l__SoundManager__8 = v2.SoundManager;
local l__RandomUtil__9 = v2.RandomUtil;
local l__getItemMeta__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ProjectileUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "projectile-util").ProjectileUtil;
local l__Maid__12 = v3.Maid;
function u1.KnitStart(p2)
	l__ClientSyncEvents__3.StartLaunchProjectile:connect(function(p3)
		if p3:isCancelled() then
			return nil;
		end;
		if p3.projectileSource.launchScreenShake then
			local v7 = l__Players__4.LocalPlayer.Character;
			if v7 ~= nil then
				v7 = v7:GetPrimaryPartCFrame();
			end;
			if v7 then
				l__KnitClient__5.Controllers.ScreenShakeController:shake(v7.Position, v7 * Vector3.new(-0.25, 0, -1) - v7.Position, {
					magnitude = 0.07, 
					duration = 0.15, 
					cycles = 2
				});
			end;
		end;
	end);
	l__default__6.Client:WaitFor("RemoteName"):andThen(function(p4)
		return p4:Connect(function(p5)
			local v8 = l__ProjectileMeta__7[p5.projectile];
			if v8.impactSound then
				local v9 = l__SoundManager__8:playSound(l__RandomUtil__9.fromList(unpack(v8.impactSound)), {
					position = p5.position
				});
				if v9 then
					v9.Looped = false;
				end;
			end;
			if p5.shooterPlayer == l__Players__4.LocalPlayer then
				local l__hitType__10 = p5.hitType;
				if l__hitType__10 ~= 0 and l__hitType__10 == l__hitType__10 and l__hitType__10 then
					local v11 = p5.projectileSource;
					if v11 ~= nil then
						v11 = v11.hitSounds;
					end;
					if v11 then
						local v12 = v11[p5.hitType];
						if v12 then
							l__SoundManager__8:playSound(l__RandomUtil__9.fromList(unpack(v12)));
						end;
					end;
				end;
			end;
			u1:destroyProjectile(p5.projectileModel);
		end);
	end);
	l__default__6.Client:WaitFor("RemoteName"):andThen(function(p6)
		return p6:Connect(function(p7)
			local v13 = l__ProjectileMeta__7[p7.projectile.Name];
			if p7.shootingPlayer == l__Players__4.LocalPlayer and not v13.useServerModel then
				p7.projectile:Destroy();
				return nil;
			end;
			local v14 = l__getItemMeta__10(p7.projectileSource.Name);
			if v14.projectileSource ~= nil then
				local v15 = v14.projectileSource;
			else
				local v16 = v14.block;
				if v16 ~= nil then
					v16 = v16.projectileSource;
				end;
				v15 = v16;
			end;
			if p7.shootingPlayer ~= l__Players__4.LocalPlayer then
				local v17 = v15;
				if v17 ~= nil then
					v17 = v17.launchSound;
				end;
				if v17 then
					local v18 = v15.launchSoundConfig;
					if v18 ~= nil then
						v18 = v18.pitch;
					end;
					local v19 = v15;
					if v19 ~= nil then
						v19 = v19.launchSound;
					end;
					local v20 = {
						position = p7.position
					};
					if v18 then
						local v21 = math.random() * (v18.Max - v18.Min) + v18.Min;
					else
						v21 = nil;
					end;
					v20.playbackSpeedMultiplier = v21;
					l__SoundManager__8:playSound(l__RandomUtil__9.fromList(unpack(v19)), v20);
				end;
			end;
			if not p7.projectile.PrimaryPart then
				p7.projectile:GetPropertyChangedSignal("PrimaryPart"):Wait();
				if not p7.projectile.PrimaryPart then
					return nil;
				end;
			end;
			local v22 = p7.projectile;
			if not v13.useServerModel then
				v22 = p7.projectile:Clone();
				v22.Parent = p7.projectile.Parent;
				p7.projectile:Destroy();
			end;
			if not v13.useServerModel or p7.shootingPlayer == l__Players__4.LocalPlayer then
				local l__PrimaryPart__23 = v22.PrimaryPart;
				if l__PrimaryPart__23 ~= nil then
					local v24 = l__PrimaryPart__23:FindFirstChildWhichIsA("BodyForce");
					if v24 ~= nil then
						v24:Destroy();
					end;
				end;
				local v25 = v13.gravitationalAcceleration;
				if v25 == nil then
					v25 = 196.2;
				end;
				local v26 = {};
				local v27 = v15;
				if v27 ~= nil then
					v27 = v27.relativeOverride;
				end;
				v26.relative = v27;
				local v28 = false;
				if v13.useServerModel == true then
					v28 = p7.shootingPlayer == l__Players__4.LocalPlayer;
				end;
				l__ProjectileUtil__11.fireProjectile(p7.shootingPlayer, v22, p7.projectileRefId, p7.position, p7.launchVelocity, v25, function()
					v22:Destroy();
				end, nil, v26, v28);
			end;
			local v29 = p7.shootingPlayer;
			if v29 ~= nil then
				v29 = v29.Character;
			end;
			u1:createProjectile(p7.projectile, v22, p7.launchVelocity, p7.position, v29);
			local v30 = l__Maid__12.new();
			v30:GiveTask(function()
				u1:destroyProjectile(p7.projectile);
			end);
			v30:GiveTask(v22.PrimaryPart.AncestryChanged:Connect(function()
				v30:DoCleaning();
			end));
			v30:GiveTask(l__ProjectileUtil__11.setupProjectileConstantOrientation(v22, p7.shootingPlayer));
		end);
	end);
end;
local u13 = {};
function u1.createProjectile(p8, p9, p10, p11, p12, p13)
	l__ClientSyncEvents__3.ProjectileLaunched:fire(p10.Name, p10, p11, p12, p13);
	u13[p9] = p10;
end;
function u1.destroyProjectile(p14, p15)
	local v31 = u13[p15];
	if not v31 then
		return nil;
	end;
	if not l__ClientSyncEvents__3.ProjectileDestroy:fire(v31.Name, v31):isCancelled() then
		v31:Destroy();
	end;
	u13[p15] = nil;
end;
function u1.getClientProjectile(p16, p17)
	return u13[p17];
end;
u2 = v3.KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	ClientProjectileMap = u13, 
	ProjectileEffectController = u2
};
return u1;
