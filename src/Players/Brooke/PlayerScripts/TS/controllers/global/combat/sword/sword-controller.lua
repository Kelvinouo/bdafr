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
local l__default__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
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
	if p9 then
		local v40 = {
			cameraPosition = {
				value = l__Workspace__6.CurrentCamera.CFrame.Position
			}, 
			cursorDirection = {
				value = p9
			}
		};
	else
		v40 = nil;
	end;
	if l__sword__34.chargedAttack then
		local v41 = l__sword__34.chargedAttack;
		if v41 ~= nil then
			v41 = v41.maxChargeTimeSec;
		end;
		local v42 = v41;
	else
		v42 = 0;
	end;
	local v43 = math.min(v42, p7.chargeTime);
	local v44 = {
		weapon = v32, 
		entityInstance = p8:getInstance(), 
		validate = {
			raycast = v40, 
			targetPosition = {
				value = p8:getInstance():GetPrimaryPartCFrame().Position
			}, 
			selfPosition = {
				value = l__Players__4.LocalPlayer.Character:GetPrimaryPartCFrame().Position
			}
		}
	};
	local v45 = {};
	if l__sword__34.chargedAttack then
		local v46 = l__sword__34.chargedAttack;
		if v46 ~= nil then
			v46 = v46.maxChargeTimeSec;
		end;
		local v47 = v43 / v46;
	else
		v47 = 0;
	end;
	v45.chargeRatio = v47;
	v44.chargedAttack = v45;
	l__default__10.Client:Get("RemoteName"):SendToServer(v44);
	p7.chargeTime = 0;
end;
local l__AnimationType__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameAnimationUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__RandomUtil__13 = v2.RandomUtil;
local l__KnitClient__14 = v3.KnitClient;
local l__GameSound__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__SoundManager__16 = v2.SoundManager;
function u1.playSwordEffect(p10, p11)
	local function v48(p12)
		local v49 = { l__AnimationType__11.SWORD_SWING };
		if not p10.thirdPersonAnimPlaying then
			if p10.swingCounter + 1 < #v49 then
				p10.swingCounter = p10.swingCounter + 1;
			else
				p10.swingCounter = 0;
			end;
			local v50 = p11.sword;
			if v50 ~= nil then
				v50 = v50.swingAnimations;
			end;
			if v50 then
				local v51 = l__RandomUtil__13.fromList(unpack(p11.sword.swingAnimations));
			else
				v51 = v49[p10.swingCounter + 1];
			end;
			local v52 = l__GameAnimationUtil__12.playAnimation(l__Players__4.LocalPlayer, v51);
			if v52 then
				v52.Stopped:Connect(function()
					p10.thirdPersonAnimPlaying = false;
				end);
			else
				p10.thirdPersonAnimPlaying = false;
			end;
		end;
		if l__KnitClient__14.Controllers.ViewmodelController:isVisible() then
			local v53 = p11.sword;
			if v53 ~= nil then
				v53 = v53.firstPersonSwingAnimations;
			end;
			if v53 then
				local v54 = l__RandomUtil__13.fromList(unpack(p11.sword.firstPersonSwingAnimations));
			else
				v54 = l__AnimationType__11.FP_SWING_SWORD;
			end;
			l__KnitClient__14.Controllers.ViewmodelController:playAnimation(v54);
		end;
		if false then
			local v55 = { l__GameSound__15.SWORD_SWING_1, l__GameSound__15.SWORD_SWING_2 };
			local v56 = p11.sword;
			if v56 ~= nil then
				v56 = v56.swingSounds;
			end;
			if v56 then
				v55 = p11.sword.swingSounds;
			end;
			l__SoundManager__16:playSound(l__RandomUtil__13.fromList(unpack(v55)));
		end;
	end;
	local v57 = p10:getHandItem();
	if v57 ~= nil then
		v57 = v57.tool;
	end;
	if not v57 then
		return nil;
	end;
	local l__sword__58 = l__getItemMeta__3(v57.Name).sword;
	local v59 = l__sword__58;
	if v59 ~= nil then
		v59 = v59.chargedAttack;
	end;
	if not v59 or l__sword__58.chargedAttack.ignoreEffectsOnFullyCharged ~= true then
		v48(v57);
		return;
	end;
	local v60 = l__sword__58;
	if v60 ~= nil then
		v60 = v60.chargedAttack;
		if v60 ~= nil then
			v60 = v60.maxChargeTimeSec;
		end;
	end;
	if v60 <= p10.chargeTime then
		return nil;
	end;
	v48(v57);
