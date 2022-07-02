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
		if v7 then
			local v11 = v7:FindFirstChildOfClass("Humanoid");
			if v11 then
				local v12 = v11;
			else
				local v13, v14 = u1(v7.Parent);
				v12 = v14;
			end;
		else
			v12 = nil;
		end;
		if v12 == nil then
			table.insert(p4, v7);
			return u3(p2, p3, p4);
		end;
	end;
	return v7, v8, v9, v10;
end;
v5.Raycast = u3;
u1 = {};
u3 = function(p5)
	local v15 = p5 and p5.Character;
	if not v15 then
		return;
	end;
	local v16 = u1[p5];
	if v16 and v16.Parent == v15 then
		return v16;
	end;
	u1[p5] = nil;
	local v17 = v15:FindFirstChildOfClass("Humanoid");
	if v17 then
		u1[p5] = v17;
	end;
	return v17;
end;
local l__LocalPlayer__4 = l__Players__3.LocalPlayer;
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
	local v18 = p6.PrimaryPart.CFrame:inverse();
	local v19 = Vector3.new(math.huge, math.huge, math.huge);
	local v20 = Vector3.new(-math.huge, -math.huge, -math.huge);
	for v21, v22 in pairs(p6:GetDescendants()) do
		if v22:IsA("BasePart") and v22.CanCollide then
			local v23 = v18 * v22.CFrame;
			local v24 = Vector3.new(v22.Size.X / 2, v22.Size.Y / 2, v22.Size.Z / 2);
			for v25, v26 in ipairs({ Vector3.new(v24.X, v24.Y, v24.Z), Vector3.new(v24.X, v24.Y, -v24.Z), Vector3.new(v24.X, -v24.Y, v24.Z), Vector3.new(v24.X, -v24.Y, -v24.Z), Vector3.new(-v24.X, v24.Y, v24.Z), Vector3.new(-v24.X, v24.Y, -v24.Z), Vector3.new(-v24.X, -v24.Y, v24.Z), Vector3.new(-v24.X, -v24.Y, -v24.Z) }) do
				local v27 = v23 * v26;
				v19 = Vector3.new(math.min(v19.X, v27.X), math.min(v19.Y, v27.Y), math.min(v19.Z, v27.Z));
				v20 = Vector3.new(math.max(v20.X, v27.X), math.max(v20.Y, v27.Y), math.max(v20.Z, v27.Z));
			end;
		end;
	end;
	local v28 = v20 - v19;
	if not (v28.X < 0) and not (v28.Y < 0) and not (v28.Z < 0) then
		return v28;
	end;
	return nil;
end;
local l__PathfindingService__15 = game:GetService("PathfindingService");
local u16 = true;
local u17 = require(script.Parent:WaitForChild("ClickToMoveDisplay"));
local u18 = 8;
local u19 = nil;
local u20 = nil;
local u21 = nil;
local function u22(p7)
	if p7 ~= nil then
		for v29, v30 in pairs(p7:GetChildren()) do
			if v30:IsA("Tool") then
				return v30;
			end;
		end;
	end;
