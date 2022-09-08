-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v6 = {};
local v7 = setmetatable({}, {
	__index = v6
});
v7.Idle = "IDLE";
v6.IDLE = "Idle";
v7.Charging = "CHARGING";
v6.CHARGING = "Charging";
v7.Charged = "CHARGED";
v6.CHARGED = "Charged";
local v8 = setmetatable({}, {
	__tostring = function()
		return "SwordController";
	end, 
	__index = l__HandKnitController__5
});
v8.__index = v8;
local u1 = v8;
function u1.new(...)
	local v9 = setmetatable({}, u1);
	return v9:constructor(...) and v9;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1)
	l__HandKnitController__5.constructor(p1);
	p1.Name = "SwordController";
	p1.maid = u2.new();
	p1.lastAttack = 0;
	p1.lastSwing = 0;
	p1.chargeTime = 0;
	p1.bufferedMobileAttack = false;
	p1.chargedWeapons = {};
	p1.swingCounter = 0;
	p1.thirdPersonAnimPlaying = false;
end;
function u1.KnitStart(p2)
	l__HandKnitController__5.KnitStart(p2);
end;
local l__getItemMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function u1.isRelevantItem(p3, p4)
	return l__getItemMeta__3(p4.itemType).sword ~= nil;
end;
local l__Players__4 = v4.Players;
local l__GameQueryUtil__5 = v2.GameQueryUtil;
function u1.canSee(p5, p6)
	local l__Character__10 = l__Players__4.LocalPlayer.Character;
	if not l__Character__10 then
		return false;
	end;
	if not p6 then
		return false;
	end;
	local v11 = l__Character__10:FindFirstChildWhichIsA("Humanoid");
	if not l__Character__10.PrimaryPart then
		local v12 = nil;
	elseif not v11 then
		v12 = nil;
	else
		v12 = l__Character__10.PrimaryPart.Position + Vector3.new(0, -1 * (v11.HipHeight + l__Character__10.PrimaryPart.Size.Y / 2), 0);
	end;
	local v13 = p6:getInstance();
	local v14 = v13:FindFirstChildWhichIsA("Humanoid");
	if not v13.PrimaryPart then
		local v15 = nil;
	elseif not v14 then
		v15 = nil;
	else
		v15 = v13.PrimaryPart.Position + Vector3.new(0, -1 * (v14.HipHeight + v13.PrimaryPart.Size.Y / 2), 0);
	end;
	if not v12 or not v15 then
		return false;
	end;
	local v16 = v12 + Vector3.new(0, 5, 0);
	local v17 = v15 + Vector3.new(0, 5, 0);
	local v18 = { l__Character__10, p6:getInstance() };
	local v19 = RaycastParams.new();
	v19.FilterDescendantsInstances = v18;
	v19.FilterType = Enum.RaycastFilterType.Blacklist;
	local v20 = l__GameQueryUtil__5:raycast(v12, v15 - v12, v19) ~= nil;
	if not v20 then
		local v21 = RaycastParams.new();
		v21.FilterDescendantsInstances = v18;
		v21.FilterType = Enum.RaycastFilterType.Blacklist;
		v20 = l__GameQueryUtil__5:raycast(v15, v12 - v15, v21) ~= nil;
	end;
	local v22 = not v20;
	if not v22 then
		local v23 = RaycastParams.new();
		v23.FilterDescendantsInstances = v18;
		v23.FilterType = Enum.RaycastFilterType.Blacklist;
		local v24 = l__GameQueryUtil__5:raycast(v16, v17 - v16, v23) ~= nil;
		if not v24 then
			local v25 = RaycastParams.new();
			v25.FilterDescendantsInstances = v18;
			v25.FilterType = Enum.RaycastFilterType.Blacklist;
			v24 = l__GameQueryUtil__5:raycast(v17, v16 - v17, v25) ~= nil;
		end;
		v22 = not v24;
		if not v22 then
			local v26 = (v12 + v16) / 2;
			local v27 = (v15 + v17) / 2;
			local v28 = RaycastParams.new();
			v28.FilterDescendantsInstances = v18;
			v28.FilterType = Enum.RaycastFilterType.Blacklist;
			local v29 = l__GameQueryUtil__5:raycast(v26, v27 - v26, v28) ~= nil;
			if not v29 then
				local v30 = RaycastParams.new();
				v30.FilterDescendantsInstances = v18;
				v30.FilterType = Enum.RaycastFilterType.Blacklist;
				v29 = l__GameQueryUtil__5:raycast(v27, v26 - v27, v30) ~= nil;
			end;
			v22 = not v29;
		end;
	end;
	return v22;
