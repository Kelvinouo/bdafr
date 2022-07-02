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
	local function v12(p7)
		local v13 = p7:FindFirstChildWhichIsA("Humanoid");
		if not p7.PrimaryPart then
			return nil;
		end;
		if not v13 then
			return nil;
		end;
		return p7.PrimaryPart.Position + Vector3.new(0, -1 * (v13.HipHeight + p7.PrimaryPart.Size.Y / 2), 0);
	end;
	local v14 = v12(l__Character__11);
	local v15 = v12(p6:getInstance());
	if not v14 or not v15 then
		return false;
	end;
	local v16 = v14 + Vector3.new(0, 5, 0);
	local v17 = v15 + Vector3.new(0, 5, 0);
	local v18 = { l__Character__11, p6:getInstance() };
	local v19 = RaycastParams.new();
	v19.FilterDescendantsInstances = v18;
	v19.FilterType = Enum.RaycastFilterType.Blacklist;
	local v20 = l__GameQueryUtil__6:raycast(v14, v15 - v14, v19) ~= nil;
	if not v20 then
		local v21 = RaycastParams.new();
		v21.FilterDescendantsInstances = v18;
		v21.FilterType = Enum.RaycastFilterType.Blacklist;
		v20 = l__GameQueryUtil__6:raycast(v15, v14 - v15, v21) ~= nil;
	end;
	local v22 = not v20;
	if not v22 then
		local v23 = RaycastParams.new();
		v23.FilterDescendantsInstances = v18;
		v23.FilterType = Enum.RaycastFilterType.Blacklist;
		local v24 = l__GameQueryUtil__6:raycast(v16, v17 - v16, v23) ~= nil;
		if not v24 then
			local v25 = RaycastParams.new();
			v25.FilterDescendantsInstances = v18;
			v25.FilterType = Enum.RaycastFilterType.Blacklist;
			v24 = l__GameQueryUtil__6:raycast(v17, v16 - v17, v25) ~= nil;
		end;
		v22 = not v24;
		if not v22 then
			local v26 = (v14 + v16) / 2;
			local v27 = (v15 + v17) / 2;
			local v28 = RaycastParams.new();
			v28.FilterDescendantsInstances = v18;
			v28.FilterType = Enum.RaycastFilterType.Blacklist;
			local v29 = l__GameQueryUtil__6:raycast(v26, v27 - v26, v28) ~= nil;
			if not v29 then
				local v30 = RaycastParams.new();
				v30.FilterDescendantsInstances = v18;
				v30.FilterType = Enum.RaycastFilterType.Blacklist;
				v29 = l__GameQueryUtil__6:raycast(v27, v26 - v27, v30) ~= nil;
			end;
			v22 = not v29;
		end;
	end;
	return v22;
