-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "ProjectileSourceController";
	end, 
	__index = l__HandKnitController__4
});
v5.__index = v5;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v5.constructor(p1, ...)
	l__HandKnitController__4.constructor(p1, ...);
	p1.maid = u1.new();
	p1.reloadingWeaponSet = {};
end;
function v5.KnitStart(p2)
	l__HandKnitController__4.KnitStart(p2);
end;
local l__Flamework__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__HttpService__3 = v3.HttpService;
local l__getItemMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__SharedSyncEvents__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local l__UserInputService__6 = v3.UserInputService;
local l__RunService__7 = v3.RunService;
local l__ItemType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__DeviceUtil__9 = v2.DeviceUtil;
local l__Players__10 = v3.Players;
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "items", "heavenly-sword", "heavenly-sword-mobile-controller").HeavenlySwordMobileController;
local l__ClientSyncEvents__12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__ChargeState__13 = v1.import(script, script.Parent.Parent, "sword", "sword-controller").ChargeState;
local l__KnitClient__14 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__SoundManager__15 = v2.SoundManager;
local l__RandomUtil__16 = v2.RandomUtil;
local l__ContextActionService__17 = v3.ContextActionService;
function v5.onEnable(p3, p4, p5)
	p3.maid:DoCleaning();
	local v6 = p3:getProjectileSource(p4);
	local v7 = p3:getAmmoType(p4.itemType);
	local v8 = v6.cooldownId or p4.itemType;
	if p3.reloadingWeaponSet[p4.itemType] ~= nil then
		l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(v8, v6.fireDelaySec);
		task.spawn(function()
			p3:onStartReload(p5);
		end);
	end;
	local v9 = "projectile-source-" .. l__HttpService__3:GenerateGUID(false);
	local v10 = u1.new();
	p3.maid:GiveTask(v10);
	local v11 = l__getItemMeta__4(p4.itemType);
	l__SharedSyncEvents__5.HookFunctionSwapEvent:connect(function(p6)
		p3.hookStatus = p6.hookFunction;
	end);
	local u18 = nil;
	p3.maid:GiveTask(l__UserInputService__6.InputBegan:Connect(function(p7, p8)
		local v12 = nil;
		if p8 then
			return nil;
		end;
		if p3.projectileHandler then
			return nil;
		end;
		if not p3:isInputMouseButton1Equivalent(p7) then
			return nil;
		end;
		if not p3:canLaunch() then
			return nil;
		end;
		if p7.UserInputType == Enum.UserInputType.Touch then
			u18 = p7;
		end;
		v12 = function()
			if not p5() then
				return nil;
			end;
			if not p3:canLaunch() then
				return nil;
			end;
			if p7.UserInputState == Enum.UserInputState.End or p7.UserInputState == Enum.UserInputState.Cancel then
				return nil;
			end;
			if p7.UserInputType ~= Enum.UserInputType.Touch then
				p3:beginHolding(p4, nil, v10);
				return;
			end;
			local u19 = 0;
			l__RunService__7:BindToRenderStep("projectile-mobile-confirm", 250, function(p9)
				u19 = u19 + p9;
				if u19 >= 0.3 then
					l__RunService__7:UnbindFromRenderStep("projectile-mobile-confirm");
					p3:beginHolding(p4, p7, v10);
				end;
			end);
			return nil;
		end;
		if not l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(v8) then
			v12();
			return;
		end;
		l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(v8, "callback", function()
			v12();
		end);
		return nil;
	end));
	p3.maid:GiveTask(l__UserInputService__6.InputEnded:Connect(function(p10)
		if not p3:isInputMouseButton1Equivalent(p10) then
			return nil;
		end;
		if not p3:canLaunch() then
			return nil;
		end;
		if u18 and p10 ~= u18 then
			return nil;
		end;
		u18 = nil;
		if p3.bufferPromise then
			p3.bufferPromise:cancel();
			p3.bufferPromise = nil;
		end;
		local v13, v14 = pcall(function()
			return l__RunService__7:UnbindFromRenderStep("projectile-mobile-confirm");
		end);
		if not v13 or not {
			success = true, 
			value = v14
		} then
			local v15 = {
				success = false, 
				error = v14
			};
		end;
		v10:DoCleaning();
		if p3.projectileHandler then
			local v16 = p3:getHandItem();
			local v17 = p3:getProjectileSource(v16);
			if p3:onLaunch(p5) == false then
				return nil;
			end;
			if not p5() then
				return nil;
			end;
			if v16.itemType == l__ItemType__8.HEAVENLY_SWORD and l__DeviceUtil__9.isMobileControls() then
				l__Players__10.LocalPlayer:SetAttribute("chargingSword", false);
				l__SharedSyncEvents__5.SwordChargedSwing:fire(l__Players__10.LocalPlayer, v16.tool, {
					chargeTime = p3.projectileHandler.drawDurationSeconds + 0.3
				});
				u11:mobileHandler(l__Players__10.LocalPlayer, v16.tool, p3.projectileHandler.drawDurationSeconds + 0.1);
				l__ClientSyncEvents__12.SwordCharge:fire(l__ChargeState__13.Idle, v16);
				l__KnitClient__14.Controllers.ProjectileController:disableTargeting();
				p3.projectileHandler = nil;
				return nil;
			end;
			l__KnitClient__14.Controllers.ProjectileController:launchProjectile(v16.itemType, p3:getAmmoType(v16.itemType), p3.projectileHandler, v16.tool, v17);
			local v18 = v17.cooldownId or v16.itemType;
			l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(v18, v17.fireDelaySec);
			l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(v18, "reloading_clear", function()
				p3.reloadingWeaponSet[v16.itemType] = nil;
			end);
			if v17.activeReload == true then
				p3.reloadingWeaponSet[v16.itemType] = true;
			end;
			task.spawn(function()
				p3:onStartReload(p5);
			end);
			local v19 = v17.reload;
			if v19 ~= nil then
				v19 = v19.reloadSound;
			end;
			if v19 then
				local v20 = l__SoundManager__15:playSound(l__RandomUtil__16.fromList(unpack(v19)));
				if v20 then
					p3.maid:GiveTask(v20);
				end;
			end;
		end;
		l__KnitClient__14.Controllers.ProjectileController:disableTargeting();
		p3.projectileHandler = nil;
	end));
	p3.maid:GiveTask(l__UserInputService__6.TouchMoved:Connect(function(p11, p12)
		if p11 ~= u18 then
			return nil;
		end;
		local v21 = l__Players__10.LocalPlayer.Character;
		if v21 ~= nil then
			v21 = v21:FindFirstChildWhichIsA("Humanoid");
			if v21 ~= nil then
				v21 = v21.MoveDirection;
			end;
		end;
		if v21 ~= nil and v21 ~= Vector3.new() then
			local v22, v23 = pcall(function()
				return l__RunService__7:UnbindFromRenderStep("projectile-mobile-confirm");
			end);
			if not v22 or not {
				success = true, 
				value = v23
			} then
				local v24 = {
					success = false, 
					error = v23
				};
			end;
		end;
	end));
	p3.maid:GiveTask(function()
		l__ContextActionService__17:UnbindAction(v9);
		l__KnitClient__14.Controllers.ProjectileController:disableTargeting();
		p3.projectileHandler = nil;
		local v25, v26 = pcall(function()
			return l__RunService__7:UnbindFromRenderStep("projectile-mobile-confirm");
		end);
		if not v25 or not {
			success = true, 
			value = v26
		} then
			local v27 = {
				success = false, 
				error = v26
			};
		end;
		u18 = nil;
	end);
