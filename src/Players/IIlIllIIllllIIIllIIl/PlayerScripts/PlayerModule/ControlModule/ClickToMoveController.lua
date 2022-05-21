-- Script Hash: 5251149149a9188b3d383d17f55fa245a2fffcf527928290323816b3fe9721ef3d2dbd72496e3562dab31d15d35d7bbd
-- Decompiled with the Synapse X Luau decompiler.

local v1, v2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserExcludeNonCollidableForPathfinding");
end);
local l__Players__3 = game:GetService("Players");
local l__Debris__4 = game:GetService("Debris");
local v5 = {};
local u1 = function(p1)
	if not p1 then
		return;
	end;
	local v6 = p1:FindFirstChildOfClass("Humanoid");
	if v6 then
		return p1, v6;
	end;
	return u1(p1.Parent);
end;
v5.FindCharacterAncestor = u1;
local l__Workspace__2 = game:GetService("Workspace");
local u3 = function(p2, p3, p4)
	p4 = p4 or {};
	local v7, v8, v9, v10 = l__Workspace__2:FindPartOnRayWithIgnoreList(p2, p4);
	if not v7 then
		return nil, nil;
	end;
	if p3 and v7.CanCollide == false then
		local v11, v12 = u1(v7);
		if v12 ~= nil then
			return v7, v8, v9, v10;
		end;
	else
		return v7, v8, v9, v10;
	end;
	table.insert(p4, v7);
	return u3(p2, p3, p4);
end;
v5.Raycast = u3;
u1 = {};
u3 = function(p5)
	local v13 = p5 and p5.Character;
	if not v13 then
		return;
	end;
	local v14 = u1[p5];
	if v14 and v14.Parent == v13 then
		return v14;
	end;
	u1[p5] = nil;
	local v15 = v13:FindFirstChildOfClass("Humanoid");
	if v15 then
		u1[p5] = v15;
	end;
	return v15;
end;
local l__LocalPlayer__4 = l__Players__3.LocalPlayer;
local u5 = nil;
local u6 = nil;
local u7 = nil;
local u8 = nil;
local function u9()
	return l__LocalPlayer__4 and l__LocalPlayer__4.Character;
end;
local l__CollectionService__10 = game:GetService("CollectionService");
local function u11(p6, p7)
	return Vector3.new(math.min(p6.X, p7.X), math.min(p6.Y, p7.Y), math.min(p6.Z, p7.Z));
end;
local function u12(p8, p9)
	return Vector3.new(math.max(p8.X, p9.X), math.max(p8.Y, p9.Y), math.max(p8.Z, p9.Z));
end;
local u13 = false;
local u14 = Vector3.new(0, 0, 0);
local u15 = 1;
local u16 = v1 or v2;
local function u17(p10)
	if p10 == nil or p10.PrimaryPart == nil then
		return;
	end;
	local v16 = p10.PrimaryPart.CFrame:inverse();
	local v17 = Vector3.new(math.huge, math.huge, math.huge);
	local v18 = Vector3.new(-math.huge, -math.huge, -math.huge);
	for v19, v20 in pairs(p10:GetDescendants()) do
		if v20:IsA("BasePart") and v20.CanCollide then
			local v21 = v16 * v20.CFrame;
			local v22 = Vector3.new(v20.Size.X / 2, v20.Size.Y / 2, v20.Size.Z / 2);
			for v23, v24 in ipairs({ Vector3.new(v22.X, v22.Y, v22.Z), Vector3.new(v22.X, v22.Y, -v22.Z), Vector3.new(v22.X, -v22.Y, v22.Z), Vector3.new(v22.X, -v22.Y, -v22.Z), Vector3.new(-v22.X, v22.Y, v22.Z), Vector3.new(-v22.X, v22.Y, -v22.Z), Vector3.new(-v22.X, -v22.Y, v22.Z), Vector3.new(-v22.X, -v22.Y, -v22.Z) }) do
				local v25 = v21 * v24;
				v17 = u11(v17, v25);
				v18 = u12(v18, v25);
			end;
		end;
	end;
	local v26 = v18 - v17;
	if not (v26.X < 0) and not (v26.Y < 0) and not (v26.Z < 0) then
		return v26;
	end;
	return nil;