end;
local l__Workspace__7 = v5.Workspace;
local l__ClientSyncEvents__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Flamework__9 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__default__11 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__default__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.attackEntity(p8, p9, p10)
	local v31 = l__Players__5.LocalPlayer.Character;
	if v31 ~= nil then
		v31 = v31.PrimaryPart;
	end;
	if not v31 or not l__Workspace__7.CurrentCamera then
		return nil;
	end;
	if l__ClientSyncEvents__8.SwordSwing:fire():isCancelled() then
		return nil;
	end;
	if l__ClientSyncEvents__8.PerformCombat:fire():isCancelled() then
		return nil;
	end;
	local v32 = p8:getHandItem();
	if v32 ~= nil then
		v32 = v32.tool;
	end;
	if not v32 then
		return nil;
	end;
	local v33 = l__getItemMeta__4(v32.Name);
	local l__sword__34 = l__getItemMeta__4(v32.Name).sword;
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
			v36 = v37 <= p8.chargeTime;
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
			v38 = v39 <= p8.chargeTime;
		end;
		if v38 then
			l__sword__34.firstPersonSwingAnimations = l__sword__34.firstPersonChargedSwingAnimation;
		else
			l__sword__34.firstPersonSwingAnimations = nil;
		end;
	end;
	if tick() - p8.lastAttack < l__sword__34.attackSpeed then
		if not l__sword__34.respectAttackSpeedForEffects then
			p8:playSwordEffect(v33);
		end;
		return nil;
	end;
	if l__sword__34.cooldown ~= nil then
		if p8.cooldownMaid ~= nil then
			p8.cooldownMaid:DoCleaning();
		end;
		p8.cooldownMaid = u3.new();
		p8.cooldownMaid:GiveTask(l__Flamework__9.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__10.SWORD));
		l__Flamework__9.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__10.SWORD, l__getItemMeta__4(v32.Name).sword.attackSpeed, l__sword__34.cooldown);
		p8.cooldownMaid:GiveTask(function()
			l__Flamework__9.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):removeCooldown(l__CooldownId__10.SWORD);
		end);
	end;
	p8:playSwordEffect(v33);
	if p9 then
		local v40 = tick();
		p8.lastAttack = v40;
		local l__Position__41 = p9:getInstance():GetPrimaryPartCFrame().Position;
		local l__Position__42 = l__Players__5.LocalPlayer.Character:GetPrimaryPartCFrame().Position;
		if p10 then
			local v43 = {
				cameraPosition = {
					value = l__Workspace__7.CurrentCamera.CFrame.Position
				}, 
				cursorDirection = {
					value = p10
				}
			};
		else
			v43 = nil;
		end;
		l__default__11.Debug("Fire sword hit remote");
		if l__sword__34.chargedAttack then
			local v44 = l__sword__34.chargedAttack;
			if v44 ~= nil then
				v44 = v44.maxChargeTimeSec;
			end;
			local v45 = v44;
		else
			v45 = 0;
		end;
		local v46 = math.min(v45, p8.chargeTime);
		local v47 = {
			weapon = v32, 
			entityInstance = p9:getInstance(), 
			validate = {
				raycast = v43, 
				targetPosition = {
					value = l__Position__41
				}, 
				selfPosition = {
					value = l__Position__42
				}
			}
		};
		local v48 = {};
		if l__sword__34.chargedAttack then
			local v49 = l__sword__34.chargedAttack;
			if v49 ~= nil then
				v49 = v49.maxChargeTimeSec;
			end;
			local v50 = v46 / v49;
		else
			v50 = 0;
		end;
		v48.chargeRatio = v50;
		v47.chargedAttack = v48;
		p8.chargeTime = 0;
		if not l__default__12.Client:Get("RemoteName"):CallServer(v47) and p8.lastAttack == v40 then
			p8.lastAttack = p8.lastAttack;
			return;
		end;
	elseif l__sword__34.setLastAttackOnEveryHit == true then
		p8.lastAttack = tick();
	end;
end;
local l__GameAnimationUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__RandomUtil__14 = v2.RandomUtil;
local l__AnimationType__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameSound__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__SoundManager__17 = v2.SoundManager;
function u1.playSwordEffect(p11, p12)
	local function v51(p13)
		local v52 = p12.sword;
		if v52 ~= nil then
			v52 = v52.swingAnimations;
		end;
		if v52 then
			local v53 = l__RandomUtil__14.fromList(unpack(p12.sword.swingAnimations));
		else
			v53 = l__AnimationType__15.SWORD_SWING;
		end;
		l__GameAnimationUtil__13.playAnimation(l__Players__5.LocalPlayer, v53);
		local v54 = p12.sword;
		if v54 ~= nil then
			v54 = v54.firstPersonSwingAnimations;
		end;
		if v54 then
			local v55 = l__RandomUtil__14.fromList(unpack(p12.sword.firstPersonSwingAnimations));
		else
			v55 = l__AnimationType__15.FP_SWING_SWORD;
		end;
		l__KnitClient__4.Controllers.ViewmodelController:playAnimation(v55);
		local v56 = { l__GameSound__16.SWORD_SWING_1, l__GameSound__16.SWORD_SWING_2 };
		local v57 = p12.sword;
		if v57 ~= nil then
			v57 = v57.swingSounds;
		end;
		if v57 then
			v56 = p12.sword.swingSounds;
		end;
		l__SoundManager__17:playSound(l__RandomUtil__14.fromList(unpack(v56)));
	end;
	local v58 = p11:getHandItem();
	if v58 ~= nil then
		v58 = v58.tool;
	end;
	if not v58 then
		return nil;
	end;
	local l__sword__59 = l__getItemMeta__4(v58.Name).sword;
	local v60 = l__sword__59;
	if v60 ~= nil then
		v60 = v60.chargedAttack;
	end;
	if not v60 or l__sword__59.chargedAttack.ignoreEffectsOnFullyCharged ~= true then
		v51(v58);
		return;
	end;
	local v61 = l__sword__59;
	if v61 ~= nil then
		v61 = v61.chargedAttack;
		if v61 ~= nil then
			v61 = v61.maxChargeTimeSec;
		end;
	end;
	if v61 <= p11.chargeTime then
		return nil;
	end;
	v51(v58);
