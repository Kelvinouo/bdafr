-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "grappling-hook", "grappling-hook-util");
local l__GrapplingHookGunHandler__4 = v1.import(script, script.Parent, "grappling-hook-gun-handler").GrapplingHookGunHandler;
local v5 = setmetatable({}, {
	__tostring = function()
		return "GrapplingHookGunController";
	end, 
	__index = l__GrapplingHookGunHandler__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__GrapplingHookGunHandler__4;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "GrapplingHookGunController";
	p1.hook = "grappling_hook_projectile";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__GrapplingHookFunctions__3 = v3.GrapplingHookFunctions;
local l__Flamework__4 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__HIT_PLAYER_COOLDOWN__6 = v3.HIT_PLAYER_COOLDOWN;
local l__SharedSyncEvents__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local l__Players__8 = v2.Players;
local l__HIT_BLOCK_COOLDOWN__9 = v3.HIT_BLOCK_COOLDOWN;
local l__ClientSyncEvents__10 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__EntityUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__InventoryEntity__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "inventory-entity").InventoryEntity;
local l__ItemType__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u14 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__KnitClient__15 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__SoundManager__16 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Workspace__18 = v2.Workspace;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:Get("RemoteName"):Connect(function(p3)
		local v7 = p2:getHookState() == l__GrapplingHookFunctions__3.HOOK_FORWARD_TRANSIT;
		local v8 = p2:getHookState() == l__GrapplingHookFunctions__3.HOOK_BACKWARD_TRANSIT;
		local v9 = p2:getHookState() == l__GrapplingHookFunctions__3.PLAYER_IN_TRANSIT;
		if p3.hitEntity then
			l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__5.GRAPPLING_HOOK, l__HIT_PLAYER_COOLDOWN__6);
			l__SharedSyncEvents__7.HookFunctionSwapEvent:fire(l__Players__8.LocalPlayer, p3.hookFunction);
			p2:transit(l__Players__8.LocalPlayer, p3.endGoal, p3.hitBasePart);
			return nil;
		end;
		if not v7 and not v8 then
			if v9 and p3.hookFunction == l__GrapplingHookFunctions__3.HOOK_CHAMBERED then
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
		local v10 = l__EntityUtil__11:getEntity(p5.shooter);
		if not v10 then
			return nil;
		end;
		if v1.instanceof(v10, l__InventoryEntity__12) then
			local v11 = v10:getItemInstanceFromCharacter(l__ItemType__13.GRAPPLING_HOOK);
			if not v11 then
				return nil;
			end;
			local l__Handle__12 = p5.projectile:FindFirstChild("Handle");
			if not l__Handle__12 then
				return nil;
			end;
			local v13 = p5.projectile:FindFirstChild("Handle");
			if v13 ~= nil then
				v13 = v13:FindFirstChild("RopeBeam");
			end;
			if not v13 then
				return nil;
			end;
			local u19 = u14.new();
			v13.Destroying:Connect(function()
				u19:DoCleaning();
			end);
			local v14 = v11:FindFirstChild("Handle");
			if v14 ~= nil then
				v14 = v14:FindFirstChild("RopeAttachment");
			end;
			if not v14 then
				return nil;
			end;
			local v15 = p5.projectile:FindFirstChild("Handle");
			if v15 ~= nil then
				v15 = v15:FindFirstChild("RopeAttachment");
			end;
			if not v15 then
				return nil;
			end;
			if p5:isLocalShooter() and l__KnitClient__15.Controllers.ViewmodelController:isVisible() then
				local v16 = l__KnitClient__15.Controllers.ViewmodelController:getViewModel();
				if v16 ~= nil then
					v16 = v16:FindFirstChild(l__ItemType__13.GRAPPLING_HOOK);
					if v16 ~= nil then
						v16 = v16:FindFirstChild("Handle");
						if v16 ~= nil then
							v16 = v16:FindFirstChild("RopeAttachment");
						end;
					end;
				end;
				if v16 then
					v13.Attachment0 = v16;
				else
					v13.Attachment0 = v14;
				end;
			else
				v13.Attachment0 = v14;
			end;
			local v17 = v10:getInstance():FindFirstChild("UpperTorso");
			if v17 ~= nil then
				v17 = v17:FindFirstChild("BodyFrontAttachment");
			end;
			v14.Destroying:Connect(function()
				if v17 and v13.Parent then
					v13.Attachment0 = v17;
				end;
			end);
			local v18 = l__SoundManager__16:playSound(l__GameSound__17.GRAPPLING_HOOK_EXTEND_LOOP, {
				position = l__Handle__12.Position, 
				parent = l__Handle__12, 
				rollOffMaxDistance = 150
			});
			if v18 then
				v18.Looped = true;
			end;
			u19:GiveTask(function()
				if v18 ~= nil then
					v18:Stop();
				end;
				if v18 ~= nil then
					v18:Destroy();
				end;
			end);
		end;
	end);
	l__ClientSyncEvents__10.LocalProjectileImpact:connect(function(p6)
		if p6.projectile.Name ~= "grappling_hook_projectile" then
			return nil;
		end;
		local v19 = u14.new();
		local v20 = p6.projectile:Clone();
		v20.Parent = l__Workspace__18;
		v19:GiveTask(function()
			v20:Destroy();
		end);
		task.delay(1, function()
			v19:DoCleaning();
		end);
		for v21, v22 in ipairs(v20:GetDescendants()) do
			if v22:IsA("BasePart") then
				v22.Anchored = true;
			end;
		end;
		local v23 = v20:FindFirstChild("Handle");
		if v23 ~= nil then
			v23 = v23:FindFirstChild("RopeBeam");
		end;
		if not v23 then
			return nil;
		end;
		if v23.Attachment0 then
			local v24 = v23.Attachment0.Parent;
			if v24 ~= nil then
				v24 = v24.Parent;
				if v24 ~= nil then
					v24 = v24:IsA("Accessory");
				end;
			end;
			if v24 then
				local l__Parent__25 = v23.Attachment0.Parent.Parent.Parent;
				if l__Parent__25 then
					v23.Attachment0.Destroying:Connect(function()
						local v26 = l__Parent__25:FindFirstChild("UpperTorso");
						if v26 ~= nil then
							v26 = v26:FindFirstChild("BodyFrontAttachment");
						end;
						v23.Attachment0 = v26;
					end);
				end;
			end;
		end;
	end);
end;
function v5.useGrapple(p7)
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
u1 = u1(v5.new());
return nil;
