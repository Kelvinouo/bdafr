-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = { CFrame.new(-2, 0, 0), CFrame.new(0, 0, 0), CFrame.new(2, 0, 0) };
local l__VehicleClient__4 = v1.import(script, script.Parent.Parent, "vehicle-client").VehicleClient;
local v5 = setmetatable({}, {
	__tostring = function()
		return "HelicopterPilotClient";
	end, 
	__index = l__VehicleClient__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__VehicleClient__4;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "pid");
local l__Workspace__4 = v2.Workspace;
local l__Players__5 = v2.Players;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__SoundService__7 = v2.SoundService;
local l__RunService__8 = v2.RunService;
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "player-control-module");
local l__PlaceUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__ContextActionService__11 = v2.ContextActionService;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__HelicopterUi__13 = v1.import(script, script.Parent, "helicopter-ui").HelicopterUi;
function v5.constructor(p1, p2)
	u1.constructor(p1, p2);
	p1.maid = u2.new();
	p1.pitchPid = u3.new(-5, 5, 0.04, 0, 0.03);
	p1.yawPid = u3.new(-10, 10, 0.009, 0, 0);
	p1.rollPid = u3.new(-10, 10, 0.07, 0, 0);
	p1.counterDriftPid = u3.new(-50, 50, 25, 0, 1);
	p1.levitationPid = u3.new(-400, 400, 20, 30, 0);
	p1.movePid = u3.new(-30, 30, 4, 0.5, 0);
	p1.heightGoal = 0;
	p1.holdingUp = false;
	p1.holdingDown = false;
	p1.entryTime = l__Workspace__4:GetServerTimeNow();
	p1.enginePowerScale = 0.6;
	p1.maid = u2.new();
	local l__Character__7 = l__Players__5.LocalPlayer.Character;
	if not l__Character__7 then
		return nil;
	end;
	if not l__Character__7:FindFirstChild("Humanoid") then
		return nil;
	end;
	local l__Root__8 = p2:FindFirstChild("Root");
	if not l__Root__8 then
		return nil;
	end;
	if l__Workspace__4.CurrentCamera then
		l__Workspace__4.CurrentCamera.CameraSubject = l__Root__8;
		l__Players__5.LocalPlayer.CameraMaxZoomDistance = 20;
		l__Players__5.LocalPlayer.CameraMinZoomDistance = 20;
		p1.maid:GiveTask(function()
			l__Players__5.LocalPlayer.CameraMaxZoomDistance = 14;
			l__Players__5.LocalPlayer.CameraMinZoomDistance = 0;
			local v9 = l__Players__5.LocalPlayer.Character;
			if v9 ~= nil then
				v9 = v9:FindFirstChild("Humanoid");
			end;
			l__Workspace__4.CurrentCamera.CameraSubject = v9;
		end);
	end;
	local u14 = u6("Attachment", {
		Parent = l__Root__8
	});
	p1.maid:GiveTask(function()
		u14:Destroy();
	end);
	p1.angularVelocity = u6("AngularVelocity", {
		RelativeTo = Enum.ActuatorRelativeTo.Attachment0, 
		MaxTorque = math.huge, 
		Attachment0 = u14, 
		Parent = l__Root__8
	});
	p1.maid:GiveTask(function()
		p1.angularVelocity:Destroy();
	end);
	p1.worldSpaceForce = u6("VectorForce", {
		Name = "WorldSpaceForce", 
		RelativeTo = Enum.ActuatorRelativeTo.World, 
		ApplyAtCenterOfMass = true, 
		Attachment0 = u14, 
		Parent = p2
	});
	p1.maid:GiveTask(function()
		p1.worldSpaceForce:Destroy();
	end);
	p1.localSpaceForce = u6("VectorForce", {
		Name = "LocalSpaceForce", 
		RelativeTo = Enum.ActuatorRelativeTo.Attachment0, 
		ApplyAtCenterOfMass = true, 
		Attachment0 = u14, 
		Parent = l__Root__8
	});
	p1.maid:GiveTask(function()
		p1.localSpaceForce:Destroy();
	end);
	p1.levitationPid:Debug("LevitationPID", l__Workspace__4);
	p1.counterDriftPid:Debug("CounterDriftPID", l__Workspace__4);
	p1.pitchPid:Debug("PitchPID", l__Workspace__4);
	p1.rollPid:Debug("RollPID", l__Workspace__4);
	p1.movePid:Debug("MovePID", l__Workspace__4);
	p1.yawPid:Debug("YawPID", l__Workspace__4);
	p1.windSound = u6("Sound", {
		Name = "WindSound", 
		SoundId = "rbxassetid://" .. tostring(7910583431), 
		Looped = true, 
		Playing = true, 
		Volume = 0.25, 
		Parent = l__SoundService__7
	});
	p1.heightGoal = l__Root__8.Position.Y;
	p1.maid:GiveTask(l__RunService__8.Stepped:Connect(function(p3, p4)
		local l__CFrame__10 = l__Root__8.CFrame;
		local l__Position__11 = l__CFrame__10.Position;
		local v12 = l__CFrame__10:VectorToObjectSpace(l__Root__8.AssemblyLinearVelocity);
		local v13, v14, v15 = l__CFrame__10:ToOrientation();
		local v16 = u9:GetMoveVector();
		local l__LookVector__17 = l__CFrame__10.LookVector;
		local v18 = math.atan2(l__LookVector__17.Z, l__LookVector__17.X);
		local v19 = l__Root__8.AssemblyLinearVelocity * Vector3.new(1, 0, 1);
		local v20 = v19.Magnitude * -math.sign(l__CFrame__10:VectorToObjectSpace(v19).X);
		local v21 = CFrame.lookAt(l__Position__11, (l__CFrame__10 * CFrame.new(-v16.X, 0, 0)).Position);
		local v22 = 0;
		if p1.holdingUp and not p1.holdingDown then
			v22 = 10;
		elseif p1.holdingDown and not p1.holdingUp then
			v22 = -9;
		end;
		if l__PlaceUtil__10.isGameServer() then
			local v23 = math.clamp(p1.heightGoal + v22 * p4, -50, 200);
		else
			v23 = p1.heightGoal + v22 * p4;
		end;
		p1.heightGoal = v23;
		local v24 = p1.levitationPid:Calculate(p4, p1.heightGoal + (0.7 * math.sin(os.clock()) + 0), l__Position__11.Y);
		local v25 = p1.counterDriftPid:Calculate(p4, 0, v12.Z);
		local v26 = p1.pitchPid:Calculate(p4, 15 * -v16.Z, math.deg(v15));
		local v27 = 0;
		local v28 = math.acos(l__LookVector__17:Dot(v21.LookVector)) * -math.round(math.clamp(l__LookVector__17:Cross(v21.LookVector).Y, -1, 1));
		if v28 == v28 then
			local v29 = v28;
		else
			v29 = 0;
		end;
		local v30 = v16.Magnitude > 0.05;
		if v30 then
			local v31 = math.deg(v18 + v29);
			if math.abs(v16.X) > 0.1 then
				local v32 = v31;
			else
				v32 = math.deg(v18);
			end;
			v27 = p1.yawPid:Calculate(p4, v32, math.deg(v18));
		end;
		if v30 then
			local v33 = -math.pi;
			local v34 = -1 + 2 * ((v29 - v33) / (math.pi - v33));
		else
			v34 = 0;
		end;
		local v35 = p1.rollPid:Calculate(p4, 25 * v34, math.deg(v13));
		local v36 = p1.movePid:Calculate(p4, -36 + 76 * ((-v16.Z - -0.9) / 1.9), v20);
		local v37 = 0 + 0.5 * ((math.abs(v20) - 0) / 40);
		if p1.windSound then
			p1.windSound.Volume = v37;
		end;
		if p1.holdingUp and not p1.holdingDown then
			p1.enginePowerScale = p1.enginePowerScale + p4 * 0.4;
		elseif p1.holdingDown and not p1.holdingDown then
			p1.enginePowerScale = p1.enginePowerScale - p4 * 0.3;
		else
			p1.enginePowerScale = p1.enginePowerScale - p4 * 0.3;
		end;
		p1.enginePowerScale = math.clamp(p1.enginePowerScale, 0.6, 1);
		p1:setEnginePowerRatio(p1.enginePowerScale);
		if p2:GetAttribute("Dead") == true then
			p1.worldSpaceForce.Force = Vector3.new(0, 0, 0);
			p1.localSpaceForce.Force = Vector3.new(0, 0, 0);
			p1.angularVelocity.AngularVelocity = Vector3.new(0, 0, 0);
			return;
		end;
		local l__AssemblyMass__38 = l__Root__8.AssemblyMass;
		p1.worldSpaceForce.Force = Vector3.new(0, v24 * l__AssemblyMass__38 * math.clamp((l__Workspace__4:GetServerTimeNow() - p1.entryTime) / 1, 0, 1), 0);
		p1.localSpaceForce.Force = Vector3.new(-v36 * l__AssemblyMass__38, 0, v25 * l__AssemblyMass__38);
		p1.angularVelocity.AngularVelocity = Vector3.new(v35, v27, v26);
	end));
	l__ContextActionService__11:BindActionAtPriority("helicopter-up", function(p5, p6, p7)
		if p6 == Enum.UserInputState.Begin then
			p1.holdingUp = true;
			return;
		end;
		if p6 == Enum.UserInputState.End then
			p1.holdingUp = false;
		end;
	end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.E, Enum.KeyCode.ButtonR2);
	p1.maid:GiveTask(function()
		l__ContextActionService__11:UnbindAction("helicopter-up");
	end);
	l__ContextActionService__11:BindActionAtPriority("helicopter-down", function(p8, p9, p10)
		if p9 == Enum.UserInputState.Begin then
			p1.holdingDown = true;
			return;
		end;
		if p9 == Enum.UserInputState.End then
			p1.holdingDown = false;
		end;
	end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Q, Enum.KeyCode.ButtonL2);
	p1.maid:GiveTask(function()
		l__ContextActionService__11:UnbindAction("helicopter-down");
	end);
	local u15 = u12.mount(u12.createElement("ScreenGui", {
		ResetOnSpawn = false
	}, { u12.createElement(l__HelicopterUi__13, {
			upChanged = function(p11)
				p1.holdingUp = p11;
			end, 
			downChanged = function(p12)
				p1.holdingDown = p12;
			end, 
			vehicleModel = p2
		}) }), l__Players__5.LocalPlayer:WaitForChild("PlayerGui"));
	p1.maid:GiveTask(function()
		u12.unmount(u15);
	end);
end;
function v5.onDisable(p13)
	p13.maid:DoCleaning();
	local l__hoverSound__39 = p13.hoverSound;
	if l__hoverSound__39 ~= nil then
		l__hoverSound__39:Destroy();
	end;
	local l__windSound__40 = p13.windSound;
	if l__windSound__40 ~= nil then
		l__windSound__40:Destroy();
	end;
end;
u1 = {
	HelicopterPilotClient = v5
};
return l__VehicleClient__4;