end;
local l__GrapplingHookFunctions__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "grappling-hook", "grappling-hook-util").GrapplingHookFunctions;
local l__InventoryUtil__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__EntityUtil__22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ProjectileController__23 = v1.import(script, script.Parent, "projectile-controller").ProjectileController;
local l__SprintController__24 = v1.import(script, script.Parent.Parent.Parent, "sprint", "sprint-controller").SprintController;
function v5.beginHolding(p13, p14, p15, p16)
	if l__ClientSyncEvents__12.BeginProjectileTargeting:fire(p14):isCancelled() then
		return nil;
	end;
	local v28 = p13:getProjectileSource(p14);
	local v29 = l__getItemMeta__4(p14.itemType);
	local v30 = p13:getAmmoType(p14.itemType);
	if v28.waitForHit and p13.hookStatus ~= l__GrapplingHookFunctions__20.HOOK_CHAMBERED then
		return nil;
	end;
	local v31 = v29.projectileSource;
	if v31 ~= nil then
		v31 = v31.ammoItemTypes;
	end;
	if v31 ~= nil then
		if v30 == nil then
			return nil;
		end;
		if not l__InventoryUtil__21.hasEnough(l__Players__10.LocalPlayer, v30, 1) then
			return nil;
		end;
	end;
	if v29.sword then
		l__Players__10.LocalPlayer:SetAttribute("chargingSword", true);
		l__ClientSyncEvents__12.SwordCharge:fire(l__ChargeState__13.Charging, p14);
	end;
	local v32 = l__Players__10.LocalPlayer.Character;
	if v32 ~= nil then
		v32 = v32.PrimaryPart;
	end;
	if v32 then
		local v33 = nil;
		local v34 = nil;
		local v35 = nil;
		local v36 = nil;
		local v37 = nil;
		local v38 = nil;
		local v39 = nil;
		local v40 = nil;
		if not l__EntityUtil__22:getEntity(l__Players__10.LocalPlayer) then
			return nil;
		end;
		p13:onStartCharging();
		p16:GiveTask(function()
			return p13:onStopCharging();
		end);
		local v41 = {};
		local v42 = v28.minStrengthScalar;
		if v42 == nil then
			v42 = 1;
		end;
		v41.initialVelocityMultiplier = v42;
		local v43 = l__ProjectileController__23:enableTargeting(p14.itemType, v28.projectileType(v30), v28, p15, v41);
		p13.projectileHandler = v43;
		local l__walkSpeedMultiplier__44 = v28.walkSpeedMultiplier;
		if l__walkSpeedMultiplier__44 ~= 0 and l__walkSpeedMultiplier__44 == l__walkSpeedMultiplier__44 and l__walkSpeedMultiplier__44 then
			p16:GiveTask(l__SprintController__24:getMovementStatusModifier():addModifier({
				moveSpeedMultiplier = v28.walkSpeedMultiplier, 
				blockSprint = true
			}));
		end;
		if v28.chargeBeginSound then
			local v45 = l__SoundManager__15:playSound(l__RandomUtil__16.fromList(unpack(v28.chargeBeginSound)));
			if v45 then
				p16:GiveTask(v45);
			end;
		end;
		local l__maxStrengthChargeSec__46 = v28.maxStrengthChargeSec;
		if l__maxStrengthChargeSec__46 ~= 0 then
			if l__maxStrengthChargeSec__46 == l__maxStrengthChargeSec__46 and l__maxStrengthChargeSec__46 then
				local u25 = true;
				p13.maid:GiveTask(function()
					u25 = false;
				end);
				v1.Promise.defer(function()
					v43.drawDurationSeconds = 0;
					local v47 = false;
					while u25 and v43 == p13.projectileHandler do
						v43.drawDurationSeconds = v43.drawDurationSeconds + l__RunService__7.RenderStepped:Wait();
						local v48 = math.min(1, v43.drawDurationSeconds / v28.maxStrengthChargeSec);
						local v49 = v28.minStrengthScalar;
						if v49 == nil then
							v49 = 0.5;
						end;
						v43.velocityMultiplier = v48 + (1 - v48) * v49;
						if not v47 and v48 >= 1 then
							v47 = true;
							p13:onMaxCharge();
						end;					
					end;
				end);
				return;
			end;
			v34 = "onMaxCharge";
			v33 = p13;
			v38 = v33;
			v35 = p13;
			v36 = v34;
			v37 = v35[v36];
			v39 = v37;
			v40 = v38;
			v39(v40);
		else
			v34 = "onMaxCharge";
			v33 = p13;
			v38 = v33;
			v35 = p13;
			v36 = v34;
			v37 = v35[v36];
			v39 = v37;
			v40 = v38;
			v39(v40);
		end;
	end;
