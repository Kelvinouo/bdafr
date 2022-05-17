
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
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
local l__Maid__3 = v3.Maid;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "SwordController";
	p1.maid = l__Maid__3.new();
	p1.lastAttack = 0;
	p1.lastSwing = 0;
	p1.chargeTime = 0;
	p1.bufferedMobileAttack = false;
	p1.chargedWeapons = {};
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
	local v11 = nil;
	local l__Character__12 = l__Players__5.LocalPlayer.Character;
	if not l__Character__12 then
		return false;
	end;
	if not p6 then
		return false;
	end;
	local function v13(p7)
		local v14 = p7:FindFirstChildWhichIsA("Humanoid");
		if not p7.PrimaryPart then
			return nil;
		end;
		if not v14 then
			return nil;
		end;
		return p7.PrimaryPart.Position + Vector3.new(0, -1 * (v14.HipHeight + p7.PrimaryPart.Size.Y / 2), 0);
	end;
	local v15 = v13(l__Character__12);
	v11 = v13(p6:getInstance());
	if not v15 or not v11 then
		return false;
	end;
	local v16 = v15 + Vector3.new(0, 5, 0);
	local v17 = v11 + Vector3.new(0, 5, 0);
	local function u7(p8, p9, p10)
		local v18 = RaycastParams.new();
		v18.FilterDescendantsInstances = p10;
		v18.FilterType = Enum.RaycastFilterType.Blacklist;
		return l__GameQueryUtil__6:raycast(p8, p9 - p8, v18) ~= nil;
	end;
	local function v19(p11, p12, p13)
		return u7(p11, p12, p13) or u7(p12, p11, p13);
	end;
	local v20 = { l__Character__12, p6:getInstance() };
	return not v19(v15, v11, v20) or (not v19(v16, v17, v20) or not v19((v15 + v16) / 2, (v11 + v17) / 2, v20));
end;
local l__Workspace__8 = v5.Workspace;
local l__ClientSyncEvents__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Flamework__10 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__default__12 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__default__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.attackEntity(p14, p15, p16)
	local v21 = l__Players__5.LocalPlayer.Character;
	if v21 ~= nil then
		v21 = v21.PrimaryPart;
	end;
	if not v21 or not l__Workspace__8.CurrentCamera then
		return nil;
	end;
	if l__ClientSyncEvents__9.SwordSwing:fire():isCancelled() then
		return nil;
	end;
	if l__ClientSyncEvents__9.PerformCombat:fire():isCancelled() then
		return nil;
	end;
	local v22 = p14:getHandItem();
	if v22 ~= nil then
		v22 = v22.tool;
	end;
	if not v22 then
		return nil;
	end;
	local v23 = l__getItemMeta__4(v22.Name);
	local l__sword__24 = l__getItemMeta__4(v22.Name).sword;
	local v25 = l__sword__24.chargedAttack;
	if v25 ~= nil then
		v25 = v25.minCharge;
	end;
	if v25 ~= 0 and v25 == v25 and v25 then
		local v26 = l__sword__24.chargedSwingAnimation;
		if v26 then
			local v27 = l__sword__24.chargedAttack;
			if v27 ~= nil then
				v27 = v27.minCharge;
			end;
			v26 = v27 <= p14.chargeTime;
		end;
		if v26 then
			l__sword__24.swingAnimations = l__sword__24.chargedSwingAnimation;
		else
			l__sword__24.swingAnimations = nil;
		end;
		local v28 = l__sword__24.firstPersonChargedSwingAnimation;
		if v28 then
			local v29 = l__sword__24.chargedAttack;
			if v29 ~= nil then
				v29 = v29.minCharge;
			end;
			v28 = v29 <= p14.chargeTime;
		end;
		if v28 then
			l__sword__24.firstPersonSwingAnimations = l__sword__24.firstPersonChargedSwingAnimation;
		else
			l__sword__24.firstPersonSwingAnimations = nil;
		end;
	end;
	if tick() - p14.lastAttack < l__sword__24.attackSpeed then
		if not l__sword__24.respectAttackSpeedForEffects then
			p14:playSwordEffect(v23);
		end;
		return nil;
	end;
	if l__sword__24.cooldown ~= nil then
		if p14.cooldownMaid ~= nil then
			p14.cooldownMaid:DoCleaning();
		end;
		p14.cooldownMaid = l__Maid__3.new();
		p14.cooldownMaid:GiveTask(l__Flamework__10.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__11.SWORD));
		l__Flamework__10.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__11.SWORD, l__getItemMeta__4(v22.Name).sword.attackSpeed, l__sword__24.cooldown);
		p14.cooldownMaid:GiveTask(function()
			l__Flamework__10.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):removeCooldown(l__CooldownId__11.SWORD);
		end);
	end;
	p14:playSwordEffect(v23);
	if p15 then
		local v30 = tick();
		p14.lastAttack = v30;
		local l__Position__31 = p15:getInstance():GetPrimaryPartCFrame().Position;
		local l__Position__32 = l__Players__5.LocalPlayer.Character:GetPrimaryPartCFrame().Position;
		if p16 then
			local v33 = {
				cameraPosition = {
					value = l__Workspace__8.CurrentCamera.CFrame.Position
				}, 
				cursorDirection = {
					value = p16
				}
			};
		else
			v33 = nil;
		end;
		l__default__12.Debug("Fire sword hit remote");
		if l__sword__24.chargedAttack then
			local v34 = l__sword__24.chargedAttack;
			if v34 ~= nil then
				v34 = v34.maxChargeTimeSec;
			end;
			local v35 = v34;
		else
			v35 = 0;
		end;
		local v36 = math.min(v35, p14.chargeTime);
		local v37 = {
			weapon = v22, 
			entityInstance = p15:getInstance(), 
			validate = {
				raycast = v33, 
				targetPosition = {
					value = l__Position__31
				}, 
				selfPosition = {
					value = l__Position__32
				}
			}
		};
		local v38 = {};
		if l__sword__24.chargedAttack then
			local v39 = l__sword__24.chargedAttack;
			if v39 ~= nil then
				v39 = v39.maxChargeTimeSec;
			end;
			local v40 = v36 / v39;
		else
			v40 = 0;
		end;
		v38.chargeRatio = v40;
		v37.chargedAttack = v38;
		p14.chargeTime = 0;
		if not l__default__13.Client:Get("RemoteName"):CallServer(v37) and p14.lastAttack == v30 then
			p14.lastAttack = p14.lastAttack;
			return;
		end;
	elseif l__sword__24.setLastAttackOnEveryHit == true then
		p14.lastAttack = tick();
	end;