end;
local l__Workspace__6 = v4.Workspace;
local l__ClientSyncEvents__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Flamework__8 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__default__10 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__default__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.attackEntity(p7, p8, p9)
	local v31 = l__Players__4.LocalPlayer.Character;
	if v31 ~= nil then
		v31 = v31.PrimaryPart;
	end;
	if not v31 or not l__Workspace__6.CurrentCamera then
		return nil;
	end;
	if l__ClientSyncEvents__7.SwordSwing:fire():isCancelled() then
		return nil;
	end;
	if l__ClientSyncEvents__7.PerformCombat:fire():isCancelled() then
		return nil;
	end;
	local v32 = p7:getHandItem();
	if v32 ~= nil then
		v32 = v32.tool;
	end;
	if not v32 then
		return nil;
	end;
	local v33 = l__getItemMeta__3(v32.Name);
	local l__sword__34 = l__getItemMeta__3(v32.Name).sword;
	local v35 = l__sword__34.chargedAttack;
	if v35 ~= nil then
		v35 = v35.minCharge;
	end;
	if v35 ~= 0 and v35 == v35 and v35 then
		local v36 = l__sword__34.chargedSwingAnimation;
		if v36 then
			local v37 = l__sword__34.chargedAttack;
			if v37 ~= nil then
				v37 = v37.minCharge;
			end;
			v36 = v37 <= p7.chargeTime;
		end;
		if v36 then
			l__sword__34.swingAnimations = l__sword__34.chargedSwingAnimation;
		else
			l__sword__34.swingAnimations = nil;
		end;
		local v38 = l__sword__34.firstPersonChargedSwingAnimation;
		if v38 then
			local v39 = l__sword__34.chargedAttack;
			if v39 ~= nil then
				v39 = v39.minCharge;
			end;
			v38 = v39 <= p7.chargeTime;
		end;
		if v38 then
			l__sword__34.firstPersonSwingAnimations = l__sword__34.firstPersonChargedSwingAnimation;
		else
			l__sword__34.firstPersonSwingAnimations = nil;
		end;
	end;
	if l__Workspace__6:GetServerTimeNow() - p7.lastAttack < l__sword__34.attackSpeed * 0.8 then
		if not l__sword__34.respectAttackSpeedForEffects then
			p7:playSwordEffect(v33);
		end;
		return nil;
	end;
	if l__sword__34.cooldown ~= nil then
		if p7.cooldownMaid ~= nil then
			p7.cooldownMaid:DoCleaning();
		end;
		p7.cooldownMaid = u2.new();
		p7.cooldownMaid:GiveTask(l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__9.SWORD));
		l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__9.SWORD, l__getItemMeta__3(v32.Name).sword.attackSpeed, l__sword__34.cooldown);
		p7.cooldownMaid:GiveTask(function()
			l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):removeCooldown(l__CooldownId__9.SWORD);
		end);
	end;
	p7:playSwordEffect(v33);
	if not p8 then
		if l__sword__34.setLastAttackOnEveryHit == true then
			p7.lastAttack = l__Workspace__6:GetServerTimeNow();
		end;
		return;
	end;
	p7.lastAttack = l__Workspace__6:GetServerTimeNow();
	local l__Position__40 = p8:getInstance():GetPrimaryPartCFrame().Position;
	local l__Position__41 = l__Players__4.LocalPlayer.Character:GetPrimaryPartCFrame().Position;
	if p9 then
		local v42 = {
			cameraPosition = {
				value = l__Workspace__6.CurrentCamera.CFrame.Position
			}, 
			cursorDirection = {
				value = p9
			}
		};
	else
		v42 = nil;
	end;
	l__default__10.Debug("Fire sword hit remote");
	if l__sword__34.chargedAttack then
		local v43 = l__sword__34.chargedAttack;
		if v43 ~= nil then
			v43 = v43.maxChargeTimeSec;
		end;
		local v44 = v43;
	else
		v44 = 0;
	end;
	local v45 = math.min(v44, p7.chargeTime);
	local v46 = {
		weapon = v32, 
		entityInstance = p8:getInstance(), 
		validate = {
			raycast = v42, 
			targetPosition = {
				value = l__Position__40
			}, 
			selfPosition = {
				value = l__Position__41
			}
		}
	};
	local v47 = {};
	if l__sword__34.chargedAttack then
		local v48 = l__sword__34.chargedAttack;
		if v48 ~= nil then
			v48 = v48.maxChargeTimeSec;
		end;
		local v49 = v45 / v48;
	else
		v49 = 0;
	end;
	v47.chargeRatio = v49;
	v46.chargedAttack = v47;
	l__default__11.Client:Get("RemoteName"):SendToServer(v46);
	p7.chargeTime = 0;
