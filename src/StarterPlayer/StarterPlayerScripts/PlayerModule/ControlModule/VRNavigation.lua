
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
local function u1(p1)
	local v10 = false;
	if p1 == p1 then
		v10 = false;
		if p1 ~= (1 / 0) then
			v10 = p1 ~= (-1 / 0);
		end;
	end;
	return v10;
end;
local v11 = Instance.new("BindableEvent");
v11.Name = "MovementUpdate";
v11.Parent = script;
local u2 = nil;
coroutine.wrap(function()
	local l__PathDisplay__12 = script.Parent:WaitForChild("PathDisplay");
	if l__PathDisplay__12 then
		u2 = require(l__PathDisplay__12);
	end;
end)();
local v13 = require(script.Parent:WaitForChild("BaseCharacterController"));
local v14 = setmetatable({}, v13);
v14.__index = v14;
function v14.new(p2)
	local v15 = setmetatable(v13.new(), v14);
	v15.CONTROL_ACTION_PRIORITY = p2;
	v15.navigationRequestedConn = nil;
	v15.heartbeatConn = nil;
	v15.currentDestination = nil;
	v15.currentPath = nil;
	v15.currentPoints = nil;
	v15.currentPointIdx = 0;
	v15.expectedTimeToNextPoint = 0;
	v15.timeReachedLastPoint = tick();
	v15.moving = false;
	v15.isJumpBound = false;
	v15.moveLatch = false;
	v15.userCFrameEnabledConn = nil;
	return v15;
end;
function v14.SetLaserPointerMode(p3, p4)
	pcall(function()
		l__StarterGui__6:SetCore("VRLaserPointerMode", p4);
	end);
end;
function v14.GetLocalHumanoid(p5)
	local l__Character__16 = l__LocalPlayer__7.Character;
	if not l__Character__16 then
		return;
	end;
	for v17, v18 in pairs(l__Character__16:GetChildren()) do
		if v18:IsA("Humanoid") then
			return v18;
		end;
	end;
	return nil;
end;
function v14.HasBothHandControllers(p6)
	return l__VRService__1:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and l__VRService__1:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand);
end;
function v14.HasAnyHandControllers(p7)
	return l__VRService__1:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) or l__VRService__1:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand);
end;
function v14.IsMobileVR(p8)
	return l__UserInputService__2.TouchEnabled;
end;
function v14.HasGamepad(p9)
	return l__UserInputService__2.GamepadEnabled;
end;
function v14.ShouldUseNavigationLaser(p10)
	if p10:IsMobileVR() then
		return true;
	end;
	if p10:HasBothHandControllers() then
		return false;
	end;
	if p10:HasAnyHandControllers() then
		return true;
	end;
	return not p10:HasGamepad();
end;
function v14.StartFollowingPath(p11, p12)
	currentPath = p12;
	currentPoints = currentPath:GetPointCoordinates();
	currentPointIdx = 1;
	moving = true;
	timeReachedLastPoint = tick();
	local v19 = p11:GetLocalHumanoid();
	if v19 and v19.Torso and #currentPoints >= 1 then
		expectedTimeToNextPoint = (currentPoints[1] - v19.Torso.Position).magnitude / v19.WalkSpeed;
	end;
	v11:Fire("targetPoint", p11.currentDestination);
end;
function v14.GoToPoint(p13, p14)
	currentPath = true;
	currentPoints = { p14 };
	currentPointIdx = 1;
	moving = true;
	local v20 = p13:GetLocalHumanoid();
	timeReachedLastPoint = tick();
	expectedTimeToNextPoint = (v20.Torso.Position - p14).magnitude / v20.WalkSpeed;
	v11:Fire("targetPoint", p14);
end;
function v14.StopFollowingPath(p15)
	currentPath = nil;
	currentPoints = nil;
	currentPointIdx = 0;
	moving = false;
	p15.moveVector = v8;
