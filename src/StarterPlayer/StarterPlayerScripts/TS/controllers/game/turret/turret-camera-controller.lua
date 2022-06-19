-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "TurretCameraController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
local u1 = v6;
function u1.new(...)
	local v7 = setmetatable({}, u1);
	return v7:constructor(...) and v7;
end;
local u2 = l__KnitController__5;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "flipper").src);
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "TurretCameraController";
	p1.turretToMaid = {};
	p1.aimTurret = l__default__3.Client:Get("RemoteName");
	p1.nextSendAim = -1;
	p1.switchTurret = l__default__3.Client:Get("RemoteName");
	p1.angleX = 0;
	p1.angleY = 0;
	p1.angleMotor = u4.GroupMotor.new({
		x = 0, 
		y = 0
	});
	p1.maid = u5.new();
end;
local l__Workspace__6 = v4.Workspace;
local l__ClientStore__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__BlockEngine__8 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local l__RunService__9 = v4.RunService;
local l__UserInputService__10 = v4.UserInputService;
local u11 = v2.ConstantManager.registerConstants(script, {
	Sensitivity = 0.004, 
	ControllerDeltaMultiplier = 5, 
	AngleLowerLimitY = 0.8, 
	AngleUpperLimitY = 0.8, 
	DampingRatio = 0.75, 
	Frequency = 4, 
	AimSendRate = 0.2
});
local l__WatchCollectionTag__12 = v2.WatchCollectionTag;
local l__isEngineerTurretBlock__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-types").isEngineerTurretBlock;
local l__CollectionService__14 = v4.CollectionService;
local l__KnitClient__15 = v3.KnitClient;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
	l__ClientStore__7.changed:connect(function(p3, p4)
		if p3.Game.selectedTurret == p4.Game.selectedTurret then
			return nil;
		end;
		p2.maid:DoCleaning();
		local l__selectedTurret__8 = p3.Game.selectedTurret;
		local v9 = {};
		if l__selectedTurret__8 then
			local v10 = l__BlockEngine__8:getBlockPosition(l__selectedTurret__8.Position);
		else
			v10 = nil;
		end;
		v9.turretBlockPos = v10;
		p2.switchTurret:SendToServer(v9);
		if l__selectedTurret__8 == nil then
			return nil;
		end;
		local v11 = l__selectedTurret__8:GetAttribute("AngleX");
		local v12 = l__selectedTurret__8:GetAttribute("AngleY");
		if v11 ~= nil then
			local v13 = math.rad(v11);
		else
			v13 = 0;
		end;
		p2.angleX = v13;
		if v12 ~= nil then
			local v14 = math.rad(v12);
		else
			v14 = 0;
		end;
		p2.angleY = v14;
	end);
	local u16 = nil;
	local l__CurrentCamera__17 = l__Workspace__6.CurrentCamera;
	l__RunService__9.RenderStepped:Connect(function()
		local l__selectedTurret__15 = l__ClientStore__7:getState().Game.selectedTurret;
		if l__selectedTurret__15 == nil then
			if u16 then
				l__UserInputService__10.MouseBehavior = u16;
				u16 = nil;
			end;
			return nil;
		end;
		if not l__UserInputService__10.TouchEnabled then
			if l__UserInputService__10.MouseBehavior ~= Enum.MouseBehavior.LockCenter then
				u16 = l__UserInputService__10.MouseBehavior;
			end;
			l__UserInputService__10.MouseBehavior = Enum.MouseBehavior.LockCenter;
		end;
		if p2.thumbstickPosition then
			local v16 = Vector2.new(p2.thumbstickPosition.X, -p2.thumbstickPosition.Y) * u11.ControllerDeltaMultiplier;
		else
			v16 = l__UserInputService__10:GetMouseDelta();
		end;
		p2.angleX = p2.angleX - v16.X * u11.Sensitivity;
		p2.angleY = math.clamp(p2.angleY - v16.Y * u11.Sensitivity, -u11.AngleLowerLimitY, u11.AngleUpperLimitY);
		p2.angleMotor:setGoal({
			x = u4.Spring.new(p2.angleX, {
				dampingRatio = u11.DampingRatio, 
				frequency = u11.Frequency
			}), 
			y = u4.Spring.new(p2.angleY, {
				dampingRatio = u11.DampingRatio, 
				frequency = u11.Frequency
			})
		});
		l__CurrentCamera__17.CFrame = l__selectedTurret__15.Head.CameraOrigin.WorldCFrame;
	end);
	l__RunService__9.Heartbeat:Connect(function()
		local l__selectedTurret__17 = l__ClientStore__7:getState().Game.selectedTurret;
		if l__selectedTurret__17 == nil then
			return nil;
		end;
		if p2.nextSendAim < time() then
			p2.nextSendAim = time() + u11.AimSendRate;
			p2.aimTurret:SendToServer({
				turretBlockPos = l__BlockEngine__8:getBlockPosition(l__selectedTurret__17.Position), 
				angleX = math.deg(p2.angleX % (math.pi * 2)), 
				angleY = math.deg(p2.angleY)
			});
		end;
	end);
	l__WatchCollectionTag__12("Turret", function(p5)
		if not l__isEngineerTurretBlock__13(p5) then
			return nil;
		end;
		local v18 = u5.new();
		p2:updateAngleOfTurret(p5);
		p2:toggleLightsOnTurret(p5, false);
		local function v19()
			if l__ClientStore__7:getState().Game.selectedTurret ~= p5 then
				p2:updateAngleOfTurret(p5);
			end;
		end;
		v18:GiveTask(p5:GetAttributeChangedSignal("AngleX"):Connect(v19));
		v18:GiveTask(p5:GetAttributeChangedSignal("AngleY"):Connect(v19));
		v18:GiveTask(p5:GetAttributeChangedSignal("IsActive"):Connect(function()
			p2:toggleLightsOnTurret(p5);
		end));
		v18:GiveTask(p5.AncestryChanged:Connect(function()
			if not p5.Parent then
				v18:DoCleaning();
			end;
		end));
		v18:GiveTask(l__UserInputService__10.InputChanged:Connect(function(p6)
			if p6.UserInputType == Enum.UserInputType.Gamepad1 and p6.KeyCode == Enum.KeyCode.Thumbstick1 then
				p2:handleConsoleInput(p6);
			end;
		end));
		v18:GiveTask(l__UserInputService__10.InputEnded:Connect(function(p7)
			if p7.UserInputType == Enum.UserInputType.Gamepad1 and p7.KeyCode == Enum.KeyCode.Thumbstick1 then
				p2.thumbstickPosition = nil;
			end;
		end));
	end);
	l__CollectionService__14:GetInstanceRemovedSignal("Turret"):Connect(function(p8)
		if l__isEngineerTurretBlock__13(p8) then
			local v20 = p2.turretToMaid[p8];
			if v20 ~= nil then
				v20:DoCleaning();
			end;
			p2.turretToMaid[p8] = nil;
			local l__selectedTurret__21 = l__ClientStore__7:getState().Game.selectedTurret;
			if l__selectedTurret__21 and p8 == l__selectedTurret__21 then
				l__ClientStore__7:dispatch({
					type = "SetSpectatedTurret", 
					selectedTurret = l__KnitClient__15.Controllers.TurretController:getNextTurret(l__selectedTurret__21:GetAttribute("TurretId"))
				});
			end;
		end;
	end);
	p2.angleMotor:onStep(function(p9)
		local l__selectedTurret__22 = l__ClientStore__7:getState().Game.selectedTurret;
		if l__selectedTurret__22 == nil then
			return nil;
		end;
		l__selectedTurret__22.Rotate.CFrame = CFrame.new(l__selectedTurret__22.Rotate.Position) * CFrame.Angles(0, p9.x, 0) * CFrame.Angles(p9.y, 0, 0);
	end);
