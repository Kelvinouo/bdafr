-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "GuidedProjectileController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "flipper").src);
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "GuidedProjectileController";
	p1.fireGuidedProjectile = l__default__2.Client:Get("RemoteName");
	p1.angleX = 0;
	p1.angleY = 0;
	p1.directionMotor = u3.GroupMotor.new({
		cameraX = 0, 
		cameraY = 0, 
		modelX = 0, 
		modelY = 0
	});
end;
local l__Workspace__4 = v3.Workspace;
local l__RunService__5 = v3.RunService;
local l__GuidedProjectileMeta__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "guided-projectile", "guided-projectile-meta").GuidedProjectileMeta;
local l__UserInputService__7 = v3.UserInputService;
local l__ClientSyncEvents__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	local l__CurrentCamera__9 = l__Workspace__4.CurrentCamera;
	l__RunService__5.RenderStepped:Connect(function()
		if p2.currentlyGuidingProjectile then
			if p2.currentlyGuidingProjectile.enabled == false then
				return nil;
			end;
			local l__model__7 = p2.currentlyGuidingProjectile.model;
			local v8 = l__model__7:GetPrimaryPartCFrame();
			local v9 = l__GuidedProjectileMeta__6[p2.currentlyGuidingProjectile.type];
			if p2.currentlyGuidingProjectile.disabling ~= true then
				p2.currentlyGuidingProjectile.forces.antiGravity.Force = Vector3.new(0, l__model__7.PrimaryPart.AssemblyMass * l__Workspace__4.Gravity, 0);
				l__model__7.PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0);
				if v9.doNotSetVelocity ~= true then
					local v10 = v9.speed;
					if v10 == nil then
						v10 = 45;
					end;
					l__model__7.PrimaryPart.AssemblyLinearVelocity = v8.LookVector * v10;
				end;
			end;
			local v11 = p2.directionMotor:getValue();
			local v12 = v9.flightRotation or Vector3.new();
			local v13 = CFrame.Angles(v12.X, v12.Y, v12.Z);
			l__model__7:SetPrimaryPartCFrame(CFrame.new(v8.Position) * v13 * CFrame.Angles(0, v11.modelX, 0) * CFrame.Angles(v11.modelY, 0, 0));
			l__CurrentCamera__9.CFrame = CFrame.new(v8.Position) * v13 * CFrame.Angles(0, v11.cameraX, 0) * CFrame.Angles(v11.cameraY, 0, 0) * CFrame.new(v9.cameraOffset or Vector3.new(0, 2, 5));
			if p2.thumbstickPosition then
				local v14 = Vector2.new(p2.thumbstickPosition.X, -p2.thumbstickPosition.Y) * 8;
			else
				v14 = l__UserInputService__7:GetMouseDelta();
			end;
			p2.angleX = p2.angleX - v14.X * 0.004;
			local v15 = v9.yAngleLimit;
			if v15 ~= nil then
				v15 = v15.lower;
			end;
			local v16 = v15;
			if v16 == nil then
				v16 = -0.8;
			end;
			local v17 = v9.yAngleLimit;
			if v17 ~= nil then
				v17 = v17.upper;
			end;
			local v18 = v17;
			if v18 == nil then
				v18 = 0.8;
			end;
			p2.angleY = math.clamp(p2.angleY - v14.Y * 0.004, v16, v18);
			local v19 = {
				frequency = 4, 
				dampingRatio = 0.85
			};
			local v20 = u3.Spring.new(v11.cameraX, v19);
			local v21 = u3.Spring.new(v11.cameraY, v19);
			if v9.modelSpringSettings then
				if v9.modelSpringSettings == "Instant" then
					v20 = u3.Instant.new(v11.cameraX);
					v21 = u3.Instant.new(v11.cameraY);
				else
					v20 = u3.Spring.new(v11.cameraX, v9.modelSpringSettings);
					v21 = u3.Spring.new(v11.cameraY, v9.modelSpringSettings);
				end;
			end;
			p2.directionMotor:setGoal({
				cameraX = u3.Spring.new(p2.angleX, v19), 
				cameraY = u3.Spring.new(p2.angleY, v19), 
				modelX = v20, 
				modelY = v21
			});
		end;
	end);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		local v22 = p3.position;
		if p2.currentlyGuidingProjectile ~= nil and p2.currentlyGuidingProjectile.model == p3.model then
			v22 = p2.currentlyGuidingProjectile.model:GetPrimaryPartCFrame().Position;
			p2:destroyGuidedProjectile();
			l__CurrentCamera__9.CameraType = Enum.CameraType.Scriptable;
			local v23 = l__GuidedProjectileMeta__6[p2.currentlyGuidingProjectile.type].observeExplosionTime;
			if v23 == nil then
				v23 = 2;
			end;
			task.delay(v23, function()
				l__CurrentCamera__9.CameraType = Enum.CameraType.Custom;
			end);
		end;
		l__ClientSyncEvents__8.GuidedProjectileDetonated:fire(p3.type, v22);
	end);
	l__UserInputService__7.InputChanged:Connect(function(p4)
		if p4.UserInputType == Enum.UserInputType.Gamepad1 and p4.KeyCode == Enum.KeyCode.Thumbstick2 then
			p2:handleConsoleInput(p4);
		end;
	end);
	l__UserInputService__7.InputEnded:Connect(function(p5)
		if p5.UserInputType == Enum.UserInputType.Gamepad1 and p5.KeyCode == Enum.KeyCode.Thumbstick2 then
			p2.thumbstickPosition = nil;
		end;
	end);
