-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local l__KnitClient__4 = v3.KnitClient;
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
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
local l__HandKnitController__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v9 = setmetatable({}, {
	__tostring = function()
		return "SwordController";
	end, 
	__index = l__HandKnitController__8
});
v9.__index = v9;
local u1 = v9;
function u1.new(...)
	local v10 = setmetatable({}, u1);
	return v10:constructor(...) and v10;
end;
local u2 = l__HandKnitController__8;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "SwordController";
	p1.maid = u3.new();
	p1.lastAttack = 0;
	p1.lastSwing = 0;
	p1.chargeTime = 0;
	p1.bufferedMobileAttack = false;
	p1.chargedWeapons = {};
	p1.swingCounter = 0;
	p1.thirdPersonAnimPlaying = false;
end;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
end;
local l__getItemMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function u1.isRelevantItem(p3, p4)
	return l__getItemMeta__4(p4.itemType).sword ~= nil;
end;
local l__Players__5 = v5.Players;
local l__GameQueryUtil__6 = v2.GameQueryUtil;
function u1.canSee(p5, p6)
	local l__Character__11 = l__Players__5.LocalPlayer.Character;
	if not l__Character__11 then
		return false;
	end;
	if not p6 then
		return false;
	end;
	local v12 = l__Character__11:FindFirstChildWhichIsA("Humanoid");
	if not l__Character__11.PrimaryPart then
		local v13 = nil;
	elseif not v12 then
		v13 = nil;
	else
		v13 = l__Character__11.PrimaryPart.Position + Vector3.new(0, -1 * (v12.HipHeight + l__Character__11.PrimaryPart.Size.Y / 2), 0);
	end;
	local v14 = p6:getInstance();
	local v15 = v14:FindFirstChildWhichIsA("Humanoid");
	if not v14.PrimaryPart then
		local v16 = nil;
	elseif not v15 then
		v16 = nil;
	else
		v16 = v14.PrimaryPart.Position + Vector3.new(0, -1 * (v15.HipHeight + v14.PrimaryPart.Size.Y / 2), 0);
	end;
	if not v13 or not v16 then
		return false;
	end;
	local v17 = v13 + Vector3.new(0, 5, 0);
	local v18 = v16 + Vector3.new(0, 5, 0);
	local v19 = { l__Character__11, p6:getInstance() };
	local v20 = RaycastParams.new();
	v20.FilterDescendantsInstances = v19;
	v20.FilterType = Enum.RaycastFilterType.Blacklist;
	local v21 = l__GameQueryUtil__6:raycast(v13, v16 - v13, v20) ~= nil;
	if not v21 then
		local v22 = RaycastParams.new();
		v22.FilterDescendantsInstances = v19;
		v22.FilterType = Enum.RaycastFilterType.Blacklist;
		v21 = l__GameQueryUtil__6:raycast(v16, v13 - v16, v22) ~= nil;
	end;
	local v23 = not v21;
	if not v23 then
		local v24 = RaycastParams.new();
		v24.FilterDescendantsInstances = v19;
		v24.FilterType = Enum.RaycastFilterType.Blacklist;
		local v25 = l__GameQueryUtil__6:raycast(v17, v18 - v17, v24) ~= nil;
		if not v25 then
			local v26 = RaycastParams.new();
			v26.FilterDescendantsInstances = v19;
			v26.FilterType = Enum.RaycastFilterType.Blacklist;
			v25 = l__GameQueryUtil__6:raycast(v18, v17 - v18, v26) ~= nil;
		end;
		v23 = not v25;
		if not v23 then
			local v27 = (v13 + v17) / 2;
			local v28 = (v16 + v18) / 2;
			local v29 = RaycastParams.new();
			v29.FilterDescendantsInstances = v19;
			v29.FilterType = Enum.RaycastFilterType.Blacklist;
			local v30 = l__GameQueryUtil__6:raycast(v27, v28 - v27, v29) ~= nil;
			if not v30 then
				local v31 = RaycastParams.new();
				v31.FilterDescendantsInstances = v19;
				v31.FilterType = Enum.RaycastFilterType.Blacklist;
				v30 = l__GameQueryUtil__6:raycast(v28, v27 - v28, v31) ~= nil;
			end;
			v23 = not v30;
		end;
	end;
	return v23;
