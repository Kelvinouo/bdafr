-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "PlayerVacuumController";
	end, 
	__index = l__HandKnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v6.constructor(p1, ...)
	l__HandKnitController__5.constructor(p1, ...);
	p1.Name = "PlayerVacuumController";
	p1.maid = u1.new();
	p1.activeVacuumingEffects = {};
	p1.activeProximityPrompts = {};
end;
local l__RunService__2 = v4.RunService;
local l__Workspace__3 = v4.Workspace;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__EntityUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__SoundManager__6 = v2.SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__KnitClient__8 = v3.KnitClient;
local l__RandomUtil__9 = v2.RandomUtil;
local l__Flamework__10 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__Players__12 = v4.Players;
local l__InventoryUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__ItemType__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v6.KnitStart(p2)
	l__HandKnitController__5.KnitStart(p2);
	l__RunService__2.Heartbeat:Connect(function()
		for v8, v9 in pairs(p2.activeVacuumingEffects) do
			if l__Workspace__3:GetServerTimeNow() - v9.startTime > 1.5 then
				p2:cleanVacuumingEffect(v8);
			end;
		end;
	end);
	l__default__4.Client:OnEvent("RemoteName", function(p3)
		local v10 = l__EntityUtil__5:getEntity(p3.victimEntityInstance);
		local v11 = l__EntityUtil__5:getEntity(p3.attackerEntityInstance);
		local v12 = {};
		local v13 = v10;
		if v13 ~= nil then
			v13 = v13:isLocalPlayer();
		end;
		if v13 then
			local v14 = nil;
		else
			v14 = p3.victimEntityInstance:GetPrimaryPartCFrame().Position;
		end;
		v12.position = v14;
		l__SoundManager__6:playSound(l__GameSound__7.GHOST_VACUUM_SHOOT, v12);
		local v15 = v10;
		if v15 ~= nil then
			v15 = v15:isLocalPlayer();
		end;
		if v15 and l__Workspace__3.CurrentCamera then
			l__Workspace__3.CurrentCamera.CameraSubject = p3.victimEntityInstance.Humanoid;
		end;
		local v16 = v11;
		if v16 ~= nil then
			v16 = v16:isLocalPlayer();
		end;
		if v16 then
			local v17 = v11:getInstance():GetPrimaryPartCFrame();
			l__KnitClient__8.Controllers.ScreenShakeController:shake(v17.Position, v17 * Vector3.new(-0.25, 0, -1) - v17.Position, {
				magnitude = 0.15, 
				duration = 0.15, 
				cycles = 2
			});
		end;
		local v18 = v10;
		if v18 ~= nil then
			v18 = v18:isLocalPlayer();
		end;
		local v19 = v18;
		if not v19 then
			local v20 = v11;
			if v20 ~= nil then
				v20 = v20:isLocalPlayer();
			end;
			v19 = v20;
		end;
		if v19 then
			local l__cooldownbarMaid__21 = p2.cooldownbarMaid;
			if l__cooldownbarMaid__21 ~= nil then
				l__cooldownbarMaid__21:DoCleaning();
			end;
		end;
	end);
	l__default__4.Client:OnEvent("RemoteName", function(p4)
		local v22 = l__EntityUtil__5:getEntity(p4.victimEntityInstance);
		local v23 = l__EntityUtil__5:getEntity(p4.attackerEntityInstance);
		local v24 = v23;
		if v24 ~= nil then
			v24 = v24:isLocalPlayer();
		end;
		local v25 = v22;
		if v25 ~= nil then
			v25 = v25:isLocalPlayer();
		end;
		local v26 = {};
		local v27 = v23;
		if v27 ~= nil then
			v27 = v27:isLocalPlayer();
		end;
		local v28 = v27;
		if not v28 then
			local v29 = v22;
			if v29 ~= nil then
				v29 = v29:isLocalPlayer();
			end;
			v28 = v29;
		end;
		if v28 then
			local v30 = nil;
		else
			v30 = p4.victimEntityInstance:GetPrimaryPartCFrame().Position;
		end;
		v26.position = v30;
		l__SoundManager__6:playSound(l__GameSound__7.VACUUM_CATCH, v26);
		if v24 then
			l__SoundManager__6:playSound(l__RandomUtil__9.fromList(l__GameSound__7.DAMAGE_1, l__GameSound__7.DAMAGE_2, l__GameSound__7.DAMAGE_3));
			local v31 = v23;
			if v31 ~= nil then
				v31 = v31:getInstance():GetPrimaryPartCFrame();
			end;
			if v31 then
				l__KnitClient__8.Controllers.ScreenShakeController:shake(v31.Position, v31 * Vector3.new(-0.25, 0, -1) - v31.Position, {
					magnitude = 0.15, 
					duration = 0.15, 
					cycles = 2
				});
			end;
		end;
		if v25 and l__Workspace__3.CurrentCamera then
			l__Flamework__10.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
				message = "You are stuck in " .. p4.attackerEntityInstance.Name .. "'s vacuum for the next few seconds!"
			});
			l__Workspace__3.CurrentCamera.CameraSubject = p4.attackerEntityInstance.Humanoid;
		end;
		if v24 or v25 then
			p2.cooldownbarMaid = l__Flamework__10.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__11.PLAYER_VACUUM);
			l__Flamework__10.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__11.PLAYER_VACUUM, p4.expirationTime - l__Workspace__3:GetServerTimeNow(), {
				cooldownBar = {
					color = Color3.fromRGB(54, 145, 224)
				}
			});
			local u15 = l__SoundManager__6:playSound(l__GameSound__7.ACTIVE_VACUUM_LOOP, {
				looped = true, 
				volumeMultiplier = 0.1
			});
			p2.cooldownbarMaid:GiveTask(function()
				if u15 then
					u15:Destroy();
				end;
			end);
			task.delay(p4.expirationTime - l__Workspace__3:GetServerTimeNow(), function()
				local l__cooldownbarMaid__32 = p2.cooldownbarMaid;
				if l__cooldownbarMaid__32 ~= nil then
					l__cooldownbarMaid__32:DoCleaning();
				end;
			end);
		end;
	end);
	l__default__4.Client:OnEvent("RemoteName", function(p5)
		local v33 = l__Players__12:GetPlayerFromCharacter(p5.attacker);
		if v33 == nil then
			return nil;
		end;
		local l__hand__34 = l__InventoryUtil__13.getInventory(v33).hand;
		if l__hand__34 == nil or l__hand__34.itemType ~= l__ItemType__14.PLAYER_VACUUM then
			return nil;
		end;
		if p5.action == "Start" then
			p2:cleanVacuumingEffect(v33);
			p2:createVacuumingEffect(v33, p5.attacker, p5.victim);
			return;
		end;
		if p5.action == "Stop" then
			p2:cleanVacuumingEffect(v33);
		end;
	end);