end;
local u23 = true;
local l__StarterGui__24 = game:GetService("StarterGui");
local function u25(p8, p9, p10)
	local v31 = {};
	if p10 ~= nil then
		local v32 = p10;
		local v33 = p10;
	else
		v32 = u10;
		v33 = true;
	end;
	v31.Cancelled = false;
	v31.Started = false;
	v31.Finished = Instance.new("BindableEvent");
	v31.PathFailed = Instance.new("BindableEvent");
	v31.PathComputing = false;
	v31.PathComputed = false;
	v31.OriginalTargetPoint = p8;
	v31.TargetPoint = p8;
	v31.TargetSurfaceNormal = p9;
	v31.DiedConn = nil;
	v31.SeatedConn = nil;
	v31.BlockedConn = nil;
	v31.TeleportedConn = nil;
	v31.CurrentPoint = 0;
	v31.HumanoidOffsetFromPath = u11;
	v31.CurrentWaypointPosition = nil;
	v31.CurrentWaypointPlaneNormal = u11;
	v31.CurrentWaypointPlaneDistance = 0;
	v31.CurrentWaypointNeedsJump = false;
	v31.CurrentHumanoidPosition = u11;
	v31.CurrentHumanoidVelocity = 0;
	v31.NextActionMoveDirection = u11;
	v31.NextActionJump = false;
	v31.Timeout = 0;
	local v34 = l__LocalPlayer__4 and l__LocalPlayer__4.Character;
	if v34 then
		local v35 = u1[l__LocalPlayer__4];
		if v35 and v35.Parent == v34 then
			local v36 = v35;
		else
			u1[l__LocalPlayer__4] = nil;
			local v37 = v34:FindFirstChildOfClass("Humanoid");
			if v37 then
				u1[l__LocalPlayer__4] = v37;
			end;
			v36 = v37;
		end;
	else
		v36 = nil;
	end;
	v31.Humanoid = v36;
	v31.OriginPoint = nil;
	v31.AgentCanFollowPath = false;
	v31.DirectPath = false;
	v31.DirectPathRiseFirst = false;
	local v38 = v31.Humanoid and v31.Humanoid.RootPart;
	if v38 then
		v31.OriginPoint = v38.CFrame.Position;
		local v39 = 2;
		local v40 = 5;
		local v41 = true;
		local l__SeatPart__42 = v31.Humanoid.SeatPart;
		if l__SeatPart__42 and l__SeatPart__42:IsA("VehicleSeat") then
			local v43 = l__SeatPart__42:FindFirstAncestorOfClass("Model");
			if v43 then
				v43.PrimaryPart = l__SeatPart__42;
				if v33 then
					local v44 = v43:GetExtentsSize();
					v39 = u12 * 0.5 * math.sqrt(v44.X * v44.X + v44.Z * v44.Z);
					v40 = u12 * v44.Y;
					v41 = false;
					v31.AgentCanFollowPath = true;
					v31.DirectPath = v33;
				end;
				v43.PrimaryPart = v43.PrimaryPart;
			end;
		else
			local v45 = nil;
			if u13 then
				local v46 = l__LocalPlayer__4 and l__LocalPlayer__4.Character;
				if v46 ~= nil then
					v45 = u14(v46);
				end;
			end;
			if v45 == nil then
				v45 = (l__LocalPlayer__4 and l__LocalPlayer__4.Character):GetExtentsSize();
			end;
			v39 = u12 * 0.5 * math.sqrt(v45.X * v45.X + v45.Z * v45.Z);
			v40 = u12 * v45.Y;
			v41 = v31.Humanoid.JumpPower > 0;
			v31.AgentCanFollowPath = true;
			v31.DirectPath = v32;
			v31.DirectPathRiseFirst = v31.Humanoid.Sit;
		end;
		v31.pathResult = l__PathfindingService__15:CreatePath({
			AgentRadius = v39, 
			AgentHeight = v40, 
			AgentCanJump = v41
		});
	end;
	function v31.Cleanup(p11)
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
	function v31.Cancel(p12)
		v31.Cancelled = true;
		v31:Cleanup();
	end;
	function v31.IsActive(p13)
		return v31.AgentCanFollowPath and (v31.Started and not v31.Cancelled);
	end;
	function v31.OnPathInterrupted(p14)
		v31.Cancelled = true;
		v31:OnPointReached(false);
	end;
	function v31.ComputePath(p15)
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
					v31.BlockedConn = v31.pathResult.Blocked:Connect(function(p16)
						v31:OnPathBlocked(p16);
					end);
					v31.PathComputed = v31.pathResult.Status == Enum.PathStatus.Success;
				end;
			end;
			v31.PathComputing = false;
		end;
	end;
	function v31.IsValidPath(p17)
		v31:ComputePath();
		return v31.PathComputed and v31.AgentCanFollowPath;
	end;
	v31.Recomputing = false;
	function v31.OnPathBlocked(p18, p19)
		if not (v31.CurrentPoint <= p19) or v31.Recomputing then
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
		if u16 then
			local v47, v48 = u17.CreatePathDisplay(v31.pointList);
			v31.stopTraverseFunc = v47;
			v31.setPointFunc = v48;
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
	function v31.OnRenderStepped(p20, p21)
		if v31.Started and not v31.Cancelled then
			v31.Timeout = v31.Timeout + p21;
			if u18 < v31.Timeout then
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
					v31.NextActionMoveDirection = u11;
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
	function v31.IsCurrentWaypointReached(p22)
		if v31.CurrentWaypointPlaneNormal ~= u11 then
			local v49 = v31.CurrentWaypointPlaneNormal:Dot(v31.CurrentHumanoidPosition) - v31.CurrentWaypointPlaneDistance < math.max(1, 0.0625 * -v31.CurrentWaypointPlaneNormal:Dot(v31.CurrentHumanoidVelocity));
		else
			v49 = true;
		end;
		if v49 then
			v31.CurrentWaypointPosition = nil;
			v31.CurrentWaypointPlaneNormal = u11;
			v31.CurrentWaypointPlaneDistance = 0;
		end;
		return v49;
	end;
	function v31.OnPointReached(p23, p24)
		if not p24 or not (not v31.Cancelled) then
			v31.PathFailed:Fire();
			v31:Cleanup();
			return;
		end;
		if v31.setPointFunc then
			v31.setPointFunc(v31.CurrentPoint);
		end;
		local v50 = v31.CurrentPoint + 1;
		if #v31.pointList < v50 then
			if v31.stopTraverseFunc then
				v31.stopTraverseFunc();
			end;
			v31.Finished:Fire();
			v31:Cleanup();
			return;
		end;
		local v51 = v31.pointList[v31.CurrentPoint];
		local v52 = v31.pointList[v50];
		local v53 = v31.Humanoid:GetState();
		local v54 = true;
		if v53 ~= Enum.HumanoidStateType.FallingDown then
			v54 = true;
			if v53 ~= Enum.HumanoidStateType.Freefall then
				v54 = v53 == Enum.HumanoidStateType.Jumping;
			end;
		end;
		if v54 then
			local v55 = v52.Action == Enum.PathWaypointAction.Jump;
			if not v55 and v31.CurrentPoint > 1 then
				local v56 = v51.Position - v31.pointList[v31.CurrentPoint - 1].Position;
				local v57 = v52.Position - v51.Position;
				v55 = Vector2.new(v56.x, v56.z).Unit:Dot(Vector2.new(v57.x, v57.z).Unit) < 0.996;
			end;
			if v55 then
				v31.Humanoid.FreeFalling:Wait();
				wait(0.1);
			end;
		end;
		v31:MoveToNextWayPoint(v51, v52, v50);
	end;
	function v31.MoveToNextWayPoint(p25, p26, p27, p28)
		v31.CurrentWaypointPlaneNormal = p26.Position - p27.Position;
		v31.CurrentWaypointPlaneNormal = Vector3.new(v31.CurrentWaypointPlaneNormal.X, 0, v31.CurrentWaypointPlaneNormal.Z);
		if v31.CurrentWaypointPlaneNormal.Magnitude > 1E-06 then
			v31.CurrentWaypointPlaneNormal = v31.CurrentWaypointPlaneNormal.Unit;
			v31.CurrentWaypointPlaneDistance = v31.CurrentWaypointPlaneNormal:Dot(p27.Position);
		else
			v31.CurrentWaypointPlaneNormal = u11;
			v31.CurrentWaypointPlaneDistance = 0;
		end;
		v31.CurrentWaypointNeedsJump = p27.Action == Enum.PathWaypointAction.Jump;
		v31.CurrentWaypointPosition = p27.Position;
		v31.CurrentPoint = p28;
		v31.Timeout = 0;
	end;
	function v31.Start(p29, p30)
		if not v31.AgentCanFollowPath then
			v31.PathFailed:Fire();
			return;
		end;
		if v31.Started then
			return;
		end;
		v31.Started = true;
		u17.CancelFailureAnimation();
		if u16 and (p30 == nil or p30) then
			local v58, v59 = u17.CreatePathDisplay(v31.pointList, v31.OriginalTargetPoint);
			v31.stopTraverseFunc = v58;
			v31.setPointFunc = v59;
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
		v31.SeatedConn = v31.Humanoid.Seated:Connect(function(p31, p32)
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
	if u8 then
		local v60 = u8;
	else
		u8 = {};
		table.insert(u8, l__LocalPlayer__4 and l__LocalPlayer__4.Character);
		v60 = u8;
	end;
	local v61, v62 = l__Workspace__2:FindPartOnRayWithIgnoreList(Ray.new(v31.TargetPoint + v31.TargetSurfaceNormal * 1.5, Vector3.new(0, -1, 0) * 50), v60);
	if v61 then
		v31.TargetPoint = v62;
	end;
	v31:ComputePath();
	return v31;
end;
local function u26(p33, p34, p35, p36, p37)
	if u19 then
		if u19 then
			u19:Cancel();
			u19 = nil;
		end;
		if u20 then
			u20:Disconnect();
			u20 = nil;
		end;
		if u21 then
			u21:Disconnect();
			u21 = nil;
		end;
	end;
	u19 = p33;
	p33:Start(p37);
	u20 = p33.Finished.Event:Connect(function()
		if u19 then
			u19:Cancel();
			u19 = nil;
		end;
		if u20 then
			u20:Disconnect();
			u20 = nil;
		end;
		if u21 then
			u21:Disconnect();
			u21 = nil;
		end;
		if p35 then
			local v63 = u22(p36);
			if v63 then
				v63:Activate();
			end;
		end;
	end);
	u21 = p33.PathFailed.Event:Connect(function()
		if u19 then
			u19:Cancel();
			u19 = nil;
		end;
		if u20 then
			u20:Disconnect();
			u20 = nil;
		end;
		if u21 then
			u21:Disconnect();
			u21 = nil;
		end;
		if p37 == nil or p37 then
			if u23 and (not u19 or not u19:IsActive()) then
				u17.PlayFailureAnimation();
			end;
			u17.DisplayFailureWaypoint(p34);
		end;
	end);
end;
function OnTap(p38, p39, p40)
	local l__CurrentCamera__64 = l__Workspace__2.CurrentCamera;
	local l__Character__65 = l__LocalPlayer__4.Character;
	local v66 = l__LocalPlayer__4 and l__LocalPlayer__4.Character;
	if v66 then
		local v67 = u1[l__LocalPlayer__4];
		if v67 then
			if v67.Parent == v66 then
				local v68 = v67;
			else
				u1[l__LocalPlayer__4] = nil;
				local v69 = v66:FindFirstChildOfClass("Humanoid");
				if v69 then
					u1[l__LocalPlayer__4] = v69;
				end;
				v68 = v69;
			end;
		else
			u1[l__LocalPlayer__4] = nil;
			v69 = v66:FindFirstChildOfClass("Humanoid");
			if v69 then
				u1[l__LocalPlayer__4] = v69;
			end;
			v68 = v69;
		end;
	else
		v68 = nil;
	end;
	local v70 = false;
	if v68 ~= nil then
		v70 = 0 < v68.Health;
	end;
	if not v70 then
		return;
	end;
	if #p38 ~= 1 then
		if p39 then
			if l__CurrentCamera__64 then
				local v71 = l__CurrentCamera__64:ScreenPointToRay(p38[1].x, p38[1].y);
				local v72 = l__LocalPlayer__4 and l__LocalPlayer__4.Character;
				if v72 then
					local v73 = u1[l__LocalPlayer__4];
					if v73 then
						if v73.Parent == v72 then

						else
							u1[l__LocalPlayer__4] = nil;
							local v74 = v72:FindFirstChildOfClass("Humanoid");
							if v74 then
								u1[l__LocalPlayer__4] = v74;
							end;
						end;
					else
						u1[l__LocalPlayer__4] = nil;
						v74 = v72:FindFirstChildOfClass("Humanoid");
						if v74 then
							u1[l__LocalPlayer__4] = v74;
						end;
					end;
				end;
				if u8 then
					local v75 = u8;
				else
					u8 = {};
					table.insert(u8, l__LocalPlayer__4 and l__LocalPlayer__4.Character);
					v75 = u8;
				end;
				local v76, v77, v78 = v5.Raycast(Ray.new(v71.Origin, v71.Direction * 1000), true, v75);
				local v79, v80 = v5.FindCharacterAncestor(v76);
				if p40 then
					if v80 then
						if l__StarterGui__24:GetCore("AvatarContextMenuEnabled") then
							if l__Players__3:GetPlayerFromCharacter(v80.Parent) then
								if u19 then
									u19:Cancel();
									u19 = nil;
								end;
								if u20 then
									u20:Disconnect();
									u20 = nil;
								end;
								if u21 then
									u21:Disconnect();
									u21 = nil;
								end;
								return;
							end;
						end;
					end;
				end;
				if p39 then
					v77 = p39;
					v79 = nil;
				end;
				if v77 then
					if l__Character__65 then
						if u19 then
							u19:Cancel();
							u19 = nil;
						end;
						if u20 then
							u20:Disconnect();
							u20 = nil;
						end;
						if u21 then
							u21:Disconnect();
							u21 = nil;
						end;
						local v81 = u25(v77, v78);
						if v81:IsValidPath() then
							u26(v81, v77, v79, l__Character__65);
							return;
						else
							v81:Cleanup();
							if u19 then
								if u19:IsActive() then
									u19:Cancel();
								end;
							end;
							if u23 then
								u17.PlayFailureAnimation();
							end;
							u17.DisplayFailureWaypoint(v77);
							return;
						end;
					end;
				end;
			end;
		elseif 2 <= #p38 then
			if l__CurrentCamera__64 then
				local v82 = u22(l__Character__65);
				if v82 then
					v82:Activate();
				end;
			end;
		end;
	elseif l__CurrentCamera__64 then
		v71 = l__CurrentCamera__64:ScreenPointToRay(p38[1].x, p38[1].y);
		v72 = l__LocalPlayer__4 and l__LocalPlayer__4.Character;
		if v72 then
			v73 = u1[l__LocalPlayer__4];
			if v73 then
				if v73.Parent == v72 then

				else
					u1[l__LocalPlayer__4] = nil;
					v74 = v72:FindFirstChildOfClass("Humanoid");
					if v74 then
						u1[l__LocalPlayer__4] = v74;
					end;
				end;
			else
				u1[l__LocalPlayer__4] = nil;
				v74 = v72:FindFirstChildOfClass("Humanoid");
				if v74 then
					u1[l__LocalPlayer__4] = v74;
				end;
			end;
		end;
		if u8 then
			v75 = u8;
		else
			u8 = {};
			table.insert(u8, l__LocalPlayer__4 and l__LocalPlayer__4.Character);
			v75 = u8;
		end;
		v76, v77, v78 = v5.Raycast(Ray.new(v71.Origin, v71.Direction * 1000), true, v75);
		v79, v80 = v5.FindCharacterAncestor(v76);
		if p40 then
			if v80 then
				if l__StarterGui__24:GetCore("AvatarContextMenuEnabled") then
					if l__Players__3:GetPlayerFromCharacter(v80.Parent) then
						if u19 then
							u19:Cancel();
							u19 = nil;
						end;
						if u20 then
							u20:Disconnect();
							u20 = nil;
						end;
						if u21 then
							u21:Disconnect();
							u21 = nil;
						end;
						return;
					end;
				end;
			end;
		end;
		if p39 then
			v77 = p39;
			v79 = nil;
		end;
		if v77 then
			if l__Character__65 then
				if u19 then
					u19:Cancel();
					u19 = nil;
				end;
				if u20 then
					u20:Disconnect();
					u20 = nil;
				end;
				if u21 then
					u21:Disconnect();
					u21 = nil;
				end;
				v81 = u25(v77, v78);
				if v81:IsValidPath() then
					u26(v81, v77, v79, l__Character__65);
					return;
				else
					v81:Cleanup();
					if u19 then
						if u19:IsActive() then
							u19:Cancel();
						end;
					end;
					if u23 then
						u17.PlayFailureAnimation();
					end;
					u17.DisplayFailureWaypoint(v77);
					return;
				end;
			end;
		end;
	end;
end;
local v83 = require(script.Parent:WaitForChild("Keyboard"));
local v84 = setmetatable({}, v83);
v84.__index = v84;
function v84.new(p41)
	local v85 = setmetatable(v83.new(p41), v84);
	v85.fingerTouches = {};
	v85.numUnsunkTouches = 0;
	v85.mouse1Down = tick();
	v85.mouse1DownPos = Vector2.new();
	v85.mouse2DownTime = tick();
	v85.mouse2DownPos = Vector2.new();
	v85.mouse2UpTime = tick();
	v85.keyboardMoveVector = u11;
	v85.tapConn = nil;
	v85.inputBeganConn = nil;
	v85.inputChangedConn = nil;
	v85.inputEndedConn = nil;
	v85.humanoidDiedConn = nil;
	v85.characterChildAddedConn = nil;
	v85.onCharacterAddedConn = nil;
	v85.characterChildRemovedConn = nil;
	v85.renderSteppedConn = nil;
	v85.menuOpenedConnection = nil;
	v85.running = false;
	v85.wasdEnabled = false;
	return v85;
end;
function v84.DisconnectEvents(p42)
	local l__tapConn__86 = p42.tapConn;
	if l__tapConn__86 then
		l__tapConn__86:Disconnect();
	end;
	local l__inputBeganConn__87 = p42.inputBeganConn;
	if l__inputBeganConn__87 then
		l__inputBeganConn__87:Disconnect();
	end;
	local l__inputChangedConn__88 = p42.inputChangedConn;
	if l__inputChangedConn__88 then
		l__inputChangedConn__88:Disconnect();
	end;
	local l__inputEndedConn__89 = p42.inputEndedConn;
	if l__inputEndedConn__89 then
		l__inputEndedConn__89:Disconnect();
	end;
	local l__humanoidDiedConn__90 = p42.humanoidDiedConn;
	if l__humanoidDiedConn__90 then
		l__humanoidDiedConn__90:Disconnect();
	end;
	local l__characterChildAddedConn__91 = p42.characterChildAddedConn;
	if l__characterChildAddedConn__91 then
		l__characterChildAddedConn__91:Disconnect();
	end;
	local l__onCharacterAddedConn__92 = p42.onCharacterAddedConn;
	if l__onCharacterAddedConn__92 then
		l__onCharacterAddedConn__92:Disconnect();
	end;
	local l__renderSteppedConn__93 = p42.renderSteppedConn;
	if l__renderSteppedConn__93 then
		l__renderSteppedConn__93:Disconnect();
	end;
	local v94 = p42.characterChildRemovedConn;
	if v94 then
		v94:Disconnect();
	end;
	local l__menuOpenedConnection__95 = p42.menuOpenedConnection;
	if l__menuOpenedConnection__95 then
		l__menuOpenedConnection__95:Disconnect();
	end;
end;
function v84.OnTouchBegan(p43, p44, p45)
	if p43.fingerTouches[p44] == nil and not p45 then
		p43.numUnsunkTouches = p43.numUnsunkTouches + 1;
	end;
	p43.fingerTouches[p44] = p45;
end;
function v84.OnTouchChanged(p46, p47, p48)
	if p46.fingerTouches[p47] == nil then
		p46.fingerTouches[p47] = p48;
		if not p48 then
			p46.numUnsunkTouches = p46.numUnsunkTouches + 1;
		end;
	end;
end;
function v84.OnTouchEnded(p49, p50, p51)
	if p49.fingerTouches[p50] ~= nil and p49.fingerTouches[p50] == false then
		p49.numUnsunkTouches = p49.numUnsunkTouches - 1;
	end;
	p49.fingerTouches[p50] = nil;
end;
local l__UserInputService__27 = game:GetService("UserInputService");
local u28 = {
	[Enum.KeyCode.W] = true, 
	[Enum.KeyCode.A] = true, 
	[Enum.KeyCode.S] = true, 
	[Enum.KeyCode.D] = true, 
	[Enum.KeyCode.Up] = true, 
	[Enum.KeyCode.Down] = true
};
local l__GuiService__29 = game:GetService("GuiService");
function v84.OnCharacterAdded(p52, p53)
	p52:DisconnectEvents();
	p52.inputBeganConn = l__UserInputService__27.InputBegan:Connect(function(p54, p55)
		if p54.UserInputType == Enum.UserInputType.Touch then
			p52:OnTouchBegan(p54, p55);
		end;
		if p52.wasdEnabled and p55 == false and p54.UserInputType == Enum.UserInputType.Keyboard and u28[p54.KeyCode] then
			if u19 then
				u19:Cancel();
				u19 = nil;
			end;
			if u20 then
				u20:Disconnect();
				u20 = nil;
			end;
			if u21 then
				u21:Disconnect();
				u21 = nil;
			end;
			u17.CancelFailureAnimation();
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
	p52.inputChangedConn = l__UserInputService__27.InputChanged:Connect(function(p56, p57)
		if p56.UserInputType == Enum.UserInputType.Touch then
			p52:OnTouchChanged(p56, p57);
		end;
	end);
	p52.inputEndedConn = l__UserInputService__27.InputEnded:Connect(function(p58, p59)
		if p58.UserInputType == Enum.UserInputType.Touch then
			p52:OnTouchEnded(p58, p59);
		end;
		if p58.UserInputType == Enum.UserInputType.MouseButton2 then
			p52.mouse2UpTime = tick();
			local l__Position__96 = p58.Position;
			if p52.mouse2UpTime - p52.mouse2DownTime < 0.25 and (l__Position__96 - p52.mouse2DownPos).magnitude < 5 and (u19 or p52.keyboardMoveVector.Magnitude <= 0) then
				OnTap({ l__Position__96 });
			end;
		end;
	end);
	p52.tapConn = l__UserInputService__27.TouchTap:Connect(function(p60, p61)
		if not p61 then
			OnTap(p60, nil, true);
		end;
	end);
	p52.menuOpenedConnection = l__GuiService__29.MenuOpened:Connect(function()
		if u19 then
			u19:Cancel();
			u19 = nil;
		end;
		if u20 then
			u20:Disconnect();
			u20 = nil;
		end;
		if u21 then
			u21:Disconnect();
			u21 = nil;
		end;
	end);
	local function u30(p62)
		if l__UserInputService__27.TouchEnabled and p62:IsA("Tool") then
			p62.ManualActivationOnly = true;
		end;
		if p62:IsA("Humanoid") then
			local l__humanoidDiedConn__97 = p52.humanoidDiedConn;
			if l__humanoidDiedConn__97 then
				l__humanoidDiedConn__97:Disconnect();
			end;
			p52.humanoidDiedConn = p62.Died:Connect(function()

			end);
		end;
	end;
	p52.characterChildAddedConn = p53.ChildAdded:Connect(function(p63)
		u30(p63);
	end);
	p52.characterChildRemovedConn = p53.ChildRemoved:Connect(function(p64)
		if l__UserInputService__27.TouchEnabled and p64:IsA("Tool") then
			p64.ManualActivationOnly = false;
		end;
	end);
	for v98, v99 in pairs(p53:GetChildren()) do
		u30(v99);
	end;
end;
function v84.Start(p65)
	p65:Enable(true);
end;
function v84.Stop(p66)
	p66:Enable(false);
end;
function v84.CleanupPath(p67)
	if u19 then
		u19:Cancel();
		u19 = nil;
	end;
	if u20 then
		u20:Disconnect();
		u20 = nil;
	end;
	if u21 then
		u21:Disconnect();
		u21 = nil;
	end;
end;
function v84.Enable(p68, p69, p70, p71)
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
			if u19 then
				u19:Cancel();
				u19 = nil;
			end;
			if u20 then
				u20:Disconnect();
				u20 = nil;
			end;
			if u21 then
				u21:Disconnect();
				u21 = nil;
			end;
			if l__UserInputService__27.TouchEnabled then
				local l__Character__100 = l__LocalPlayer__4.Character;
				if l__Character__100 then
					for v101, v102 in pairs(l__Character__100:GetChildren()) do
						if v102:IsA("Tool") then
							v102.ManualActivationOnly = false;
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
	if l__UserInputService__27.KeyboardEnabled and p69 ~= p68.enabled then
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
function v84.OnRenderStepped(p73, p74)
	p73.isJumping = false;
	if u19 then
		u19:OnRenderStepped(p74);
		if u19 then
			p73.moveVector = u19.NextActionMoveDirection;
			p73.moveVectorIsCameraRelative = false;
			if u19.NextActionJump then
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
function v84.UpdateMovement(p75, p76)
	if p76 == Enum.UserInputState.Cancel then
		p75.keyboardMoveVector = u11;
		return;
	end;
	if p75.wasdEnabled then
		p75.keyboardMoveVector = Vector3.new(p75.leftValue + p75.rightValue, 0, p75.forwardValue + p75.backwardValue);
	end;
end;
function v84.UpdateJump(p77)

end;
function v84.SetShowPath(p78, p79)
	u16 = p79;
end;
function v84.GetShowPath(p80)
	return u16;
end;
function v84.SetWaypointTexture(p81, p82)
	u17.SetWaypointTexture(p82);
end;
function v84.GetWaypointTexture(p83)
	return u17.GetWaypointTexture();
end;
function v84.SetWaypointRadius(p84, p85)
	u17.SetWaypointRadius(p85);
end;
function v84.GetWaypointRadius(p86)
	return u17.GetWaypointRadius();
end;
function v84.SetEndWaypointTexture(p87, p88)
	u17.SetEndWaypointTexture(p88);
end;
function v84.GetEndWaypointTexture(p89)
	return u17.GetEndWaypointTexture();
end;
function v84.SetWaypointsAlwaysOnTop(p90, p91)
	u17.SetWaypointsAlwaysOnTop(p91);
end;
function v84.GetWaypointsAlwaysOnTop(p92)
	return u17.GetWaypointsAlwaysOnTop();
end;
function v84.SetFailureAnimationEnabled(p93, p94)
	u23 = p94;
end;
function v84.GetFailureAnimationEnabled(p95)
	return u23;
end;
local function u31(p96)
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
		for v103, v104 in ipairs((l__CollectionService__9:GetTagged(u5))) do
			table.insert(u8, v104);
		end;
		u6 = l__CollectionService__9:GetInstanceAddedSignal(u5):Connect(function(p97)
			table.insert(u8, p97);
		end);
		u7 = l__CollectionService__9:GetInstanceRemovedSignal(u5):Connect(function(p98)
			for v105 = 1, #u8 do
				if u8[v105] == p98 then
					u8[v105] = u8[#u8];
					table.remove(u8);
					return;
				end;
			end;
		end);
	end;
end;
function v84.SetIgnoredPartsTag(p99, p100)
	u31(p100);
end;
function v84.GetIgnoredPartsTag(p101)
	return u5;
end;
function v84.SetUseDirectPath(p102, p103)
	u10 = p103;
end;
function v84.GetUseDirectPath(p104)
	return u10;
end;
function v84.SetAgentSizeIncreaseFactor(p105, p106)
	u12 = 1 + p106 / 100;
end;
function v84.GetAgentSizeIncreaseFactor(p107)
	return (u12 - 1) * 100;
end;
function v84.SetUnreachableWaypointTimeout(p108, p109)
	u18 = p109;
end;
function v84.GetUnreachableWaypointTimeout(p110)
	return u18;
end;
function v84.SetUserJumpEnabled(p111, p112)
	p111.jumpEnabled = p112;
	if p111.touchJumpController then
		p111.touchJumpController:Enable(p112);
	end;
end;
function v84.GetUserJumpEnabled(p113)
	return p113.jumpEnabled;
end;
function v84.MoveTo(p114, p115, p116, p117)
	local l__Character__106 = l__LocalPlayer__4.Character;
	if l__Character__106 == nil then
		return false;
	end;
	local v107 = u25(p115, Vector3.new(0, 1, 0), p117);
	if not v107 or not v107:IsValidPath() then
		return false;
	end;
	u26(v107, p115, nil, l__Character__106, p116);
	return true;
end;
return v84;
