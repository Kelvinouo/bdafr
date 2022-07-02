-- Decompiled with the Synapse X Luau decompiler.

local l__VRService__1 = game:GetService("VRService");
local l__UserInputService__2 = game:GetService("UserInputService");
local l__RunService__3 = game:GetService("RunService");
local l__PathfindingService__4 = game:GetService("PathfindingService");
local l__ContextActionService__5 = game:GetService("ContextActionService");
local l__StarterGui__6 = game:GetService("StarterGui");
local l__LocalPlayer__7 = game:GetService("Players").LocalPlayer;
local v8 = Vector3.new(0, 0, 0);
local v9 = Vector3.new(1, 0, 1);
local v10 = Instance.new("BindableEvent");
v10.Name = "MovementUpdate";
v10.Parent = script;
local u1 = nil;
coroutine.wrap(function()
	local l__PathDisplay__11 = script.Parent:WaitForChild("PathDisplay");
	if l__PathDisplay__11 then
		u1 = require(l__PathDisplay__11);
	end;
end)();
local v12 = require(script.Parent:WaitForChild("BaseCharacterController"));
local v13 = setmetatable({}, v12);
v13.__index = v13;
function v13.new(p1)
	local v14 = setmetatable(v12.new(), v13);
	v14.CONTROL_ACTION_PRIORITY = p1;
	v14.navigationRequestedConn = nil;
	v14.heartbeatConn = nil;
	v14.currentDestination = nil;
	v14.currentPath = nil;
	v14.currentPoints = nil;
	v14.currentPointIdx = 0;
	v14.expectedTimeToNextPoint = 0;
	v14.timeReachedLastPoint = tick();
	v14.moving = false;
	v14.isJumpBound = false;
	v14.moveLatch = false;
	v14.userCFrameEnabledConn = nil;
	return v14;
end;
function v13.SetLaserPointerMode(p2, p3)
	pcall(function()
		l__StarterGui__6:SetCore("VRLaserPointerMode", p3);
	end);
end;
function v13.GetLocalHumanoid(p4)
	local l__Character__15 = l__LocalPlayer__7.Character;
	if not l__Character__15 then
		return;
	end;
	for v16, v17 in pairs(l__Character__15:GetChildren()) do
		if v17:IsA("Humanoid") then
			return v17;
		end;
	end;
	return nil;
end;
function v13.HasBothHandControllers(p5)
	return l__VRService__1:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and l__VRService__1:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand);
end;
function v13.HasAnyHandControllers(p6)
	return l__VRService__1:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) or l__VRService__1:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand);
end;
function v13.IsMobileVR(p7)
	return l__UserInputService__2.TouchEnabled;
end;
function v13.HasGamepad(p8)
	return l__UserInputService__2.GamepadEnabled;
end;
function v13.ShouldUseNavigationLaser(p9)
	if p9:IsMobileVR() then
		return true;
	end;
	if p9:HasBothHandControllers() then
		return false;
	end;
	if p9:HasAnyHandControllers() then
		return true;
	end;
	return not p9:HasGamepad();
end;
function v13.StartFollowingPath(p10, p11)
	currentPath = p11;
	currentPoints = currentPath:GetPointCoordinates();
	currentPointIdx = 1;
	moving = true;
	timeReachedLastPoint = tick();
	local v18 = p10:GetLocalHumanoid();
	if v18 and v18.Torso and #currentPoints >= 1 then
		expectedTimeToNextPoint = (currentPoints[1] - v18.Torso.Position).magnitude / v18.WalkSpeed;
	end;
	v10:Fire("targetPoint", p10.currentDestination);
end;
function v13.GoToPoint(p12, p13)
	currentPath = true;
	currentPoints = { p13 };
	currentPointIdx = 1;
	moving = true;
	local v19 = p12:GetLocalHumanoid();
	timeReachedLastPoint = tick();
	expectedTimeToNextPoint = (v19.Torso.Position - p13).magnitude / v19.WalkSpeed;
	v10:Fire("targetPoint", p13);
end;
function v13.StopFollowingPath(p14)
	currentPath = nil;
	currentPoints = nil;
	currentPointIdx = 0;
	moving = false;
	p14.moveVector = v8;
end;
function v13.TryComputePath(p15, p16, p17)
	local v20 = nil;
	while not v20 and 0 < 5 do
		local v21 = l__PathfindingService__4:ComputeSmoothPathAsync(p16, p17, 200);
		if v21.Status == Enum.PathStatus.ClosestNoPath then
			return nil;
		end;
		if v21.Status == Enum.PathStatus.ClosestOutOfRange then
			return nil;
		end;
		if v21 and v21.Status == Enum.PathStatus.FailStartNotEmpty then
			p16 = p16 + (p17 - p16).unit;
			v21 = nil;
		end;
		if v20 and v20.Status == Enum.PathStatus.FailFinishNotEmpty then
			p17 = p17 + Vector3.new(0, 1, 0);
			v20 = nil;
		end;	
	end;
	return v20;
