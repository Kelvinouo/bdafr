-- Script Hash: 8677ad748d9449c5d1297a30d8030c8aac04c44cd57c21ae855315699478255e5da2911cbf0a5bc8d967b78e24daa3e3
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "CameraTurretCameraController";
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
local l__Maid__5 = v3.Maid;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "CameraTurretCameraController";
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
	p1.maid = l__Maid__5.new();
end;
local l__Workspace__6 = v4.Workspace;
local l__ClientStore__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
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
local l__CollectionService__12 = v4.CollectionService;
local l__isEngineerTurretBlock__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret-types").isEngineerTurretBlock;
local l__KnitClient__14 = v3.KnitClient;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
	l__ClientStore__7.changed:connect(function(p3, p4)
		if p3.Kit.engineerSelectedTurret ~= p4.Kit.engineerSelectedTurret then
			p2.maid:DoCleaning();
			local l__engineerSelectedTurret__8 = p3.Kit.engineerSelectedTurret;
			local v9 = {};
			if l__engineerSelectedTurret__8 then
				local v10 = l__BlockEngine__8:getBlockPosition(l__engineerSelectedTurret__8.Position);
			else
				v10 = nil;
			end;
			v9.turretBlockPos = v10;
			p2.switchTurret:SendToServer(v9);
			if l__engineerSelectedTurret__8 == nil then
				return nil;
			end;
			local v11 = l__engineerSelectedTurret__8:GetAttribute("AngleX");
			local v12 = l__engineerSelectedTurret__8:GetAttribute("AngleY");
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
		end;
	end);
	local l__CurrentCamera__15 = l__Workspace__6.CurrentCamera;
	l__RunService__9.RenderStepped:Connect(function()
		local l__engineerSelectedTurret__15 = l__ClientStore__7:getState().Kit.engineerSelectedTurret;
		if l__engineerSelectedTurret__15 == nil then
			return nil;
		end;
		if not l__UserInputService__10.TouchEnabled then
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
		l__CurrentCamera__15.CFrame = l__engineerSelectedTurret__15.Head.CameraOrigin.WorldCFrame;
	end);
	l__RunService__9.Heartbeat:Connect(function()
		local l__engineerSelectedTurret__17 = l__ClientStore__7:getState().Kit.engineerSelectedTurret;
		if l__engineerSelectedTurret__17 == nil then
			return nil;
		end;
		if p2.nextSendAim < time() then
			p2.nextSendAim = time() + u11.AimSendRate;
			p2.aimTurret:SendToServer({
				turretBlockPos = l__BlockEngine__8:getBlockPosition(l__engineerSelectedTurret__17.Position), 
				angleX = math.deg(p2.angleX % (math.pi * 2)), 
				angleY = math.deg(p2.angleY)
			});
		end;
	end);
	for v18, v19 in ipairs(l__CollectionService__12:GetTagged("engineer-turret")) do
		if l__isEngineerTurretBlock__13(v19) then
			p2:updateAngleOfTurret(v19);
			p2:toggleLightsOnTurret(v19);
			p2:updateTeamLightOfTurret(v19);
		end;
	end;
	l__CollectionService__12:GetInstanceAddedSignal("engineer-turret"):Connect(function(p5)
		if l__isEngineerTurretBlock__13(p5) then
			local v20 = l__Maid__5.new();
			local function v21()
				if l__ClientStore__7:getState().Kit.engineerSelectedTurret ~= p5 then
					p2:updateAngleOfTurret(p5);
				end;
			end;
			v20:GiveTask(p5:GetAttributeChangedSignal("AngleX"):Connect(v21));
			v20:GiveTask(p5:GetAttributeChangedSignal("AngleY"):Connect(v21));
			v20:GiveTask(p5:GetAttributeChangedSignal("IsActive"):Connect(function()
				p2:toggleLightsOnTurret(p5);
			end));
			p2:updateTeamLightOfTurret(p5);
		end;
		l__UserInputService__10.InputChanged:Connect(function(p6)
			if p6.UserInputType == Enum.UserInputType.Gamepad1 and p6.KeyCode == Enum.KeyCode.Thumbstick1 then
				p2:handleConsoleInput(p6);
			end;
		end);
		l__UserInputService__10.InputEnded:Connect(function(p7)
			if p7.UserInputType == Enum.UserInputType.Gamepad1 and p7.KeyCode == Enum.KeyCode.Thumbstick1 then
				p2.thumbstickPosition = nil;
			end;
		end);
	end);
	l__CollectionService__12:GetInstanceRemovedSignal("engineer-turret"):Connect(function(p8)
		if l__isEngineerTurretBlock__13(p8) then
			local v22 = p2.turretToMaid[p8];
			if v22 ~= nil then
				v22:DoCleaning();
			end;
			p2.turretToMaid[p8] = nil;
			local v23 = l__KnitClient__14.Controllers.CameraTurretController:getNextTurret();
			if p8 == l__ClientStore__7:getState().Kit.engineerSelectedTurret then
				l__ClientStore__7:dispatch({
					type = "KitEngineerSetTurret", 
					selectedTurret = v23
				});
			end;
		end;
	end);
	p2.angleMotor:onStep(function(p9)
		local l__engineerSelectedTurret__24 = l__ClientStore__7:getState().Kit.engineerSelectedTurret;
		if l__engineerSelectedTurret__24 == nil then
			return nil;
		end;
		l__engineerSelectedTurret__24.Rotate.CFrame = CFrame.new(l__engineerSelectedTurret__24.Rotate.Position) * CFrame.Angles(0, p9.x, 0) * CFrame.Angles(p9.y, 0, 0);
	end);
