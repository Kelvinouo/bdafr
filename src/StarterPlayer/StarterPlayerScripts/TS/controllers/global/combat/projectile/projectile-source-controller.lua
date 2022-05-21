-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "ProjectileSourceController";
	end, 
	__index = l__HandKnitController__5
});
v6.__index = v6;
local u1 = l__HandKnitController__5;
local l__Maid__2 = v3.Maid;
function v6.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.maid = l__Maid__2.new();
	p1.reloadingWeaponSet = {};
end;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
end;
local l__Flamework__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__HttpService__4 = v4.HttpService;
local l__getItemMeta__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__SharedSyncEvents__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local l__UserInputService__7 = v4.UserInputService;
local l__RunService__8 = v4.RunService;
local l__ItemType__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__DeviceUtil__10 = v2.DeviceUtil;
local l__Players__11 = v4.Players;
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "items", "heavenly-sword", "heavenly-sword-mobile-controller").HeavenlySwordMobileController;
local l__ClientSyncEvents__13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__ChargeState__14 = v1.import(script, script.Parent.Parent, "sword", "sword-controller").ChargeState;
local l__KnitClient__15 = v3.KnitClient;
local l__SoundManager__16 = v2.SoundManager;
local l__RandomUtil__17 = v2.RandomUtil;
local l__ContextActionService__18 = v4.ContextActionService;
function v6.onEnable(p3, p4, p5)
	p3.maid:DoCleaning();
	local v7 = p3:getProjectileSource(p4);
	local v8 = p3:getAmmoType(p4.itemType);
	local v9 = v7.cooldownId or p4.itemType;
	if p3.reloadingWeaponSet[p4.itemType] ~= nil then
		l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(v9, v7.fireDelaySec);
		task.spawn(function()
			p3:onStartReload(p5);
		end);
	end;
	local v10 = "projectile-source-" .. l__HttpService__4:GenerateGUID(false);
	local v11 = l__Maid__2.new();
	p3.maid:GiveTask(v11);
	local v12 = l__getItemMeta__5(p4.itemType);
	l__SharedSyncEvents__6.HookFunctionSwapEvent:connect(function(p6)
		p3.hookStatus = p6.hookFunction;
	end);
	local u19 = nil;
	p3.maid:GiveTask(l__UserInputService__7.InputBegan:Connect(function(p7, p8)
		local v13 = nil;
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
			u19 = p7;
		end;
		v13 = function()
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
				p3:beginHolding(p4, nil, v11);
				return;
			end;
			local u20 = 0;
			l__RunService__8:BindToRenderStep("projectile-mobile-confirm", 250, function(p9)
				u20 = u20 + p9;
				if u20 >= 0.3 then
					l__RunService__8:UnbindFromRenderStep("projectile-mobile-confirm");
					p3:beginHolding(p4, p7, v11);
				end;
			end);
			return nil;
		end;
		if not l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(v9) then
			v13();
			return;
		end;
		l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(v9, "callback", function()
			v13();
		end);
		return nil;
	end));
	p3.maid:GiveTask(l__UserInputService__7.InputEnded:Connect(function(p10)
		if not p3:isInputMouseButton1Equivalent(p10) then
			return nil;
		end;
		if not p3:canLaunch() then
			return nil;
		end;
		if u19 and p10 ~= u19 then
			return nil;
		end;
		u19 = nil;
		if p3.bufferPromise then
			p3.bufferPromise:cancel();
			p3.bufferPromise = nil;
		end;
		local v14, v15 = pcall(function()
			return l__RunService__8:UnbindFromRenderStep("projectile-mobile-confirm");
		end);
		if not v14 or not {
			success = true, 
			value = v15
		} then
			local v16 = {
				success = false, 
				error = v15
			};
		end;
		v11:DoCleaning();
		if p3.projectileHandler then
			local v17 = p3:getHandItem();
			local v18 = p3:getProjectileSource(v17);
			if p3:onLaunch(p5) == false then
				return nil;
			end;
			if not p5() then
				return nil;
			end;
			if v17.itemType == l__ItemType__9.HEAVENLY_SWORD and l__DeviceUtil__10.isMobileControls() then
				l__Players__11.LocalPlayer:SetAttribute("chargingSword", false);
				l__SharedSyncEvents__6.SwordChargedSwing:fire(l__Players__11.LocalPlayer, v17.tool, {
					chargeTime = p3.projectileHandler.drawDurationSeconds + 0.3
				});
				u12:mobileHandler(l__Players__11.LocalPlayer, v17.tool, p3.projectileHandler.drawDurationSeconds + 0.1);
				l__ClientSyncEvents__13.SwordCharge:fire(l__ChargeState__14.Idle, v17);
				l__KnitClient__15.Controllers.ProjectileController:disableTargeting();
				p3.projectileHandler = nil;
				return nil;
			end;
			l__KnitClient__15.Controllers.ProjectileController:launchProjectile(v17.itemType, p3:getAmmoType(v17.itemType), p3.projectileHandler, v17.tool, v18);
			local v19 = v18.cooldownId or v17.itemType;
			l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(v19, v18.fireDelaySec);
			l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(v19, "reloading_clear", function()
				p3.reloadingWeaponSet[v17.itemType] = nil;
			end);
			if v18.activeReload == true then
				p3.reloadingWeaponSet[v17.itemType] = true;
			end;
			task.spawn(function()
				p3:onStartReload(p5);
			end);
			local v20 = v18.reload;
			if v20 ~= nil then
				v20 = v20.reloadSound;
			end;
			if v20 then
				local v21 = l__SoundManager__16:playSound(l__RandomUtil__17.fromList(unpack(v20)));
				if v21 then
					p3.maid:GiveTask(v21);
				end;
			end;
		end;
		l__KnitClient__15.Controllers.ProjectileController:disableTargeting();
		p3.projectileHandler = nil;
	end));
	p3.maid:GiveTask(l__UserInputService__7.TouchMoved:Connect(function(p11, p12)
		if p11 ~= u19 then
			return nil;
		end;
		local v22 = l__Players__11.LocalPlayer.Character;
		if v22 ~= nil then
			v22 = v22:FindFirstChildWhichIsA("Humanoid");
			if v22 ~= nil then
				v22 = v22.MoveDirection;
			end;
		end;
		if v22 ~= nil and v22 ~= Vector3.new() then
			local v23, v24 = pcall(function()
				return l__RunService__8:UnbindFromRenderStep("projectile-mobile-confirm");
			end);
			if not v23 or not {
				success = true, 
				value = v24
			} then
				local v25 = {
					success = false, 
					error = v24
				};
			end;
		end;
	end));
	p3.maid:GiveTask(function()
		l__ContextActionService__18:UnbindAction(v10);
		l__KnitClient__15.Controllers.ProjectileController:disableTargeting();
		p3.projectileHandler = nil;
		local v26, v27 = pcall(function()
			return l__RunService__8:UnbindFromRenderStep("projectile-mobile-confirm");
		end);
		if not v26 or not {
			success = true, 
			value = v27
		} then
			local v28 = {
				success = false, 
				error = v27
			};
		end;
		u19 = nil;
	end);