end;
function u1.bufferMobileAttack(p14)
	p14.bufferedMobileAttack = true;
end;
local l__EntityUtil__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__CombatConstant__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "combat-constant").CombatConstant;
function u1.swingSwordAtMouse(p15)
	if p15:isClickingTooFast() then
		return nil;
	end;
	local v62 = l__Players__5.LocalPlayer:GetAttribute("chargingSword");
	if v62 ~= 0 and v62 == v62 and v62 ~= "" and v62 then
		return nil;
	end;
	local v63 = p15:getHandItem();
	local v64 = v63;
	if v64 then
		local v65 = l__Players__5.LocalPlayer.Character;
		if v65 ~= nil then
			v65 = v65.PrimaryPart;
		end;
		v64 = v65;
	end;
	if v64 then
		local v66 = l__EntityUtil__18:getEntity(l__Players__5.LocalPlayer);
		if not v66 then
			return nil;
		end;
		local l__sword__67 = l__getItemMeta__4(v63.itemType).sword;
		local v68 = RaycastParams.new();
		v68.FilterDescendantsInstances = { l__Players__5.LocalPlayer.Character };
		v68.FilterType = Enum.RaycastFilterType.Blacklist;
		local l__mouse__69 = l__Players__5.LocalPlayer:GetMouse();
		local l__Direction__70 = l__mouse__69.UnitRay.Direction;
		local v71 = l__Workspace__7:Raycast(l__mouse__69.UnitRay.Origin, l__Direction__70 * 200, v68);
		local v72 = v71;
		if v72 ~= nil then
			v72 = v72.Instance;
		end;
		if v72 then
			local v73 = l__sword__67 and l__sword__67.attackRange;
			if v73 ~= 0 and v73 == v73 and v73 then
				local v74 = l__sword__67.attackRange;
			else
				v74 = l__CombatConstant__19.RAYCAST_SWORD_CHARACTER_DISTANCE;
			end;
			if (l__Players__5.LocalPlayer.Character.PrimaryPart.Position - v71.Instance.Position).Magnitude <= v74 then
				local v75 = l__EntityUtil__18:getEntity(v71.Instance);
				if v75 and v66:canAttack(v75) and p15:canSee(v75) then
					p15:attackEntity(v75, l__Direction__70);
					return nil;
				end;
			end;
		end;
		p15:swingSwordInRegion();
	end;
end;
function u1.mobileSwingPressed(p16)
	l__ClientSyncEvents__8.SwordSwingDown:fire();
	if p16:isClickingTooFast() then
		return nil;
	end;
	p16:swingSwordInRegion();