end;
function u1.handleConsoleInput(p10, p11)
	if not (p11.Position.Magnitude > 0.1) then
		p10.thumbstickPosition = nil;
		return;
	end;
	p10.thumbstickPosition = p11.Position;
end;
local l__TweenService__16 = v4.TweenService;
function u1.updateAngleOfTurret(p12, p13)
	local v25 = nil;
	local v26 = p13:GetAttribute("AngleX");
	v25 = p13:GetAttribute("AngleY");
	if v26 == nil or v25 == nil then
		return nil;
	end;
	l__TweenService__16:Create(p13.Rotate, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
		CFrame = CFrame.new(p13.Rotate.Position) * CFrame.Angles(0, math.rad(v26), 0) * CFrame.Angles(math.rad(v25), 0, 0)
	}):Play();
end;
local l__Players__17 = v4.Players;
u1.updateTeamLightOfTurret = v1.async(function(p14, p15)
	local l__TeamLight__27 = p15:WaitForChild("TeamLight", 1);
	if not l__TeamLight__27 then
		error("TeamLight could not be found");
	end;
	local v28 = l__Players__17:GetPlayerByUserId((p15:GetAttribute("PlacedByUserId")));
	if not v28 then
		error("Could not find player");
	end;
	local l__teams__29 = l__ClientStore__7:getState().Game.teams;
	local function v30(p16)
		local v31 = v28.Team;
		if v31 ~= nil then
			v31 = v31.Name;
		end;
		return p16.name == v31;
	end;
	local v32 = nil;
	for v33, v34 in ipairs(l__teams__29) do
		if v30(v34, v33 - 1, l__teams__29) == true then
			v32 = v34;
			break;
		end;
	end;
	if not v32 then
		error("Could not find player team");
	end;
	l__TeamLight__27.Color = v32.color;
end);
local l__SoundManager__18 = v2.SoundManager;
local l__GameSound__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function u1.toggleLightsOnTurret(p17, p18)
	local v35 = p18:GetAttribute("IsActive");
	if v35 == nil then
		l__SoundManager__18:playSound(l__GameSound__19.TURRET_OFF, {
			position = p18.Position
		});
		return nil;
	end;
	l__SoundManager__18:playSound(l__GameSound__19.TURRET_ON, {
		position = p18.Position
	});
	if v35 then
		local v36 = Color3.fromRGB(0, 255, 0);
	else
		v36 = Color3.fromRGB(255, 0, 0);
	end;
	if p18:FindFirstChild("Light1") then
		p18.Light1.Color = v36;
	end;
	if p18:FindFirstChild("Light2") then
		p18.Light2.Color = v36;
	end;
end;
u2 = v3.KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
