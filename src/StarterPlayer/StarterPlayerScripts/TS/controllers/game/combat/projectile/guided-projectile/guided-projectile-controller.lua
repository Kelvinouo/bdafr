-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
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
			local v14 = v9.fov;
			if v14 == nil then
				v14 = 85;
			end;
			l__CurrentCamera__9.FieldOfView = v14;
			l__CurrentCamera__9.CFrame = CFrame.new(v8.Position) * v13 * CFrame.Angles(0, v11.cameraX, 0) * CFrame.Angles(v11.cameraY, 0, 0) * CFrame.new(v9.cameraOffset or Vector3.new(0, 2, 5));
			if p2.thumbstickPosition then
				local v15 = Vector2.new(p2.thumbstickPosition.X, -p2.thumbstickPosition.Y) * 8;
			else
				v15 = l__UserInputService__7:GetMouseDelta();
			end;
			p2.angleX = p2.angleX - v15.X * 0.004;
			local v16 = v9.yAngleLimit;
			if v16 ~= nil then
				v16 = v16.lower;
			end;
			local v17 = v16;
			if v17 == nil then
				v17 = -0.8;
			end;
			local v18 = v9.yAngleLimit;
			if v18 ~= nil then
				v18 = v18.upper;
			end;
			local v19 = v18;
			if v19 == nil then
				v19 = 0.8;
			end;
			p2.angleY = math.clamp(p2.angleY - v15.Y * 0.004, v17, v19);
			local v20 = {
				frequency = 4, 
				dampingRatio = 0.85
			};
			local v21 = u3.Spring.new(v11.cameraX, v20);
			local v22 = u3.Spring.new(v11.cameraY, v20);
			if v9.modelSpringSettings then
				if v9.modelSpringSettings == "Instant" then
					v21 = u3.Instant.new(v11.cameraX);
					v22 = u3.Instant.new(v11.cameraY);
				else
					v21 = u3.Spring.new(v11.cameraX, v9.modelSpringSettings);
					v22 = u3.Spring.new(v11.cameraY, v9.modelSpringSettings);
				end;
			end;
			p2.directionMotor:setGoal({
				cameraX = u3.Spring.new(p2.angleX, v20), 
				cameraY = u3.Spring.new(p2.angleY, v20), 
				modelX = v21, 
				modelY = v22
			});
		end;
	end);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		local v23 = p3.position;
		if p2.currentlyGuidingProjectile ~= nil and p2.currentlyGuidingProjectile.model == p3.model then
			v23 = p2.currentlyGuidingProjectile.model:GetPrimaryPartCFrame().Position;
			p2:destroyGuidedProjectile();
			l__CurrentCamera__9.CameraType = Enum.CameraType.Scriptable;
			local v24 = l__GuidedProjectileMeta__6[p2.currentlyGuidingProjectile.type].observeExplosionTime;
			if v24 == nil then
				v24 = 2;
			end;
			task.delay(v24, function()
				l__CurrentCamera__9.CameraType = Enum.CameraType.Custom;
			end);
		end;
		l__ClientSyncEvents__8.GuidedProjectileDetonated:fire(p3.type, v23);
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
	local v25 = l__GuidedProjectileMeta__6[p7];
	local v26 = u10.new();
	if not v25.dontShowCooldown then
		v26:GiveTask(l__Flamework__11.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__12.GUIDED_PROJECTILE));
	end;
	l__Flamework__11.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__12.GUIDED_PROJECTILE, p9 - l__Workspace__4:GetServerTimeNow(), {
		cooldownBar = {
			color = v25.barColor or Color3.fromRGB(255, 176, 31)
		}
	});
	v26:GiveTask(function()
		l__Flamework__11.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):removeCooldown(l__CooldownId__12.GUIDED_PROJECTILE);
	end);
	v26:GiveTask(l__KnitClient__13.Controllers.SprintController:getMovementStatusModifier():addModifier({
		constantSpeedMultiplier = 0, 
		blockSprint = true
	}));
	l__UserInputService__7.MouseBehavior = Enum.MouseBehavior.LockCenter;
	l__UserInputService__7.MouseIconEnabled = false;
	v26:GiveTask(function()
		l__UserInputService__7.MouseBehavior = Enum.MouseBehavior.Default;
		l__UserInputService__7.MouseIconEnabled = true;
		task.delay(0.1, function()
			l__UserInputService__7.MouseBehavior = Enum.MouseBehavior.Default;
		end);
	end);
	local l__CurrentCamera__27 = l__Workspace__4.CurrentCamera;
	local l__FieldOfView__15 = l__CurrentCamera__27.FieldOfView;
	v26:GiveTask(function()
		l__CurrentCamera__27.FieldOfView = l__FieldOfView__15;
	end);
	l__Workspace__4.CurrentCamera.CameraType = Enum.CameraType.Scriptable;
	v26:GiveTask(function()
		l__Workspace__4.CurrentCamera.CameraType = Enum.CameraType.Custom;
	end);
	v26:GiveTask(function()
		if p6.currentlyGuidingProjectile then
			l__ClientSyncEvents__8.GuidedProjectileRemoved:fire(p6.currentlyGuidingProjectile.type, p6.currentlyGuidingProjectile.model);
		end;
	end);
	local u16 = l__KnitClient__14.Controllers.ViewmodelController:addDisabler();
	v26:GiveTask(function()
		l__KnitClient__14.Controllers.ViewmodelController:removeDisabler(u16);
	end);
	l__ClientSyncEvents__8.GuidedProjectileEnabling:fire(p7, p8);
	return v26;