end;
function v13.OnNavigationRequest(p18, p19, p20)
	local l__Position__22 = p19.Position;
	local l__currentDestination__23 = p18.currentDestination;
	local l__x__24 = l__Position__22.x;
	local v25 = false;
	if l__x__24 == l__x__24 then
		v25 = false;
		if l__x__24 ~= (1 / 0) then
			v25 = l__x__24 ~= (-1 / 0);
		end;
	end;
	if v25 then
		local l__y__26 = l__Position__22.y;
		v25 = false;
		if l__y__26 == l__y__26 then
			v25 = false;
			if l__y__26 ~= (1 / 0) then
				v25 = l__y__26 ~= (-1 / 0);
			end;
		end;
		if v25 then
			local l__z__27 = l__Position__22.z;
			v25 = false;
			if l__z__27 == l__z__27 then
				v25 = false;
				if l__z__27 ~= (1 / 0) then
					v25 = l__z__27 ~= (-1 / 0);
				end;
			end;
		end;
	end;
	if not v25 then
		return;
	end;
	p18.currentDestination = l__Position__22;
	local v28 = p18:GetLocalHumanoid();
	if not v28 or not v28.Torso then
		return;
	end;
	local l__Position__29 = v28.Torso.Position;
	if (p18.currentDestination - l__Position__29).magnitude < 12 then
		p18:GoToPoint(p18.currentDestination);
		return;
	end;
	if not l__currentDestination__23 or (p18.currentDestination - l__currentDestination__23).magnitude > 4 then
		local v30 = p18:TryComputePath(l__Position__29, p18.currentDestination);
		if v30 then
			p18:StartFollowingPath(v30);
			if u1 then
				u1.setCurrentPoints(p18.currentPoints);
				u1.renderPath();
				return;
			end;
		else
			p18:StopFollowingPath();
			if u1 then
				u1.clearRenderedPath();
				return;
			end;
		end;
	else
		if moving then
			p18.currentPoints[#currentPoints] = p18.currentDestination;
			return;
		end;
		p18:GoToPoint(p18.currentDestination);
	end;
end;
function v13.OnJumpAction(p21, p22, p23, p24)
	if p23 == Enum.UserInputState.Begin then
		p21.isJumping = true;
	end;
	return Enum.ContextActionResult.Sink;
end;
function v13.BindJumpAction(p25, p26)
	if p26 then
		if p25.isJumpBound then
			return;
		end;
	else
		if p25.isJumpBound then
			p25.isJumpBound = false;
			l__ContextActionService__5:UnbindAction("VRJumpAction");
		end;
		return;
	end;
	p25.isJumpBound = true;
	l__ContextActionService__5:BindActionAtPriority("VRJumpAction", function()
		return p25:OnJumpAction();
	end, false, p25.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonA);
end;
function v13.ControlCharacterGamepad(p27, p28, p29, p30)
	if p30.KeyCode ~= Enum.KeyCode.Thumbstick1 then
		return;
	end;
	if p29 == Enum.UserInputState.Cancel then
		p27.moveVector = v8;
		return;
	end;
	if p29 ~= Enum.UserInputState.End then
		p27:StopFollowingPath();
		if u1 then
			u1.clearRenderedPath();
		end;
		if p27:ShouldUseNavigationLaser() then
			p27:BindJumpAction(true);
			p27:SetLaserPointerMode("Hidden");
		end;
		if p30.Position.magnitude > 0.22 then
			p27.moveVector = Vector3.new(p30.Position.X, 0, -p30.Position.Y);
			if p27.moveVector.magnitude > 0 then
				p27.moveVector = p27.moveVector.unit * math.min(1, p30.Position.magnitude);
			end;
			p27.moveLatch = true;
		end;
	else
		p27.moveVector = v8;
		if p27:ShouldUseNavigationLaser() then
			p27:BindJumpAction(false);
			p27:SetLaserPointerMode("Navigation");
		end;
		if p27.moveLatch then
			p27.moveLatch = false;
			v10:Fire("offtrack");
		end;
	end;
	return Enum.ContextActionResult.Sink;
end;
function v13.OnHeartbeat(p31, p32)
	local v31 = p31.moveVector;
	local v32 = p31:GetLocalHumanoid();
	if not v32 or not v32.Torso then
		return;
	end;
	if p31.moving and p31.currentPoints then
		local l__Position__33 = v32.Torso.Position;
		local v34 = (currentPoints[1] - l__Position__33) * v9;
		local l__magnitude__35 = v34.magnitude;
		local v36 = v34 / l__magnitude__35;
		if l__magnitude__35 < 1 then
			local v37 = 0;
			local v38 = currentPoints[1];
			for v39, v40 in pairs(currentPoints) do
				if v39 ~= 1 then
					v38 = v40;
					v37 = v37 + (v40 - v38).magnitude / v32.WalkSpeed;
				end;
			end;
			table.remove(currentPoints, 1);
			currentPointIdx = currentPointIdx + 1;
			if #currentPoints == 0 then
				p31:StopFollowingPath();
				if u1 then
					u1.clearRenderedPath();
				end;
				return;
			end;
			if u1 then
				u1.setCurrentPoints(currentPoints);
				u1.renderPath();
			end;
			expectedTimeToNextPoint = (currentPoints[1] - l__Position__33).magnitude / v32.WalkSpeed;
			timeReachedLastPoint = tick();
		else
			local v41 = { game.Players.LocalPlayer.Character, workspace.CurrentCamera };
			local v42, v43, v44 = workspace:FindPartOnRayWithIgnoreList(Ray.new(l__Position__33 - Vector3.new(0, 1, 0), v36 * 3), v41);
			if v42 then
				local v45 = Vector3.new(0, 100, 0);
				local v46, v47, v48 = workspace:FindPartOnRayWithIgnoreList(Ray.new(v43 + v36 * 0.5 + v45, -v45), v41);
				local v49 = v47.Y - l__Position__33.Y;
				if v49 < 6 and v49 > -2 then
					v32.Jump = true;
				end;
			end;
			if expectedTimeToNextPoint + 2 < tick() - timeReachedLastPoint then
				p31:StopFollowingPath();
				if u1 then
					u1.clearRenderedPath();
				end;
				v10:Fire("offtrack");
			end;
			v31 = p31.moveVector:Lerp(v36, p32 * 10);
		end;
	end;
	local l__x__50 = v31.x;
	local v51 = false;
	if l__x__50 == l__x__50 then
		v51 = false;
		if l__x__50 ~= (1 / 0) then
			v51 = l__x__50 ~= (-1 / 0);
		end;
	end;
	if v51 then
		local l__y__52 = v31.y;
		v51 = false;
		if l__y__52 == l__y__52 then
			v51 = false;
			if l__y__52 ~= (1 / 0) then
				v51 = l__y__52 ~= (-1 / 0);
			end;
		end;
		if v51 then
			local l__z__53 = v31.z;
			v51 = false;
			if l__z__53 == l__z__53 then
				v51 = false;
				if l__z__53 ~= (1 / 0) then
					v51 = l__z__53 ~= (-1 / 0);
				end;
			end;
		end;
	end;
	if v51 then
		p31.moveVector = v31;
	end;
end;
function v13.OnUserCFrameEnabled(p33)
	if p33:ShouldUseNavigationLaser() then
		p33:BindJumpAction(false);
		p33:SetLaserPointerMode("Navigation");
		return;
	end;
	p33:BindJumpAction(true);
	p33:SetLaserPointerMode("Hidden");
end;
function v13.Enable(p34, p35)
	p34.moveVector = v8;
	p34.isJumping = false;
	if p35 then
		p34.navigationRequestedConn = l__VRService__1.NavigationRequested:Connect(function(p36, p37)
			p34:OnNavigationRequest(p36, p37);
		end);
		p34.heartbeatConn = l__RunService__3.Heartbeat:Connect(function(p38)
			p34:OnHeartbeat(p38);
		end);
		l__ContextActionService__5:BindAction("MoveThumbstick", function(p39, p40, p41)
			return p34:ControlCharacterGamepad(p39, p40, p41);
		end, false, p34.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Thumbstick1);
		l__ContextActionService__5:BindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2);
		p34.userCFrameEnabledConn = l__VRService__1.UserCFrameEnabled:Connect(function()
			p34:OnUserCFrameEnabled();
		end);
		p34:OnUserCFrameEnabled();
		l__VRService__1:SetTouchpadMode(Enum.VRTouchpad.Left, Enum.VRTouchpadMode.VirtualThumbstick);
		l__VRService__1:SetTouchpadMode(Enum.VRTouchpad.Right, Enum.VRTouchpadMode.ABXY);
		p34.enabled = true;
		return;
	end;
	p34:StopFollowingPath();
	l__ContextActionService__5:UnbindAction("MoveThumbstick");
	l__ContextActionService__5:UnbindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2);
	p34:BindJumpAction(false);
	p34:SetLaserPointerMode("Disabled");
	if p34.navigationRequestedConn then
		p34.navigationRequestedConn:Disconnect();
		p34.navigationRequestedConn = nil;
	end;
	if p34.heartbeatConn then
		p34.heartbeatConn:Disconnect();
		p34.heartbeatConn = nil;
	end;
	if p34.userCFrameEnabledConn then
		p34.userCFrameEnabledConn:Disconnect();
		p34.userCFrameEnabledConn = nil;
	end;
	p34.enabled = false;
end;
return v13;