end;
local l__Workspace__7 = v5.Workspace;
local l__ClientSyncEvents__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Flamework__9 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__default__11 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__default__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.attackEntity(p7, p8, p9)
	local v32 = l__Players__5.LocalPlayer.Character;
	if v32 ~= nil then
		v32 = v32.PrimaryPart;
	end;
	if not v32 or not l__Workspace__7.CurrentCamera then
		return nil;
	end;
	if l__ClientSyncEvents__8.SwordSwing:fire():isCancelled() then
		return nil;
	end;
	if l__ClientSyncEvents__8.PerformCombat:fire():isCancelled() then
		return nil;
	end;
	local v33 = p7:getHandItem();
	if v33 ~= nil then
		v33 = v33.tool;
	end;
	if not v33 then
		return nil;
	end;
	local v34 = l__getItemMeta__4(v33.Name);
	local l__sword__35 = l__getItemMeta__4(v33.Name).sword;
	local v36 = l__sword__35.chargedAttack;
	if v36 ~= nil then
		v36 = v36.minCharge;
	end;
	if v36 ~= 0 and v36 == v36 and v36 then
		local v37 = l__sword__35.chargedSwingAnimation;
		if v37 then
			local v38 = l__sword__35.chargedAttack;
			if v38 ~= nil then
				v38 = v38.minCharge;
			end;
			v37 = v38 <= p7.chargeTime;
		end;
		if v37 then
			l__sword__35.swingAnimations = l__sword__35.chargedSwingAnimation;
		else
			l__sword__35.swingAnimations = nil;
		end;
		local v39 = l__sword__35.firstPersonChargedSwingAnimation;
		if v39 then
			local v40 = l__sword__35.chargedAttack;
			if v40 ~= nil then
				v40 = v40.minCharge;
			end;
			v39 = v40 <= p7.chargeTime;
		end;
		if v39 then
			l__sword__35.firstPersonSwingAnimations = l__sword__35.firstPersonChargedSwingAnimation;
		else
			l__sword__35.firstPersonSwingAnimations = nil;
		end;
	end;
	if tick() - p7.lastAttack < l__sword__35.attackSpeed then
		if not l__sword__35.respectAttackSpeedForEffects then
			p7:playSwordEffect(v34);
		end;
		return nil;
	end;
	if l__sword__35.cooldown ~= nil then
		if p7.cooldownMaid ~= nil then
			p7.cooldownMaid:DoCleaning();
		end;
		p7.cooldownMaid = u3.new();
		p7.cooldownMaid:GiveTask(l__Flamework__9.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__10.SWORD));
		l__Flamework__9.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__10.SWORD, l__getItemMeta__4(v33.Name).sword.attackSpeed, l__sword__35.cooldown);
		p7.cooldownMaid:GiveTask(function()
			l__Flamework__9.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):removeCooldown(l__CooldownId__10.SWORD);
		end);
	end;
	p7:playSwordEffect(v34);
	if p8 then
		local v41 = tick();
		p7.lastAttack = v41;
		local l__Position__42 = p8:getInstance():GetPrimaryPartCFrame().Position;
		local l__Position__43 = l__Players__5.LocalPlayer.Character:GetPrimaryPartCFrame().Position;
		if p9 then
			local v44 = {
				cameraPosition = {
					value = l__Workspace__7.CurrentCamera.CFrame.Position
				}, 
				cursorDirection = {
					value = p9
				}
			};
		else
			v44 = nil;
		end;
		l__default__11.Debug("Fire sword hit remote");
		if l__sword__35.chargedAttack then
			local v45 = l__sword__35.chargedAttack;
			if v45 ~= nil then
				v45 = v45.maxChargeTimeSec;
			end;
			local v46 = v45;
		else
			v46 = 0;
		end;
		local v47 = math.min(v46, p7.chargeTime);
		local v48 = {
			weapon = v33, 
			entityInstance = p8:getInstance(), 
			validate = {
				raycast = v44, 
				targetPosition = {
					value = l__Position__42
				}, 
				selfPosition = {
					value = l__Position__43
				}
			}
		};
		local v49 = {};
		if l__sword__35.chargedAttack then
			local v50 = l__sword__35.chargedAttack;
			if v50 ~= nil then
				v50 = v50.maxChargeTimeSec;
			end;
			local v51 = v47 / v50;
		else
			v51 = 0;
		end;
		v49.chargeRatio = v51;
		v48.chargedAttack = v49;
		p7.chargeTime = 0;
		if not l__default__12.Client:Get("RemoteName"):CallServer(v48) and p7.lastAttack == v41 then
			p7.lastAttack = p7.lastAttack;
			return;
		end;
	elseif l__sword__35.setLastAttackOnEveryHit == true then
		p7.lastAttack = tick();
	end;