end;
local l__BLOCK_SIZE__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local l__DeviceUtil__21 = v2.DeviceUtil;
function u1.swingSwordInRegion(p17)
	local v76 = l__Players__5.LocalPlayer:GetAttribute("chargingSword");
	if v76 ~= 0 and v76 == v76 and v76 ~= "" and v76 then
		return nil;
	end;
	local v77 = l__EntityUtil__18:getLocalPlayerEntity();
	local v78 = v77;
	if v78 then
		local v79 = l__Players__5.LocalPlayer.Character;
		if v79 ~= nil then
			v79 = v79.PrimaryPart;
		end;
		v78 = v79;
	end;
	if v78 then
		local v80 = p17:getHandItem();
		if v80 ~= nil then
			v80 = v80.tool;
		end;
		if not v80 then
			return nil;
		end;
		local l__sword__81 = l__getItemMeta__4(v80.Name).sword;
		local v82 = 3.8 * l__BLOCK_SIZE__20;
		local l__attackRange__83 = l__sword__81.attackRange;
		if l__attackRange__83 ~= 0 and l__attackRange__83 == l__attackRange__83 and l__attackRange__83 then
			v82 = l__sword__81.attackRange;
		elseif l__DeviceUtil__21.isMobileControls() then
			v82 = l__CombatConstant__19.REGION_SWORD_CHARACTER_DISTANCE;
		end;
		local v84 = 1.5;
		local l__Humanoid__85 = l__Players__5.LocalPlayer.Character:FindFirstChild("Humanoid");
		if l__Humanoid__85 then
			v84 = l__Humanoid__85.HipHeight;
		end;
		local v86 = l__Players__5.LocalPlayer.Character.PrimaryPart.Position + l__Players__5.LocalPlayer.Character.PrimaryPart.CFrame.LookVector.Unit * (v82 / 2);
		local v87 = Region3.new(v86 - Vector3.new(v82 / 2, v84, v82 / 2), v86 + Vector3.new(v82 / 2, v84, v82 / 2));
		local v88 = CFrame.new(v86, v86 + l__Players__5.LocalPlayer.Character.PrimaryPart.CFrame.LookVector);
		local v89 = {};
		local v90 = 0;
		local v91, v92, v93 = ipairs((l__EntityUtil__18:getAliveEntityInstances()));
		while true do
			local v94, v95 = v91(v92, v93);
			if not v94 then
				break;
			end;
			if v95 ~= l__Players__5.LocalPlayer.Character == true then
				v90 = v90 + 1;
				v89[v90] = v95;
			end;		
		end;
		local v96 = {};
		local v97 = 0;
		local v98, v99, v100 = ipairs(v89);
		while true do
			local v101, v102 = v98(v99, v100);
			if not v101 then
				break;
			end;
			if v102.PrimaryPart ~= nil == true then
				v97 = v97 + 1;
				v96[v97] = v102;
			end;		
		end;
		local v103 = OverlapParams.new();
		v103.FilterType = Enum.RaycastFilterType.Whitelist;
		v103.FilterDescendantsInstances = v96;
		for v104, v105 in ipairs((l__Workspace__7:GetPartBoundsInBox(v87.CFrame, v87.Size, v103))) do
			local v106 = l__EntityUtil__18:getEntity(v105);
			if v106 and v77:canAttack(v106) then
				local l__PrimaryPart__107 = v106:getInstance().PrimaryPart;
				if l__PrimaryPart__107 and (l__PrimaryPart__107.Position - l__Players__5.LocalPlayer.Character.PrimaryPart.Position).Magnitude < v82 and p17:canSee(v106) then
					p17:attackEntity(v106);
					return nil;
				end;
			end;
		end;
		p17:attackEntity(nil);
	end;