end;
function u1.bufferMobileAttack(p13)
	p13.bufferedMobileAttack = true;
end;
local l__EntityUtil__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__CombatConstant__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "combat-constant").CombatConstant;
function u1.swingSwordAtMouse(p14)
	if p14:isClickingTooFast() then
		return nil;
	end;
	local v61 = l__Players__4.LocalPlayer:GetAttribute("chargingSword");
	if v61 ~= 0 and v61 == v61 and v61 ~= "" and v61 then
		return nil;
	end;
	local v62 = p14:getHandItem();
	local v63 = v62;
	if v63 then
		local v64 = l__Players__4.LocalPlayer.Character;
		if v64 ~= nil then
			v64 = v64.PrimaryPart;
		end;
		v63 = v64;
	end;
	if v63 then
		local v65 = l__EntityUtil__17:getEntity(l__Players__4.LocalPlayer);
		if not v65 then
			return nil;
		end;
		local l__sword__66 = l__getItemMeta__3(v62.itemType).sword;
		local v67 = RaycastParams.new();
		v67.FilterDescendantsInstances = { l__Players__4.LocalPlayer.Character };
		v67.FilterType = Enum.RaycastFilterType.Blacklist;
		local l__mouse__68 = l__Players__4.LocalPlayer:GetMouse();
		local l__Direction__69 = l__mouse__68.UnitRay.Direction;
		local v70 = l__Workspace__6:Raycast(l__mouse__68.UnitRay.Origin, l__Direction__69 * 200, v67);
		local v71 = v70;
		if v71 ~= nil then
			v71 = v71.Instance;
		end;
		if v71 then
			local v72 = l__sword__66 and l__sword__66.attackRange;
			if v72 ~= 0 and v72 == v72 and v72 then
				local v73 = l__sword__66.attackRange;
			else
				v73 = l__CombatConstant__18.RAYCAST_SWORD_CHARACTER_DISTANCE;
			end;
			if (l__Players__4.LocalPlayer.Character.PrimaryPart.Position - v70.Instance.Position).Magnitude <= v73 then
				local v74 = l__EntityUtil__17:getEntity(v70.Instance);
				if v74 and v65:canAttack(v74) and p14:canSee(v74) then
					p14:attackEntity(v74, l__Direction__69);
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
local l__BLOCK_SIZE__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local l__DeviceUtil__20 = v2.DeviceUtil;
function u1.swingSwordInRegion(p16)
	local v75 = l__Players__4.LocalPlayer:GetAttribute("chargingSword");
	if v75 ~= 0 and v75 == v75 and v75 ~= "" and v75 then
		return nil;
	end;
	local v76 = l__EntityUtil__17:getLocalPlayerEntity();
	local v77 = v76;
	if v77 then
		local v78 = l__Players__4.LocalPlayer.Character;
		if v78 ~= nil then
			v78 = v78.PrimaryPart;
		end;
		v77 = v78;
	end;
	if v77 then
		local v79 = p16:getHandItem();
		if v79 ~= nil then
			v79 = v79.tool;
		end;
		if not v79 then
			return nil;
		end;
		local l__sword__80 = l__getItemMeta__3(v79.Name).sword;
		local v81 = 3.8 * l__BLOCK_SIZE__19;
		local l__attackRange__82 = l__sword__80.attackRange;
		if l__attackRange__82 ~= 0 and l__attackRange__82 == l__attackRange__82 and l__attackRange__82 then
			v81 = l__sword__80.attackRange;
		elseif l__DeviceUtil__20.isMobileControls() then
			v81 = l__CombatConstant__18.REGION_SWORD_CHARACTER_DISTANCE;
		end;
		local v83 = 1.5;
		local l__Humanoid__84 = l__Players__4.LocalPlayer.Character:FindFirstChild("Humanoid");
		if l__Humanoid__84 then
			v83 = l__Humanoid__84.HipHeight;
		end;
		local v85 = l__Players__4.LocalPlayer.Character.PrimaryPart.Position + l__Players__4.LocalPlayer.Character.PrimaryPart.CFrame.LookVector.Unit * (v81 / 2);
		local v86 = Region3.new(v85 - Vector3.new(v81 / 2, v83, v81 / 2), v85 + Vector3.new(v81 / 2, v83, v81 / 2));
		local v87 = CFrame.new(v85, v85 + l__Players__4.LocalPlayer.Character.PrimaryPart.CFrame.LookVector);
		local v88 = {};
		local v89 = 0;
		local v90, v91, v92 = ipairs((l__EntityUtil__17:getAliveEntityInstances()));
		while true do
			v90(v91, v92);
			if not v90 then
				break;
			end;
			if v91 ~= l__Players__4.LocalPlayer.Character == true then
				v89 = v89 + 1;
				v88[v89] = v91;
			end;		
		end;
		local v93 = {};
		local v94 = 0;
		local v95, v96, v97 = ipairs(v88);
		while true do
			v95(v96, v97);
			if not v95 then
				break;
			end;
			if v96.PrimaryPart ~= nil == true then
				v94 = v94 + 1;
				v93[v94] = v96;
			end;		
		end;
		local v98 = OverlapParams.new();
		v98.FilterType = Enum.RaycastFilterType.Whitelist;
		v98.FilterDescendantsInstances = v93;
		local v99, v100, v101 = ipairs((l__Workspace__6:GetPartBoundsInBox(v86.CFrame, v86.Size, v98)));
		while true do
			v99(v100, v101);
			if not v99 then
				break;
			end;
			v101 = v99;
			local v102 = l__EntityUtil__17:getEntity(v100);
			if v102 and v76:canAttack(v102) then
				local l__PrimaryPart__103 = v102:getInstance().PrimaryPart;
				if l__PrimaryPart__103 and (l__PrimaryPart__103.Position - l__Players__4.LocalPlayer.Character.PrimaryPart.Position).Magnitude < v81 and p16:canSee(v102) then
					p16:attackEntity(v102);
					return nil;
				end;
			end;		
		end;
		p16:attackEntity(nil);
	end;