end;
local l__AnimationType__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameAnimationUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__RandomUtil__14 = v2.RandomUtil;
local l__KnitClient__15 = v3.KnitClient;
local l__GameSound__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__SoundManager__17 = v2.SoundManager;
function u1.playSwordEffect(p10, p11)
	local function v50(p12)
		local v51 = { l__AnimationType__12.SWORD_SWING };
		if not p10.thirdPersonAnimPlaying then
			if p10.swingCounter + 1 < #v51 then
				p10.swingCounter = p10.swingCounter + 1;
			else
				p10.swingCounter = 0;
			end;
			local v52 = p11.sword;
			if v52 ~= nil then
				v52 = v52.swingAnimations;
			end;
			if v52 then
				local v53 = l__RandomUtil__14.fromList(unpack(p11.sword.swingAnimations));
			else
				v53 = v51[p10.swingCounter + 1];
			end;
			local v54 = l__GameAnimationUtil__13.playAnimation(l__Players__4.LocalPlayer, v53);
			if v54 then
				v54.Stopped:Connect(function()
					p10.thirdPersonAnimPlaying = false;
				end);
			else
				p10.thirdPersonAnimPlaying = false;
			end;
		end;
		if l__KnitClient__15.Controllers.ViewmodelController:isVisible() then
			local v55 = p11.sword;
			if v55 ~= nil then
				v55 = v55.firstPersonSwingAnimations;
			end;
			if v55 then
				local v56 = l__RandomUtil__14.fromList(unpack(p11.sword.firstPersonSwingAnimations));
			else
				v56 = l__AnimationType__12.FP_SWING_SWORD;
			end;
			l__KnitClient__15.Controllers.ViewmodelController:playAnimation(v56);
		end;
		if false then
			local v57 = { l__GameSound__16.SWORD_SWING_1, l__GameSound__16.SWORD_SWING_2 };
			local v58 = p11.sword;
			if v58 ~= nil then
				v58 = v58.swingSounds;
			end;
			if v58 then
				v57 = p11.sword.swingSounds;
			end;
			l__SoundManager__17:playSound(l__RandomUtil__14.fromList(unpack(v57)));
		end;
	end;
	local v59 = p10:getHandItem();
	if v59 ~= nil then
		v59 = v59.tool;
	end;
	if not v59 then
		return nil;
	end;
	local l__sword__60 = l__getItemMeta__3(v59.Name).sword;
	local v61 = l__sword__60;
	if v61 ~= nil then
		v61 = v61.chargedAttack;
	end;
	if not v61 or l__sword__60.chargedAttack.ignoreEffectsOnFullyCharged ~= true then
		v50(v59);
		return;
	end;
	local v62 = l__sword__60;
	if v62 ~= nil then
		v62 = v62.chargedAttack;
		if v62 ~= nil then
			v62 = v62.maxChargeTimeSec;
		end;
	end;
	if v62 <= p10.chargeTime then
		return nil;
	end;
	v50(v59);