end;
local l__AnimationType__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameAnimationUtil__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__RandomUtil__15 = v2.RandomUtil;
local l__GameSound__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__SoundManager__17 = v2.SoundManager;
function u1.playSwordEffect(p10, p11)
	local function v52(p12)
		local v53 = { l__AnimationType__13.SWORD_SWING };
		if not p10.thirdPersonAnimPlaying then
			if p10.swingCounter + 1 < #v53 then
				p10.swingCounter = p10.swingCounter + 1;
			else
				p10.swingCounter = 0;
			end;
			local v54 = p11.sword;
			if v54 ~= nil then
				v54 = v54.swingAnimations;
			end;
			if v54 then
				local v55 = l__RandomUtil__15.fromList(unpack(p11.sword.swingAnimations));
			else
				v55 = v53[p10.swingCounter + 1];
			end;
			local v56 = l__GameAnimationUtil__14.playAnimation(l__Players__5.LocalPlayer, v55);
			if v56 then
				v56.Stopped:Connect(function()
					p10.thirdPersonAnimPlaying = false;
				end);
			else
				p10.thirdPersonAnimPlaying = false;
			end;
		end;
		if l__KnitClient__4.Controllers.ViewmodelController:isVisible() then
			local v57 = p11.sword;
			if v57 ~= nil then
				v57 = v57.firstPersonSwingAnimations;
			end;
			if v57 then
				local v58 = l__RandomUtil__15.fromList(unpack(p11.sword.firstPersonSwingAnimations));
			else
				v58 = l__AnimationType__13.FP_SWING_SWORD;
			end;
			l__KnitClient__4.Controllers.ViewmodelController:playAnimation(v58);
		end;
		if false then
			local v59 = { l__GameSound__16.SWORD_SWING_1, l__GameSound__16.SWORD_SWING_2 };
			local v60 = p11.sword;
			if v60 ~= nil then
				v60 = v60.swingSounds;
			end;
			if v60 then
				v59 = p11.sword.swingSounds;
			end;
			l__SoundManager__17:playSound(l__RandomUtil__15.fromList(unpack(v59)));
		end;
	end;
	local v61 = p10:getHandItem();
	if v61 ~= nil then
		v61 = v61.tool;
	end;
	if not v61 then
		return nil;
	end;
	local l__sword__62 = l__getItemMeta__4(v61.Name).sword;
	local v63 = l__sword__62;
	if v63 ~= nil then
		v63 = v63.chargedAttack;
	end;
	if not v63 or l__sword__62.chargedAttack.ignoreEffectsOnFullyCharged ~= true then
		v52(v61);
		return;
	end;
	local v64 = l__sword__62;
	if v64 ~= nil then
		v64 = v64.chargedAttack;
		if v64 ~= nil then
			v64 = v64.maxChargeTimeSec;
		end;
	end;
	if v64 <= p10.chargeTime then
		return nil;
	end;
	v52(v61);
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
	local v65 = l__Players__5.LocalPlayer:GetAttribute("chargingSword");
	if v65 ~= 0 and v65 == v65 and v65 ~= "" and v65 then
		return nil;
	end;
	local v66 = p14:getHandItem();
	local v67 = v66;
	if v67 then
		local v68 = l__Players__5.LocalPlayer.Character;
		if v68 ~= nil then
			v68 = v68.PrimaryPart;
		end;
		v67 = v68;
	end;
	if v67 then
		local v69 = l__EntityUtil__18:getEntity(l__Players__5.LocalPlayer);
		if not v69 then
			return nil;
		end;
		local l__sword__70 = l__getItemMeta__4(v66.itemType).sword;
		local v71 = RaycastParams.new();
		v71.FilterDescendantsInstances = { l__Players__5.LocalPlayer.Character };
		v71.FilterType = Enum.RaycastFilterType.Blacklist;
		local l__mouse__72 = l__Players__5.LocalPlayer:GetMouse();
		local l__Direction__73 = l__mouse__72.UnitRay.Direction;
		local v74 = l__Workspace__7:Raycast(l__mouse__72.UnitRay.Origin, l__Direction__73 * 200, v71);
		local v75 = v74;
		if v75 ~= nil then
			v75 = v75.Instance;
		end;
		if v75 then
			local v76 = l__sword__70 and l__sword__70.attackRange;
			if v76 ~= 0 and v76 == v76 and v76 then
				local v77 = l__sword__70.attackRange;
			else
				v77 = l__CombatConstant__19.RAYCAST_SWORD_CHARACTER_DISTANCE;
			end;
			if (l__Players__5.LocalPlayer.Character.PrimaryPart.Position - v74.Instance.Position).Magnitude <= v77 then
				local v78 = l__EntityUtil__18:getEntity(v74.Instance);
				if v78 and v69:canAttack(v78) and p14:canSee(v78) then
					p14:attackEntity(v78, l__Direction__73);
					return nil;
				end;
			end;
		end;
		p14:swingSwordInRegion();
	end;