end;
function v6.isRelevantItem(p6, p7)
	return p7.itemType == l__ItemType__14.PLAYER_VACUUM;
end;
local u16 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ActionButton__17 = v2.ActionButton;
local u18 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__GameAnimationUtil__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v6.onEnable(p8, p9, p10)
	p8.maid = u1.new();
	local v35 = l__EntityUtil__5:getLocalPlayerEntity();
	if v35 ~= nil then
		v35 = v35:getInstance();
	end;
	if v35 then
		p8.maid:GiveTask(v35:GetAttributeChangedSignal("PlayerStoredInVacuum"):Connect(function()
			if v35:GetAttribute("PlayerStoredInVacuum") ~= true then
				for v36 in pairs(p8.activeProximityPrompts) do
					v36.Enabled = true;
				end;
				if p8.uiMaid then
					p8.uiMaid:DoCleaning();
					p8.uiMaid = nil;
				end;
				return;
			end;
			for v37 in pairs(p8.activeProximityPrompts) do
				v37.Enabled = false;
			end;
			p8.uiMaid = l__Flamework__10.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u16.createElement(l__ActionButton__17, {
				actionName = "vacuum-release", 
				onActivated = function()
					l__default__4.Client:Get("RemoteName"):SendToServer({
						action = "Release"
					});
				end, 
				interactionKey = Enum.KeyCode.X, 
				gamepadInteractionKey = Enum.KeyCode.ButtonB, 
				text = "Release Player Early", 
				priority = 50
			}));
		end));
	end;
	local v38, v39, v40 = ipairs(l__EntityUtil__5:getAliveEntityInstances());
	while true do
		v38(v39, v40);
		if not v38 then
			break;
		end;
		v40 = v38;
		if v39:GetAttribute("Team") ~= l__Players__12.LocalPlayer:GetAttribute("Team") and v39.PrimaryPart then
			local v41 = {
				Name = "VacuumProximityPrompt", 
				ActionText = "Vacuum", 
				Enabled = true, 
				ObjectText = v39.Name, 
				KeyboardKeyCode = l__Theme__19.promptKeyboardKey, 
				HoldDuration = 1.5, 
				MaxActivationDistance = 16
			};
			local u22 = u1.new();
			function v41.PromptButtonHoldBegan()
				local v42 = l__GameAnimationUtil__20.playAnimation(l__Players__12.LocalPlayer, l__AnimationType__21.PLAYER_VACUUM_SUCK, {
					looped = true
				});
				if v42 then
					u22:GiveTask(function()
						return v42:Stop();
					end);
				end;
				l__default__4.Client:Get("RemoteName"):SendToServer({
					action = "BeginCharging", 
					entityInstance = v39
				});
			end;
			function v41.PromptButtonHoldEnded()
				u22:DoCleaning();
				l__default__4.Client:Get("RemoteName"):SendToServer({
					action = "StopCharging", 
					entityInstance = v39
				});
			end;
			function v41.Triggered()
				l__default__4.Client:Get("RemoteName"):SendToServer({
					action = "Suck", 
					entityInstance = v39
				});
			end;
			v41.RequiresLineOfSight = false;
			v41.Parent = v39.PrimaryPart;
			p8.activeProximityPrompts[u18("ProximityPrompt", v41)] = true;
		end;	
	end;