end;
function u1.bufferMobileAttack(p13)
	p13.bufferedMobileAttack = true;
end;
local l__EntityUtil__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__CombatConstant__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "combat-constant").CombatConstant;
function u1.swingSwordAtMouse(p14)
	if p14:isClickingTooFast() then
		return nil;
	end;
	local v63 = l__Players__4.LocalPlayer:GetAttribute("chargingSword");
	if v63 ~= 0 and v63 == v63 and v63 ~= "" and v63 then
		return nil;
	end;
	local v64 = p14:getHandItem();
	local v65 = v64;
	if v65 then
		local v66 = l__Players__4.LocalPlayer.Character;
		if v66 ~= nil then
			v66 = v66.PrimaryPart;
		end;
		v65 = v66;
	end;
	if v65 then
		local v67 = l__EntityUtil__18:getEntity(l__Players__4.LocalPlayer);
		if not v67 then
			return nil;
		end;
		local l__sword__68 = l__getItemMeta__3(v64.itemType).sword;
		local v69 = RaycastParams.new();
		v69.FilterDescendantsInstances = { l__Players__4.LocalPlayer.Character };
		v69.FilterType = Enum.RaycastFilterType.Blacklist;
		local l__mouse__70 = l__Players__4.LocalPlayer:GetMouse();
		local l__Direction__71 = l__mouse__70.UnitRay.Direction;
		local v72 = l__Workspace__6:Raycast(l__mouse__70.UnitRay.Origin, l__Direction__71 * 200, v69);
		local v73 = v72;
		if v73 ~= nil then
			v73 = v73.Instance;
		end;
		if v73 then
			local v74 = l__sword__68 and l__sword__68.attackRange;
			if v74 ~= 0 and v74 == v74 and v74 then
				local v75 = l__sword__68.attackRange;
			else
				v75 = l__CombatConstant__19.RAYCAST_SWORD_CHARACTER_DISTANCE;
			end;
			if (l__Players__4.LocalPlayer.Character.PrimaryPart.Position - v72.Instance.Position).Magnitude <= v75 then
				local v76 = l__EntityUtil__18:getEntity(v72.Instance);
				if v76 and v67:canAttack(v76) and p14:canSee(v76) then
					p14:attackEntity(v76, l__Direction__71);
					return nil;
				end;
			end;
		end;
		p14:swingSwordInRegion();
	end;
end;
function u1.mobileSwingPressed(p15)
	l__ClientSyncEvents__7.SwordSwingDown:fire();
	if p15:isClickingTooFast() then
		return nil;
	end;
	p15:swingSwordInRegion();