end;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Flamework__11 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__KnitClient__13 = v2.KnitClient;
local l__KnitClient__14 = v2.KnitClient;
function v5.setupGuidedProjectileMaid(p6, p7, p8, p9)
	local v24 = l__GuidedProjectileMeta__6[p7];
	local v25 = u10.new();
	if not v24.dontShowCooldown then
		v25:GiveTask(l__Flamework__11.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__12.GUIDED_PROJECTILE));
	end;
	l__Flamework__11.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__12.GUIDED_PROJECTILE, p9 - l__Workspace__4:GetServerTimeNow(), {
		cooldownBar = {
			color = v24.barColor or Color3.fromRGB(255, 176, 31)
		}
	});
	v25:GiveTask(function()
		l__Flamework__11.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):removeCooldown(l__CooldownId__12.GUIDED_PROJECTILE);
	end);
	v25:GiveTask(l__KnitClient__13.Controllers.SprintController:getMovementStatusModifier():addModifier({
		constantSpeedMultiplier = 0, 
		blockSprint = true
	}));
	l__UserInputService__7.MouseBehavior = Enum.MouseBehavior.LockCenter;
	l__UserInputService__7.MouseIconEnabled = false;
	v25:GiveTask(function()
		l__UserInputService__7.MouseBehavior = Enum.MouseBehavior.Default;
		l__UserInputService__7.MouseIconEnabled = true;
		task.delay(0.1, function()
			l__UserInputService__7.MouseBehavior = Enum.MouseBehavior.Default;
		end);
	end);
	local v26 = {};
	local v27 = v24.fov;
	if v27 == nil then
		v27 = 85;
	end;
	v26.fovMultiplier = v27 / l__KnitClient__14.Controllers.FovController:getBaseFOV();
	v25:GiveTask(l__KnitClient__14.Controllers.FovController:addModifier(v26));
	l__Workspace__4.CurrentCamera.CameraType = Enum.CameraType.Scriptable;
	v25:GiveTask(function()
		l__Workspace__4.CurrentCamera.CameraType = Enum.CameraType.Custom;
	end);
	v25:GiveTask(function()
		if p6.currentlyGuidingProjectile then
			l__ClientSyncEvents__8.GuidedProjectileRemoved:fire(p6.currentlyGuidingProjectile.type, p6.currentlyGuidingProjectile.model);
		end;
	end);
	local u15 = l__KnitClient__14.Controllers.ViewmodelController:addDisabler();
	v25:GiveTask(function()
		l__KnitClient__14.Controllers.ViewmodelController:removeDisabler(u15);
	end);
	l__ClientSyncEvents__8.GuidedProjectileEnabling:fire(p7, p8);
	return v25;