end;
local l__GameAnimationUtil__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__RandomUtil__15 = v2.RandomUtil;
local l__AnimationType__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameSound__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__SoundManager__18 = v2.SoundManager;
function u1.playSwordEffect(p17, p18)
	local function v41()
		local v42 = p18.sword;
		if v42 ~= nil then
			v42 = v42.swingAnimations;
		end;
		if v42 then
			local v43 = l__RandomUtil__15.fromList(unpack(p18.sword.swingAnimations));
		else
			v43 = l__AnimationType__16.SWORD_SWING;
		end;
		l__GameAnimationUtil__14.playAnimation(l__Players__5.LocalPlayer, v43);
		local v44 = p18.sword;
		if v44 ~= nil then
			v44 = v44.firstPersonSwingAnimations;
		end;
		if v44 then
			local v45 = l__RandomUtil__15.fromList(unpack(p18.sword.firstPersonSwingAnimations));
		else
			v45 = l__AnimationType__16.FP_SWING_SWORD;
		end;
		l__KnitClient__4.Controllers.ViewmodelController:playAnimation(v45);
		local v46 = { l__GameSound__17.SWORD_SWING_1, l__GameSound__17.SWORD_SWING_2 };
		local v47 = p18.sword;
		if v47 ~= nil then
			v47 = v47.swingSounds;
		end;
		if v47 then
			v46 = p18.sword.swingSounds;
		end;
		l__SoundManager__18:playSound(l__RandomUtil__15.fromList(unpack(v46)));
	end;
	local v48 = p17:getHandItem();
	if v48 ~= nil then
		v48 = v48.tool;
	end;
	if not v48 then
		return nil;
	end;
	local l__sword__49 = l__getItemMeta__4(v48.Name).sword;
	local v50 = l__sword__49;
	if v50 ~= nil then
		v50 = v50.chargedAttack;
	end;
	if not v50 or l__sword__49.chargedAttack.ignoreEffectsOnFullyCharged ~= true then
		v41();
		return;
	end;
	local v51 = l__sword__49;
	if v51 ~= nil then
		v51 = v51.chargedAttack;
		if v51 ~= nil then
			v51 = v51.maxChargeTimeSec;
		end;
	end;
	if v51 <= p17.chargeTime then
		return nil;
	end;
	v41();
