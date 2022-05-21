-- Script Hash: 8773115d71fd448bbe0daccbc761b6593f27e5ad9fe1700e01693e1d8daca154b7c27a248fddb3c051cc0fa770efb9fa
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
local l__Maid__2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).Maid;
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "pid");
local l__Workspace__4 = v2.Workspace;
local l__Players__5 = v2.Players;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__SoundService__7 = v2.SoundService;
local l__RunService__8 = v2.RunService;
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "player-control-module");
local l__PlaceUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local function u11(p1, p2, p3, p4, p5)
	return p4 + (p5 - p4) * ((p1 - p2) / (p3 - p2));
end;
local l__ContextActionService__12 = v2.ContextActionService;
local u13 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__HelicopterUi__14 = v1.import(script, script.Parent, "helicopter-ui").HelicopterUi;
function v5.constructor(p6, p7)
	u1.constructor(p6, p7);
	p6.maid = l__Maid__2.new();
	p6.pitchPid = u3.new(-5, 5, 0.04, 0, 0.03);
	p6.yawPid = u3.new(-10, 10, 0.009, 0, 0);
	p6.rollPid = u3.new(-10, 10, 0.07, 0, 0);
	p6.counterDriftPid = u3.new(-50, 50, 25, 0, 1);
	p6.levitationPid = u3.new(-400, 400, 20, 30, 0);
	p6.movePid = u3.new(-30, 30, 4, 0.5, 0);
	p6.heightGoal = 0;
	p6.holdingUp = false;
	p6.holdingDown = false;
	p6.entryTime = l__Workspace__4:GetServerTimeNow();
	p6.enginePowerScale = 0.6;
	p6.maid = l__Maid__2.new();
	local l__Character__7 = l__Players__5.LocalPlayer.Character;
	if not l__Character__7 then
		return nil;
	end;
	if not l__Character__7:FindFirstChild("Humanoid") then
		return nil;
	end;
	local l__Root__8 = p7:FindFirstChild("Root");
	if not l__Root__8 then
		return nil;
	end;
	if l__Workspace__4.CurrentCamera then
		l__Workspace__4.CurrentCamera.CameraSubject = l__Root__8;
		l__Players__5.LocalPlayer.CameraMaxZoomDistance = 20;
		l__Players__5.LocalPlayer.CameraMinZoomDistance = 20;
		p6.maid:GiveTask(function()
			l__Players__5.LocalPlayer.CameraMaxZoomDistance = 14;
			l__Players__5.LocalPlayer.CameraMinZoomDistance = 0;
			local v9 = l__Players__5.LocalPlayer.Character;
			if v9 ~= nil then
				v9 = v9:FindFirstChild("Humanoid");
			end;
			l__Workspace__4.CurrentCamera.CameraSubject = v9;
		end);
	end;
	local u15 = u6("Attachment", {
		Parent = l__Root__8
	});
	p6.maid:GiveTask(function()
		u15:Destroy();
	end);
	p6.angularVelocity = u6("AngularVelocity", {
		RelativeTo = Enum.ActuatorRelativeTo.Attachment0, 
		MaxTorque = math.huge, 
		Attachment0 = u15, 
		Parent = l__Root__8
	});
	p6.maid:GiveTask(function()
		p6.angularVelocity:Destroy();
	end);
	p6.worldSpaceForce = u6("VectorForce", {
		Name = "WorldSpaceForce", 
		RelativeTo = Enum.ActuatorRelativeTo.World, 
		ApplyAtCenterOfMass = true, 
		Attachment0 = u15, 
		Parent = p7
	});
	p6.maid:GiveTask(function()
		p6.worldSpaceForce:Destroy();
	end);
	p6.localSpaceForce = u6("VectorForce", {
		Name = "LocalSpaceForce", 
		RelativeTo = Enum.ActuatorRelativeTo.Attachment0, 
		ApplyAtCenterOfMass = true, 
		Attachment0 = u15, 
		Parent = l__Root__8
	});
	p6.maid:GiveTask(function()
		p6.localSpaceForce:Destroy();
	end);
	p6.levitationPid:Debug("LevitationPID", l__Workspace__4);
	p6.counterDriftPid:Debug("CounterDriftPID", l__Workspace__4);
	p6.pitchPid:Debug("PitchPID", l__Workspace__4);
	p6.rollPid:Debug("RollPID", l__Workspace__4);
	p6.movePid:Debug("MovePID", l__Workspace__4);
	p6.yawPid:Debug("YawPID", l__Workspace__4);
	p6.windSound = u6("Sound", {
		Name = "WindSound", 
		SoundId = "rbxassetid://" .. tostring(7910583431), 
		Looped = true, 
		Playing = true, 
		Volume = 0.25, 
		Parent = l__SoundService__7
	});
	p6.heightGoal = l__Root__8.Position.Y;
	p6.maid:GiveTask(l__RunService__8.Stepped:Connect(function(p8, p9)
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
		if p6.holdingUp and not p6.holdingDown then
			v22 = 10;
		elseif p6.holdingDown and not p6.holdingUp then
			v22 = -9;
		end;
		if l__PlaceUtil__10.isGameServer() then
			local v23 = math.clamp(p6.heightGoal + v22 * p9, -50, 200);
		else
			v23 = p6.heightGoal + v22 * p9;
		end;
		p6.heightGoal = v23;
		local v24 = p6.levitationPid:Calculate(p9, p6.heightGoal + (0.7 * math.sin(os.clock()) + 0), l__Position__11.Y);
		local v25 = p6.counterDriftPid:Calculate(p9, 0, v12.Z);
		local v26 = p6.pitchPid:Calculate(p9, 15 * -v16.Z, math.deg(v15));
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
			v27 = p6.yawPid:Calculate(p9, v32, math.deg(v18));
		end;
		if v30 then
			local v33 = u11(v29, -math.pi, math.pi, -1, 1);
		else
			v33 = 0;
		end;
		local v34 = p6.rollPid:Calculate(p9, 25 * v33, math.deg(v13));
		local v35 = p6.movePid:Calculate(p9, u11(-v16.Z, -0.9, 1, -36, 40), v20);
		local v36 = u11(math.abs(v20), 0, 40, 0, 0.5);
		if p6.windSound then
			p6.windSound.Volume = v36;
		end;
		if p6.holdingUp and not p6.holdingDown then
			p6.enginePowerScale = p6.enginePowerScale + p9 * 0.4;
		elseif p6.holdingDown and not p6.holdingDown then
			p6.enginePowerScale = p6.enginePowerScale - p9 * 0.3;
		else
			p6.enginePowerScale = p6.enginePowerScale - p9 * 0.3;
		end;
		p6.enginePowerScale = math.clamp(p6.enginePowerScale, 0.6, 1);
		p6:setEnginePowerRatio(p6.enginePowerScale);
		if p7:GetAttribute("Dead") == true then
			p6.worldSpaceForce.Force = Vector3.new(0, 0, 0);
			p6.localSpaceForce.Force = Vector3.new(0, 0, 0);
			p6.angularVelocity.AngularVelocity = Vector3.new(0, 0, 0);
			return;
		end;
		local l__AssemblyMass__37 = l__Root__8.AssemblyMass;
		p6.worldSpaceForce.Force = Vector3.new(0, v24 * l__AssemblyMass__37 * math.clamp((l__Workspace__4:GetServerTimeNow() - p6.entryTime) / 1, 0, 1), 0);
		p6.localSpaceForce.Force = Vector3.new(-v35 * l__AssemblyMass__37, 0, v25 * l__AssemblyMass__37);
		p6.angularVelocity.AngularVelocity = Vector3.new(v34, v27, v26);
	end));
	l__ContextActionService__12:BindActionAtPriority("helicopter-up", function(p10, p11, p12)
		if p11 == Enum.UserInputState.Begin then
			p6.holdingUp = true;
			return;
		end;
		if p11 == Enum.UserInputState.End then
			p6.holdingUp = false;
		end;
	end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.E, Enum.KeyCode.ButtonR2);
	p6.maid:GiveTask(function()
		l__ContextActionService__12:UnbindAction("helicopter-up");
	end);
	l__ContextActionService__12:BindActionAtPriority("helicopter-down", function(p13, p14, p15)
		if p14 == Enum.UserInputState.Begin then
			p6.holdingDown = true;
			return;
		end;
		if p14 == Enum.UserInputState.End then
			p6.holdingDown = false;
		end;
	end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Q, Enum.KeyCode.ButtonL2);
	p6.maid:GiveTask(function()
		l__ContextActionService__12:UnbindAction("helicopter-down");
	end);
	local u16 = u13.mount(u13.createElement("ScreenGui", {
		ResetOnSpawn = false
	}, { u13.createElement(l__HelicopterUi__14, {
			upChanged = function(p16)
				p6.holdingUp = p16;
			end, 
			downChanged = function(p17)
				p6.holdingDown = p17;
			end, 
			vehicleModel = p7
		}) }), l__Players__5.LocalPlayer:WaitForChild("PlayerGui"));
	p6.maid:GiveTask(function()
		u13.unmount(u16);
	end);
end;
function v5.onDisable(p18)
	p18.maid:DoCleaning();
	local l__hoverSound__38 = p18.hoverSound;
	if l__hoverSound__38 ~= nil then
		l__hoverSound__38:Destroy();
	end;
	local l__windSound__39 = p18.windSound;
	if l__windSound__39 ~= nil then
		l__windSound__39:Destroy();
	end;
end;
u1 = {
	HelicopterPilotClient = v5
};
return l__VehicleClient__4;