end;
local l__BLOCK_SIZE__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local l__DeviceUtil__21 = v2.DeviceUtil;
function u1.swingSwordInRegion(p16)
	local v77 = l__Players__4.LocalPlayer:GetAttribute("chargingSword");
	if v77 ~= 0 and v77 == v77 and v77 ~= "" and v77 then
		return nil;
	end;
	local v78 = l__EntityUtil__18:getLocalPlayerEntity();
	local v79 = v78;
	if v79 then
		local v80 = l__Players__4.LocalPlayer.Character;
		if v80 ~= nil then
			v80 = v80.PrimaryPart;
		end;
		v79 = v80;
	end;
	if v79 then
		local v81 = p16:getHandItem();
		if v81 ~= nil then
			v81 = v81.tool;
		end;
		if not v81 then
			return nil;
		end;
		local l__sword__82 = l__getItemMeta__3(v81.Name).sword;
		local v83 = 3.8 * l__BLOCK_SIZE__20;
		local l__attackRange__84 = l__sword__82.attackRange;
		if l__attackRange__84 ~= 0 and l__attackRange__84 == l__attackRange__84 and l__attackRange__84 then
			v83 = l__sword__82.attackRange;
		elseif l__DeviceUtil__21.isMobileControls() then
			v83 = l__CombatConstant__19.REGION_SWORD_CHARACTER_DISTANCE;
		end;
		local v85 = 1.5;
		local l__Humanoid__86 = l__Players__4.LocalPlayer.Character:FindFirstChild("Humanoid");
		if l__Humanoid__86 then
			v85 = l__Humanoid__86.HipHeight;
		end;
		local v87 = l__Players__4.LocalPlayer.Character.PrimaryPart.Position + l__Players__4.LocalPlayer.Character.PrimaryPart.CFrame.LookVector.Unit * (v83 / 2);
		local v88 = Region3.new(v87 - Vector3.new(v83 / 2, v85, v83 / 2), v87 + Vector3.new(v83 / 2, v85, v83 / 2));
		local v89 = CFrame.new(v87, v87 + l__Players__4.LocalPlayer.Character.PrimaryPart.CFrame.LookVector);
		local v90 = {};
		local v91 = 0;
		local v92, v93, v94 = ipairs((l__EntityUtil__18:getAliveEntityInstances()));
		while true do
			v92(v93, v94);
			if not v92 then
				break;
			end;
			if v93 ~= l__Players__4.LocalPlayer.Character == true then
				v91 = v91 + 1;
				v90[v91] = v93;
			end;		
		end;
		local v95 = {};
		local v96 = 0;
		local v97, v98, v99 = ipairs(v90);
		while true do
			v97(v98, v99);
			if not v97 then
				break;
			end;
			if v98.PrimaryPart ~= nil == true then
				v96 = v96 + 1;
				v95[v96] = v98;
			end;		
		end;
		local v100 = OverlapParams.new();
		v100.FilterType = Enum.RaycastFilterType.Whitelist;
		v100.FilterDescendantsInstances = v95;
		local v101, v102, v103 = ipairs((l__Workspace__6:GetPartBoundsInBox(v88.CFrame, v88.Size, v100)));
		while true do
			v101(v102, v103);
			if not v101 then
				break;
			end;
			v103 = v101;
			local v104 = l__EntityUtil__18:getEntity(v102);
			if v104 and v78:canAttack(v104) then
				local l__PrimaryPart__105 = v104:getInstance().PrimaryPart;
				if l__PrimaryPart__105 and (l__PrimaryPart__105.Position - l__Players__4.LocalPlayer.Character.PrimaryPart.Position).Magnitude < v83 and p16:canSee(v104) then
					p16:attackEntity(v104);
					return nil;
				end;
			end;		
		end;
		p16:attackEntity(nil);
	end;