end;
local l__HttpService__21 = v4.HttpService;
local l__ClickHold__22 = v2.ClickHold;
local l__UserInputService__23 = v4.UserInputService;
local l__SharedSyncEvents__24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local l__ContextActionService__25 = v4.ContextActionService;
function u1.onEnable(p17, p18)
	local v104 = l__getItemMeta__3(p18.itemType);
	local v105 = v104.sword;
	if v105 ~= nil then
		v105 = v105.idleAnimation;
	end;
	if v105 ~= 0 and v105 == v105 and v105 then
		p17:setupYield(function()
			local u26 = l__GameAnimationUtil__12.playAnimation(l__Players__4.LocalPlayer, v105, {
				looped = true
			});
			return function()
				if u26 ~= nil then
					u26:Stop();
				end;
				if u26 ~= nil then
					u26:Destroy();
				end;
			end;
		end);
	end;
	local v106 = v104.sword;
	if v106 ~= nil then
		v106 = v106.chargedAttack;
		if v106 ~= nil then
			v106 = v106.fireAtFullCharge;
		end;
	end;
	if v106 then
		local v107 = true;
	else
		v107 = false;
	end;
	local v108 = u2.new();
	local l__Idle__109 = v7.Idle;
	local v110 = nil;
	local v111 = l__HttpService__21:GenerateGUID();
	local v112 = v104.sword;
	if v112 ~= nil then
		v112 = v112.chargedAttack;
	end;
	if v112 ~= nil then
		l__ClientSyncEvents__7.SwordCharge:fire(v7.Idle, p18);
		local v113 = v104.sword;
		if v113 ~= nil then
			v113 = v113.chargedAttack;
			if v113 ~= nil then
				v113 = v113.maxChargeTimeSec;
			end;
		end;
		v110 = l__ClickHold__22.new(v113, false);
	end;
	if l__UserInputService__23.TouchEnabled then
		p17.maid:GiveTask(l__UserInputService__23.TouchTapInWorld:Connect(function(p19, p20)
			if not p20 then
				p17:swingSwordAtMouse();
			end;
		end));
		local u27 = l__Idle__109;
		local u28 = 0;
		p17.maid:GiveTask(l__ClientSyncEvents__7.MobileSwordButtonPressed:connect(function(p21)
			if p21.state == "down" then
				local v114 = l__Players__4.LocalPlayer:GetAttribute("IsCasting");
				if v114 ~= 0 and v114 == v114 and v114 ~= "" and v114 then
					return nil;
				end;
				local v115 = v104.sword;
				if v115 ~= nil then
					v115 = v115.chargedAttack;
				end;
				if v115 ~= nil and not v104.projectileSource then
					p21:setCancelled(true);
					if u27 ~= v7.Idle then
						return nil;
					else
						p17:chargeWeapon(v104, v108, v110, u27);
						u27 = v7.Charging;
						l__ClientSyncEvents__7.SwordCharge:fire(v7.Charging, p18);
						u28 = tick();
						task.spawn(function()
							local v116 = v104.sword;
							if v116 ~= nil then
								v116 = v116.chargedAttack;
								if v116 ~= nil then
									v116 = v116.maxChargeTimeSec;
								end;
							end;
							task.wait(v116);
							if not p17.chargedWeapons[v111] then
								if v110 ~= nil then
									v110:endClick();
								end;
								v108:DoCleaning();
								return nil;
							end;
							if u28 == u28 and u27 == v7.Charging then
								u27 = v7.Charged;
								l__ClientSyncEvents__7.SwordCharge:fire(v7.Charged, p18);
								if v107 then
									p17.chargeTime = v104.sword.chargedAttack.maxChargeTimeSec;
									p17:chargeWeapon(v104, v108, v110, u27);
									p17:swingSwordAtMouse();
									u27 = v7.Idle;
									l__ClientSyncEvents__7.SwordCharge:fire(v7.Idle, p18);
								end;
							end;
						end);
						return;
					end;
				end;
			elseif p21.state == "up" then
				local v117 = tick() - u28;
				local v118 = v104.sword;
				if v118 ~= nil then
					v118 = v118.chargedAttack;
				end;
				local v119 = v118 == nil or v104.projectileSource;
				if v119 then
					return nil;
				end;
				local v120 = v104.sword;
				if v120 ~= nil then
					v120 = v120.chargedAttack;
				end;
				if v120 then
					p17.chargeTime = v117;
					if u27 ~= v7.Idle then
						p17:chargeWeapon(v104, v108, v110, u27);
						p17:swingSwordAtMouse();
					end;
				end;
				if u27 ~= v7.Idle then
					l__ClientSyncEvents__7.SwordCharge:fire(v7.Idle, p18);
				end;
				local v121 = v104.sword;
				if v121 ~= nil then
					v121 = v121.chargedAttack;
				end;
				local v122 = v121 and u27 == v7.Idle;
				if v122 then
					return nil;
				end;
				local v123 = p17:getHandItem();
				if v123 ~= nil then
					v123 = v123.tool;
				end;
				local v124 = v123;
				if v124 then
					local v125 = v104.sword;
					if v125 ~= nil then
						v125 = v125.chargedAttack;
					end;
					v124 = v125 and v104.projectileSource == nil;
				end;
				if v124 then
					l__SharedSyncEvents__24.SwordChargedSwing:fire(l__Players__4.LocalPlayer, v123, {
						chargeTime = tick() - u28
					});
				end;
				u27 = v7.Idle;
			end;
		end));
	end;
	local v126 = "swing-sword:" .. l__HttpService__21:GenerateGUID(false);
	local u29 = 0;
	local u30 = l__Idle__109;
	l__ContextActionService__25:BindAction(v126, function(p22, p23, p24)
		if p23 == Enum.UserInputState.Begin then
			u29 = tick();
			local v127 = l__Players__4.LocalPlayer:GetAttribute("IsCasting");
			if v127 ~= 0 and v127 == v127 and v127 ~= "" and v127 then
				return nil;
			else
				local v128 = nil;
				local v129 = nil;
				local v130 = nil;
				local v131 = nil;
				local v132 = nil;
				local v133 = nil;
				local v134 = nil;
				local v135 = nil;
				local v136 = nil;
				local v137 = nil;
				local v138 = v104.sword;
				if v138 ~= nil then
					v138 = v138.chargedAttack;
				end;
				if v138 == nil then
					p17:swingSwordAtMouse();
					v128 = l__ClientSyncEvents__7;
					v129 = "SwordSwingDown";
					v130 = v128;
					v131 = v129;
					v132 = v130[v131];
					local v139 = "fire";
					v133 = v132;
					local v140 = v133;
					v134 = v132;
					v135 = v139;
					local v141 = v134[v135];
					v136 = v141;
					v137 = v140;
					v136(v137);
					return;
				elseif u30 ~= v7.Idle then
					return nil;
				else
					p17:chargeWeapon(v104, v108, v110, u30);
					u30 = v7.Charging;
					l__ClientSyncEvents__7.SwordCharge:fire(v7.Charging, p18);
					task.spawn(function()
						p17.chargedWeapons[v111] = true;
						local v142 = v104.sword;
						if v142 ~= nil then
							v142 = v142.chargedAttack;
							if v142 ~= nil then
								v142 = v142.maxChargeTimeSec;
							end;
						end;
						task.wait(v142);
						if not p17.chargedWeapons[v111] then
							if v110 ~= nil then
								v110:endClick();
							end;
							v108:DoCleaning();
							return nil;
						end;
						if u29 == u29 and u30 == v7.Charging then
							u30 = v7.Charged;
							l__ClientSyncEvents__7.SwordCharge:fire(v7.Charged, p18);
							if v107 then
								p17.chargeTime = v104.sword.chargedAttack.maxChargeTimeSec;
								p17:chargeWeapon(v104, v108, v110, u30);
								p17:swingSwordAtMouse();
								u30 = v7.Idle;
								l__ClientSyncEvents__7.SwordCharge:fire(v7.Idle, p18);
							end;
						end;
					end);
					v128 = l__ClientSyncEvents__7;
					v129 = "SwordSwingDown";
					v130 = v128;
					v131 = v129;
					v132 = v130[v131];
					v139 = "fire";
					v133 = v132;
					v140 = v133;
					v134 = v132;
					v135 = v139;
					v141 = v134[v135];
					v136 = v141;
					v137 = v140;
					v136(v137);
					return;
				end;
			end;
		end;
		if p23 == Enum.UserInputState.End then
			local v143 = tick() - u29;
			local v144 = v104.sword;
			if v144 ~= nil then
				v144 = v144.chargedAttack;
			end;
			if v144 then
				p17.chargeTime = v143;
				if u30 ~= v7.Idle then
					p17:chargeWeapon(v104, v108, v110, u30);
					p17:swingSwordAtMouse();
				else
					if v110 ~= nil then
						v110:endClick();
					end;
					v108:DoCleaning();
				end;
			end;
			if u30 ~= v7.Idle then
				l__ClientSyncEvents__7.SwordCharge:fire(v7.Idle, p18);
			end;
			local v145 = v104.sword;
			if v145 ~= nil then
				v145 = v145.chargedAttack;
			end;
			if v145 and u30 == v7.Idle then
				return nil;
			end;
			u30 = v7.Idle;
			l__ClientSyncEvents__7.SwordSwingUp:fire();
			local v146 = p17:getHandItem();
			if v146 ~= nil then
				v146 = v146.tool;
			end;
			l__SharedSyncEvents__24.SwordChargedSwing:fire(l__Players__4.LocalPlayer, v146, {
				chargeTime = v143
			});
		end;
	end, false, Enum.UserInputType.MouseButton1);
	p17.maid:GiveTask(function()
		l__ContextActionService__25:UnbindAction(v126);
		if v110 ~= nil then
			v110:disable();
		end;
		local v147 = l__getItemMeta__3(p18.itemType).sword;
		if v147 ~= nil then
			v147 = v147.chargedAttack;
		end;
		if v147 ~= nil then
			p17.chargedWeapons[v111] = false;
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
local l__KnitClient__31 = v3.KnitClient;
function u1.chargeWeapon(p25, p26, p27, p28, p29)
	local l__chargedAttack__148 = p26.sword.chargedAttack;
	local v149 = l__chargedAttack__148.chargeSlowDelay;
	if v149 == nil then
		v149 = 0;
	end;
	p25.maid:GiveTask(function()
		p28:endClick();
		p27:DoCleaning();
	end);
	if p29 == v7.Idle then
		task.delay(v149, function()
			local v150 = l__Players__4.LocalPlayer:GetAttribute("IsCharging");
			if v150 ~= 0 and v150 == v150 and v150 ~= "" and v150 then
				p27:GiveTask(l__KnitClient__31.Controllers.SprintController:getMovementStatusModifier():addModifier({
					moveSpeedMultiplier = l__chargedAttack__148.walkSpeedMultiplier
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
local l__ItemType__32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function u1.heavenlySwordMobileHandler(p32)
	if not l__UserInputService__23.TouchEnabled then
		return nil;
	end;
	local v151 = l__EntityUtil__17:getEntity(l__Players__4.LocalPlayer);
	if v151 ~= nil then
		v151 = v151:getItemInHand();
		if v151 ~= nil then
			v151 = v151.Name;
		end;
	end;
	if v151 ~= l__ItemType__32.HEAVENLY_SWORD then
		return nil;
	end;
	p32:swingSwordInRegion();
end;
u1 = l__KnitClient__14.CreateController;
u1 = u1(u1.new());
return {
	ChargeState = v7, 
	SwordController = u1
};
