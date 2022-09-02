-- Decompiled with the Synapse X Luau decompiler.

local v1, v2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserExcludeNonCollidableForPathfinding");
end);
local v3, v4 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserClickToMoveSupportAgentCanClimb2");
end);
local l__Players__5 = game:GetService("Players");
local l__Debris__6 = game:GetService("Debris");
local v7 = {};
local u1 = function(p1)
	if not p1 then
		return;
	end;
	local v8 = p1:FindFirstChildOfClass("Humanoid");
	if v8 then
		return p1, v8;
	end;
	return u1(p1.Parent);
end;
v7.FindCharacterAncestor = u1;
local l__Workspace__2 = game:GetService("Workspace");
local u3 = function(p2, p3, p4)
	p4 = p4 or {};
	local v9, v10, v11, v12 = l__Workspace__2:FindPartOnRayWithIgnoreList(p2, p4);
	if not v9 then
		return nil, nil;
	end;
	if p3 and v9.CanCollide == false then
		if v9 then
			local v13 = v9:FindFirstChildOfClass("Humanoid");
			if v13 then
				local v14 = v13;
			else
				local v15, v16 = u1(v9.Parent);
				v14 = v16;
			end;
		else
			v14 = nil;
		end;
		if v14 == nil then
			table.insert(p4, v9);
			return u3(p2, p3, p4);
		end;
	end;
	return v9, v10, v11, v12;
end;
v7.Raycast = u3;
u1 = {};
u3 = function(p5)
	local v17 = p5 and p5.Character;
	if not v17 then
		return;
	end;
	local v18 = u1[p5];
	if v18 and v18.Parent == v17 then
		return v18;
	end;
	u1[p5] = nil;
	local v19 = v17:FindFirstChildOfClass("Humanoid");
	if v19 then
		u1[p5] = v19;
	end;
	return v19;
end;
local l__LocalPlayer__4 = l__Players__5.LocalPlayer;
local u5 = nil;
local u6 = nil;
local u7 = nil;
local u8 = nil;
local l__CollectionService__9 = game:GetService("CollectionService");
local u10 = false;
local u11 = Vector3.new(0, 0, 0);
local u12 = 1;
local u13 = v1 or v2;
local function u14(p6)
	if p6 == nil or p6.PrimaryPart == nil then
		return;
	end;
	assert(p6, "");
	assert(p6.PrimaryPart, "");
	local v20 = p6.PrimaryPart.CFrame:Inverse();
	local v21 = Vector3.new(math.huge, math.huge, math.huge);
	local v22 = Vector3.new(-math.huge, -math.huge, -math.huge);
	for v23, v24 in pairs(p6:GetDescendants()) do
		if v24:IsA("BasePart") and v24.CanCollide then
			local v25 = v20 * v24.CFrame;
			local v26 = Vector3.new(v24.Size.X / 2, v24.Size.Y / 2, v24.Size.Z / 2);
			local v27, v28, v29 = ipairs({ Vector3.new(v26.X, v26.Y, v26.Z), Vector3.new(v26.X, v26.Y, -v26.Z), Vector3.new(v26.X, -v26.Y, v26.Z), Vector3.new(v26.X, -v26.Y, -v26.Z), Vector3.new(-v26.X, v26.Y, v26.Z), Vector3.new(-v26.X, v26.Y, -v26.Z), Vector3.new(-v26.X, -v26.Y, v26.Z), Vector3.new(-v26.X, -v26.Y, -v26.Z) });
			while true do
				v27(v28, v29);
				if not v27 then
					break;
				end;
				v29 = v27;
				local v30 = v25 * v28;
				v21 = Vector3.new(math.min(v21.X, v30.X), math.min(v21.Y, v30.Y), math.min(v21.Z, v30.Z));
				v22 = Vector3.new(math.max(v22.X, v30.X), math.max(v22.Y, v30.Y), math.max(v22.Z, v30.Z));			
			end;
		end;
	end;
	local v31 = v22 - v21;
	if not (v31.X < 0) and not (v31.Y < 0) and not (v31.Z < 0) then
		return v31;
	end;
	return nil;
end;
local u15 = v3 or v4;
local l__PathfindingService__16 = game:GetService("PathfindingService");
local u17 = true;
local u18 = require(script.Parent:WaitForChild("ClickToMoveDisplay"));
local u19 = 8;
local u20 = nil;
local u21 = nil;
local u22 = nil;
local function u23(p7)
	if p7 ~= nil then
		for v32, v33 in pairs(p7:GetChildren()) do
			if v33:IsA("Tool") then
				return v33;
			end;
		end;
	end;