end;
function u1.bufferMobileAttack(p19)
	p19.bufferedMobileAttack = true;
end;
local l__EntityUtil__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__CombatConstant__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "combat-constant").CombatConstant;
function u1.swingSwordAtMouse(p20)
	if p20:isClickingTooFast() then
		return nil;
	end;
	local v52 = l__Players__5.LocalPlayer:GetAttribute("chargingSword");
	if v52 ~= 0 and v52 == v52 and v52 ~= "" and v52 then
		return nil;
	end;
	local v53 = p20:getHandItem();
	local v54 = v53;
	if v54 then
		local v55 = l__Players__5.LocalPlayer.Character;
		if v55 ~= nil then
			v55 = v55.PrimaryPart;
		end;
		v54 = v55;
	end;
	if v54 then
		local v56 = l__EntityUtil__19:getEntity(l__Players__5.LocalPlayer);
		if not v56 then
			return nil;
		end;
		local l__sword__57 = l__getItemMeta__4(v53.itemType).sword;
		local v58 = RaycastParams.new();
		v58.FilterDescendantsInstances = { l__Players__5.LocalPlayer.Character };
		v58.FilterType = Enum.RaycastFilterType.Blacklist;
		local l__mouse__59 = l__Players__5.LocalPlayer:GetMouse();
		local l__Direction__60 = l__mouse__59.UnitRay.Direction;
		local v61 = l__Workspace__8:Raycast(l__mouse__59.UnitRay.Origin, l__Direction__60 * 200, v58);
		local v62 = v61;
		if v62 ~= nil then
			v62 = v62.Instance;
		end;
		if v62 then
			local v63 = l__sword__57 and l__sword__57.attackRange;
			if v63 ~= 0 and v63 == v63 and v63 then
				local v64 = l__sword__57.attackRange;
			else
				v64 = l__CombatConstant__20.RAYCAST_SWORD_CHARACTER_DISTANCE;
			end;
			if (l__Players__5.LocalPlayer.Character.PrimaryPart.Position - v61.Instance.Position).Magnitude <= v64 then
				local v65 = l__EntityUtil__19:getEntity(v61.Instance);
				if v65 and v56:canAttack(v65) and p20:canSee(v65) then
					p20:attackEntity(v65, l__Direction__60);
					return nil;
				end;
			end;
		end;
		p20:swingSwordInRegion();
	end;
end;
function u1.mobileSwingPressed(p21)
	l__ClientSyncEvents__9.SwordSwingDown:fire();
	if p21:isClickingTooFast() then
		return nil;
	end;
	p21:swingSwordInRegion();