end;
local l__HttpService__22 = v4.HttpService;
local l__ClickHold__23 = v2.ClickHold;
local l__UserInputService__24 = v4.UserInputService;
local l__SharedSyncEvents__25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local l__ContextActionService__26 = v4.ContextActionService;
function u1.onEnable(p17, p18)
	local v106 = l__getItemMeta__3(p18.itemType);
	local v107 = v106.sword;
	if v107 ~= nil then
		v107 = v107.idleAnimation;
	end;
	if v107 ~= 0 and v107 == v107 and v107 then
		p17:setupYield(function()
			local u27 = l__GameAnimationUtil__13.playAnimation(l__Players__4.LocalPlayer, v107, {
				looped = true
			});
			return function()
				if u27 ~= nil then
					u27:Stop();
				end;
				if u27 ~= nil then
					u27:Destroy();
				end;
			end;
		end);
	end;
	local v108 = v106.sword;
	if v108 ~= nil then
		v108 = v108.chargedAttack;
		if v108 ~= nil then
			v108 = v108.fireAtFullCharge;
		end;
	end;
	if v108 then
		local v109 = true;
	else
		v109 = false;
	end;
	local v110 = u2.new();
	local l__Idle__111 = v7.Idle;
	local v112 = nil;
	local v113 = l__HttpService__22:GenerateGUID();
	local v114 = v106.sword;
	if v114 ~= nil then
		v114 = v114.chargedAttack;
	end;
	if v114 ~= nil then
		l__ClientSyncEvents__7.SwordCharge:fire(v7.Idle, p18);
		local v115 = v106.sword;
		if v115 ~= nil then
			v115 = v115.chargedAttack;
			if v115 ~= nil then
				v115 = v115.maxChargeTimeSec;
			end;
		end;
		v112 = l__ClickHold__23.new(v115, false);
	end;
	if l__UserInputService__24.TouchEnabled then
		p17.maid:GiveTask(l__UserInputService__24.TouchTapInWorld:Connect(function(p19, p20)
			if not p20 then
				p17:swingSwordAtMouse();
			end;
		end));
		local u28 = l__Idle__111;
		local u29 = 0;
		p17.maid:GiveTask(l__ClientSyncEvents__7.MobileSwordButtonPressed:connect(function(p21)
			if p21.state == "down" then
				local v116 = l__Players__4.LocalPlayer:GetAttribute("IsCasting");
				if v116 ~= 0 and v116 == v116 and v116 ~= "" and v116 then
					return nil;
				end;
				local v117 = v106.sword;
				if v117 ~= nil then
					v117 = v117.chargedAttack;
				end;
				if v117 ~= nil and not v106.projectileSource then
					p21:setCancelled(true);
					if u28 ~= v7.Idle then
						return nil;
					else
						p17:chargeWeapon(v106, v110, v112, u28);
						u28 = v7.Charging;
						l__ClientSyncEvents__7.SwordCharge:fire(v7.Charging, p18);
						u29 = tick();
						task.spawn(function()
							local v118 = v106.sword;
							if v118 ~= nil then
								v118 = v118.chargedAttack;
								if v118 ~= nil then
									v118 = v118.maxChargeTimeSec;
								end;
							end;
							task.wait(v118);
							if not p17.chargedWeapons[v113] then
								if v112 ~= nil then
									v112:endClick();
								end;
								v110:DoCleaning();
								return nil;
							end;
							if u29 == u29 and u28 == v7.Charging then
								u28 = v7.Charged;
								l__ClientSyncEvents__7.SwordCharge:fire(v7.Charged, p18);
								if v109 then
									p17.chargeTime = v106.sword.chargedAttack.maxChargeTimeSec;
									p17:chargeWeapon(v106, v110, v112, u28);
									p17:swingSwordAtMouse();
									u28 = v7.Idle;
									l__ClientSyncEvents__7.SwordCharge:fire(v7.Idle, p18);
								end;
							end;
						end);
						return;
					end;
				end;
			elseif p21.state == "up" then
				local v119 = tick() - u29;
				local v120 = v106.sword;
				if v120 ~= nil then
					v120 = v120.chargedAttack;
				end;
				local v121 = v120 == nil or v106.projectileSource;
				if v121 then
					return nil;
				end;
				local v122 = v106.sword;
				if v122 ~= nil then
					v122 = v122.chargedAttack;
				end;
				if v122 then
					p17.chargeTime = v119;
					if u28 ~= v7.Idle then
						p17:chargeWeapon(v106, v110, v112, u28);
						p17:swingSwordAtMouse();
					end;
				end;
				if u28 ~= v7.Idle then
					l__ClientSyncEvents__7.SwordCharge:fire(v7.Idle, p18);
				end;
				local v123 = v106.sword;
				if v123 ~= nil then
					v123 = v123.chargedAttack;
				end;
				local v124 = v123 and u28 == v7.Idle;
				if v124 then
					return nil;
				end;
				local v125 = p17:getHandItem();
				if v125 ~= nil then
					v125 = v125.tool;
				end;
				local v126 = v125;
				if v126 then
					local v127 = v106.sword;
					if v127 ~= nil then
						v127 = v127.chargedAttack;
					end;
					v126 = v127 and v106.projectileSource == nil;
				end;
				if v126 then
					l__SharedSyncEvents__25.SwordChargedSwing:fire(l__Players__4.LocalPlayer, v125, {
						chargeTime = tick() - u29
					});
				end;
				u28 = v7.Idle;
			end;
		end));
	end;
	local v128 = "swing-sword:" .. l__HttpService__22:GenerateGUID(false);
	local u30 = 0;
	local u31 = l__Idle__111;
	l__ContextActionService__26:BindAction(v128, function(p22, p23, p24)
		if p23 == Enum.UserInputState.Begin then
			u30 = tick();
			local v129 = l__Players__4.LocalPlayer:GetAttribute("IsCasting");
			if v129 ~= 0 and v129 == v129 and v129 ~= "" and v129 then
				return nil;
			else
				local v130 = nil;
				local v131 = nil;
				local v132 = nil;
				local v133 = nil;
				local v134 = nil;
				local v135 = nil;
				local v136 = nil;
				local v137 = nil;
				local v138 = nil;
				local v139 = nil;
				local v140 = v106.sword;
				if v140 ~= nil then
					v140 = v140.chargedAttack;
				end;
				if v140 == nil then
					p17:swingSwordAtMouse();
					v130 = l__ClientSyncEvents__7;
					v131 = "SwordSwingDown";
					v132 = v130;
					v133 = v131;
					v134 = v132[v133];
					local v141 = "fire";
					v135 = v134;
					local v142 = v135;
					v136 = v134;
					v137 = v141;
					local v143 = v136[v137];
					v138 = v143;
					v139 = v142;
					v138(v139);
					return;
				elseif u31 ~= v7.Idle then
					return nil;
				else
					p17:chargeWeapon(v106, v110, v112, u31);
					u31 = v7.Charging;
					l__ClientSyncEvents__7.SwordCharge:fire(v7.Charging, p18);
					task.spawn(function()
						p17.chargedWeapons[v113] = true;
						local v144 = v106.sword;
						if v144 ~= nil then
							v144 = v144.chargedAttack;
							if v144 ~= nil then
								v144 = v144.maxChargeTimeSec;
							end;
						end;
						task.wait(v144);
						if not p17.chargedWeapons[v113] then
							if v112 ~= nil then
								v112:endClick();
							end;
							v110:DoCleaning();
							return nil;
						end;
						if u30 == u30 and u31 == v7.Charging then
							u31 = v7.Charged;
							l__ClientSyncEvents__7.SwordCharge:fire(v7.Charged, p18);
							if v109 then
								p17.chargeTime = v106.sword.chargedAttack.maxChargeTimeSec;
								p17:chargeWeapon(v106, v110, v112, u31);
								p17:swingSwordAtMouse();
								u31 = v7.Idle;
								l__ClientSyncEvents__7.SwordCharge:fire(v7.Idle, p18);
							end;
						end;
					end);
					v130 = l__ClientSyncEvents__7;
					v131 = "SwordSwingDown";
					v132 = v130;
					v133 = v131;
					v134 = v132[v133];
					v141 = "fire";
					v135 = v134;
					v142 = v135;
					v136 = v134;
					v137 = v141;
					v143 = v136[v137];
					v138 = v143;
					v139 = v142;
					v138(v139);
					return;
				end;
			end;
		end;
		if p23 == Enum.UserInputState.End then
			local v145 = tick() - u30;
			local v146 = v106.sword;
			if v146 ~= nil then
				v146 = v146.chargedAttack;
			end;
			if v146 then
				p17.chargeTime = v145;
				if u31 ~= v7.Idle then
					p17:chargeWeapon(v106, v110, v112, u31);
					p17:swingSwordAtMouse();
				else
					if v112 ~= nil then
						v112:endClick();
					end;
					v110:DoCleaning();
				end;
			end;
			if u31 ~= v7.Idle then
				l__ClientSyncEvents__7.SwordCharge:fire(v7.Idle, p18);
			end;
			local v147 = v106.sword;
			if v147 ~= nil then
				v147 = v147.chargedAttack;
			end;
			if v147 and u31 == v7.Idle then
				return nil;
			end;
			u31 = v7.Idle;
			l__ClientSyncEvents__7.SwordSwingUp:fire();
			local v148 = p17:getHandItem();
			if v148 ~= nil then
				v148 = v148.tool;
			end;
			l__SharedSyncEvents__25.SwordChargedSwing:fire(l__Players__4.LocalPlayer, v148, {
				chargeTime = v145
			});
		end;
	end, false, Enum.UserInputType.MouseButton1);
	p17.maid:GiveTask(function()
		l__ContextActionService__26:UnbindAction(v128);
		if v112 ~= nil then
			v112:disable();
		end;
		local v149 = l__getItemMeta__3(p18.itemType).sword;
		if v149 ~= nil then
			v149 = v149.chargedAttack;
		end;
		if v149 ~= nil then
			p17.chargedWeapons[v113] = false;
			l__ClientSyncEvents__7.SwordCharge:fire(v7.Idle, p18);
		end;
	end);
	if p17.bufferedMobileAttack then
		p17.bufferedMobileAttack = false;
		p17:setupYield(function()
			p17:mobileSwingPressed();
			return function()

			end;
		end);
	end;