end;
local l__HttpService__22 = v5.HttpService;
local l__ClickHold__23 = v2.ClickHold;
local l__UserInputService__24 = v5.UserInputService;
local l__SharedSyncEvents__25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local l__ContextActionService__26 = v5.ContextActionService;
function u1.onEnable(p18, p19)
	local v108 = l__getItemMeta__4(p19.itemType);
	local v109 = v108.sword;
	if v109 ~= nil then
		v109 = v109.idleAnimation;
	end;
	if v109 ~= 0 and v109 == v109 and v109 then
		task.spawn(function()
			local u27 = l__GameAnimationUtil__13.playAnimation(l__Players__5.LocalPlayer, v108.sword.idleAnimation, {
				looped = true
			});
			p18.maid:GiveTask(function()
				if u27 ~= nil then
					u27:Stop();
				end;
				if u27 ~= nil then
					u27:Destroy();
				end;
			end);
		end);
	end;
	local v110 = v108.sword;
	if v110 ~= nil then
		v110 = v110.chargedAttack;
		if v110 ~= nil then
			v110 = v110.fireAtFullCharge;
		end;
	end;
	if v110 then
		local v111 = true;
	else
		v111 = false;
	end;
	local v112 = u3.new();
	local l__Idle__113 = v7.Idle;
	local v114 = nil;
	local v115 = l__HttpService__22:GenerateGUID();
	local v116 = v108.sword;
	if v116 ~= nil then
		v116 = v116.chargedAttack;
	end;
	if v116 ~= nil then
		l__ClientSyncEvents__8.SwordCharge:fire(v7.Idle, p19);
		local v117 = v108.sword;
		if v117 ~= nil then
			v117 = v117.chargedAttack;
			if v117 ~= nil then
				v117 = v117.maxChargeTimeSec;
			end;
		end;
		v114 = l__ClickHold__23.new(v117, false);
	end;
	if l__UserInputService__24.TouchEnabled then
		p18.maid:GiveTask(l__UserInputService__24.TouchTapInWorld:Connect(function(p20, p21)
			if not p21 then
				p18:swingSwordAtMouse();
			end;
		end));
		local u28 = l__Idle__113;
		local u29 = 0;
		p18.maid:GiveTask(l__ClientSyncEvents__8.MobileSwordButtonPressed:connect(function(p22)
			if p22.state == "down" then
				local v118 = l__Players__5.LocalPlayer:GetAttribute("IsCasting");
				if v118 ~= 0 and v118 == v118 and v118 ~= "" and v118 then
					return nil;
				end;
				local v119 = v108.sword;
				if v119 ~= nil then
					v119 = v119.chargedAttack;
				end;
				if v119 ~= nil and not v108.projectileSource then
					p22:setCancelled(true);
					if u28 ~= v7.Idle then
						return nil;
					else
						p18:chargeWeapon(v108, v112, v114, u28);
						u28 = v7.Charging;
						l__ClientSyncEvents__8.SwordCharge:fire(v7.Charging, p19);
						u29 = tick();
						task.spawn(function()
							local v120 = v108.sword;
							if v120 ~= nil then
								v120 = v120.chargedAttack;
								if v120 ~= nil then
									v120 = v120.maxChargeTimeSec;
								end;
							end;
							task.wait(v120);
							if not p18.chargedWeapons[v115] then
								if v114 ~= nil then
									v114:endClick();
								end;
								v112:DoCleaning();
								return nil;
							end;
							if u29 == u29 and u28 == v7.Charging then
								u28 = v7.Charged;
								l__ClientSyncEvents__8.SwordCharge:fire(v7.Charged, p19);
								if v111 then
									p18.chargeTime = v108.sword.chargedAttack.maxChargeTimeSec;
									p18:chargeWeapon(v108, v112, v114, u28);
									p18:swingSwordAtMouse();
									u28 = v7.Idle;
									l__ClientSyncEvents__8.SwordCharge:fire(v7.Idle, p19);
								end;
							end;
						end);
						return;
					end;
				end;
			elseif p22.state == "up" then
				local v121 = tick() - u29;
				local v122 = v108.sword;
				if v122 ~= nil then
					v122 = v122.chargedAttack;
				end;
				local v123 = v122 == nil or v108.projectileSource;
				if v123 then
					return nil;
				end;
				local v124 = v108.sword;
				if v124 ~= nil then
					v124 = v124.chargedAttack;
				end;
				if v124 then
					p18.chargeTime = v121;
					if u28 ~= v7.Idle then
						p18:chargeWeapon(v108, v112, v114, u28);
						p18:swingSwordAtMouse();
					end;
				end;
				if u28 ~= v7.Idle then
					l__ClientSyncEvents__8.SwordCharge:fire(v7.Idle, p19);
				end;
				local v125 = v108.sword;
				if v125 ~= nil then
					v125 = v125.chargedAttack;
				end;
				local v126 = v125 and u28 == v7.Idle;
				if v126 then
					return nil;
				end;
				local v127 = p18:getHandItem();
				if v127 ~= nil then
					v127 = v127.tool;
				end;
				local v128 = v127;
				if v128 then
					local v129 = v108.sword;
					if v129 ~= nil then
						v129 = v129.chargedAttack;
					end;
					v128 = v129 and v108.projectileSource == nil;
				end;
				if v128 then
					l__SharedSyncEvents__25.SwordChargedSwing:fire(l__Players__5.LocalPlayer, v127, {
						chargeTime = tick() - u29
					});
				end;
				u28 = v7.Idle;
			end;
		end));
	end;
	local v130 = "swing-sword:" .. l__HttpService__22:GenerateGUID(false);
	local u30 = 0;
	local u31 = l__Idle__113;
	l__ContextActionService__26:BindAction(v130, function(p23, p24, p25)
		if p24 == Enum.UserInputState.Begin then
			u30 = tick();
			local v131 = l__Players__5.LocalPlayer:GetAttribute("IsCasting");
			if v131 ~= 0 and v131 == v131 and v131 ~= "" and v131 then
				return nil;
			else
				local v132 = nil;
				local v133 = nil;
				local v134 = nil;
				local v135 = nil;
				local v136 = nil;
				local v137 = nil;
				local v138 = nil;
				local v139 = nil;
				local v140 = nil;
				local v141 = nil;
				local v142 = v108.sword;
				if v142 ~= nil then
					v142 = v142.chargedAttack;
				end;
				if v142 == nil then
					p18:swingSwordAtMouse();
					v132 = l__ClientSyncEvents__8;
					v133 = "SwordSwingDown";
					v134 = v132;
					v135 = v133;
					v136 = v134[v135];
					local v143 = "fire";
					v137 = v136;
					local v144 = v137;
					v138 = v136;
					v139 = v143;
					local v145 = v138[v139];
					v140 = v145;
					v141 = v144;
					v140(v141);
					return;
				elseif u31 ~= v7.Idle then
					return nil;
				else
					p18:chargeWeapon(v108, v112, v114, u31);
					u31 = v7.Charging;
					l__ClientSyncEvents__8.SwordCharge:fire(v7.Charging, p19);
					task.spawn(function()
						p18.chargedWeapons[v115] = true;
						local v146 = v108.sword;
						if v146 ~= nil then
							v146 = v146.chargedAttack;
							if v146 ~= nil then
								v146 = v146.maxChargeTimeSec;
							end;
						end;
						task.wait(v146);
						if not p18.chargedWeapons[v115] then
							if v114 ~= nil then
								v114:endClick();
							end;
							v112:DoCleaning();
							return nil;
						end;
						if u30 == u30 and u31 == v7.Charging then
							u31 = v7.Charged;
							l__ClientSyncEvents__8.SwordCharge:fire(v7.Charged, p19);
							if v111 then
								p18.chargeTime = v108.sword.chargedAttack.maxChargeTimeSec;
								p18:chargeWeapon(v108, v112, v114, u31);
								p18:swingSwordAtMouse();
								u31 = v7.Idle;
								l__ClientSyncEvents__8.SwordCharge:fire(v7.Idle, p19);
							end;
						end;
					end);
					v132 = l__ClientSyncEvents__8;
					v133 = "SwordSwingDown";
					v134 = v132;
					v135 = v133;
					v136 = v134[v135];
					v143 = "fire";
					v137 = v136;
					v144 = v137;
					v138 = v136;
					v139 = v143;
					v145 = v138[v139];
					v140 = v145;
					v141 = v144;
					v140(v141);
					return;
				end;
			end;
		end;
		if p24 == Enum.UserInputState.End then
			local v147 = tick() - u30;
			local v148 = v108.sword;
			if v148 ~= nil then
				v148 = v148.chargedAttack;
			end;
			if v148 then
				p18.chargeTime = v147;
				if u31 ~= v7.Idle then
					p18:chargeWeapon(v108, v112, v114, u31);
					p18:swingSwordAtMouse();
				else
					if v114 ~= nil then
						v114:endClick();
					end;
					v112:DoCleaning();
				end;
			end;
			if u31 ~= v7.Idle then
				l__ClientSyncEvents__8.SwordCharge:fire(v7.Idle, p19);
			end;
			local v149 = v108.sword;
			if v149 ~= nil then
				v149 = v149.chargedAttack;
			end;
			if v149 and u31 == v7.Idle then
				return nil;
			end;
			u31 = v7.Idle;
			l__ClientSyncEvents__8.SwordSwingUp:fire();
			local v150 = p18:getHandItem();
			if v150 ~= nil then
				v150 = v150.tool;
			end;
			l__SharedSyncEvents__25.SwordChargedSwing:fire(l__Players__5.LocalPlayer, v150, {
				chargeTime = v147
			});
		end;
	end, false, Enum.UserInputType.MouseButton1);
	p18.maid:GiveTask(function()
		l__ContextActionService__26:UnbindAction(v130);
		if v114 ~= nil then
			v114:disable();
		end;
		local v151 = l__getItemMeta__4(p19.itemType).sword;
		if v151 ~= nil then
			v151 = v151.chargedAttack;
		end;
		if v151 ~= nil then
			p18.chargedWeapons[v115] = false;
			l__ClientSyncEvents__8.SwordCharge:fire(v7.Idle, p19);
		end;
	end);
	if p18.bufferedMobileAttack then
		p18.bufferedMobileAttack = false;
		p18:setupYield(function()
			p18:mobileSwingPressed();
			return function()

			end;
		end);
	end;