end;
local l__BLOCK_SIZE__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local l__DeviceUtil__22 = v2.DeviceUtil;
function u1.swingSwordInRegion(p22)
	local v66 = l__Players__5.LocalPlayer:GetAttribute("chargingSword");
	if v66 ~= 0 and v66 == v66 and v66 ~= "" and v66 then
		return nil;
	end;
	local v67 = l__EntityUtil__19:getLocalPlayerEntity();
	local v68 = v67;
	if v68 then
		local v69 = l__Players__5.LocalPlayer.Character;
		if v69 ~= nil then
			v69 = v69.PrimaryPart;
		end;
		v68 = v69;
	end;
	if v68 then
		local v70 = p22:getHandItem();
		if v70 ~= nil then
			v70 = v70.tool;
		end;
		if not v70 then
			return nil;
		end;
		local l__sword__71 = l__getItemMeta__4(v70.Name).sword;
		local v72 = 3.8 * l__BLOCK_SIZE__21;
		local l__attackRange__73 = l__sword__71.attackRange;
		if l__attackRange__73 ~= 0 and l__attackRange__73 == l__attackRange__73 and l__attackRange__73 then
			v72 = l__sword__71.attackRange;
		elseif l__DeviceUtil__22.isMobileControls() then
			v72 = l__CombatConstant__20.REGION_SWORD_CHARACTER_DISTANCE;
		end;
		local v74 = 1.5;
		local l__Humanoid__75 = l__Players__5.LocalPlayer.Character:FindFirstChild("Humanoid");
		if l__Humanoid__75 then
			v74 = l__Humanoid__75.HipHeight;
		end;
		local v76 = l__Players__5.LocalPlayer.Character.PrimaryPart.Position + l__Players__5.LocalPlayer.Character.PrimaryPart.CFrame.LookVector.Unit * (v72 / 2);
		local v77 = Region3.new(v76 - Vector3.new(v72 / 2, v74, v72 / 2), v76 + Vector3.new(v72 / 2, v74, v72 / 2));
		local v78 = CFrame.new(v76, v76 + l__Players__5.LocalPlayer.Character.PrimaryPart.CFrame.LookVector);
		local v79 = l__EntityUtil__19:getAliveEntityInstances();
		local function v80(p23)
			return p23 ~= l__Players__5.LocalPlayer.Character;
		end;
		local v81 = {};
		local v82 = 0;
		for v83, v84 in ipairs(v79) do
			if v80(v84, v83 - 1, v79) == true then
				v82 = v82 + 1;
				v81[v82] = v84;
			end;
		end;
		local function v85(p24)
			return p24.PrimaryPart ~= nil;
		end;
		local v86 = {};
		local v87 = 0;
		for v88, v89 in ipairs(v81) do
			if v85(v89, v88 - 1, v81) == true then
				v87 = v87 + 1;
				v86[v87] = v89;
			end;
		end;
		local v90 = OverlapParams.new();
		v90.FilterType = Enum.RaycastFilterType.Whitelist;
		v90.FilterDescendantsInstances = v86;
		for v91, v92 in ipairs((l__Workspace__8:GetPartBoundsInBox(v77.CFrame, v77.Size, v90))) do
			local v93 = l__EntityUtil__19:getEntity(v92);
			if v93 and v67:canAttack(v93) then
				local l__PrimaryPart__94 = v93:getInstance().PrimaryPart;
				if l__PrimaryPart__94 and (l__PrimaryPart__94.Position - l__Players__5.LocalPlayer.Character.PrimaryPart.Position).Magnitude < v72 and p22:canSee(v93) then
					p22:attackEntity(v93);
					return nil;
				end;
			end;
		end;
		p22:attackEntity(nil);
	end;
