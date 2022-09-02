--[[VARIABLE DEFINITION ANOMALY DETECTED, DECOMPILATION OUTPUT POTENTIALLY INCORRECT]]--
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
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
function u1.constructor(p1, ...)
	l__KnitController__4.constructor(p1, ...);
	p1.Name = "ProjectileEffectController";
end;
local l__ClientSyncEvents__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__KnitClient__4 = v3.KnitClient;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ProjectileMeta__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta;
local l__SoundManager__7 = v2.SoundManager;
local l__RandomUtil__8 = v2.RandomUtil;
local l__getItemMeta__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ProjectileUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "projectile-util").ProjectileUtil;
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.KnitStart(p2)
	l__ClientSyncEvents__2.StartLaunchProjectile:connect(function(p3)
		if p3:isCancelled() then
			return nil;
		end;
		if p3.projectileSource.launchScreenShake then
			local v7 = l__Players__3.LocalPlayer.Character;
			if v7 ~= nil then
				v7 = v7:GetPrimaryPartCFrame();
			end;
			if v7 then
				l__KnitClient__4.Controllers.ScreenShakeController:shake(v7.Position, v7 * Vector3.new(-0.25, 0, -1) - v7.Position, p3.projectileSource.launchScreenShake.config);
			end;
		end;
	end);
	l__default__5.Client:WaitFor("RemoteName"):andThen(function(p4)
		return p4:Connect(function(p5)
			local v8 = l__ProjectileMeta__6[p5.projectile];
			if v8.impactSound then
				local v9 = l__SoundManager__7:playSound(l__RandomUtil__8.fromList(unpack(v8.impactSound)), {
					position = p5.position
				});
				if v9 then
					v9.Looped = false;
				end;
			end;
			if p5.shooterPlayer == l__Players__3.LocalPlayer then
				local l__hitType__10 = p5.hitType;
				if l__hitType__10 ~= 0 and l__hitType__10 == l__hitType__10 and l__hitType__10 then
					local v11 = p5.projectileSource;
					if v11 ~= nil then
						v11 = v11.hitSounds;
					end;
					if v11 then
						local v12 = v11[p5.hitType];
						if v12 then
							l__SoundManager__7:playSound(l__RandomUtil__8.fromList(unpack(v12)));
						end;
					end;
				end;
			end;
			u1:destroyProjectile(p5.projectileModel);
		end);
	end);
	l__default__5.Client:WaitFor("RemoteName"):andThen(function(p6)
		return p6:Connect(function(p7)
			local v13 = l__ProjectileMeta__6[p7.projectile.Name];
			if p7.shootingPlayer == l__Players__3.LocalPlayer and not v13.useServerModel then
				p7.projectile:Destroy();
				return nil;
			end;
			local v14 = l__getItemMeta__9(p7.projectileSource.Name);
			if v14.projectileSource ~= nil then
				local v15 = v14.projectileSource;
			else
				local v16 = v14.block;
				if v16 ~= nil then
					v16 = v16.projectileSource;
				end;
				v15 = v16;
			end;
			if p7.shootingPlayer ~= l__Players__3.LocalPlayer then
				local v17 = v15;
				if v17 ~= nil then
					v17 = v17.launchSound;
				end;
				if v17 then
					local l__launchSoundConfig__18 = v15.launchSoundConfig;
					local v19 = l__launchSoundConfig__18;
					if v19 ~= nil then
						v19 = v19.pitch;
					end;
					local v20 = v15;
					if v20 ~= nil then
						v20 = v20.launchSound;
					end;
					local v21 = {
						position = p7.position
					};
					if v19 then
						local v22 = math.random() * (v19.Max - v19.Min) + v19.Min;
					else
						v22 = nil;
					end;
					v21.playbackSpeedMultiplier = v22;
					local v23 = l__launchSoundConfig__18;
					if v23 ~= nil then
						v23 = v23.volumeMultiplier;
					end;
					local v24 = v23;
					if v24 == nil then
						v24 = 1;
					end;
					v21.volumeMultiplier = v24;
					l__SoundManager__7:playSound(l__RandomUtil__8.fromList(unpack(v20)), v21);
				end;
			end;
			if not p7.projectile.PrimaryPart then
				p7.projectile:GetPropertyChangedSignal("PrimaryPart"):Wait();
				if not p7.projectile.PrimaryPart then
					return nil;
				end;
			end;
			local v25 = p7.projectile;
			if not v13.useServerModel then
				v25 = p7.projectile:Clone();
				v25.Parent = p7.projectile.Parent;
				p7.projectile:Destroy();
			end;
			if not v13.useServerModel or p7.shootingPlayer == l__Players__3.LocalPlayer then
				local l__PrimaryPart__26 = v25.PrimaryPart;
				if l__PrimaryPart__26 ~= nil then
					local v27 = l__PrimaryPart__26:FindFirstChildWhichIsA("BodyForce");
					if v27 ~= nil then
						v27:Destroy();
					end;
				end;
				local v28 = v13.gravitationalAcceleration;
				if v28 == nil then
					v28 = 196.2;
				end;
				local v29 = {};
				local v30 = v15;
				if v30 ~= nil then
					v30 = v30.relativeOverride;
				end;
				v29.relative = v30;
				local v31 = false;
				if v13.useServerModel == true then
					v31 = p7.shootingPlayer == l__Players__3.LocalPlayer;
				end;
				l__ProjectileUtil__10.fireProjectile(p7.shootingPlayer, v25, p7.projectileRefId, p7.position, p7.launchVelocity, v28, function()
					v25:Destroy();
				end, nil, v29, v31);
			end;
			local v32 = p7.shootingPlayer;
			if v32 ~= nil then
				v32 = v32.Character;
			end;
			u1:createProjectile(p7.projectile, v25, p7.launchVelocity, p7.position, v32);
			local v33 = u11.new();
			v33:GiveTask(function()
				u1:destroyProjectile(p7.projectile);
			end);
			v33:GiveTask(v25.PrimaryPart.AncestryChanged:Connect(function()
				v33:DoCleaning();
			end));
			v33:GiveTask(l__ProjectileUtil__10.setupProjectileConstantOrientation(v25, p7.shootingPlayer));
		end);
	end);
end;
local u12 = {};
function u1.createProjectile(p8, p9, p10, p11, p12, p13)
	l__ClientSyncEvents__2.ProjectileLaunched:fire(p10.Name, p10, p11, p12, p13);
	u12[p9] = p10;
end;
function u1.destroyProjectile(p14, p15)
	local v34 = u12[p15];
	if not v34 then
		return nil;
	end;
	if not l__ClientSyncEvents__2.ProjectileDestroy:fire(v34.Name, v34):isCancelled() then
		v34:Destroy();
	end;
	u12[p15] = nil;
end;
function u1.getClientProjectile(p16, p17)
	return u12[p17];
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(u1.new());
return {
	ClientProjectileMap = u12, 
	ProjectileEffectController = u1
};