end;
local l__PathfindingService__18 = game:GetService("PathfindingService");
local u19 = true;
local u20 = require(script.Parent:WaitForChild("ClickToMoveDisplay"));
local u21 = 8;
local function u22()
	if u8 then
		return u8;
	end;
	u8 = {};
	table.insert(u8, u9());
	return u8;
end;
local u23 = nil;
local u24 = nil;
local u25 = nil;
local function u26()
	if u23 then
		u23:Cancel();
		u23 = nil;
	end;
	if u24 then
		u24:Disconnect();
		u24 = nil;
	end;
	if u25 then
		u25:Disconnect();
		u25 = nil;
	end;
end;
local function u27(p11)
	if p11 ~= nil then
		for v27, v28 in pairs(p11:GetChildren()) do
			if v28:IsA("Tool") then
				return v28;
			end;
		end;
	end;
end;
local u28 = true;
local function u29()
	local v29 = u3(l__LocalPlayer__4);
	local v30 = false;
	if v29 ~= nil then
		v30 = v29.Health > 0;
	end;
	return v30;
end;
local l__StarterGui__30 = game:GetService("StarterGui");
local function u31(p12, p13, p14)
	local v31 = {};
	if p14 ~= nil then
		local v32 = p14;
		local v33 = p14;
	else
		v32 = u13;
		v33 = true;
	end;
	v31.Cancelled = false;
	v31.Started = false;
	v31.Finished = Instance.new("BindableEvent");
	v31.PathFailed = Instance.new("BindableEvent");
	v31.PathComputing = false;
	v31.PathComputed = false;
	v31.OriginalTargetPoint = p12;
	v31.TargetPoint = p12;
	v31.TargetSurfaceNormal = p13;
	v31.DiedConn = nil;
	v31.SeatedConn = nil;
	v31.BlockedConn = nil;
	v31.TeleportedConn = nil;
	v31.CurrentPoint = 0;
	v31.HumanoidOffsetFromPath = u14;
	v31.CurrentWaypointPosition = nil;
	v31.CurrentWaypointPlaneNormal = u14;
	v31.CurrentWaypointPlaneDistance = 0;
	v31.CurrentWaypointNeedsJump = false;
	v31.CurrentHumanoidPosition = u14;
	v31.CurrentHumanoidVelocity = 0;
	v31.NextActionMoveDirection = u14;
	v31.NextActionJump = false;
	v31.Timeout = 0;
	v31.Humanoid = u3(l__LocalPlayer__4);
	v31.OriginPoint = nil;
	v31.AgentCanFollowPath = false;
	v31.DirectPath = false;
	v31.DirectPathRiseFirst = false;
	local v34 = v31.Humanoid and v31.Humanoid.RootPart;
	if v34 then
		v31.OriginPoint = v34.CFrame.Position;
		local v35 = 2;
		local v36 = 5;
		local v37 = true;
		local l__SeatPart__38 = v31.Humanoid.SeatPart;
		if l__SeatPart__38 and l__SeatPart__38:IsA("VehicleSeat") then
			local v39 = l__SeatPart__38:FindFirstAncestorOfClass("Model");
			if v39 then
				v39.PrimaryPart = l__SeatPart__38;
				if v33 then
					local v40 = v39:GetExtentsSize();
					v35 = u15 * 0.5 * math.sqrt(v40.X * v40.X + v40.Z * v40.Z);
					v36 = u15 * v40.Y;
					v37 = false;
					v31.AgentCanFollowPath = true;
					v31.DirectPath = v33;
				end;
				v39.PrimaryPart = v39.PrimaryPart;
			end;
		else
			local v41 = nil;
			if u16 then
				local v42 = u9();
				if v42 ~= nil then
					v41 = u17(v42);
				end;
			end;
			if v41 == nil then
				v41 = u9():GetExtentsSize();
			end;
			v35 = u15 * 0.5 * math.sqrt(v41.X * v41.X + v41.Z * v41.Z);
			v36 = u15 * v41.Y;
			v37 = v31.Humanoid.JumpPower > 0;
			v31.AgentCanFollowPath = true;
			v31.DirectPath = v32;
			v31.DirectPathRiseFirst = v31.Humanoid.Sit;
		end;
		v31.pathResult = l__PathfindingService__18:CreatePath({
			AgentRadius = v35, 
			AgentHeight = v36, 
			AgentCanJump = v37
		});
	end;
	function v31.Cleanup(p15)
		if v31.stopTraverseFunc then
			v31.stopTraverseFunc();
			v31.stopTraverseFunc = nil;
		end;
		if v31.MoveToConn then
			v31.MoveToConn:Disconnect();
			v31.MoveToConn = nil;
		end;
		if v31.BlockedConn then
			v31.BlockedConn:Disconnect();
			v31.BlockedConn = nil;
		end;
		if v31.DiedConn then
			v31.DiedConn:Disconnect();
			v31.DiedConn = nil;
		end;
		if v31.SeatedConn then
			v31.SeatedConn:Disconnect();
			v31.SeatedConn = nil;
		end;
		if v31.TeleportedConn then
			v31.TeleportedConn:Disconnect();
			v31.TeleportedConn = nil;
		end;
		v31.Started = false;
	end;
	function v31.Cancel(p16)
		v31.Cancelled = true;
		v31:Cleanup();
	end;
	function v31.IsActive(p17)
		return v31.AgentCanFollowPath and (v31.Started and not v31.Cancelled);
	end;
	function v31.OnPathInterrupted(p18)
		v31.Cancelled = true;
		v31:OnPointReached(false);
	end;
	function v31.ComputePath(p19)
		if v31.OriginPoint then
			if v31.PathComputed or v31.PathComputing then
				return;
			end;
			v31.PathComputing = true;
			if v31.AgentCanFollowPath then
				if v31.DirectPath then
					v31.pointList = { PathWaypoint.new(v31.OriginPoint, Enum.PathWaypointAction.Walk), PathWaypoint.new(v31.TargetPoint, v31.DirectPathRiseFirst and Enum.PathWaypointAction.Jump or Enum.PathWaypointAction.Walk) };
					v31.PathComputed = true;
				else
					v31.pathResult:ComputeAsync(v31.OriginPoint, v31.TargetPoint);
					v31.pointList = v31.pathResult:GetWaypoints();
					v31.BlockedConn = v31.pathResult.Blocked:Connect(function(p20)
						v31:OnPathBlocked(p20);
					end);
					v31.PathComputed = v31.pathResult.Status == Enum.PathStatus.Success;
				end;
			end;
			v31.PathComputing = false;
		end;
	end;
	function v31.IsValidPath(p21)
		v31:ComputePath();
		return v31.PathComputed and v31.AgentCanFollowPath;
	end;
	v31.Recomputing = false;
	function v31.OnPathBlocked(p22, p23)
		if not (v31.CurrentPoint <= p23) or v31.Recomputing then
			return;
		end;
		v31.Recomputing = true;
		if v31.stopTraverseFunc then
			v31.stopTraverseFunc();
			v31.stopTraverseFunc = nil;
		end;
		v31.OriginPoint = v31.Humanoid.RootPart.CFrame.p;
		v31.pathResult:ComputeAsync(v31.OriginPoint, v31.TargetPoint);
		v31.pointList = v31.pathResult:GetWaypoints();
		if #v31.pointList > 0 then
			v31.HumanoidOffsetFromPath = v31.pointList[1].Position - v31.OriginPoint;
		end;
		v31.PathComputed = v31.pathResult.Status == Enum.PathStatus.Success;
		if u19 then
			local v43, v44 = u20.CreatePathDisplay(v31.pointList);
			v31.stopTraverseFunc = v43;
			v31.setPointFunc = v44;
		end;
		if v31.PathComputed then
			v31.CurrentPoint = 1;
			v31:OnPointReached(true);
		else
			v31.PathFailed:Fire();
			v31:Cleanup();
		end;
		v31.Recomputing = false;
	end;
	function v31.OnRenderStepped(p24, p25)
		if v31.Started and not v31.Cancelled then
			v31.Timeout = v31.Timeout + p25;
			if u21 < v31.Timeout then
				v31:OnPointReached(false);
				return;
			end;
			v31.CurrentHumanoidPosition = v31.Humanoid.RootPart.Position + v31.HumanoidOffsetFromPath;
			v31.CurrentHumanoidVelocity = v31.Humanoid.RootPart.Velocity;
			while v31.Started and v31:IsCurrentWaypointReached() do
				v31:OnPointReached(true);			
			end;
			if v31.Started then
				v31.NextActionMoveDirection = v31.CurrentWaypointPosition - v31.CurrentHumanoidPosition;
				if v31.NextActionMoveDirection.Magnitude > 1E-06 then
					v31.NextActionMoveDirection = v31.NextActionMoveDirection.Unit;
				else
					v31.NextActionMoveDirection = u14;
				end;
				if v31.CurrentWaypointNeedsJump then
					v31.NextActionJump = true;
					v31.CurrentWaypointNeedsJump = false;
					return;
				end;
				v31.NextActionJump = false;
			end;
		end;
	end;
	function v31.IsCurrentWaypointReached(p26)
		if v31.CurrentWaypointPlaneNormal ~= u14 then
			local v45 = v31.CurrentWaypointPlaneNormal:Dot(v31.CurrentHumanoidPosition) - v31.CurrentWaypointPlaneDistance < math.max(1, 0.0625 * -v31.CurrentWaypointPlaneNormal:Dot(v31.CurrentHumanoidVelocity));
		else
			v45 = true;
		end;
		if v45 then
			v31.CurrentWaypointPosition = nil;
			v31.CurrentWaypointPlaneNormal = u14;
			v31.CurrentWaypointPlaneDistance = 0;
		end;
		return v45;
	end;
	function v31.OnPointReached(p27, p28)
		if not p28 or not (not v31.Cancelled) then
			v31.PathFailed:Fire();
			v31:Cleanup();
			return;
		end;
		if v31.setPointFunc then
			v31.setPointFunc(v31.CurrentPoint);
		end;
		local v46 = v31.CurrentPoint + 1;
		if #v31.pointList < v46 then
			if v31.stopTraverseFunc then
				v31.stopTraverseFunc();
			end;
			v31.Finished:Fire();
			v31:Cleanup();
			return;
		end;
		local v47 = v31.pointList[v31.CurrentPoint];
		local v48 = v31.pointList[v46];
		local v49 = v31.Humanoid:GetState();
		local v50 = true;
		if v49 ~= Enum.HumanoidStateType.FallingDown then
			v50 = true;
			if v49 ~= Enum.HumanoidStateType.Freefall then
				v50 = v49 == Enum.HumanoidStateType.Jumping;
			end;
		end;
		if v50 then
			local v51 = v48.Action == Enum.PathWaypointAction.Jump;
			if not v51 and v31.CurrentPoint > 1 then
				local v52 = v47.Position - v31.pointList[v31.CurrentPoint - 1].Position;
				local v53 = v48.Position - v47.Position;
				v51 = Vector2.new(v52.x, v52.z).Unit:Dot(Vector2.new(v53.x, v53.z).Unit) < 0.996;
			end;
			if v51 then
				v31.Humanoid.FreeFalling:Wait();
				wait(0.1);
			end;
		end;
		v31:MoveToNextWayPoint(v47, v48, v46);
	end;
	function v31.MoveToNextWayPoint(p29, p30, p31, p32)
		v31.CurrentWaypointPlaneNormal = p30.Position - p31.Position;
		v31.CurrentWaypointPlaneNormal = Vector3.new(v31.CurrentWaypointPlaneNormal.X, 0, v31.CurrentWaypointPlaneNormal.Z);
		if v31.CurrentWaypointPlaneNormal.Magnitude > 1E-06 then
			v31.CurrentWaypointPlaneNormal = v31.CurrentWaypointPlaneNormal.Unit;
			v31.CurrentWaypointPlaneDistance = v31.CurrentWaypointPlaneNormal:Dot(p31.Position);
		else
			v31.CurrentWaypointPlaneNormal = u14;
			v31.CurrentWaypointPlaneDistance = 0;
		end;
		v31.CurrentWaypointNeedsJump = p31.Action == Enum.PathWaypointAction.Jump;
		v31.CurrentWaypointPosition = p31.Position;
		v31.CurrentPoint = p32;
		v31.Timeout = 0;
	end;
	function v31.Start(p33, p34)
		if not v31.AgentCanFollowPath then
			v31.PathFailed:Fire();
			return;
		end;
		if v31.Started then
			return;
		end;
		v31.Started = true;
		u20.CancelFailureAnimation();
		if u19 and (p34 == nil or p34) then
			local v54, v55 = u20.CreatePathDisplay(v31.pointList, v31.OriginalTargetPoint);
			v31.stopTraverseFunc = v54;
			v31.setPointFunc = v55;
		end;
		if not (#v31.pointList > 0) then
			v31.PathFailed:Fire();
			if v31.stopTraverseFunc then
				v31.stopTraverseFunc();
			end;
			return;
		end;
		v31.HumanoidOffsetFromPath = Vector3.new(0, v31.pointList[1].Position.Y - v31.OriginPoint.Y, 0);
		v31.CurrentHumanoidPosition = v31.Humanoid.RootPart.Position + v31.HumanoidOffsetFromPath;
		v31.CurrentHumanoidVelocity = v31.Humanoid.RootPart.Velocity;
		v31.SeatedConn = v31.Humanoid.Seated:Connect(function(p35, p36)
			v31:OnPathInterrupted();
		end);
		v31.DiedConn = v31.Humanoid.Died:Connect(function()
			v31:OnPathInterrupted();
		end);
		v31.TeleportedConn = v31.Humanoid.RootPart:GetPropertyChangedSignal("CFrame"):Connect(function()
			v31:OnPathInterrupted();
		end);
		v31.CurrentPoint = 1;
		v31:OnPointReached(true);
	end;
	local v56, v57 = l__Workspace__2:FindPartOnRayWithIgnoreList(Ray.new(v31.TargetPoint + v31.TargetSurfaceNormal * 1.5, Vector3.new(0, -1, 0) * 50), u22());
	if v56 then
		v31.TargetPoint = v57;
	end;
	v31:ComputePath();
	return v31;
end;
local function u32(p37, p38, p39, p40, p41)
	if u23 then
		u26();
	end;
	u23 = p37;
	p37:Start(p41);
	u24 = p37.Finished.Event:Connect(function()
		u26();
		if p39 then
			local v58 = u27(p40);
			if v58 then
				v58:Activate();
			end;
		end;
	end);
	u25 = p37.PathFailed.Event:Connect(function()
		u26();
		if p41 == nil or p41 then
			if u28 and (not u23 or not u23:IsActive()) then
				u20.PlayFailureAnimation();
			end;
			u20.DisplayFailureWaypoint(p38);
		end;
	end);
end;
local function u33(p42)
	if u23 and u23:IsActive() then
		u23:Cancel();
	end;
	if u28 then
		u20.PlayFailureAnimation();
	end;
	u20.DisplayFailureWaypoint(p42);
end;
function OnTap(p43, p44, p45)
	local l__CurrentCamera__59 = l__Workspace__2.CurrentCamera;
	local l__Character__60 = l__LocalPlayer__4.Character;
	if not u29() then
		return;
	end;
	if #p43 ~= 1 then
		if p44 then
			if l__CurrentCamera__59 then
				local v61 = l__CurrentCamera__59:ScreenPointToRay(p43[1].x, p43[1].y);
				local v62 = u3(l__LocalPlayer__4);
				local v63, v64, v65 = v5.Raycast(Ray.new(v61.Origin, v61.Direction * 1000), true, u22());
				local v66, v67 = v5.FindCharacterAncestor(v63);
				if p45 then
					if v67 then
						if l__StarterGui__30:GetCore("AvatarContextMenuEnabled") then
							if l__Players__3:GetPlayerFromCharacter(v67.Parent) then
								u26();
								return;
							end;
						end;
					end;
				end;
				if p44 then
					v64 = p44;
					v66 = nil;
				end;
				if v64 then
					if l__Character__60 then
						u26();
						local v68 = u31(v64, v65);
						if v68:IsValidPath() then
							u32(v68, v64, v66, l__Character__60);
							return;
						else
							v68:Cleanup();
							u33(v64);
							return;
						end;
					end;
				end;
			end;
		elseif 2 <= #p43 then
			if l__CurrentCamera__59 then
				local v69 = u27(l__Character__60);
				if v69 then
					v69:Activate();
				end;
			end;
		end;
	elseif l__CurrentCamera__59 then
		v61 = l__CurrentCamera__59:ScreenPointToRay(p43[1].x, p43[1].y);
		v62 = u3(l__LocalPlayer__4);
		v63, v64, v65 = v5.Raycast(Ray.new(v61.Origin, v61.Direction * 1000), true, u22());
		v66, v67 = v5.FindCharacterAncestor(v63);
		if p45 then
			if v67 then
				if l__StarterGui__30:GetCore("AvatarContextMenuEnabled") then
					if l__Players__3:GetPlayerFromCharacter(v67.Parent) then
						u26();
						return;
					end;
				end;
			end;
		end;
		if p44 then
			v64 = p44;
			v66 = nil;
		end;
		if v64 then
			if l__Character__60 then
				u26();
				v68 = u31(v64, v65);
				if v68:IsValidPath() then
					u32(v68, v64, v66, l__Character__60);
					return;
				else
					v68:Cleanup();
					u33(v64);
					return;
				end;
			end;
		end;
	end;
end;
local v70 = require(script.Parent:WaitForChild("Keyboard"));
local v71 = setmetatable({}, v70);
v71.__index = v71;
function v71.new(p46)
	local v72 = setmetatable(v70.new(p46), v71);
	v72.fingerTouches = {};
	v72.numUnsunkTouches = 0;
	v72.mouse1Down = tick();
	v72.mouse1DownPos = Vector2.new();
	v72.mouse2DownTime = tick();
	v72.mouse2DownPos = Vector2.new();
	v72.mouse2UpTime = tick();
	v72.keyboardMoveVector = u14;
	v72.tapConn = nil;
	v72.inputBeganConn = nil;
	v72.inputChangedConn = nil;
	v72.inputEndedConn = nil;
	v72.humanoidDiedConn = nil;
	v72.characterChildAddedConn = nil;
	v72.onCharacterAddedConn = nil;
	v72.characterChildRemovedConn = nil;
	v72.renderSteppedConn = nil;
	v72.menuOpenedConnection = nil;
	v72.running = false;
	v72.wasdEnabled = false;
	return v72;
end;
local function u34(p47)
	if p47 then
		p47:Disconnect();
	end;
end;
function v71.DisconnectEvents(p48)
	u34(p48.tapConn);
	u34(p48.inputBeganConn);
	u34(p48.inputChangedConn);
	u34(p48.inputEndedConn);
	u34(p48.humanoidDiedConn);
	u34(p48.characterChildAddedConn);
	u34(p48.onCharacterAddedConn);
	u34(p48.renderSteppedConn);
	u34(p48.characterChildRemovedConn);
	u34(p48.menuOpenedConnection);
end;
function v71.OnTouchBegan(p49, p50, p51)
	if p49.fingerTouches[p50] == nil and not p51 then
		p49.numUnsunkTouches = p49.numUnsunkTouches + 1;
	end;
	p49.fingerTouches[p50] = p51;
end;
function v71.OnTouchChanged(p52, p53, p54)
	if p52.fingerTouches[p53] == nil then
		p52.fingerTouches[p53] = p54;
		if not p54 then
			p52.numUnsunkTouches = p52.numUnsunkTouches + 1;
		end;
	end;
end;
function v71.OnTouchEnded(p55, p56, p57)
	if p55.fingerTouches[p56] ~= nil and p55.fingerTouches[p56] == false then
		p55.numUnsunkTouches = p55.numUnsunkTouches - 1;
	end;
	p55.fingerTouches[p56] = nil;
end;
local l__UserInputService__35 = game:GetService("UserInputService");
local u36 = {
	[Enum.KeyCode.W] = true, 
	[Enum.KeyCode.A] = true, 
	[Enum.KeyCode.S] = true, 
	[Enum.KeyCode.D] = true, 
	[Enum.KeyCode.Up] = true, 
	[Enum.KeyCode.Down] = true
};
local l__GuiService__37 = game:GetService("GuiService");
function v71.OnCharacterAdded(p58, p59)
	p58:DisconnectEvents();
	p58.inputBeganConn = l__UserInputService__35.InputBegan:Connect(function(p60, p61)
		if p60.UserInputType == Enum.UserInputType.Touch then
			p58:OnTouchBegan(p60, p61);
		end;
		if p58.wasdEnabled and p61 == false and p60.UserInputType == Enum.UserInputType.Keyboard and u36[p60.KeyCode] then
			u26();
			u20.CancelFailureAnimation();
		end;
		if p60.UserInputType == Enum.UserInputType.MouseButton1 then
			p58.mouse1DownTime = tick();
			p58.mouse1DownPos = p60.Position;
		end;
		if p60.UserInputType == Enum.UserInputType.MouseButton2 then
			p58.mouse2DownTime = tick();
			p58.mouse2DownPos = p60.Position;
		end;
	end);
	p58.inputChangedConn = l__UserInputService__35.InputChanged:Connect(function(p62, p63)
		if p62.UserInputType == Enum.UserInputType.Touch then
			p58:OnTouchChanged(p62, p63);
		end;
	end);
	p58.inputEndedConn = l__UserInputService__35.InputEnded:Connect(function(p64, p65)
		if p64.UserInputType == Enum.UserInputType.Touch then
			p58:OnTouchEnded(p64, p65);
		end;
		if p64.UserInputType == Enum.UserInputType.MouseButton2 then
			p58.mouse2UpTime = tick();
			local l__Position__73 = p64.Position;
			if p58.mouse2UpTime - p58.mouse2DownTime < 0.25 and (l__Position__73 - p58.mouse2DownPos).magnitude < 5 and (u23 or p58.keyboardMoveVector.Magnitude <= 0) then
				OnTap({ l__Position__73 });
			end;
		end;
	end);
	p58.tapConn = l__UserInputService__35.TouchTap:Connect(function(p66, p67)
		if not p67 then
			OnTap(p66, nil, true);
		end;
	end);
	p58.menuOpenedConnection = l__GuiService__37.MenuOpened:Connect(function()
		u26();
	end);
	local function u38(p68)
		if l__UserInputService__35.TouchEnabled and p68:IsA("Tool") then
			p68.ManualActivationOnly = true;
		end;
		if p68:IsA("Humanoid") then
			u34(p58.humanoidDiedConn);
			p58.humanoidDiedConn = p68.Died:Connect(function()

			end);
		end;
	end;
	p58.characterChildAddedConn = p59.ChildAdded:Connect(function(p69)
		u38(p69);
	end);
	p58.characterChildRemovedConn = p59.ChildRemoved:Connect(function(p70)
		if l__UserInputService__35.TouchEnabled and p70:IsA("Tool") then
			p70.ManualActivationOnly = false;
		end;
	end);
	for v74, v75 in pairs(p59:GetChildren()) do
		u38(v75);
	end;
end;
function v71.Start(p71)
	p71:Enable(true);
end;
function v71.Stop(p72)
	p72:Enable(false);
end;
function v71.CleanupPath(p73)
	u26();
end;
function v71.Enable(p74, p75, p76, p77)
	if p75 then
		if not p74.running then
			if l__LocalPlayer__4.Character then
				p74:OnCharacterAdded(l__LocalPlayer__4.Character);
			end;
			p74.onCharacterAddedConn = l__LocalPlayer__4.CharacterAdded:Connect(function(p78)
				p74:OnCharacterAdded(p78);
			end);
			p74.running = true;
		end;
		p74.touchJumpController = p77;
		if p74.touchJumpController then
			p74.touchJumpController:Enable(p74.jumpEnabled);
		end;
	else
		if p74.running then
			p74:DisconnectEvents();
			u26();
			if l__UserInputService__35.TouchEnabled then
				local l__Character__76 = l__LocalPlayer__4.Character;
				if l__Character__76 then
					for v77, v78 in pairs(l__Character__76:GetChildren()) do
						if v78:IsA("Tool") then
							v78.ManualActivationOnly = false;
						end;
					end;
				end;
			end;
			p74.running = false;
		end;
		if p74.touchJumpController and not p74.jumpEnabled then
			p74.touchJumpController:Enable(true);
		end;
		p74.touchJumpController = nil;
	end;
	if l__UserInputService__35.KeyboardEnabled and p75 ~= p74.enabled then
		p74.forwardValue = 0;
		p74.backwardValue = 0;
		p74.leftValue = 0;
		p74.rightValue = 0;
		p74.moveVector = u14;
		if p75 then
			p74:BindContextActions();
			p74:ConnectFocusEventListeners();
		else
			p74:UnbindContextActions();
			p74:DisconnectFocusEventListeners();
		end;
	end;
	p74.wasdEnabled = p75 and p76 or false;
	p74.enabled = p75;
end;
function v71.OnRenderStepped(p79, p80)
	p79.isJumping = false;
	if u23 then
		u23:OnRenderStepped(p80);
		if u23 then
			p79.moveVector = u23.NextActionMoveDirection;
			p79.moveVectorIsCameraRelative = false;
			if u23.NextActionJump then
				p79.isJumping = true;
			end;
		else
			p79.moveVector = p79.keyboardMoveVector;
			p79.moveVectorIsCameraRelative = true;
		end;
	else
		p79.moveVector = p79.keyboardMoveVector;
		p79.moveVectorIsCameraRelative = true;
	end;
	if p79.jumpRequested then
		p79.isJumping = true;
	end;
end;
function v71.UpdateMovement(p81, p82)
	if p82 == Enum.UserInputState.Cancel then
		p81.keyboardMoveVector = u14;
		return;
	end;
	if p81.wasdEnabled then
		p81.keyboardMoveVector = Vector3.new(p81.leftValue + p81.rightValue, 0, p81.forwardValue + p81.backwardValue);
	end;
end;
function v71.UpdateJump(p83)

end;
function v71.SetShowPath(p84, p85)
	u19 = p85;
end;
function v71.GetShowPath(p86)
	return u19;
end;
function v71.SetWaypointTexture(p87, p88)
	u20.SetWaypointTexture(p88);
end;
function v71.GetWaypointTexture(p89)
	return u20.GetWaypointTexture();
end;
function v71.SetWaypointRadius(p90, p91)
	u20.SetWaypointRadius(p91);
end;
function v71.GetWaypointRadius(p92)
	return u20.GetWaypointRadius();
end;
function v71.SetEndWaypointTexture(p93, p94)
	u20.SetEndWaypointTexture(p94);
end;
function v71.GetEndWaypointTexture(p95)
	return u20.GetEndWaypointTexture();
end;
function v71.SetWaypointsAlwaysOnTop(p96, p97)
	u20.SetWaypointsAlwaysOnTop(p97);
end;
function v71.GetWaypointsAlwaysOnTop(p98)
	return u20.GetWaypointsAlwaysOnTop();
end;
function v71.SetFailureAnimationEnabled(p99, p100)
	u28 = p100;
end;
function v71.GetFailureAnimationEnabled(p101)
	return u28;
end;
local function u39(p102)
	if p102 == u5 then
		return;
	end;
	if u6 then
		u6:Disconnect();
		u6 = nil;
	end;
	if u7 then
		u7:Disconnect();
		u7 = nil;
	end;
	u5 = p102;
	u8 = { u9() };
	if u5 ~= nil then
		for v79, v80 in ipairs((l__CollectionService__10:GetTagged(u5))) do
			table.insert(u8, v80);
		end;
		u6 = l__CollectionService__10:GetInstanceAddedSignal(u5):Connect(function(p103)
			table.insert(u8, p103);
		end);
		u7 = l__CollectionService__10:GetInstanceRemovedSignal(u5):Connect(function(p104)
			for v81 = 1, #u8 do
				if u8[v81] == p104 then
					u8[v81] = u8[#u8];
					table.remove(u8);
					return;
				end;
			end;
		end);
	end;
end;
function v71.SetIgnoredPartsTag(p105, p106)
	u39(p106);
end;
function v71.GetIgnoredPartsTag(p107)
	return u5;
end;
function v71.SetUseDirectPath(p108, p109)
	u13 = p109;
end;
function v71.GetUseDirectPath(p110)
	return u13;
end;
function v71.SetAgentSizeIncreaseFactor(p111, p112)
	u15 = 1 + p112 / 100;
end;
function v71.GetAgentSizeIncreaseFactor(p113)
	return (u15 - 1) * 100;
end;
function v71.SetUnreachableWaypointTimeout(p114, p115)
	u21 = p115;
end;
function v71.GetUnreachableWaypointTimeout(p116)
	return u21;
end;
function v71.SetUserJumpEnabled(p117, p118)
	p117.jumpEnabled = p118;
	if p117.touchJumpController then
		p117.touchJumpController:Enable(p118);
	end;
end;
function v71.GetUserJumpEnabled(p119)
	return p119.jumpEnabled;
end;
function v71.MoveTo(p120, p121, p122, p123)
	local l__Character__82 = l__LocalPlayer__4.Character;
	if l__Character__82 == nil then
		return false;
	end;
	local v83 = u31(p121, Vector3.new(0, 1, 0), p123);
	if not v83 or not v83:IsValidPath() then
		return false;
	end;
	u32(v83, p121, nil, l__Character__82, p122);
	return true;
end;
return v71;