end;
local l__HttpService__23 = v5.HttpService;
local l__ClickHold__24 = v2.ClickHold;
local l__UserInputService__25 = v5.UserInputService;
local l__SharedSyncEvents__26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local l__ContextActionService__27 = v5.ContextActionService;
function u1.onEnable(p25, p26)
	local v95 = l__getItemMeta__4(p26.itemType);
	local v96 = v95.sword;
	if v96 ~= nil then
		v96 = v96.idleAnimation;
	end;
	if v96 ~= 0 and v96 == v96 and v96 then
		task.spawn(function()
			local u28 = l__GameAnimationUtil__14.playAnimation(l__Players__5.LocalPlayer, v95.sword.idleAnimation, {
				looped = true
			});
			p25.maid:GiveTask(function()
				if u28 ~= nil then
					u28:Stop();
				end;
				if u28 ~= nil then
					u28:Destroy();
				end;
			end);
		end);
	end;
	local v97 = v95.sword;
	if v97 ~= nil then
		v97 = v97.chargedAttack;
		if v97 ~= nil then
			v97 = v97.fireAtFullCharge;
		end;
	end;
	if v97 then
		local v98 = true;
	else
		v98 = false;
	end;
	local v99 = l__Maid__3.new();
	local l__Idle__100 = v7.Idle;
	local v101 = nil;
	local v102 = l__HttpService__23:GenerateGUID();
	local v103 = v95.sword;
	if v103 ~= nil then
		v103 = v103.chargedAttack;
	end;
	if v103 ~= nil then
		l__ClientSyncEvents__9.SwordCharge:fire(v7.Idle, p26);
		local v104 = v95.sword;
		if v104 ~= nil then
			v104 = v104.chargedAttack;
			if v104 ~= nil then
				v104 = v104.maxChargeTimeSec;
			end;
		end;
		v101 = l__ClickHold__24.new(v104, false);
	end;
	if l__UserInputService__25.TouchEnabled then
		p25.maid:GiveTask(l__UserInputService__25.TouchTapInWorld:Connect(function(p27, p28)
			if not p28 then
				p25:swingSwordAtMouse();
			end;
		end));
		local u29 = 0;
		local u30 = l__Idle__100;
		p25.maid:GiveTask(l__ClientSyncEvents__9.MobileSwordButtonPressed:connect(function(p29)
			if p29.state == "down" then
				u29 = tick();
				local v105 = v95.sword;
				if v105 ~= nil then
					v105 = v105.chargedAttack;
				end;
				if v105 == nil or v95.projectileSource then
					p25:swingSwordAtMouse();
					return;
				else
					p25:chargeWeapon(v95, v99, v101, u30);
					u30 = v7.Charging;
					l__ClientSyncEvents__9.SwordCharge:fire(v7.Charging, p26);
					task.spawn(function()
						local v106 = v95.sword;
						if v106 ~= nil then
							v106 = v106.chargedAttack;
							if v106 ~= nil then
								v106 = v106.maxChargeTimeSec;
							end;
						end;
						task.wait(v106);
						if not p25.chargedWeapons[v102] then
							return nil;
						end;
						if u29 == u29 and u30 == v7.Charging then
							u30 = v7.Charged;
							l__ClientSyncEvents__9.SwordCharge:fire(v7.Charged, p26);
							if v98 then
								p25.chargeTime = v95.sword.chargedAttack.maxChargeTimeSec;
								p25:chargeWeapon(v95, v99, v101, u30);
								p25:swingSwordAtMouse();
								u30 = v7.Idle;
								l__ClientSyncEvents__9.SwordCharge:fire(v7.Idle, p26);
							end;
						end;
					end);
					return;
				end;
			end;
			if p29.state == "up" then
				local v107 = v95.sword;
				if v107 ~= nil then
					v107 = v107.chargedAttack;
				end;
				if v107 == nil or v95.projectileSource then
					return nil;
				end;
				local v108 = v95.sword;
				if v108 ~= nil then
					v108 = v108.chargedAttack;
				end;
				if v108 then
					p25.chargeTime = tick() - u29;
					if u30 ~= v7.Idle then
						p25:chargeWeapon(v95, v99, v101, u30);
						p25:swingSwordAtMouse();
					end;
				end;
				if u30 ~= v7.Idle then
					l__ClientSyncEvents__9.SwordCharge:fire(v7.Idle, p26);
				end;
				u30 = v7.Idle;
				local v109 = p25:getHandItem();
				if v109 ~= nil then
					v109 = v109.tool;
				end;
				local v110 = v109;
				if v110 then
					local v111 = v95.sword;
					if v111 ~= nil then
						v111 = v111.chargedAttack;
					end;
					v110 = v111 and v95.projectileSource == nil;
				end;
				if v110 then
					l__default__13.Client:Get("RemoteName"):CallServer({
						weapon = v109, 
						chargedAttack = {
							chargeRatio = tick() - u29
						}
					});
					l__SharedSyncEvents__26.SwordChargedSwing:fire(l__Players__5.LocalPlayer, v109, {
						chargeTime = tick() - u29
					});
				end;
			end;
		end));
	end;
	local v112 = "swing-sword:" .. l__HttpService__23:GenerateGUID(false);
	local u31 = 0;
	local u32 = l__Idle__100;
	l__ContextActionService__27:BindAction(v112, function(p30, p31, p32)
		if p31 == Enum.UserInputState.Begin then
			u31 = tick();
			local v113 = v95.sword;
			if v113 ~= nil then
				v113 = v113.chargedAttack;
			end;
			if v113 == nil then
				p25:swingSwordAtMouse();
			else
				p25:chargeWeapon(v95, v99, v101, u32);
				u32 = v7.Charging;
				l__ClientSyncEvents__9.SwordCharge:fire(v7.Charging, p26);
				task.spawn(function()
					p25.chargedWeapons[v102] = true;
					local v114 = v95.sword;
					if v114 ~= nil then
						v114 = v114.chargedAttack;
						if v114 ~= nil then
							v114 = v114.maxChargeTimeSec;
						end;
					end;
					task.wait(v114);
					if not p25.chargedWeapons[v102] then
						return nil;
					end;
					if u31 == u31 and u32 == v7.Charging then
						u32 = v7.Charged;
						l__ClientSyncEvents__9.SwordCharge:fire(v7.Charged, p26);
						if v98 then
							p25.chargeTime = v95.sword.chargedAttack.maxChargeTimeSec;
							p25:chargeWeapon(v95, v99, v101, u32);
							p25:swingSwordAtMouse();
							u32 = v7.Idle;
							l__ClientSyncEvents__9.SwordCharge:fire(v7.Idle, p26);
						end;
					end;
				end);
			end;
			l__ClientSyncEvents__9.SwordSwingDown:fire();
			return;
		end;
		if p31 == Enum.UserInputState.End then
			local v115 = tick() - u31;
			local v116 = v95.sword;
			if v116 ~= nil then
				v116 = v116.chargedAttack;
			end;
			if v116 then
				p25.chargeTime = v115;
				if u32 ~= v7.Idle then
					p25:chargeWeapon(v95, v99, v101, u32);
					p25:swingSwordAtMouse();
				end;
			end;
			if u32 ~= v7.Idle then
				l__ClientSyncEvents__9.SwordCharge:fire(v7.Idle, p26);
			end;
			u32 = v7.Idle;
			l__ClientSyncEvents__9.SwordSwingUp:fire();
			local v117 = p25:getHandItem();
			if v117 ~= nil then
				v117 = v117.tool;
			end;
			l__default__13.Client:Get("RemoteName"):CallServer({
				weapon = v117, 
				chargedAttack = {
					chargeRatio = v115
				}
			});
			l__SharedSyncEvents__26.SwordChargedSwing:fire(l__Players__5.LocalPlayer, v117, {
				chargeTime = v115
			});
		end;
	end, false, Enum.UserInputType.MouseButton1);
	p25.maid:GiveTask(function()
		l__ContextActionService__27:UnbindAction(v112);
		if v101 ~= nil then
			v101:disable();
		end;
		local v118 = l__getItemMeta__4(p26.itemType).sword;
		if v118 ~= nil then
			v118 = v118.chargedAttack;
		end;
		if v118 ~= nil then
			p25.chargedWeapons[v102] = false;
			l__ClientSyncEvents__9.SwordCharge:fire(v7.Idle, p26);
		end;
	end);
	if p25.bufferedMobileAttack then
		p25.bufferedMobileAttack = false;
		p25:mobileSwingPressed();
	end;
