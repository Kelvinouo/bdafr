-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "helicopter", "helicopter-missile");
local l__VehicleClient__4 = v1.import(script, script.Parent.Parent, "vehicle-client").VehicleClient;
local v5 = { CFrame.new(-2, 0, 0), CFrame.new(0, 0, 0), CFrame.new(2, 0, 0) };
local v6 = setmetatable({}, {
	__tostring = function()
		return "HelicopterPilotClient";
	end, 
	__index = l__VehicleClient__4
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "pid");
local l__Workspace__3 = v2.Workspace;
local l__Players__4 = v2.Players;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__SoundService__6 = v2.SoundService;
local l__RunService__7 = v2.RunService;
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "player-control-module");
local l__PlaceUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__ContextActionService__10 = v2.ContextActionService;
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__HelicopterUi__12 = v1.import(script, script.Parent, "helicopter-ui").HelicopterUi;
function v6.constructor(p1, p2, p3)
	l__VehicleClient__4.constructor(p1, p2);
	p1.maid = u1.new();
	p1.pitchPid = u2.new(-5, 5, 0.04, 0, 0.03);
	p1.yawPid = u2.new(-10, 10, 0.009, 0, 0);
	p1.rollPid = u2.new(-10, 10, 0.07, 0, 0);
	p1.counterDriftPid = u2.new(-50, 50, 25, 0, 1);
	p1.levitationPid = u2.new(-400, 400, 20, 30, 0);
	p1.movePid = u2.new(-30, 30, 4, 0.5, 0);
	p1.heightGoal = 0;
	p1.holdingUp = false;
	p1.holdingDown = false;
	p1.entryTime = l__Workspace__3:GetServerTimeNow();
	p1.enginePowerScale = 0.6;
	p1.maid = u1.new();
	local l__Character__8 = l__Players__4.LocalPlayer.Character;
	if not l__Character__8 then
		return nil;
	end;
	if not l__Character__8:FindFirstChild("Humanoid") then
		return nil;
	end;
	local l__Root__9 = p2:FindFirstChild("Root");
	if not l__Root__9 then
		return nil;
	end;
	if l__Workspace__3.CurrentCamera then
		l__Workspace__3.CurrentCamera.CameraSubject = l__Root__9;
		l__Players__4.LocalPlayer.CameraMaxZoomDistance = 20;
		l__Players__4.LocalPlayer.CameraMinZoomDistance = 20;
		p1.maid:GiveTask(function()
			l__Players__4.LocalPlayer.CameraMaxZoomDistance = 14;
			l__Players__4.LocalPlayer.CameraMinZoomDistance = 0;
			local v10 = l__Players__4.LocalPlayer.Character;
			if v10 ~= nil then
				v10 = v10:FindFirstChild("Humanoid");
			end;
			l__Workspace__3.CurrentCamera.CameraSubject = v10;
		end);
	end;
	local u13 = u5("Attachment", {
		Parent = l__Root__9
	});
	p1.maid:GiveTask(function()
		u13:Destroy();
	end);
	p1.angularVelocity = u5("AngularVelocity", {
		RelativeTo = Enum.ActuatorRelativeTo.Attachment0, 
		MaxTorque = math.huge, 
		Attachment0 = u13, 
		Parent = l__Root__9
	});
	p1.maid:GiveTask(function()
		p1.angularVelocity:Destroy();
	end);
	p1.worldSpaceForce = u5("VectorForce", {
		Name = "WorldSpaceForce", 
		RelativeTo = Enum.ActuatorRelativeTo.World, 
		ApplyAtCenterOfMass = true, 
		Attachment0 = u13, 
		Parent = p2
	});
	p1.maid:GiveTask(function()
		p1.worldSpaceForce:Destroy();
	end);
	p1.localSpaceForce = u5("VectorForce", {
		Name = "LocalSpaceForce", 
		RelativeTo = Enum.ActuatorRelativeTo.Attachment0, 
		ApplyAtCenterOfMass = true, 
		Attachment0 = u13, 
		Parent = l__Root__9
	});
	p1.maid:GiveTask(function()
		p1.localSpaceForce:Destroy();
	end);
	p1.levitationPid:Debug("LevitationPID", l__Workspace__3);
	p1.counterDriftPid:Debug("CounterDriftPID", l__Workspace__3);
	p1.pitchPid:Debug("PitchPID", l__Workspace__3);
	p1.rollPid:Debug("RollPID", l__Workspace__3);
	p1.movePid:Debug("MovePID", l__Workspace__3);
	p1.yawPid:Debug("YawPID", l__Workspace__3);
	p1.maid:GiveTask(p1.levitationPid);
	p1.maid:GiveTask(p1.counterDriftPid);
	p1.maid:GiveTask(p1.pitchPid);
	p1.maid:GiveTask(p1.rollPid);
	p1.maid:GiveTask(p1.movePid);
	p1.maid:GiveTask(p1.yawPid);
	p1.windSound = u5("Sound", {
		Name = "WindSound", 
		SoundId = "rbxassetid://" .. tostring(7910583431), 
		Looped = true, 
		Playing = true, 
		Volume = 0.25, 
		Parent = l__SoundService__6
	});
	p1.heightGoal = l__Root__9.Position.Y;
	p1.maid:GiveTask(l__RunService__7.Stepped:Connect(function(p4, p5)
		local l__CFrame__11 = l__Root__9.CFrame;
		local l__Position__12 = l__CFrame__11.Position;
		local v13 = l__CFrame__11:VectorToObjectSpace(l__Root__9.AssemblyLinearVelocity);
		local v14, v15, v16 = l__CFrame__11:ToOrientation();
		local v17 = u8:GetMoveVector();
		local l__LookVector__18 = l__CFrame__11.LookVector;
		local v19 = math.atan2(l__LookVector__18.Z, l__LookVector__18.X);
		local v20 = l__Root__9.AssemblyLinearVelocity * Vector3.new(1, 0, 1);
		local v21 = v20.Magnitude * -math.sign(l__CFrame__11:VectorToObjectSpace(v20).X);
		local v22 = CFrame.lookAt(l__Position__12, (l__CFrame__11 * CFrame.new(-v17.X, 0, 0)).Position);
		local v23 = 0;
		if p1.holdingUp and not p1.holdingDown then
			v23 = 10;
		elseif p1.holdingDown and not p1.holdingUp then
			v23 = -9;
		end;
		if l__PlaceUtil__9.isGameServer() then
			local v24 = math.clamp(p1.heightGoal + v23 * p5, -50, 200);
		else
			v24 = p1.heightGoal + v23 * p5;
		end;
		p1.heightGoal = v24;
		local v25 = p1.levitationPid:Calculate(p5, p1.heightGoal + (0.7 * math.sin(os.clock()) + 0), l__Position__12.Y);
		local v26 = p1.counterDriftPid:Calculate(p5, 0, v13.Z);
		local v27 = p1.pitchPid:Calculate(p5, 15 * -v17.Z, math.deg(v16));
		local v28 = 0;
		local v29 = math.acos(l__LookVector__18:Dot(v22.LookVector)) * -math.round(math.clamp(l__LookVector__18:Cross(v22.LookVector).Y, -1, 1));
		if v29 == v29 then
			local v30 = v29;
		else
			v30 = 0;
		end;
		local v31 = v17.Magnitude > 0.05;
		if v31 then
			local v32 = math.deg(v19 + v30);
			if math.abs(v17.X) > 0.1 then
				local v33 = v32;
			else
				v33 = math.deg(v19);
			end;
			v28 = p1.yawPid:Calculate(p5, v33, math.deg(v19));
		end;
		if v31 then
			local v34 = -math.pi;
			local v35 = -1 + 2 * ((v30 - v34) / (math.pi - v34));
		else
			v35 = 0;
		end;
		local v36 = p1.rollPid:Calculate(p5, 25 * v35, math.deg(v14));
		local v37 = p1.movePid:Calculate(p5, -36 + 76 * ((-v17.Z - -0.9) / 1.9), v21);
		local v38 = 0 + 0.5 * ((math.abs(v21) - 0) / 40);
		if p1.windSound then
			p1.windSound.Volume = v38;
		end;
		if p1.holdingUp and not p1.holdingDown then
			p1.enginePowerScale = p1.enginePowerScale + p5 * 0.4;
		elseif p1.holdingDown and not p1.holdingDown then
			p1.enginePowerScale = p1.enginePowerScale - p5 * 0.3;
		else
			p1.enginePowerScale = p1.enginePowerScale - p5 * 0.3;
		end;
		p1.enginePowerScale = math.clamp(p1.enginePowerScale, 0.6, 1);
		p1:setEnginePowerRatio(p1.enginePowerScale);
		if p2:GetAttribute("Dead") == true then
			p1.worldSpaceForce.Force = Vector3.new(0, 0, 0);
			p1.localSpaceForce.Force = Vector3.new(0, 0, 0);
			p1.angularVelocity.AngularVelocity = Vector3.new(0, 0, 0);
			return;
		end;
		local l__AssemblyMass__39 = l__Root__9.AssemblyMass;
		p1.worldSpaceForce.Force = Vector3.new(0, v25 * l__AssemblyMass__39 * math.clamp((l__Workspace__3:GetServerTimeNow() - p1.entryTime) / 1, 0, 1), 0);
		p1.localSpaceForce.Force = Vector3.new(-v37 * l__AssemblyMass__39, 0, v26 * l__AssemblyMass__39);
		p1.angularVelocity.AngularVelocity = Vector3.new(v36, v28, v27);
	end));
	l__ContextActionService__10:BindActionAtPriority("helicopter-up", function(p6, p7, p8)
		if p7 == Enum.UserInputState.Begin then
			p1.holdingUp = true;
			return;
		end;
		if p7 == Enum.UserInputState.End then
			p1.holdingUp = false;
		end;
	end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.E, Enum.KeyCode.ButtonR2);
	p1.maid:GiveTask(function()
		l__ContextActionService__10:UnbindAction("helicopter-up");
	end);
	l__ContextActionService__10:BindActionAtPriority("helicopter-down", function(p9, p10, p11)
		if p10 == Enum.UserInputState.Begin then
			p1.holdingDown = true;
			return;
		end;
		if p10 == Enum.UserInputState.End then
			p1.holdingDown = false;
		end;
	end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Q, Enum.KeyCode.ButtonL2);
	p1.maid:GiveTask(function()
		l__ContextActionService__10:UnbindAction("helicopter-down");
	end);
	if p3 then
		p1:setupAttackHeli(p2, l__Root__9);
	end;
	local u14 = u11.mount(u11.createElement("ScreenGui", {
		ResetOnSpawn = false
	}, { u11.createElement(l__HelicopterUi__12, {
			upChanged = function(p12)
				p1.holdingUp = p12;
			end, 
			downChanged = function(p13)
				p1.holdingDown = p13;
			end, 
			vehicleModel = p2
		}) }), l__Players__4.LocalPlayer:WaitForChild("PlayerGui"));
	p1.maid:GiveTask(function()
		u11.unmount(u14);
	end);