end;
local l__KnitClient__32 = v3.KnitClient;
function u1.chargeWeapon(p26, p27, p28, p29, p30)
	local l__chargedAttack__152 = p27.sword.chargedAttack;
	local v153 = l__chargedAttack__152.chargeSlowDelay;
	if v153 == nil then
		v153 = 0;
	end;
	p26.maid:GiveTask(function()
		p29:endClick();
		p28:DoCleaning();
	end);
	if p30 == v7.Idle then
		task.delay(v153, function()
			local v154 = l__Players__5.LocalPlayer:GetAttribute("IsCharging");
			if v154 ~= 0 and v154 == v154 and v154 ~= "" and v154 then
				p28:GiveTask(l__KnitClient__32.Controllers.SprintController:getMovementStatusModifier():addModifier({
					moveSpeedMultiplier = l__chargedAttack__152.walkSpeedMultiplier
				}));
				return;
			end;
			return nil;
		end);
		p29:startClick();
	elseif p30 == v7.Charging then
		p29:endClick();
		p28:DoCleaning();
	elseif p30 == v7.Charged then
		p29:endClick();
		p28:DoCleaning();
	end;
end;
function u1.onDisable(p31)
	p31.maid:DoCleaning();
end;
function u1.isClickingTooFast(p32)
	if tick() - p32.lastSwing < 0.1111111111111111 then
		return true;
	end;
	p32.lastSwing = tick();
	return false;
end;
local l__ItemType__33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function u1.heavenlySwordMobileHandler(p33)
	if not l__UserInputService__24.TouchEnabled then
		return nil;
	end;
	local v155 = l__EntityUtil__18:getEntity(l__Players__5.LocalPlayer);
	if v155 ~= nil then
		v155 = v155:getItemInHand();
		if v155 ~= nil then
			v155 = v155.Name;
		end;
	end;
	if v155 ~= l__ItemType__33.HEAVENLY_SWORD then
		return nil;
	end;
	p33:swingSwordInRegion();
end;
u2 = l__KnitClient__4.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	ChargeState = v7, 
	SwordController = u2
};
return v9;