end;
function v5.onDisable(p17)
	p17.maid:DoCleaning();
end;
function v5.onMaxCharge(p18)

end;
function v5.canLaunch(p19)
	return true;
end;
function v5.getProjectileSource(p20, p21)
	return l__getItemMeta__4(p21.itemType).projectileSource;
end;
local l__ClientStore__26 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v5.getAmmoType(p22, p23)
	local v50 = l__getItemMeta__4(p23).projectileSource;
	if v50 ~= nil then
		v50 = v50.ammoItemTypes;
	end;
	if v50 then
		local l__hotbar__51 = l__ClientStore__26:getState().Inventory.observedInventory.hotbar;
		local v52, v53, v54 = ipairs(v50);
		while true do
			v52(v53, v54);
			if not v52 then
				break;
			end;
			local v55 = nil;
			local v56, v57, v58 = ipairs(l__hotbar__51);
			while true do
				v56(v57, v58);
				if not v56 then
					break;
				end;
				local v59 = v57.item;
				if v59 ~= nil then
					v59 = v59.itemType;
				end;
				if v59 == v53 == true then
					v55 = v57;
					break;
				end;			
			end;
			if v55 then
				return v53;
			end;		
		end;
		local l__inventory__60 = l__ClientStore__26:getState().Inventory.observedInventory.inventory;
		local v61, v62, v63 = ipairs(v50);
		while true do
			v61(v62, v63);
			if not v61 then
				break;
			end;
			local v64 = nil;
			local v65, v66, v67 = ipairs(l__inventory__60.items);
			while true do
				v65(v66, v67);
				if not v65 then
					break;
				end;
				v67 = v65;
				if v66.itemType == v62 == true then
					v64 = v66;
					break;
				end;			
			end;
			if v64 then
				return v62;
			end;		
		end;
	end;
	return nil;
end;
return {
	ProjectileSourceController = v5
};