end;
local l__HelicopterMissile__15 = v3.HelicopterMissile;
local l__default__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__MISSILE_FIRE_RATE__17 = v3.MISSILE_FIRE_RATE;
local l__ClientSyncEvents__18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__SyncEventPriority__19 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).SyncEventPriority;
function v6.setupAttackHeli(p14, p15, p16)
	local u20 = Random.new();
	local u21 = 0;
	local function u22()
		if u20:NextNumber() < 0.5 then
			local v40 = -1;
		else
			v40 = 1;
		end;
		local v41 = p16.CFrame * CFrame.Angles(0, math.pi / 2, 0) * CFrame.new(u20:NextNumber(2.5, 6) * v40, -3, -2);
		local l__Position__42 = v41.Position;
		local l__LookVector__43 = v41.LookVector;
		l__HelicopterMissile__15.new(l__Position__42, l__LookVector__43, l__Players__4.LocalPlayer):fire(0, function()

		end);
		l__default__16.Client:GetNamespace("Helicopter"):Get("FireMissile"):SendToServer(l__Position__42, l__LookVector__43);
	end;
	local u23 = nil;
	local function u24()
		local v44 = time();
		if v44 - u21 < l__MISSILE_FIRE_RATE__17 then
			return nil;
		end;
		if not p15:GetAttribute("Dead") and not (p15:GetAttribute("AttackEnergy") <= 0) then
			u21 = v44;
			u22();
			return;
		end;
		return nil;
	end;
	l__ContextActionService__10:BindActionAtPriority("helicopter-attack", function(p17, p18, p19)
		if p18 == Enum.UserInputState.Begin then
			if not u23 then
				u23 = l__RunService__7.Heartbeat:Connect(u24);
				return;
			end;
		elseif p18 == Enum.UserInputState.End and u23 then
			u23:Disconnect();
			u23 = nil;
		end;
	end, false, Enum.ContextActionPriority.High.Value, Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonX);
	p14.maid:GiveTask(l__ClientSyncEvents__18.MobileSwordButtonPressed:setPriority(l__SyncEventPriority__19.HIGH):connect(function(p20)
		p20:setCancelled(true);
		if p20.state == "down" then
			if u23 then
				return;
			end;
		else
			if u23 then
				u23:Disconnect();
				u23 = nil;
			end;
			return;
		end;
		u23 = l__RunService__7.Heartbeat:Connect(u24);
	end));
	p14.maid:GiveTask(function()
		l__ContextActionService__10:UnbindAction("helicopter-attack");
		if u23 then
			u23:Disconnect();
		end;
	end);
end;
function v6.onDisable(p21)
	p21.maid:DoCleaning();
	local l__hoverSound__45 = p21.hoverSound;
	if l__hoverSound__45 ~= nil then
		l__hoverSound__45:Destroy();
	end;
	local l__windSound__46 = p21.windSound;
	if l__windSound__46 ~= nil then
		l__windSound__46:Destroy();
	end;
end;
return {
	HelicopterPilotClient = v6
};