end;
local l__getItemMeta__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local u17 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__default__18 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
v5.launch = v1.async(function(p10, p11)
	local v28 = v1.await(p10.fireGuidedProjectile:CallServerAsync(p11));
	if not v28 then
		l__default__18.Warn("Server rejected request to launch guided projectile");
		return;
	end;
	local l__guidedProjectile__29 = l__getItemMeta__16(p11).guidedProjectileSource.guidedProjectile;
	local l__model__30 = v28.model;
	local l__explodeTime__31 = v28.explodeTime;
	l__model__30.AncestryChanged:Connect(function(p12, p13)
		local v32 = p13;
		if v32 ~= nil then
			v32 = v32:IsDescendantOf(l__Workspace__4);
		end;
		if not v32 then
			p10:destroyGuidedProjectile();
		end;
	end);
	if not l__model__30.PrimaryPart then
		l__model__30:GetPropertyChangedSignal("PrimaryPart"):Wait();
	end;
	local l__PrimaryPart__33 = l__model__30.PrimaryPart;
	local v34 = l__Workspace__4.CurrentCamera;
	if v34 ~= nil then
		v34 = v34.CFrame.LookVector;
	end;
	local v35 = v34;
	if v35 == nil then
		v35 = Vector3.new(0, 1, 0);
	end;
	p10.angleX = math.atan2(v35.Z, -v35.X) + math.pi * 0.5;
	p10.angleY = 0;
	local v36 = {
		enabled = true, 
		disabling = false, 
		maid = p10:setupGuidedProjectileMaid(l__guidedProjectile__29, l__model__30, l__explodeTime__31), 
		type = l__guidedProjectile__29, 
		model = l__model__30, 
		explodeTime = l__explodeTime__31, 
		forces = {
			antiGravity = u17("BodyForce", {
				Force = Vector3.new(0, l__PrimaryPart__33.AssemblyMass * l__Workspace__4.Gravity, 0), 
				Parent = l__PrimaryPart__33, 
				Name = "AntiGravity"
			})
		}
	};
	local v37 = {};
	local v38 = 0;
	for v39, v40 in ipairs((l__model__30:GetDescendants())) do
		if v40:IsA("Sound") == true then
			v38 = v38 + 1;
			v37[v38] = v40;
		end;
	end;
	v36.sounds = v37;
	p10.currentlyGuidingProjectile = v36;
end);
function v5.handleConsoleInput(p14, p15)
	if not (p15.Position.Magnitude > 0.1) then
		p14.thumbstickPosition = nil;
		return;
	end;
	p14.thumbstickPosition = p15.Position;
end;
function v5.getCurrentGuidedProjectile(p16)
	if not p16.currentlyGuidingProjectile then
		return nil;
	end;
	return {
		model = p16.currentlyGuidingProjectile.model, 
		type = p16.currentlyGuidingProjectile.type, 
		forces = p16.currentlyGuidingProjectile.forces, 
		sounds = p16.currentlyGuidingProjectile.sounds, 
		enabled = p16.currentlyGuidingProjectile.enabled, 
		disabling = p16.currentlyGuidingProjectile.disabling
	};
end;
function v5.enableGuidedProjectile(p17)
	if p17.currentlyGuidingProjectile and not p17.currentlyGuidingProjectile.disabling then
		p17.currentlyGuidingProjectile.maid = p17:setupGuidedProjectileMaid(p17.currentlyGuidingProjectile.type, p17.currentlyGuidingProjectile.model, p17.currentlyGuidingProjectile.explodeTime);
		p17.currentlyGuidingProjectile.enabled = true;
		p17.currentlyGuidingProjectile.forces.antiGravity.Force = Vector3.new(0, l__Workspace__4.Gravity * p17.currentlyGuidingProjectile.model.PrimaryPart.AssemblyMass, 0);
	end;
end;
function v5.disableGuidedProjectile(p18, p19)
	if p18.currentlyGuidingProjectile and not p18.currentlyGuidingProjectile.disabling then
		p18.currentlyGuidingProjectile.disabling = true;
		l__ClientSyncEvents__8.GuidedProjectileDisabling:fire(p18.currentlyGuidingProjectile.type, p18.currentlyGuidingProjectile.model);
		local v41 = p19;
		if v41 == nil then
			v41 = 0.1;
		end;
		task.delay(v41, function()
			if p18.currentlyGuidingProjectile then
				p18.currentlyGuidingProjectile.disabling = false;
				p18.currentlyGuidingProjectile.maid:DoCleaning();
				p18.currentlyGuidingProjectile.enabled = false;
				p18.currentlyGuidingProjectile.forces.antiGravity.Force = Vector3.new(0, 0, 0);
			end;
		end);
	end;
end;
function v5.destroyGuidedProjectile(p20)
	if p20.currentlyGuidingProjectile then
		p20.currentlyGuidingProjectile.maid:DoCleaning();
		if p20.currentlyGuidingProjectile.model then
			p20.currentlyGuidingProjectile.model:Destroy();
		end;
		p20.currentlyGuidingProjectile = nil;
	end;
end;
u1 = l__KnitClient__14.CreateController;
u1 = u1(v5.new());
return nil;
