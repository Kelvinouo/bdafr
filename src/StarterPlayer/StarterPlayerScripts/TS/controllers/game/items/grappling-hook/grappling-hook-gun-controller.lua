-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "grappling-hook", "grappling-hook-util");
local l__GrapplingHookGunHandler__5 = v1.import(script, script.Parent, "grappling-hook-gun-handler").GrapplingHookGunHandler;
local v6 = setmetatable({}, {
	__tostring = function()
		return "GrapplingHookGunController";
	end, 
	__index = l__GrapplingHookGunHandler__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__GrapplingHookGunHandler__5;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "GrapplingHookGunController";
	p1.hook = "grappling_hook_projectile";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__GrapplingHookFunctions__3 = v4.GrapplingHookFunctions;
local l__Flamework__4 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__HIT_PLAYER_COOLDOWN__6 = v4.HIT_PLAYER_COOLDOWN;
local l__SharedSyncEvents__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local l__Players__8 = v3.Players;
local l__HIT_BLOCK_COOLDOWN__9 = v4.HIT_BLOCK_COOLDOWN;
local l__ClientSyncEvents__10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__EntityUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__InventoryEntity__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "inventory-entity").InventoryEntity;
local l__ItemType__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__Maid__14 = v2.Maid;
local l__KnitClient__15 = v2.KnitClient;
local l__SoundManager__16 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Workspace__18 = v3.Workspace;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:Get("RemoteName"):Connect(function(p3)
		local v8 = p2:getHookState() == l__GrapplingHookFunctions__3.HOOK_FORWARD_TRANSIT;
		local v9 = p2:getHookState() == l__GrapplingHookFunctions__3.HOOK_BACKWARD_TRANSIT;
		local v10 = p2:getHookState() == l__GrapplingHookFunctions__3.PLAYER_IN_TRANSIT;
		if p3.hitEntity then
			l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__5.GRAPPLING_HOOK, l__HIT_PLAYER_COOLDOWN__6);
			l__SharedSyncEvents__7.HookFunctionSwapEvent:fire(l__Players__8.LocalPlayer, p3.hookFunction);
			p2:transit(l__Players__8.LocalPlayer, p3.endGoal, p3.hitBasePart);
			return nil;
		end;
		if not v8 and not v9 then
			if v10 and p3.hookFunction == l__GrapplingHookFunctions__3.HOOK_CHAMBERED then
				l__SharedSyncEvents__7.HookFunctionSwapEvent:fire(l__Players__8.LocalPlayer, p3.hookFunction);
			end;
			return;
		end;
		l__SharedSyncEvents__7.HookFunctionSwapEvent:fire(l__Players__8.LocalPlayer, p3.hookFunction);
		l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__5.GRAPPLING_HOOK, l__HIT_BLOCK_COOLDOWN__9);
		p2:transit(l__Players__8.LocalPlayer, p3.endGoal, p3.hitBasePart);
	end);
	l__ClientSyncEvents__10.StartLaunchProjectile:connect(function(p4)
		if p4.projectileType ~= p2.hook then
			return nil;
		end;
		if not p2:useGrapple() then
			return nil;
		end;
		if p2:getHookState() ~= l__GrapplingHookFunctions__3.HOOK_CHAMBERED then
			p4:setCancelled(true);
			return nil;
		end;
		p2:setHookState(l__GrapplingHookFunctions__3.HOOK_FORWARD_TRANSIT);
		l__SharedSyncEvents__7.HookFunctionSwapEvent:fire(l__Players__8.LocalPlayer, l__GrapplingHookFunctions__3.HOOK_FORWARD_TRANSIT);
	end);
	l__ClientSyncEvents__10.ProjectileLaunched:connect(function(p5)
		if p5:isCancelled() then
			return nil;
		end;
		if p5.projectileType ~= "grappling_hook_projectile" then
			return nil;
		end;
		if not p5.shooter then
			return nil;
		end;
		local v11 = l__EntityUtil__11:getEntity(p5.shooter);
		if not v11 then
			return nil;
		end;
		if v1.instanceof(v11, l__InventoryEntity__12) then
			local v12 = v11:getItemInstanceFromCharacter(l__ItemType__13.GRAPPLING_HOOK);
			if not v12 then
				return nil;
			end;
			local l__Handle__13 = p5.projectile:FindFirstChild("Handle");
			if not l__Handle__13 then
				return nil;
			end;
			local v14 = p5.projectile:FindFirstChild("Handle");
			if v14 ~= nil then
				v14 = v14:FindFirstChild("RopeBeam");
			end;
			if not v14 then
				return nil;
			end;
			local u19 = l__Maid__14.new();
			v14.Destroying:Connect(function()
				u19:DoCleaning();
			end);
			local v15 = v12:FindFirstChild("Handle");
			if v15 ~= nil then
				v15 = v15:FindFirstChild("RopeAttachment");
			end;
			if not v15 then
				return nil;
			end;
			local v16 = p5.projectile:FindFirstChild("Handle");
			if v16 ~= nil then
				v16 = v16:FindFirstChild("RopeAttachment");
			end;
			if not v16 then
				return nil;
			end;
			if p5:isLocalShooter() and l__KnitClient__15.Controllers.ViewmodelController:isVisible() then
				local v17 = l__KnitClient__15.Controllers.ViewmodelController:getViewModel();
				if v17 ~= nil then
					v17 = v17:FindFirstChild(l__ItemType__13.GRAPPLING_HOOK);
					if v17 ~= nil then
						v17 = v17:FindFirstChild("Handle");
						if v17 ~= nil then
							v17 = v17:FindFirstChild("RopeAttachment");
						end;
					end;
				end;
				if v17 then
					v14.Attachment0 = v17;
				else
					v14.Attachment0 = v15;
				end;
			else
				v14.Attachment0 = v15;
			end;
			local v18 = v11:getInstance():FindFirstChild("UpperTorso");
			if v18 ~= nil then
				v18 = v18:FindFirstChild("BodyFrontAttachment");
			end;
			v15.Destroying:Connect(function()
				if v18 and v14.Parent then
					v14.Attachment0 = v18;
				end;
			end);
			local v19 = l__SoundManager__16:playSound(l__GameSound__17.GRAPPLING_HOOK_EXTEND_LOOP, {
				position = l__Handle__13.Position, 
				parent = l__Handle__13, 
				rollOffMaxDistance = 150
			});
			if v19 then
				v19.Looped = true;
			end;
			u19:GiveTask(function()
				if v19 ~= nil then
					v19:Stop();
				end;
				if v19 ~= nil then
					v19:Destroy();
				end;
			end);
		end;
	end);
	l__ClientSyncEvents__10.LocalProjectileImpact:connect(function(p6)
		if p6.projectile.Name ~= "grappling_hook_projectile" then
			return nil;
		end;
		local v20 = l__Maid__14.new();
		local v21 = p6.projectile:Clone();
		v21.Parent = l__Workspace__18;
		v20:GiveTask(function()
			v21:Destroy();
		end);
		task.delay(1, function()
			v20:DoCleaning();
		end);
		for v22, v23 in ipairs(v21:GetDescendants()) do
			if v23:IsA("BasePart") then
				v23.Anchored = true;
			end;
		end;
		local v24 = v21:FindFirstChild("Handle");
		if v24 ~= nil then
			v24 = v24:FindFirstChild("RopeBeam");
		end;
		if not v24 then
			return nil;
		end;
		if v24.Attachment0 then
			local v25 = v24.Attachment0.Parent;
			if v25 ~= nil then
				v25 = v25.Parent;
				if v25 ~= nil then
					v25 = v25:IsA("Accessory");
				end;
			end;
			if v25 then
				local l__Parent__26 = v24.Attachment0.Parent.Parent.Parent;
				if l__Parent__26 then
					v24.Attachment0.Destroying:Connect(function()
						local v27 = l__Parent__26:FindFirstChild("UpperTorso");
						if v27 ~= nil then
							v27 = v27:FindFirstChild("BodyFrontAttachment");
						end;
						v24.Attachment0 = v27;
					end);
				end;
			end;
		end;
	end);
end;
function v6.useGrapple(p7)
	if not l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(l__CooldownId__5.GRAPPLING_HOOK) then
		return true;
	end;
	if l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(l__CooldownId__5.GRAPPLING_HOOK) < 0.25 then
		l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(l__CooldownId__5.GRAPPLING_HOOK, "buffer", function()
			if not p7:isEnabled() then
				return;
			end;
			return p7:useGrapple();
		end);
	end;
	return false;
end;
u1 = l__KnitClient__15.CreateController;
u1 = u1(v6.new());
return nil;