end;
local l__GrapplingHookFunctions__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "grappling-hook", "grappling-hook-util").GrapplingHookFunctions;
local l__InventoryUtil__22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__EntityUtil__23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ProjectileController__24 = v1.import(script, script.Parent, "projectile-controller").ProjectileController;
local l__SprintController__25 = v1.import(script, script.Parent.Parent.Parent, "sprint", "sprint-controller").SprintController;
function v6.beginHolding(p13, p14, p15, p16)
	local v29 = p13:getProjectileSource(p14);
	local v30 = l__getItemMeta__5(p14.itemType);
	local v31 = p13:getAmmoType(p14.itemType);
	if v29.waitForHit and p13.hookStatus ~= l__GrapplingHookFunctions__21.HOOK_CHAMBERED then
		return nil;
	end;
	local v32 = v30.projectileSource;
	if v32 ~= nil then
		v32 = v32.ammoItemTypes;
	end;
	if v32 ~= nil then
		if v31 == nil then
			return nil;
		end;
		if not l__InventoryUtil__22.hasEnough(l__Players__11.LocalPlayer, v31, 1) then
			return nil;
		end;
	end;
	if v30.sword then
		l__Players__11.LocalPlayer:SetAttribute("chargingSword", true);
		l__ClientSyncEvents__13.SwordCharge:fire(l__ChargeState__14.Charging, p14);
	end;
	local v33 = l__Players__11.LocalPlayer.Character;
	if v33 ~= nil then
		v33 = v33.PrimaryPart;
	end;
	if v33 then
		local v34 = nil;
		local v35 = nil;
		local v36 = nil;
		local v37 = nil;
		local v38 = nil;
		local v39 = nil;
		local v40 = nil;
		local v41 = nil;
		if not l__EntityUtil__23:getEntity(l__Players__11.LocalPlayer) then
			return nil;
		end;
		p13:onStartCharging();
		p16:GiveTask(function()
			return p13:onStopCharging();
		end);
		local v42 = {};
		local v43 = v29.minStrengthScalar;
		if v43 == nil then
			v43 = 1;
		end;
		v42.initialVelocityMultiplier = v43;
		local v44 = l__ProjectileController__24:enableTargeting(p14.itemType, v29.projectileType(v31), v29, p15, v42);
		p13.projectileHandler = v44;
		local l__walkSpeedMultiplier__45 = v29.walkSpeedMultiplier;
		if l__walkSpeedMultiplier__45 ~= 0 and l__walkSpeedMultiplier__45 == l__walkSpeedMultiplier__45 and l__walkSpeedMultiplier__45 then
			p16:GiveTask(l__SprintController__25:getMovementStatusModifier():addModifier({
				moveSpeedMultiplier = v29.walkSpeedMultiplier, 
				blockSprint = true
			}));
		end;
		if v29.chargeBeginSound then
			local v46 = l__SoundManager__16:playSound(l__RandomUtil__17.fromList(unpack(v29.chargeBeginSound)));
			if v46 then
				p16:GiveTask(v46);
			end;
		end;
		local l__maxStrengthChargeSec__47 = v29.maxStrengthChargeSec;
		if l__maxStrengthChargeSec__47 ~= 0 then
			if l__maxStrengthChargeSec__47 == l__maxStrengthChargeSec__47 and l__maxStrengthChargeSec__47 then
				local u26 = true;
				p13.maid:GiveTask(function()
					u26 = false;
				end);
				v1.Promise.defer(function()
					v44.drawDurationSeconds = 0;
					local v48 = false;
					while u26 and v44 == p13.projectileHandler do
						v44.drawDurationSeconds = v44.drawDurationSeconds + l__RunService__8.RenderStepped:Wait();
						local v49 = math.min(1, v44.drawDurationSeconds / v29.maxStrengthChargeSec);
						local v50 = v29.minStrengthScalar;
						if v50 == nil then
							v50 = 0.5;
						end;
						v44.velocityMultiplier = v49 + (1 - v49) * v50;
						if not v48 and v49 >= 1 then
							v48 = true;
							p13:onMaxCharge();
						end;					
					end;
				end);
				return;
			end;
			v35 = "onMaxCharge";
			v34 = p13;
			v39 = v34;
			v36 = p13;
			v37 = v35;
			v38 = v36[v37];
			v40 = v38;
			v41 = v39;
			v40(v41);
		else
			v35 = "onMaxCharge";
			v34 = p13;
			v39 = v34;
			v36 = p13;
			v37 = v35;
			v38 = v36[v37];
			v40 = v38;
			v41 = v39;
			v40(v41);
		end;
	end;