end;
function u1.mobileSwingPressed(p15)
	l__ClientSyncEvents__8.SwordSwingDown:fire();
	if p15:isClickingTooFast() then
		return nil;
	end;
	p15:swingSwordInRegion();
end;
local l__BLOCK_SIZE__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local l__DeviceUtil__21 = v2.DeviceUtil;
function u1.swingSwordInRegion(p16)
	local v79 = l__Players__5.LocalPlayer:GetAttribute("chargingSword");
	if v79 ~= 0 and v79 == v79 and v79 ~= "" and v79 then
		return nil;
	end;
	local v80 = l__EntityUtil__18:getLocalPlayerEntity();
	local v81 = v80;
	if v81 then
		local v82 = l__Players__5.LocalPlayer.Character;
		if v82 ~= nil then
			v82 = v82.PrimaryPart;
		end;
		v81 = v82;
	end;
	if v81 then
		local v83 = p16:getHandItem();
		if v83 ~= nil then
			v83 = v83.tool;
		end;
		if not v83 then
			return nil;
		end;
		local l__sword__84 = l__getItemMeta__4(v83.Name).sword;
		local v85 = 3.8 * l__BLOCK_SIZE__20;
		local l__attackRange__86 = l__sword__84.attackRange;
		if l__attackRange__86 ~= 0 and l__attackRange__86 == l__attackRange__86 and l__attackRange__86 then
			v85 = l__sword__84.attackRange;
		elseif l__DeviceUtil__21.isMobileControls() then
			v85 = l__CombatConstant__19.REGION_SWORD_CHARACTER_DISTANCE;
		end;
		local v87 = 1.5;
		local l__Humanoid__88 = l__Players__5.LocalPlayer.Character:FindFirstChild("Humanoid");
		if l__Humanoid__88 then
			v87 = l__Humanoid__88.HipHeight;
		end;
		local v89 = l__Players__5.LocalPlayer.Character.PrimaryPart.Position + l__Players__5.LocalPlayer.Character.PrimaryPart.CFrame.LookVector.Unit * (v85 / 2);
		local v90 = Region3.new(v89 - Vector3.new(v85 / 2, v87, v85 / 2), v89 + Vector3.new(v85 / 2, v87, v85 / 2));
		local v91 = CFrame.new(v89, v89 + l__Players__5.LocalPlayer.Character.PrimaryPart.CFrame.LookVector);
		local v92 = {};
		local v93 = 0;
		local v94, v95, v96 = ipairs((l__EntityUtil__18:getAliveEntityInstances()));
		while true do
			local v97, v98 = v94(v95, v96);
			if not v97 then
				break;
			end;
			if v98 ~= l__Players__5.LocalPlayer.Character == true then
				v93 = v93 + 1;
				v92[v93] = v98;
			end;		
		end;
		local v99 = {};
		local v100 = 0;
		local v101, v102, v103 = ipairs(v92);
		while true do
			local v104, v105 = v101(v102, v103);
			if not v104 then
				break;
			end;
			if v105.PrimaryPart ~= nil == true then
				v100 = v100 + 1;
				v99[v100] = v105;
			end;		
		end;
		local v106 = OverlapParams.new();
		v106.FilterType = Enum.RaycastFilterType.Whitelist;
		v106.FilterDescendantsInstances = v99;
		for v107, v108 in ipairs((l__Workspace__7:GetPartBoundsInBox(v90.CFrame, v90.Size, v106))) do
			local v109 = l__EntityUtil__18:getEntity(v108);
			if v109 and v80:canAttack(v109) then
				local l__PrimaryPart__110 = v109:getInstance().PrimaryPart;
				if l__PrimaryPart__110 and (l__PrimaryPart__110.Position - l__Players__5.LocalPlayer.Character.PrimaryPart.Position).Magnitude < v85 and p16:canSee(v109) then
					p16:attackEntity(v109);
					return nil;
				end;
			end;
		end;
		p16:attackEntity(nil);
	end;