end;
function v14.TryComputePath(p16, p17, p18)
	local v21 = nil;
	while not v21 and 0 < 5 do
		local v22 = l__PathfindingService__4:ComputeSmoothPathAsync(p17, p18, 200);
		if v22.Status == Enum.PathStatus.ClosestNoPath then
			return nil;
		end;
		if v22.Status == Enum.PathStatus.ClosestOutOfRange then
			return nil;
		end;
		if v22 and v22.Status == Enum.PathStatus.FailStartNotEmpty then
			p17 = p17 + (p18 - p17).unit;
			v22 = nil;
		end;
		if v21 and v21.Status == Enum.PathStatus.FailFinishNotEmpty then
			p18 = p18 + Vector3.new(0, 1, 0);
			v21 = nil;
		end;	
	end;
	return v21;
end;
local function u3(p19)
	return u1(p19.x) and (u1(p19.y) and u1(p19.z));
end;
function v14.OnNavigationRequest(p20, p21, p22)
	local l__Position__23 = p21.Position;
	local l__currentDestination__24 = p20.currentDestination;
	if not u3(l__Position__23) then
		return;
	end;
	p20.currentDestination = l__Position__23;
	local v25 = p20:GetLocalHumanoid();
	if not v25 or not v25.Torso then
		return;
	end;
	local l__Position__26 = v25.Torso.Position;
	if (p20.currentDestination - l__Position__26).magnitude < 12 then
		p20:GoToPoint(p20.currentDestination);
		return;
	end;
	if not l__currentDestination__24 or (p20.currentDestination - l__currentDestination__24).magnitude > 4 then
		local v27 = p20:TryComputePath(l__Position__26, p20.currentDestination);
		if v27 then
			p20:StartFollowingPath(v27);
			if u2 then
				u2.setCurrentPoints(p20.currentPoints);
				u2.renderPath();
				return;
			end;
		else
			p20:StopFollowingPath();
			if u2 then
				u2.clearRenderedPath();
				return;
			end;
		end;
	else
		if moving then
			p20.currentPoints[#currentPoints] = p20.currentDestination;
			return;
		end;
		p20:GoToPoint(p20.currentDestination);
	end;
end;
function v14.OnJumpAction(p23, p24, p25, p26)
	if p25 == Enum.UserInputState.Begin then
		p23.isJumping = true;
	end;
	return Enum.ContextActionResult.Sink;
end;
function v14.BindJumpAction(p27, p28)
	if p28 then
		if p27.isJumpBound then
			return;
		end;
	else
		if p27.isJumpBound then
			p27.isJumpBound = false;
			l__ContextActionService__5:UnbindAction("VRJumpAction");
		end;
		return;
	end;
	p27.isJumpBound = true;
	l__ContextActionService__5:BindActionAtPriority("VRJumpAction", function()
		return p27:OnJumpAction();
	end, false, p27.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonA);
end;
function v14.ControlCharacterGamepad(p29, p30, p31, p32)
	if p32.KeyCode ~= Enum.KeyCode.Thumbstick1 then
		return;
	end;
	if p31 == Enum.UserInputState.Cancel then
		p29.moveVector = v8;
		return;
	end;
	if p31 ~= Enum.UserInputState.End then
		p29:StopFollowingPath();
		if u2 then
			u2.clearRenderedPath();
		end;
		if p29:ShouldUseNavigationLaser() then
			p29:BindJumpAction(true);
			p29:SetLaserPointerMode("Hidden");
		end;
		if p32.Position.magnitude > 0.22 then
			p29.moveVector = Vector3.new(p32.Position.X, 0, -p32.Position.Y);
			if p29.moveVector.magnitude > 0 then
				p29.moveVector = p29.moveVector.unit * math.min(1, p32.Position.magnitude);
			end;
			p29.moveLatch = true;
		end;
	else
		p29.moveVector = v8;
		if p29:ShouldUseNavigationLaser() then
			p29:BindJumpAction(false);
			p29:SetLaserPointerMode("Navigation");
		end;
		if p29.moveLatch then
			p29.moveLatch = false;
			v11:Fire("offtrack");
		end;
	end;
	return Enum.ContextActionResult.Sink;
end;
function v14.OnHeartbeat(p33, p34)
	local v28 = p33.moveVector;
	local v29 = p33:GetLocalHumanoid();
	if not v29 or not v29.Torso then
		return;
	end;
	if p33.moving and p33.currentPoints then
		local l__Position__30 = v29.Torso.Position;
		local v31 = (currentPoints[1] - l__Position__30) * v9;
		local l__magnitude__32 = v31.magnitude;
		local v33 = v31 / l__magnitude__32;
		if l__magnitude__32 < 1 then
			local v34 = 0;
			local v35 = currentPoints[1];
			for v36, v37 in pairs(currentPoints) do
				if v36 ~= 1 then
					v35 = v37;
					v34 = v34 + (v37 - v35).magnitude / v29.WalkSpeed;
				end;
			end;
			table.remove(currentPoints, 1);
			currentPointIdx = currentPointIdx + 1;
			if #currentPoints == 0 then
				p33:StopFollowingPath();
				if u2 then
					u2.clearRenderedPath();
				end;
				return;
			end;
			if u2 then
				u2.setCurrentPoints(currentPoints);
				u2.renderPath();
			end;
			expectedTimeToNextPoint = (currentPoints[1] - l__Position__30).magnitude / v29.WalkSpeed;
			timeReachedLastPoint = tick();
		else
			local v38 = { game.Players.LocalPlayer.Character, workspace.CurrentCamera };
			local v39, v40, v41 = workspace:FindPartOnRayWithIgnoreList(Ray.new(l__Position__30 - Vector3.new(0, 1, 0), v33 * 3), v38);
			if v39 then
				local v42 = Vector3.new(0, 100, 0);
				local v43, v44, v45 = workspace:FindPartOnRayWithIgnoreList(Ray.new(v40 + v33 * 0.5 + v42, -v42), v38);
				local v46 = v44.Y - l__Position__30.Y;
				if v46 < 6 and v46 > -2 then
					v29.Jump = true;
				end;
			end;
			if expectedTimeToNextPoint + 2 < tick() - timeReachedLastPoint then
				p33:StopFollowingPath();
				if u2 then
					u2.clearRenderedPath();
				end;
				v11:Fire("offtrack");
			end;
			v28 = p33.moveVector:Lerp(v33, p34 * 10);
		end;
	end;
	if u3(v28) then
		p33.moveVector = v28;
	end;
end;
function v14.OnUserCFrameEnabled(p35)
	if p35:ShouldUseNavigationLaser() then
		p35:BindJumpAction(false);
		p35:SetLaserPointerMode("Navigation");
		return;
	end;
	p35:BindJumpAction(true);
	p35:SetLaserPointerMode("Hidden");
end;
function v14.Enable(p36, p37)
	p36.moveVector = v8;
	p36.isJumping = false;
	if p37 then
		p36.navigationRequestedConn = l__VRService__1.NavigationRequested:Connect(function(p38, p39)
			p36:OnNavigationRequest(p38, p39);
		end);
		p36.heartbeatConn = l__RunService__3.Heartbeat:Connect(function(p40)
			p36:OnHeartbeat(p40);
		end);
		l__ContextActionService__5:BindAction("MoveThumbstick", function(p41, p42, p43)
			return p36:ControlCharacterGamepad(p41, p42, p43);
		end, false, p36.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Thumbstick1);
		l__ContextActionService__5:BindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2);
		p36.userCFrameEnabledConn = l__VRService__1.UserCFrameEnabled:Connect(function()
			p36:OnUserCFrameEnabled();
		end);
		p36:OnUserCFrameEnabled();
		l__VRService__1:SetTouchpadMode(Enum.VRTouchpad.Left, Enum.VRTouchpadMode.VirtualThumbstick);
		l__VRService__1:SetTouchpadMode(Enum.VRTouchpad.Right, Enum.VRTouchpadMode.ABXY);
		p36.enabled = true;
		return;
	end;
	p36:StopFollowingPath();
	l__ContextActionService__5:UnbindAction("MoveThumbstick");
	l__ContextActionService__5:UnbindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2);
	p36:BindJumpAction(false);
	p36:SetLaserPointerMode("Disabled");
	if p36.navigationRequestedConn then
		p36.navigationRequestedConn:Disconnect();
		p36.navigationRequestedConn = nil;
	end;
	if p36.heartbeatConn then
		p36.heartbeatConn:Disconnect();
		p36.heartbeatConn = nil;
	end;
	if p36.userCFrameEnabledConn then
		p36.userCFrameEnabledConn:Disconnect();
		p36.userCFrameEnabledConn = nil;
	end;
	p36.enabled = false;
end;
return v14;