end;
function v6.onDisable(p17)
	p17.maid:DoCleaning();
end;
function v6.onMaxCharge(p18)

end;
function v6.canLaunch(p19)
	return true;
end;
function v6.getProjectileSource(p20, p21)
	return l__getItemMeta__5(p21.itemType).projectileSource;
end;
local l__ClientStore__27 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v6.getAmmoType(p22, p23)
	local v51 = l__getItemMeta__5(p23).projectileSource;
	if v51 ~= nil then
		v51 = v51.ammoItemTypes;
	end;
	if v51 then
		local l__hotbar__52 = l__ClientStore__27:getState().Inventory.observedInventory.hotbar;
		local v53, v54, v55 = ipairs(v51);
		while true do
			local v56, v57 = v53(v54, v55);
			if not v56 then
				break;
			end;
			local function v58(p24)
				local v59 = p24.item;
				if v59 ~= nil then
					v59 = v59.itemType;
				end;
				return v59 == v57;
			end;
			local v60 = nil;
			for v61, v62 in ipairs(l__hotbar__52) do
				if v58(v62, v61 - 1, l__hotbar__52) == true then
					v60 = v62;
					break;
				end;
			end;
			if v60 then
				return v57;
			end;		
		end;
		local l__inventory__63 = l__ClientStore__27:getState().Inventory.observedInventory.inventory;
		local v64, v65, v66 = ipairs(v51);
		while true do
			local v67, v68 = v64(v65, v66);
			if not v67 then
				break;
			end;
			local l__items__69 = l__inventory__63.items;
			local function v70(p25)
				return p25.itemType == v68;
			end;
			local v71 = nil;
			for v72, v73 in ipairs(l__items__69) do
				if v70(v73, v72 - 1, l__items__69) == true then
					v71 = v73;
					break;
				end;
			end;
			if v71 then
				return v68;
			end;		
		end;
	end;
	return nil;
end;
u1 = {
	ProjectileSourceController = v6
};
return u1;