end;
local l__HttpService__22 = v5.HttpService;
local l__ClickHold__23 = v2.ClickHold;
local l__UserInputService__24 = v5.UserInputService;
local l__SharedSyncEvents__25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local l__ContextActionService__26 = v5.ContextActionService;
function u1.onEnable(p17, p18)
	local v111 = l__getItemMeta__4(p18.itemType);
	local v112 = v111.sword;
	if v112 ~= nil then
		v112 = v112.idleAnimation;
	end;
	if v112 ~= 0 and v112 == v112 and v112 then
		p17:setupYield(function()
			local u27 = l__GameAnimationUtil__14.playAnimation(l__Players__5.LocalPlayer, v112, {
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
	local v113 = v111.sword;
	if v113 ~= nil then
		v113 = v113.chargedAttack;
		if v113 ~= nil then
			v113 = v113.fireAtFullCharge;
		end;
	end;
	if v113 then
		local v114 = true;
	else
		v114 = false;
	end;
	local v115 = u3.new();
	local l__Idle__116 = v7.Idle;
	local v117 = nil;
	local v118 = l__HttpService__22:GenerateGUID();
	local v119 = v111.sword;
	if v119 ~= nil then
		v119 = v119.chargedAttack;
	end;
	if v119 ~= nil then
		l__ClientSyncEvents__8.SwordCharge:fire(v7.Idle, p18);
		local v120 = v111.sword;
		if v120 ~= nil then
			v120 = v120.chargedAttack;
			if v120 ~= nil then
				v120 = v120.maxChargeTimeSec;
			end;
		end;
		v117 = l__ClickHold__23.new(v120, false);
	end;
	if l__UserInputService__24.TouchEnabled then
		p17.maid:GiveTask(l__UserInputService__24.TouchTapInWorld:Connect(function(p19, p20)
			if not p20 then
				p17:swingSwordAtMouse();
			end;
		end));
		local u28 = l__Idle__116;
		local u29 = 0;
		p17.maid:GiveTask(l__ClientSyncEvents__8.MobileSwordButtonPressed:connect(function(p21)
			if p21.state == "down" then
				local v121 = l__Players__5.LocalPlayer:GetAttribute("IsCasting");
				if v121 ~= 0 and v121 == v121 and v121 ~= "" and v121 then
					return nil;
				end;
				local v122 = v111.sword;
				if v122 ~= nil then
					v122 = v122.chargedAttack;
				end;
				if v122 ~= nil and not v111.projectileSource then
					p21:setCancelled(true);
					if u28 ~= v7.Idle then
						return nil;
					else
						p17:chargeWeapon(v111, v115, v117, u28);
						u28 = v7.Charging;
						l__ClientSyncEvents__8.SwordCharge:fire(v7.Charging, p18);
						u29 = tick();
						task.spawn(function()
							local v123 = v111.sword;
							if v123 ~= nil then
								v123 = v123.chargedAttack;
								if v123 ~= nil then
									v123 = v123.maxChargeTimeSec;
								end;
							end;
							task.wait(v123);
							if not p17.chargedWeapons[v118] then
								if v117 ~= nil then
									v117:endClick();
								end;
								v115:DoCleaning();
								return nil;
							end;
							if u29 == u29 and u28 == v7.Charging then
								u28 = v7.Charged;
								l__ClientSyncEvents__8.SwordCharge:fire(v7.Charged, p18);
								if v114 then
									p17.chargeTime = v111.sword.chargedAttack.maxChargeTimeSec;
									p17:chargeWeapon(v111, v115, v117, u28);
									p17:swingSwordAtMouse();
									u28 = v7.Idle;
									l__ClientSyncEvents__8.SwordCharge:fire(v7.Idle, p18);
								end;
							end;
						end);
						return;
					end;
				end;
			elseif p21.state == "up" then
				local v124 = tick() - u29;
				local v125 = v111.sword;
				if v125 ~= nil then
					v125 = v125.chargedAttack;
				end;
				local v126 = v125 == nil or v111.projectileSource;
				if v126 then
					return nil;
				end;
				local v127 = v111.sword;
				if v127 ~= nil then
					v127 = v127.chargedAttack;
				end;
				if v127 then
					p17.chargeTime = v124;
					if u28 ~= v7.Idle then
						p17:chargeWeapon(v111, v115, v117, u28);
						p17:swingSwordAtMouse();
					end;
				end;
				if u28 ~= v7.Idle then
					l__ClientSyncEvents__8.SwordCharge:fire(v7.Idle, p18);
				end;
				local v128 = v111.sword;
				if v128 ~= nil then
					v128 = v128.chargedAttack;
				end;
				local v129 = v128 and u28 == v7.Idle;
				if v129 then
					return nil;
				end;
				local v130 = p17:getHandItem();
				if v130 ~= nil then
					v130 = v130.tool;
				end;
				local v131 = v130;
				if v131 then
					local v132 = v111.sword;
					if v132 ~= nil then
						v132 = v132.chargedAttack;
					end;
					v131 = v132 and v111.projectileSource == nil;
				end;
				if v131 then
					l__SharedSyncEvents__25.SwordChargedSwing:fire(l__Players__5.LocalPlayer, v130, {
						chargeTime = tick() - u29
					});
				end;
				u28 = v7.Idle;
			end;
		end));
	end;
	local v133 = "swing-sword:" .. l__HttpService__22:GenerateGUID(false);
	local u30 = 0;
	local u31 = l__Idle__116;
	l__ContextActionService__26:BindAction(v133, function(p22, p23, p24)
		if p23 == Enum.UserInputState.Begin then
			u30 = tick();
			local v134 = l__Players__5.LocalPlayer:GetAttribute("IsCasting");
			if v134 ~= 0 and v134 == v134 and v134 ~= "" and v134 then
				return nil;
			else
				local v135 = nil;
				local v136 = nil;
				local v137 = nil;
				local v138 = nil;
				local v139 = nil;
				local v140 = nil;
				local v141 = nil;
				local v142 = nil;
				local v143 = nil;
				local v144 = nil;
				local v145 = v111.sword;
				if v145 ~= nil then
					v145 = v145.chargedAttack;
				end;
				if v145 == nil then
					p17:swingSwordAtMouse();
					v135 = l__ClientSyncEvents__8;
					v136 = "SwordSwingDown";
					v137 = v135;
					v138 = v136;
					v139 = v137[v138];
					local v146 = "fire";
					v140 = v139;
					local v147 = v140;
					v141 = v139;
					v142 = v146;
					local v148 = v141[v142];
					v143 = v148;
					v144 = v147;
					v143(v144);
					return;
				elseif u31 ~= v7.Idle then
					return nil;
				else
					p17:chargeWeapon(v111, v115, v117, u31);
					u31 = v7.Charging;
					l__ClientSyncEvents__8.SwordCharge:fire(v7.Charging, p18);
					task.spawn(function()
						p17.chargedWeapons[v118] = true;
						local v149 = v111.sword;
						if v149 ~= nil then
							v149 = v149.chargedAttack;
							if v149 ~= nil then
								v149 = v149.maxChargeTimeSec;
							end;
						end;
						task.wait(v149);
						if not p17.chargedWeapons[v118] then
							if v117 ~= nil then
								v117:endClick();
							end;
							v115:DoCleaning();
							return nil;
						end;
						if u30 == u30 and u31 == v7.Charging then
							u31 = v7.Charged;
							l__ClientSyncEvents__8.SwordCharge:fire(v7.Charged, p18);
							if v114 then
								p17.chargeTime = v111.sword.chargedAttack.maxChargeTimeSec;
								p17:chargeWeapon(v111, v115, v117, u31);
								p17:swingSwordAtMouse();
								u31 = v7.Idle;
								l__ClientSyncEvents__8.SwordCharge:fire(v7.Idle, p18);
							end;
						end;
					end);
					v135 = l__ClientSyncEvents__8;
					v136 = "SwordSwingDown";
					v137 = v135;
					v138 = v136;
					v139 = v137[v138];
					v146 = "fire";
					v140 = v139;
					v147 = v140;
					v141 = v139;
					v142 = v146;
					v148 = v141[v142];
					v143 = v148;
					v144 = v147;
					v143(v144);
					return;
				end;
			end;
		end;
		if p23 == Enum.UserInputState.End then
			local v150 = tick() - u30;
			local v151 = v111.sword;
			if v151 ~= nil then
				v151 = v151.chargedAttack;
			end;
			if v151 then
				p17.chargeTime = v150;
				if u31 ~= v7.Idle then
					p17:chargeWeapon(v111, v115, v117, u31);
					p17:swingSwordAtMouse();
				else
					if v117 ~= nil then
						v117:endClick();
					end;
					v115:DoCleaning();
				end;
			end;
			if u31 ~= v7.Idle then
				l__ClientSyncEvents__8.SwordCharge:fire(v7.Idle, p18);
			end;
			local v152 = v111.sword;
			if v152 ~= nil then
				v152 = v152.chargedAttack;
			end;
			if v152 and u31 == v7.Idle then
				return nil;
			end;
			u31 = v7.Idle;
			l__ClientSyncEvents__8.SwordSwingUp:fire();
			local v153 = p17:getHandItem();
			if v153 ~= nil then
				v153 = v153.tool;
			end;
			l__SharedSyncEvents__25.SwordChargedSwing:fire(l__Players__5.LocalPlayer, v153, {
				chargeTime = v150
			});
		end;
	end, false, Enum.UserInputType.MouseButton1);
	p17.maid:GiveTask(function()
		l__ContextActionService__26:UnbindAction(v133);
		if v117 ~= nil then
			v117:disable();
		end;
		local v154 = l__getItemMeta__4(p18.itemType).sword;
		if v154 ~= nil then
			v154 = v154.chargedAttack;
		end;
		if v154 ~= nil then
			p17.chargedWeapons[v118] = false;
			l__ClientSyncEvents__8.SwordCharge:fire(v7.Idle, p18);
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
	local l__chargedAttack__155 = p26.sword.chargedAttack;
	local v156 = l__chargedAttack__155.chargeSlowDelay;
	if v156 == nil then
		v156 = 0;
	end;
	p25.maid:GiveTask(function()
		p28:endClick();
		p27:DoCleaning();
	end);
	if p29 == v7.Idle then
		task.delay(v156, function()
			local v157 = l__Players__5.LocalPlayer:GetAttribute("IsCharging");
			if v157 ~= 0 and v157 == v157 and v157 ~= "" and v157 then
				p27:GiveTask(l__KnitClient__32.Controllers.SprintController:getMovementStatusModifier():addModifier({
					moveSpeedMultiplier = l__chargedAttack__155.walkSpeedMultiplier
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
	local v158 = l__EntityUtil__18:getEntity(l__Players__5.LocalPlayer);
	if v158 ~= nil then
		v158 = v158:getItemInHand();
		if v158 ~= nil then
			v158 = v158.Name;
		end;
	end;
	if v158 ~= l__ItemType__33.HEAVENLY_SWORD then
		return nil;
	end;
	p32:swingSwordInRegion();
end;
u2 = l__KnitClient__4.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	ChargeState = v7, 
	SwordController = u2
};
return v9;