end;
local l__KnitClient__33 = v3.KnitClient;
function u1.chargeWeapon(p33, p34, p35, p36, p37)
	local l__chargedAttack__119 = p34.sword.chargedAttack;
	local v120 = l__chargedAttack__119.chargeSlowDelay;
	if v120 == nil then
		v120 = 0;
	end;
	local function u34()
		p36:endClick();
		p35:DoCleaning();
	end;
	p33.maid:GiveTask(function()
		u34();
	end);
	if p37 == v7.Idle then
		(function()
			task.delay(v120, function()
				local v121 = l__Players__5.LocalPlayer:GetAttribute("IsCharging");
				if v121 ~= 0 and v121 == v121 and v121 ~= "" and v121 then
					p35:GiveTask(l__KnitClient__33.Controllers.SprintController:getMovementStatusModifier():addModifier({
						moveSpeedMultiplier = l__chargedAttack__119.walkSpeedMultiplier
					}));
					return;
				end;
				return nil;
			end);
			p36:startClick();
		end)();
	elseif p37 == v7.Charging then
		u34();
	elseif p37 == v7.Charged then
		u34();
	end;
end;
function u1.onDisable(p38)
	p38.maid:DoCleaning();
end;
function u1.isClickingTooFast(p39)
	if tick() - p39.lastSwing < 0.1111111111111111 then
		return true;
	end;
	p39.lastSwing = tick();
	return false;
end;
local l__ItemType__35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function u1.heavenlySwordMobileHandler(p40)
	if not l__UserInputService__25.TouchEnabled then
		return nil;
	end;
	local v122 = l__EntityUtil__19:getEntity(l__Players__5.LocalPlayer);
	if v122 ~= nil then
		v122 = v122:getItemInHand();
		if v122 ~= nil then
			v122 = v122.Name;
		end;
	end;
	if v122 ~= l__ItemType__35.HEAVENLY_SWORD then
		return nil;
	end;
	p40:swingSwordInRegion();
end;
u2 = l__KnitClient__4.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	ChargeState = v7, 
	SwordController = u2
};
return v9;