end;
local l__KnitClient__32 = v3.KnitClient;
function u1.chargeWeapon(p25, p26, p27, p28, p29)
	local l__chargedAttack__150 = p26.sword.chargedAttack;
	local v151 = l__chargedAttack__150.chargeSlowDelay;
	if v151 == nil then
		v151 = 0;
	end;
	p25.maid:GiveTask(function()
		p28:endClick();
		p27:DoCleaning();
	end);
	if p29 == v7.Idle then
		task.delay(v151, function()
			local v152 = l__Players__4.LocalPlayer:GetAttribute("IsCharging");
			if v152 ~= 0 and v152 == v152 and v152 ~= "" and v152 then
				p27:GiveTask(l__KnitClient__32.Controllers.SprintController:getMovementStatusModifier():addModifier({
					moveSpeedMultiplier = l__chargedAttack__150.walkSpeedMultiplier
				}));
				return;
			end;
			return nil;
		end);
		p28:startClick();
	elseif p29 == v7.Charging then
		p28:endClick();
		p27:DoCleaning();
	elseif p29 == v7.Charged then
		p28:endClick();
		p27:DoCleaning();
	end;
end;
function u1.onDisable(p30)
	p30.maid:DoCleaning();
end;
function u1.isClickingTooFast(p31)
	if tick() - p31.lastSwing < 0.1111111111111111 then
		return true;
	end;
	p31.lastSwing = tick();
	return false;
end;
local l__ItemType__33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function u1.heavenlySwordMobileHandler(p32)
	if not l__UserInputService__24.TouchEnabled then
		return nil;
	end;
	local v153 = l__EntityUtil__18:getEntity(l__Players__4.LocalPlayer);
	if v153 ~= nil then
		v153 = v153:getItemInHand();
		if v153 ~= nil then
			v153 = v153.Name;
		end;
	end;
	if v153 ~= l__ItemType__33.HEAVENLY_SWORD then
		return nil;
	end;
	p32:swingSwordInRegion();
end;
u1 = l__KnitClient__15.CreateController;
u1 = u1(u1.new());
return {
	ChargeState = v7, 
	SwordController = u1
};