end;
function v6.onDisable(p11)
	p11.maid:DoCleaning();
	local l__uiMaid__43 = p11.uiMaid;
	if l__uiMaid__43 ~= nil then
		l__uiMaid__43:DoCleaning();
	end;
	for v44 in pairs(p11.activeProximityPrompts) do
		v44:Destroy();
	end;
end;
function v6.cleanVacuumingEffect(p12, p13)
	local v45 = p12.activeVacuumingEffects[p13];
	if v45 then
		p12.activeVacuumingEffects[p13] = nil;
		v45.beam:Destroy();
		v45.sound:Destroy();
		local l__shakeMaid__46 = v45.shakeMaid;
		if l__shakeMaid__46 ~= nil then
			l__shakeMaid__46:DoCleaning();
		end;
	end;
end;
local l__ReplicatedStorage__23 = v4.ReplicatedStorage;
function v6.createVacuumingEffect(p14, p15, p16, p17)
	local l__hand__47 = l__InventoryUtil__13.getInventory(p15).hand;
	if l__hand__47 == nil then
		return nil;
	end;
	local v48 = p15 == l__Players__12.LocalPlayer;
	local v49 = {};
	if v48 then
		local v50 = nil;
	else
		v50 = p16:GetPrimaryPartCFrame().Position;
	end;
	v49.position = v50;
	if v48 then
		local v51 = nil;
	else
		v51 = p16.PrimaryPart;
	end;
	v49.parent = v51;
	local v52 = l__SoundManager__6:playSound(l__GameSound__7.GHOST_VACUUM_SUCKING_LOOP, v49);
	if v52 == nil then
		return nil;
	end;
	local v53 = nil;
	if v48 == true then
		local v54 = p17:GetPrimaryPartCFrame();
		v53 = l__KnitClient__8.Controllers.ScreenShakeController:shake(v54.Position, v54 * Vector3.new(-0.25, 0, -1) - v54.Position, {
			magnitude = 0.2, 
			duration = 1.5, 
			cycles = 40
		});
	end;
	local v55 = l__ReplicatedStorage__23.Assets.Effects.VacuumBeam:Clone();
	v55.Name = "PlayerVacuumBeam";
	local v56 = l__hand__47.tool:FindFirstChild("Handle");
	if v56 ~= nil then
		v56 = v56:FindFirstChild("BeamAttachment");
	end;
	v55.Attachment0 = v56;
	v55.Attachment1 = p17.HumanoidRootPart.RootRigAttachment;
	v55.Parent = p16;
	p14.activeVacuumingEffects[p15] = {
		startTime = l__Workspace__3:GetServerTimeNow(), 
		beam = v55, 
		sound = v52, 
		shakeMaid = v53
	};
end;
local v57 = v3.KnitClient.CreateController(v6.new());
return nil;