end;
function u1.handleConsoleInput(p10, p11)
	if not (p11.Position.Magnitude > 0.1) then
		p10.thumbstickPosition = nil;
		return;
	end;
	p10.thumbstickPosition = p11.Position;
end;
local l__TweenService__18 = v4.TweenService;
function u1.updateAngleOfTurret(p12, p13)
	local v23 = nil;
	local v24 = p13:GetAttribute("AngleX");
	v23 = p13:GetAttribute("AngleY");
	if v24 == nil or v23 == nil then
		return nil;
	end;
	l__TweenService__18:Create(p13.Rotate, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
		CFrame = CFrame.new(p13.Rotate.Position) * CFrame.Angles(0, math.rad(v24), 0) * CFrame.Angles(math.rad(v23), 0, 0)
	}):Play();
end;
local l__SoundManager__19 = v2.SoundManager;
local l__GameSound__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function u1.toggleLightsOnTurret(p14, p15, p16)
	if p16 == nil then
		p16 = true;
	end;
	if p15:GetAttribute("IsActive") ~= nil then
		if p16 then
			l__SoundManager__19:playSound(l__GameSound__20.TURRET_ON, {
				position = p15.Position
			});
		end;
		return;
	end;
	if p16 then
		l__SoundManager__19:playSound(l__GameSound__20.TURRET_OFF, {
			position = p15.Position
		});
	end;
	return nil;
end;
u2 = v3.KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