end;
local u24 = true;
local l__StarterGui__25 = game:GetService("StarterGui");
local function u26(p8, p9, p10)
	local v34 = {};
	if p10 ~= nil then
		local v35 = p10;
		local v36 = p10;
	else
		v35 = u10;
		v36 = true;
	end;
	v34.Cancelled = false;
	v34.Started = false;
	v34.Finished = Instance.new("BindableEvent");
	v34.PathFailed = Instance.new("BindableEvent");
	v34.PathComputing = false;
	v34.PathComputed = false;
	v34.OriginalTargetPoint = p8;
	v34.TargetPoint = p8;
	v34.TargetSurfaceNormal = p9;
	v34.DiedConn = nil;
	v34.SeatedConn = nil;
	v34.BlockedConn = nil;
	v34.TeleportedConn = nil;
	v34.CurrentPoint = 0;
	v34.HumanoidOffsetFromPath = u11;
	v34.CurrentWaypointPosition = nil;
	v34.CurrentWaypointPlaneNormal = u11;
	v34.CurrentWaypointPlaneDistance = 0;
	v34.CurrentWaypointNeedsJump = false;
	v34.CurrentHumanoidPosition = u11;
	v34.CurrentHumanoidVelocity = 0;
	v34.NextActionMoveDirection = u11;
	v34.NextActionJump = false;
	v34.Timeout = 0;
	local v37 = l__LocalPlayer__4 and l__LocalPlayer__4.Character;
	if v37 then
		local v38 = u1[l__LocalPlayer__4];
		if v38 and v38.Parent == v37 then
			local v39 = v38;
		else
			u1[l__LocalPlayer__4] = nil;
			local v40 = v37:FindFirstChildOfClass("Humanoid");
			if v40 then
				u1[l__LocalPlayer__4] = v40;
			end;
			v39 = v40;
		end;
	else
		v39 = nil;
	end;
	v34.Humanoid = v39;
	v34.OriginPoint = nil;
	v34.AgentCanFollowPath = false;
	v34.DirectPath = false;
	v34.DirectPathRiseFirst = false;
	v34.stopTraverseFunc = nil;
	v34.setPointFunc = nil;
	v34.pointList = nil;
	local v41 = v34.Humanoid and v34.Humanoid.RootPart;
	if v41 then
		v34.OriginPoint = v41.CFrame.Position;
		local v42 = 2;
		local v43 = 5;
		local v44 = true;
		local l__SeatPart__45 = v34.Humanoid.SeatPart;
		if l__SeatPart__45 and l__SeatPart__45:IsA("VehicleSeat") then
			local v46 = l__SeatPart__45:FindFirstAncestorOfClass("Model");
			if v46 then
				v46.PrimaryPart = l__SeatPart__45;
				if v36 then
					local v47 = v46:GetExtentsSize();
					v42 = u12 * 0.5 * math.sqrt(v47.X * v47.X + v47.Z * v47.Z);
					v43 = u12 * v47.Y;
					v44 = false;
					v34.AgentCanFollowPath = true;
					v34.DirectPath = v36;
				end;
				v46.PrimaryPart = v46.PrimaryPart;
			end;
		else
			local v48 = nil;
			if u13 then
				local v49 = l__LocalPlayer__4 and l__LocalPlayer__4.Character;
				if v49 ~= nil then
					v48 = u14(v49);
				end;
			end;
			if v48 == nil then
				v48 = (l__LocalPlayer__4 and l__LocalPlayer__4.Character):GetExtentsSize();
			end;
			assert(v48, "");
			v42 = u12 * 0.5 * math.sqrt(v48.X * v48.X + v48.Z * v48.Z);
			v43 = u12 * v48.Y;
			v44 = v34.Humanoid.JumpPower > 0;
			v34.AgentCanFollowPath = true;
			v34.DirectPath = v35;
			v34.DirectPathRiseFirst = v34.Humanoid.Sit;
		end;
		if u15 then
			v34.pathResult = l__PathfindingService__16:CreatePath({
				AgentRadius = v42, 
				AgentHeight = v43, 
				AgentCanJump = v44, 
				AgentCanClimb = true
			});
		else
			v34.pathResult = l__PathfindingService__16:CreatePath({
				AgentRadius = v42, 
				AgentHeight = v43, 
				AgentCanJump = v44
			});
		end;
	end;
	function v34.Cleanup(p11)
		if v34.stopTraverseFunc then
			v34.stopTraverseFunc();
			v34.stopTraverseFunc = nil;
		end;
		if v34.BlockedConn then
			v34.BlockedConn:Disconnect();
			v34.BlockedConn = nil;
		end;
		if v34.DiedConn then
			v34.DiedConn:Disconnect();
			v34.DiedConn = nil;
		end;
		if v34.SeatedConn then
			v34.SeatedConn:Disconnect();
			v34.SeatedConn = nil;
		end;
		if v34.TeleportedConn then
			v34.TeleportedConn:Disconnect();
			v34.TeleportedConn = nil;
		end;
		v34.Started = false;
	end;
	function v34.Cancel(p12)
		v34.Cancelled = true;
		v34:Cleanup();
	end;
	function v34.IsActive(p13)
		return v34.AgentCanFollowPath and (v34.Started and not v34.Cancelled);
	end;
	function v34.OnPathInterrupted(p14)
		v34.Cancelled = true;
		v34:OnPointReached(false);
	end;
	function v34.ComputePath(p15)
		if v34.OriginPoint then
			if v34.PathComputed or v34.PathComputing then
				return;
			end;
			v34.PathComputing = true;
			if v34.AgentCanFollowPath then
				if v34.DirectPath then
					v34.pointList = { PathWaypoint.new(v34.OriginPoint, Enum.PathWaypointAction.Walk), PathWaypoint.new(v34.TargetPoint, v34.DirectPathRiseFirst and Enum.PathWaypointAction.Jump or Enum.PathWaypointAction.Walk) };
					v34.PathComputed = true;
				else
					v34.pathResult:ComputeAsync(v34.OriginPoint, v34.TargetPoint);
					v34.pointList = v34.pathResult:GetWaypoints();
					v34.BlockedConn = v34.pathResult.Blocked:Connect(function(p16)
						v34:OnPathBlocked(p16);
					end);
					v34.PathComputed = v34.pathResult.Status == Enum.PathStatus.Success;
				end;
			end;
			v34.PathComputing = false;
		end;
	end;
	function v34.IsValidPath(p17)
		v34:ComputePath();
		return v34.PathComputed and v34.AgentCanFollowPath;
	end;
	v34.Recomputing = false;
	function v34.OnPathBlocked(p18, p19)
		if not (v34.CurrentPoint <= p19) or v34.Recomputing then
			return;
		end;
		v34.Recomputing = true;
		if v34.stopTraverseFunc then
			v34.stopTraverseFunc();
			v34.stopTraverseFunc = nil;
		end;
		v34.OriginPoint = v34.Humanoid.RootPart.CFrame.p;
		v34.pathResult:ComputeAsync(v34.OriginPoint, v34.TargetPoint);
		v34.pointList = v34.pathResult:GetWaypoints();
		if #v34.pointList > 0 then
			v34.HumanoidOffsetFromPath = v34.pointList[1].Position - v34.OriginPoint;
		end;
		v34.PathComputed = v34.pathResult.Status == Enum.PathStatus.Success;
		if u17 then
			local v50, v51 = u18.CreatePathDisplay(v34.pointList);
			v34.stopTraverseFunc = v50;
			v34.setPointFunc = v51;
		end;
		if v34.PathComputed then
			v34.CurrentPoint = 1;
			v34:OnPointReached(true);
		else
			v34.PathFailed:Fire();
			v34:Cleanup();
		end;
		v34.Recomputing = false;
	end;
	function v34.OnRenderStepped(p20, p21)
		if v34.Started and not v34.Cancelled then
			v34.Timeout = v34.Timeout + p21;
			if u19 < v34.Timeout then
				v34:OnPointReached(false);
				return;
			end;
			v34.CurrentHumanoidPosition = v34.Humanoid.RootPart.Position + v34.HumanoidOffsetFromPath;
			v34.CurrentHumanoidVelocity = v34.Humanoid.RootPart.Velocity;
			while v34.Started and v34:IsCurrentWaypointReached() do
				v34:OnPointReached(true);			
			end;
			if v34.Started then
				v34.NextActionMoveDirection = v34.CurrentWaypointPosition - v34.CurrentHumanoidPosition;
				if v34.NextActionMoveDirection.Magnitude > 1E-06 then
					v34.NextActionMoveDirection = v34.NextActionMoveDirection.Unit;
				else
					v34.NextActionMoveDirection = u11;
				end;
				if v34.CurrentWaypointNeedsJump then
					v34.NextActionJump = true;
					v34.CurrentWaypointNeedsJump = false;
					return;
				end;
				v34.NextActionJump = false;
			end;
		end;
	end;
	function v34.IsCurrentWaypointReached(p22)
		if v34.CurrentWaypointPlaneNormal ~= u11 then
			local v52 = v34.CurrentWaypointPlaneNormal:Dot(v34.CurrentHumanoidPosition) - v34.CurrentWaypointPlaneDistance < math.max(1, 0.0625 * -v34.CurrentWaypointPlaneNormal:Dot(v34.CurrentHumanoidVelocity));
		else
			v52 = true;
		end;
		if v52 then
			v34.CurrentWaypointPosition = nil;
			v34.CurrentWaypointPlaneNormal = u11;
			v34.CurrentWaypointPlaneDistance = 0;
		end;
		return v52;
	end;
	function v34.OnPointReached(p23, p24)
		if not p24 or not (not v34.Cancelled) then
			v34.PathFailed:Fire();
			v34:Cleanup();
			return;
		end;
		if v34.setPointFunc then
			v34.setPointFunc(v34.CurrentPoint);
		end;
		local v53 = v34.CurrentPoint + 1;
		if #v34.pointList < v53 then
			if v34.stopTraverseFunc then
				v34.stopTraverseFunc();
			end;
			v34.Finished:Fire();
			v34:Cleanup();
			return;
		end;
		local v54 = v34.pointList[v34.CurrentPoint];
		local v55 = v34.pointList[v53];
		local v56 = v34.Humanoid:GetState();
		local v57 = true;
		if v56 ~= Enum.HumanoidStateType.FallingDown then
			v57 = true;
			if v56 ~= Enum.HumanoidStateType.Freefall then
				v57 = v56 == Enum.HumanoidStateType.Jumping;
			end;
		end;
		if v57 then
			local v58 = v55.Action == Enum.PathWaypointAction.Jump;
			if not v58 and v34.CurrentPoint > 1 then
				local v59 = v54.Position - v34.pointList[v34.CurrentPoint - 1].Position;
				local v60 = v55.Position - v54.Position;
				v58 = Vector2.new(v59.x, v59.z).Unit:Dot(Vector2.new(v60.x, v60.z).Unit) < 0.996;
			end;
			if v58 then
				v34.Humanoid.FreeFalling:Wait();
				wait(0.1);
			end;
		end;
		v34:MoveToNextWayPoint(v54, v55, v53);
	end;
	function v34.MoveToNextWayPoint(p25, p26, p27, p28)
		v34.CurrentWaypointPlaneNormal = p26.Position - p27.Position;
		if not u15 or p27.Label ~= "Climb" then
			v34.CurrentWaypointPlaneNormal = Vector3.new(v34.CurrentWaypointPlaneNormal.X, 0, v34.CurrentWaypointPlaneNormal.Z);
		end;
		if v34.CurrentWaypointPlaneNormal.Magnitude > 1E-06 then
			v34.CurrentWaypointPlaneNormal = v34.CurrentWaypointPlaneNormal.Unit;
			v34.CurrentWaypointPlaneDistance = v34.CurrentWaypointPlaneNormal:Dot(p27.Position);
		else
			v34.CurrentWaypointPlaneNormal = u11;
			v34.CurrentWaypointPlaneDistance = 0;
		end;
		v34.CurrentWaypointNeedsJump = p27.Action == Enum.PathWaypointAction.Jump;
		v34.CurrentWaypointPosition = p27.Position;
		v34.CurrentPoint = p28;
		v34.Timeout = 0;
	end;
	function v34.Start(p29, p30)
		if not v34.AgentCanFollowPath then
			v34.PathFailed:Fire();
			return;
		end;
		if v34.Started then
			return;
		end;
		v34.Started = true;
		u18.CancelFailureAnimation();
		if u17 and (p30 == nil or p30) then
			local v61, v62 = u18.CreatePathDisplay(v34.pointList, v34.OriginalTargetPoint);
			v34.stopTraverseFunc = v61;
			v34.setPointFunc = v62;
		end;
		if not (#v34.pointList > 0) then
			v34.PathFailed:Fire();
			if v34.stopTraverseFunc then
				v34.stopTraverseFunc();
			end;
			return;
		end;
		v34.HumanoidOffsetFromPath = Vector3.new(0, v34.pointList[1].Position.Y - v34.OriginPoint.Y, 0);
		v34.CurrentHumanoidPosition = v34.Humanoid.RootPart.Position + v34.HumanoidOffsetFromPath;
		v34.CurrentHumanoidVelocity = v34.Humanoid.RootPart.Velocity;
		v34.SeatedConn = v34.Humanoid.Seated:Connect(function(p31, p32)
			v34:OnPathInterrupted();
		end);
		v34.DiedConn = v34.Humanoid.Died:Connect(function()
			v34:OnPathInterrupted();
		end);
		v34.TeleportedConn = v34.Humanoid.RootPart:GetPropertyChangedSignal("CFrame"):Connect(function()
			v34:OnPathInterrupted();
		end);
		v34.CurrentPoint = 1;
		v34:OnPointReached(true);
	end;
	if u8 then
		local v63 = u8;
	else
		u8 = {};
		table.insert(u8, l__LocalPlayer__4 and l__LocalPlayer__4.Character);
		v63 = u8;
	end;
	local v64, v65 = l__Workspace__2:FindPartOnRayWithIgnoreList(Ray.new(v34.TargetPoint + v34.TargetSurfaceNormal * 1.5, Vector3.new(0, -1, 0) * 50), v63);
	if v64 then
		v34.TargetPoint = v65;
	end;
	v34:ComputePath();
	return v34;
end;
local function u27(p33, p34, p35, p36, p37)
	if u20 then
		if u20 then
			u20:Cancel();
			u20 = nil;
		end;
		if u21 then
			u21:Disconnect();
			u21 = nil;
		end;
		if u22 then
			u22:Disconnect();
			u22 = nil;
		end;
	end;
	u20 = p33;
	p33:Start(p37);
	u21 = p33.Finished.Event:Connect(function()
		if u20 then
			u20:Cancel();
			u20 = nil;
		end;
		if u21 then
			u21:Disconnect();
			u21 = nil;
		end;
		if u22 then
			u22:Disconnect();
			u22 = nil;
		end;
		if p35 then
			local v66 = u23(p36);
			if v66 then
				v66:Activate();
			end;
		end;
	end);
	u22 = p33.PathFailed.Event:Connect(function()
		if u20 then
			u20:Cancel();
			u20 = nil;
		end;
		if u21 then
			u21:Disconnect();
			u21 = nil;
		end;
		if u22 then
			u22:Disconnect();
			u22 = nil;
		end;
		if p37 == nil or p37 then
			if u24 and (not u20 or not u20:IsActive()) then
				u18.PlayFailureAnimation();
			end;
			u18.DisplayFailureWaypoint(p34);
		end;
	end);
end;
function OnTap(p38, p39, p40)
	local l__CurrentCamera__67 = l__Workspace__2.CurrentCamera;
	local l__Character__68 = l__LocalPlayer__4.Character;
	local v69 = l__LocalPlayer__4 and l__LocalPlayer__4.Character;
	if v69 then
		local v70 = u1[l__LocalPlayer__4];
		if v70 then
			if v70.Parent == v69 then
				local v71 = v70;
			else
				u1[l__LocalPlayer__4] = nil;
				local v72 = v69:FindFirstChildOfClass("Humanoid");
				if v72 then
					u1[l__LocalPlayer__4] = v72;
				end;
				v71 = v72;
			end;
		else
			u1[l__LocalPlayer__4] = nil;
			v72 = v69:FindFirstChildOfClass("Humanoid");
			if v72 then
				u1[l__LocalPlayer__4] = v72;
			end;
			v71 = v72;
		end;
	else
		v71 = nil;
	end;
	local v73 = false;
	if v71 ~= nil then
		v73 = 0 < v71.Health;
	end;
	if not v73 then
		return;
	end;
	if #p38 ~= 1 then
		if p39 then
			if l__CurrentCamera__67 then
				local v74 = l__CurrentCamera__67:ScreenPointToRay(p38[1].X, p38[1].Y);
				local v75 = l__LocalPlayer__4 and l__LocalPlayer__4.Character;
				if v75 then
					local v76 = u1[l__LocalPlayer__4];
					if v76 then
						if v76.Parent == v75 then

						else
							u1[l__LocalPlayer__4] = nil;
							local v77 = v75:FindFirstChildOfClass("Humanoid");
							if v77 then
								u1[l__LocalPlayer__4] = v77;
							end;
						end;
					else
						u1[l__LocalPlayer__4] = nil;
						v77 = v75:FindFirstChildOfClass("Humanoid");
						if v77 then
							u1[l__LocalPlayer__4] = v77;
						end;
					end;
				end;
				if u8 then
					local v78 = u8;
				else
					u8 = {};
					table.insert(u8, l__LocalPlayer__4 and l__LocalPlayer__4.Character);
					v78 = u8;
				end;
				local v79, v80, v81 = v7.Raycast(Ray.new(v74.Origin, v74.Direction * 1000), true, v78);
				local v82, v83 = v7.FindCharacterAncestor(v79);
				if p40 then
					if v83 then
						if l__StarterGui__25:GetCore("AvatarContextMenuEnabled") then
							if l__Players__5:GetPlayerFromCharacter(v83.Parent) then
								if u20 then
									u20:Cancel();
									u20 = nil;
								end;
								if u21 then
									u21:Disconnect();
									u21 = nil;
								end;
								if u22 then
									u22:Disconnect();
									u22 = nil;
								end;
								return;
							end;
						end;
					end;
				end;
				if p39 then
					v80 = p39;
					v82 = nil;
				end;
				if v80 then
					if l__Character__68 then
						if u20 then
							u20:Cancel();
							u20 = nil;
						end;
						if u21 then
							u21:Disconnect();
							u21 = nil;
						end;
						if u22 then
							u22:Disconnect();
							u22 = nil;
						end;
						local v84 = u26(v80, v81);
						if v84:IsValidPath() then
							u27(v84, v80, v82, l__Character__68);
							return;
						else
							v84:Cleanup();
							if u20 then
								if u20:IsActive() then
									u20:Cancel();
								end;
							end;
							if u24 then
								u18.PlayFailureAnimation();
							end;
							u18.DisplayFailureWaypoint(v80);
							return;
						end;
					end;
				end;
			end;
		elseif 2 <= #p38 then
			if l__CurrentCamera__67 then
				local v85 = u23(l__Character__68);
				if v85 then
					v85:Activate();
				end;
			end;
		end;
	elseif l__CurrentCamera__67 then
		v74 = l__CurrentCamera__67:ScreenPointToRay(p38[1].X, p38[1].Y);
		v75 = l__LocalPlayer__4 and l__LocalPlayer__4.Character;
		if v75 then
			v76 = u1[l__LocalPlayer__4];
			if v76 then
				if v76.Parent == v75 then

				else
					u1[l__LocalPlayer__4] = nil;
					v77 = v75:FindFirstChildOfClass("Humanoid");
					if v77 then
						u1[l__LocalPlayer__4] = v77;
					end;
				end;
			else
				u1[l__LocalPlayer__4] = nil;
				v77 = v75:FindFirstChildOfClass("Humanoid");
				if v77 then
					u1[l__LocalPlayer__4] = v77;
				end;
			end;
		end;
		if u8 then
			v78 = u8;
		else
			u8 = {};
			table.insert(u8, l__LocalPlayer__4 and l__LocalPlayer__4.Character);
			v78 = u8;
		end;
		v79, v80, v81 = v7.Raycast(Ray.new(v74.Origin, v74.Direction * 1000), true, v78);
		v82, v83 = v7.FindCharacterAncestor(v79);
		if p40 then
			if v83 then
				if l__StarterGui__25:GetCore("AvatarContextMenuEnabled") then
					if l__Players__5:GetPlayerFromCharacter(v83.Parent) then
						if u20 then
							u20:Cancel();
							u20 = nil;
						end;
						if u21 then
							u21:Disconnect();
							u21 = nil;
						end;
						if u22 then
							u22:Disconnect();
							u22 = nil;
						end;
						return;
					end;
				end;
			end;
		end;
		if p39 then
			v80 = p39;
			v82 = nil;
		end;
		if v80 then
			if l__Character__68 then
				if u20 then
					u20:Cancel();
					u20 = nil;
				end;
				if u21 then
					u21:Disconnect();
					u21 = nil;
				end;
				if u22 then
					u22:Disconnect();
					u22 = nil;
				end;
				v84 = u26(v80, v81);
				if v84:IsValidPath() then
					u27(v84, v80, v82, l__Character__68);
					return;
				else
					v84:Cleanup();
					if u20 then
						if u20:IsActive() then
							u20:Cancel();
						end;
					end;
					if u24 then
						u18.PlayFailureAnimation();
					end;
					u18.DisplayFailureWaypoint(v80);
					return;
				end;
			end;
		end;
	end;
end;
local v86 = require(script.Parent:WaitForChild("Keyboard"));
local v87 = setmetatable({}, v86);
v87.__index = v87;
function v87.new(p41)
	local v88 = setmetatable(v86.new(p41), v87);
	v88.fingerTouches = {};
	v88.numUnsunkTouches = 0;
	v88.mouse1Down = tick();
	v88.mouse1DownPos = Vector2.new();
	v88.mouse2DownTime = tick();
	v88.mouse2DownPos = Vector2.new();
	v88.mouse2UpTime = tick();
	v88.keyboardMoveVector = u11;
	v88.tapConn = nil;
	v88.inputBeganConn = nil;
	v88.inputChangedConn = nil;
	v88.inputEndedConn = nil;
	v88.humanoidDiedConn = nil;
	v88.characterChildAddedConn = nil;
	v88.onCharacterAddedConn = nil;
	v88.characterChildRemovedConn = nil;
	v88.renderSteppedConn = nil;
	v88.menuOpenedConnection = nil;
	v88.running = false;
	v88.wasdEnabled = false;
	return v88;
end;
function v87.DisconnectEvents(p42)
	local l__tapConn__89 = p42.tapConn;
	if l__tapConn__89 then
		l__tapConn__89:Disconnect();
	end;
	local l__inputBeganConn__90 = p42.inputBeganConn;
	if l__inputBeganConn__90 then
		l__inputBeganConn__90:Disconnect();
	end;
	local l__inputChangedConn__91 = p42.inputChangedConn;
	if l__inputChangedConn__91 then
		l__inputChangedConn__91:Disconnect();
	end;
	local l__inputEndedConn__92 = p42.inputEndedConn;
	if l__inputEndedConn__92 then
		l__inputEndedConn__92:Disconnect();
	end;
	local l__humanoidDiedConn__93 = p42.humanoidDiedConn;
	if l__humanoidDiedConn__93 then
		l__humanoidDiedConn__93:Disconnect();
	end;
	local l__characterChildAddedConn__94 = p42.characterChildAddedConn;
	if l__characterChildAddedConn__94 then
		l__characterChildAddedConn__94:Disconnect();
	end;
	local l__onCharacterAddedConn__95 = p42.onCharacterAddedConn;
	if l__onCharacterAddedConn__95 then
		l__onCharacterAddedConn__95:Disconnect();
	end;
	local l__renderSteppedConn__96 = p42.renderSteppedConn;
	if l__renderSteppedConn__96 then
		l__renderSteppedConn__96:Disconnect();
	end;
	local v97 = p42.characterChildRemovedConn;
	if v97 then
		v97:Disconnect();
	end;
	local l__menuOpenedConnection__98 = p42.menuOpenedConnection;
	if l__menuOpenedConnection__98 then
		l__menuOpenedConnection__98:Disconnect();
	end;
end;
function v87.OnTouchBegan(p43, p44, p45)
	if p43.fingerTouches[p44] == nil and not p45 then
		p43.numUnsunkTouches = p43.numUnsunkTouches + 1;
	end;
	p43.fingerTouches[p44] = p45;
end;
function v87.OnTouchChanged(p46, p47, p48)
	if p46.fingerTouches[p47] == nil then
		p46.fingerTouches[p47] = p48;
		if not p48 then
			p46.numUnsunkTouches = p46.numUnsunkTouches + 1;
		end;
	end;
end;
function v87.OnTouchEnded(p49, p50, p51)
	if p49.fingerTouches[p50] ~= nil and p49.fingerTouches[p50] == false then
		p49.numUnsunkTouches = p49.numUnsunkTouches - 1;
	end;
	p49.fingerTouches[p50] = nil;
end;
local l__UserInputService__28 = game:GetService("UserInputService");
local u29 = {
	[Enum.KeyCode.W] = true, 
	[Enum.KeyCode.A] = true, 
	[Enum.KeyCode.S] = true, 
	[Enum.KeyCode.D] = true, 
	[Enum.KeyCode.Up] = true, 
	[Enum.KeyCode.Down] = true
};
local l__GuiService__30 = game:GetService("GuiService");
function v87.OnCharacterAdded(p52, p53)
	p52:DisconnectEvents();
	p52.inputBeganConn = l__UserInputService__28.InputBegan:Connect(function(p54, p55)
		if p54.UserInputType == Enum.UserInputType.Touch then
			p52:OnTouchBegan(p54, p55);
		end;
		if p52.wasdEnabled and p55 == false and p54.UserInputType == Enum.UserInputType.Keyboard and u29[p54.KeyCode] then
			if u20 then
				u20:Cancel();
				u20 = nil;
			end;
			if u21 then
				u21:Disconnect();
				u21 = nil;
			end;
			if u22 then
				u22:Disconnect();
				u22 = nil;
			end;
			u18.CancelFailureAnimation();
		end;
		if p54.UserInputType == Enum.UserInputType.MouseButton1 then
			p52.mouse1DownTime = tick();
			p52.mouse1DownPos = p54.Position;
		end;
		if p54.UserInputType == Enum.UserInputType.MouseButton2 then
			p52.mouse2DownTime = tick();
			p52.mouse2DownPos = p54.Position;
		end;
	end);
	p52.inputChangedConn = l__UserInputService__28.InputChanged:Connect(function(p56, p57)
		if p56.UserInputType == Enum.UserInputType.Touch then
			p52:OnTouchChanged(p56, p57);
		end;
	end);
	p52.inputEndedConn = l__UserInputService__28.InputEnded:Connect(function(p58, p59)
		if p58.UserInputType == Enum.UserInputType.Touch then
			p52:OnTouchEnded(p58, p59);
		end;
		if p58.UserInputType == Enum.UserInputType.MouseButton2 then
			p52.mouse2UpTime = tick();
			local l__Position__99 = p58.Position;
			if p52.mouse2UpTime - p52.mouse2DownTime < 0.25 and (l__Position__99 - p52.mouse2DownPos).magnitude < 5 and (u20 or p52.keyboardMoveVector.Magnitude <= 0) then
				OnTap({ l__Position__99 });
			end;
		end;
	end);
	p52.tapConn = l__UserInputService__28.TouchTap:Connect(function(p60, p61)
		if not p61 then
			OnTap(p60, nil, true);
		end;
	end);
	p52.menuOpenedConnection = l__GuiService__30.MenuOpened:Connect(function()
		if u20 then
			u20:Cancel();
			u20 = nil;
		end;
		if u21 then
			u21:Disconnect();
			u21 = nil;
		end;
		if u22 then
			u22:Disconnect();
			u22 = nil;
		end;
	end);
	local function u31(p62)
		if l__UserInputService__28.TouchEnabled and p62:IsA("Tool") then
			p62.ManualActivationOnly = true;
		end;
		if p62:IsA("Humanoid") then
			local l__humanoidDiedConn__100 = p52.humanoidDiedConn;
			if l__humanoidDiedConn__100 then
				l__humanoidDiedConn__100:Disconnect();
			end;
			p52.humanoidDiedConn = p62.Died:Connect(function()

			end);
		end;
	end;
	p52.characterChildAddedConn = p53.ChildAdded:Connect(function(p63)
		u31(p63);
	end);
	p52.characterChildRemovedConn = p53.ChildRemoved:Connect(function(p64)
		if l__UserInputService__28.TouchEnabled and p64:IsA("Tool") then
			p64.ManualActivationOnly = false;
		end;
	end);
	for v101, v102 in pairs(p53:GetChildren()) do
		u31(v102);
	end;
end;
function v87.Start(p65)
	p65:Enable(true);
end;
function v87.Stop(p66)
	p66:Enable(false);
end;
function v87.CleanupPath(p67)
	if u20 then
		u20:Cancel();
		u20 = nil;
	end;
	if u21 then
		u21:Disconnect();
		u21 = nil;
	end;
	if u22 then
		u22:Disconnect();
		u22 = nil;
	end;
end;
function v87.Enable(p68, p69, p70, p71)
	if p69 then
		if not p68.running then
			if l__LocalPlayer__4.Character then
				p68:OnCharacterAdded(l__LocalPlayer__4.Character);
			end;
			p68.onCharacterAddedConn = l__LocalPlayer__4.CharacterAdded:Connect(function(p72)
				p68:OnCharacterAdded(p72);
			end);
			p68.running = true;
		end;
		p68.touchJumpController = p71;
		if p68.touchJumpController then
			p68.touchJumpController:Enable(p68.jumpEnabled);
		end;
	else
		if p68.running then
			p68:DisconnectEvents();
			if u20 then
				u20:Cancel();
				u20 = nil;
			end;
			if u21 then
				u21:Disconnect();
				u21 = nil;
			end;
			if u22 then
				u22:Disconnect();
				u22 = nil;
			end;
			if l__UserInputService__28.TouchEnabled then
				local l__Character__103 = l__LocalPlayer__4.Character;
				if l__Character__103 then
					for v104, v105 in pairs(l__Character__103:GetChildren()) do
						if v105:IsA("Tool") then
							v105.ManualActivationOnly = false;
						end;
					end;
				end;
			end;
			p68.running = false;
		end;
		if p68.touchJumpController and not p68.jumpEnabled then
			p68.touchJumpController:Enable(true);
		end;
		p68.touchJumpController = nil;
	end;
	if l__UserInputService__28.KeyboardEnabled and p69 ~= p68.enabled then
		p68.forwardValue = 0;
		p68.backwardValue = 0;
		p68.leftValue = 0;
		p68.rightValue = 0;
		p68.moveVector = u11;
		if p69 then
			p68:BindContextActions();
			p68:ConnectFocusEventListeners();
		else
			p68:UnbindContextActions();
			p68:DisconnectFocusEventListeners();
		end;
	end;
	p68.wasdEnabled = p69 and p70 or false;
	p68.enabled = p69;
end;
function v87.OnRenderStepped(p73, p74)
	p73.isJumping = false;
	if u20 then
		u20:OnRenderStepped(p74);
		if u20 then
			p73.moveVector = u20.NextActionMoveDirection;
			p73.moveVectorIsCameraRelative = false;
			if u20.NextActionJump then
				p73.isJumping = true;
			end;
		else
			p73.moveVector = p73.keyboardMoveVector;
			p73.moveVectorIsCameraRelative = true;
		end;
	else
		p73.moveVector = p73.keyboardMoveVector;
		p73.moveVectorIsCameraRelative = true;
	end;
	if p73.jumpRequested then
		p73.isJumping = true;
	end;
end;
function v87.UpdateMovement(p75, p76)
	if p76 == Enum.UserInputState.Cancel then
		p75.keyboardMoveVector = u11;
		return;
	end;
	if p75.wasdEnabled then
		p75.keyboardMoveVector = Vector3.new(p75.leftValue + p75.rightValue, 0, p75.forwardValue + p75.backwardValue);
	end;
end;
function v87.UpdateJump(p77)

end;
function v87.SetShowPath(p78, p79)
	u17 = p79;
end;
function v87.GetShowPath(p80)
	return u17;
end;
function v87.SetWaypointTexture(p81, p82)
	u18.SetWaypointTexture(p82);
end;
function v87.GetWaypointTexture(p83)
	return u18.GetWaypointTexture();
end;
function v87.SetWaypointRadius(p84, p85)
	u18.SetWaypointRadius(p85);
end;
function v87.GetWaypointRadius(p86)
	return u18.GetWaypointRadius();
end;
function v87.SetEndWaypointTexture(p87, p88)
	u18.SetEndWaypointTexture(p88);
end;
function v87.GetEndWaypointTexture(p89)
	return u18.GetEndWaypointTexture();
end;
function v87.SetWaypointsAlwaysOnTop(p90, p91)
	u18.SetWaypointsAlwaysOnTop(p91);
end;
function v87.GetWaypointsAlwaysOnTop(p92)
	return u18.GetWaypointsAlwaysOnTop();
end;
function v87.SetFailureAnimationEnabled(p93, p94)
	u24 = p94;
end;
function v87.GetFailureAnimationEnabled(p95)
	return u24;
end;
local function u32(p96)
	if p96 == u5 then
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
	u5 = p96;
	u8 = { l__LocalPlayer__4 and l__LocalPlayer__4.Character };
	if u5 ~= nil then
		local v106, v107, v108 = ipairs((l__CollectionService__9:GetTagged(u5)));
		while true do
			v106(v107, v108);
			if not v106 then
				break;
			end;
			v108 = v106;
			table.insert(u8, v107);		
		end;
		u6 = l__CollectionService__9:GetInstanceAddedSignal(u5):Connect(function(p97)
			table.insert(u8, p97);
		end);
		u7 = l__CollectionService__9:GetInstanceRemovedSignal(u5):Connect(function(p98)
			for v109 = 1, #u8 do
				if u8[v109] == p98 then
					u8[v109] = u8[#u8];
					table.remove(u8);
					return;
				end;
			end;
		end);
	end;
end;
function v87.SetIgnoredPartsTag(p99, p100)
	u32(p100);
end;
function v87.GetIgnoredPartsTag(p101)
	return u5;
end;
function v87.SetUseDirectPath(p102, p103)
	u10 = p103;
end;
function v87.GetUseDirectPath(p104)
	return u10;
end;
function v87.SetAgentSizeIncreaseFactor(p105, p106)
	u12 = 1 + p106 / 100;
end;
function v87.GetAgentSizeIncreaseFactor(p107)
	return (u12 - 1) * 100;
end;
function v87.SetUnreachableWaypointTimeout(p108, p109)
	u19 = p109;
end;
function v87.GetUnreachableWaypointTimeout(p110)
	return u19;
end;
function v87.SetUserJumpEnabled(p111, p112)
	p111.jumpEnabled = p112;
	if p111.touchJumpController then
		p111.touchJumpController:Enable(p112);
	end;
end;
function v87.GetUserJumpEnabled(p113)
	return p113.jumpEnabled;
end;
function v87.MoveTo(p114, p115, p116, p117)
	local l__Character__110 = l__LocalPlayer__4.Character;
	if l__Character__110 == nil then
		return false;
	end;
	local v111 = u26(p115, Vector3.new(0, 1, 0), p117);
	if not v111 or not v111:IsValidPath() then
		return false;
	end;
	u27(v111, p115, nil, l__Character__110, p116);
	return true;
end;
return v87;