end;
local l__getItemMeta__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local u18 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__default__19 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
v5.launch = v1.async(function(p10, p11)
	local v28 = v1.await(p10.fireGuidedProjectile:CallServerAsync(p11));
	if not v28 then
		l__default__19.Warn("Server rejected request to launch guided projectile");
		return;
	end;
	local l__guidedProjectile__29 = l__getItemMeta__17(p11).guidedProjectileSource.guidedProjectile;
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
			antiGravity = u18("BodyForce", {
				Force = Vector3.new(0, l__PrimaryPart__33.AssemblyMass * l__Workspace__4.Gravity, 0), 
				Parent = l__PrimaryPart__33, 
				Name = "AntiGravity"
			})
		}
	};
	local v37 = l__model__30:GetDescendants();
	local function v38(p14)
		return p14:IsA("Sound");
	end;
	local v39 = {};
	local v40 = 0;
	for v41, v42 in ipairs(v37) do
		if v38(v42, v41 - 1, v37) == true then
			v40 = v40 + 1;
			v39[v40] = v42;
		end;
	end;
	v36.sounds = v39;
	p10.currentlyGuidingProjectile = v36;
end);
function v5.handleConsoleInput(p15, p16)
	if not (p16.Position.Magnitude > 0.1) then
		p15.thumbstickPosition = nil;
		return;
	end;
	p15.thumbstickPosition = p16.Position;
end;
function v5.getCurrentGuidedProjectile(p17)
	if not p17.currentlyGuidingProjectile then
		return nil;
	end;
	return {
		model = p17.currentlyGuidingProjectile.model, 
		type = p17.currentlyGuidingProjectile.type, 
		forces = p17.currentlyGuidingProjectile.forces, 
		sounds = p17.currentlyGuidingProjectile.sounds, 
		enabled = p17.currentlyGuidingProjectile.enabled, 
		disabling = p17.currentlyGuidingProjectile.disabling
	};
end;
function v5.enableGuidedProjectile(p18)
	if p18.currentlyGuidingProjectile and not p18.currentlyGuidingProjectile.disabling then
		p18.currentlyGuidingProjectile.maid = p18:setupGuidedProjectileMaid(p18.currentlyGuidingProjectile.type, p18.currentlyGuidingProjectile.model, p18.currentlyGuidingProjectile.explodeTime);
		p18.currentlyGuidingProjectile.enabled = true;
		p18.currentlyGuidingProjectile.forces.antiGravity.Force = Vector3.new(0, l__Workspace__4.Gravity * p18.currentlyGuidingProjectile.model.PrimaryPart.AssemblyMass, 0);
	end;
end;
function v5.disableGuidedProjectile(p19, p20)
	if p19.currentlyGuidingProjectile and not p19.currentlyGuidingProjectile.disabling then
		p19.currentlyGuidingProjectile.disabling = true;
		l__ClientSyncEvents__8.GuidedProjectileDisabling:fire(p19.currentlyGuidingProjectile.type, p19.currentlyGuidingProjectile.model);
		local v43 = p20;
		if v43 == nil then
			v43 = 0.1;
		end;
		task.delay(v43, function()
			if p19.currentlyGuidingProjectile then
				p19.currentlyGuidingProjectile.disabling = false;
				p19.currentlyGuidingProjectile.maid:DoCleaning();
				p19.currentlyGuidingProjectile.enabled = false;
				p19.currentlyGuidingProjectile.forces.antiGravity.Force = Vector3.new(0, 0, 0);
			end;
		end);
	end;
end;
function v5.destroyGuidedProjectile(p21)
	if p21.currentlyGuidingProjectile then
		p21.currentlyGuidingProjectile.maid:DoCleaning();
		if p21.currentlyGuidingProjectile.model then
			p21.currentlyGuidingProjectile.model:Destroy();
		end;
		p21.currentlyGuidingProjectile = nil;
	end;
end;
u1 = l__KnitClient__14.CreateController;
u1 = u1(v5.new());
return nil;
