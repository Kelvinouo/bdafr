-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = setmetatable({}, {
	__tostring = function()
		return "HoverboardComponent";
	end
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "pid");
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "draw");
local u3 = { CFrame.new(-2, 0, 0), CFrame.new(0, 0, 0), CFrame.new(2, 0, 0) };
local l__default__4 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__default__5 = v1.import(script, v1.getModule(script, "@rbxts", "yield-for-character")).default;
local l__LocalPlayer__6 = v2.Players.LocalPlayer;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__8 = v2.Workspace;
local l__SoundService__9 = v2.SoundService;
local l__Flamework__10 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ActionButton__12 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ActionButton;
function v3.constructor(p1, p2)
	p1.hoverboard = p2;
	p1.pitchPid = u1.new(-5, 5, 0.075, 0, 0);
	p1.yawPid = u1.new(-15, 15, 0.04, 0, 0);
	p1.rollPid = u1.new(-10, 10, 0.1, 0, 0);
	p1.counterDriftPid = u1.new(-10000, 10000, 2500, 1, 1);
	p1.levitationPid = u1.new(-300000, 300000, 16000, 750, 0);
	p1.movePid = u1.new(-4500, 4500, 100, 10, 0);
	p1.lastJumpTimestamp = 0;
	local v5 = table.create(#u3);
	local v6, v7, v8 = ipairs(u3);
	while true do
		v6(v7, v8);
		if not v6 then
			break;
		end;
		v8 = v6;
		v5[v6] = u2.ray(Ray.new());	
	end;
	p1.debugRays = v5;
	l__default__4.Debug("Got new hoverboard at {@Location}", p2);
	p1.character = l__default__5(l__LocalPlayer__6.Character):expect();
	if not p1:isOwn() then
		return nil;
	end;
	l__default__4.Debug("Hoverboard belongs to local player");
	p1.character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
	local v9 = u7("Attachment", {
		Parent = p2
	});
	p1.angularVelocity = u7("AngularVelocity", {
		RelativeTo = Enum.ActuatorRelativeTo.Attachment0, 
		MaxTorque = math.huge, 
		Attachment0 = v9, 
		Parent = p2
	});
	p1.worldSpaceForce = u7("VectorForce", {
		Name = "WorldSpaceForce", 
		RelativeTo = Enum.ActuatorRelativeTo.World, 
		ApplyAtCenterOfMass = true, 
		Attachment0 = v9, 
		Parent = p2
	});
	p1.localSpaceForce = u7("VectorForce", {
		Name = "LocalSpaceForce", 
		RelativeTo = Enum.ActuatorRelativeTo.Attachment0, 
		ApplyAtCenterOfMass = true, 
		Attachment0 = v9, 
		Parent = p2
	});
	p1.levitationPid:Debug("LevitationPID", l__Workspace__8);
	p1.counterDriftPid:Debug("CounterDriftPID", l__Workspace__8);
	p1.pitchPid:Debug("PitchPID", l__Workspace__8);
	p1.rollPid:Debug("RollPID", l__Workspace__8);
	p1.movePid:Debug("MovePID", l__Workspace__8);
	p1.yawPid:Debug("YawPID", l__Workspace__8);
	local v10 = RaycastParams.new();
	v10.FilterDescendantsInstances = { l__Workspace__8:FindFirstChild("Map"), l__Workspace__8:FindFirstChild("Lobby"), l__Workspace__8.Terrain };
	v10.FilterType = Enum.RaycastFilterType.Whitelist;
	p1.raycastParams = v10;
	p1.hoverSound = u7("Sound", {
		Name = "HoverSound", 
		SoundId = "rbxassetid://" .. tostring(7910584261), 
		Looped = true, 
		Playing = true, 
		Volume = 1, 
		Parent = l__SoundService__9
	});
	p1.windSound = u7("Sound", {
		Name = "WindSound", 
		SoundId = "rbxassetid://" .. tostring(7910583431), 
		Looped = true, 
		Playing = true, 
		Volume = 0.25, 
		Parent = l__SoundService__9
	});
	local v11 = {
		actionName = "HoverboardDismount", 
		interactionKey = Enum.KeyCode.X, 
		gamepadInteractionKey = Enum.KeyCode.ButtonB
	};
	function v11.onActivated()
		p1:dismountHoverboard();
	end;
	v11.text = "Dismount Hoverboard";
	p1.actionButtonMaid = l__Flamework__10.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u11.createElement(l__ActionButton__12, v11));
end;
function v3.SteppedUpdate(p3, p4)
	if not p3:isOwn() then
		return nil;
	end;
	local l__CFrame__12 = p3.hoverboard.CFrame;
	local l__Position__13 = l__CFrame__12.Position;
	local v14 = l__CFrame__12:VectorToObjectSpace(p3.hoverboard.AssemblyLinearVelocity);
	local v15, v16, v17 = l__CFrame__12:ToOrientation();
	local l__Humanoid__18 = p3.character.Humanoid;
	local l__MoveDirection__19 = l__Humanoid__18.MoveDirection;
	local v20 = -l__CFrame__12:VectorToObjectSpace(l__MoveDirection__19).X;
	local l__LookVector__21 = l__CFrame__12.LookVector;
	local v22 = math.atan2(l__LookVector__21.Z, l__LookVector__21.X) + math.pi * 0.5;
	local v23 = p3.hoverboard.AssemblyLinearVelocity * Vector3.new(1, 0, 1);
	local v24 = v23.Magnitude * -math.sign(l__CFrame__12:VectorToObjectSpace(v23).X);
	local v25 = 0;
	local v26 = 5 + (0.1 * math.sin((os.clock() - 0) / 0.5) + 0);
	local u13 = Vector3.new(0, -v26, 0);
	local function v27(p5, p6)
		local v28 = l__Workspace__8:Raycast((l__CFrame__12 * p5).Position, u13, p3.raycastParams);
		if not v28 then
			return nil;
		end;
		return v28.Position.Y;
	end;
	local v29 = {};
	local v30 = 0;
	local v31, v32, v33 = ipairs(u3);
	while true do
		v31(v32, v33);
		if not v31 then
			break;
		end;
		v33 = v31;
		local v34 = v27(v32, v31 - 1, u3);
		if v34 ~= nil then
			v30 = v30 + 1;
			v29[v30] = v34;
		end;	
	end;
	if #v29 > 0 then
		if #v29 == 0 then
			error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.");
		end;
		local v35 = v29[1];
		for v36 = 2, #v29 do
			local v37 = v29[v36];
			if v37 < v35 then
				local v38 = v35;
			else
				v38 = v37;
			end;
		end;
		v25 = p3.levitationPid:Calculate(p4, v38 + v26, l__Position__13.Y);
		p3.hoverSound.PlaybackSpeed = 1 - math.pow(1 - (1 - (0 + 1 * ((0.4 + 0.4 * ((l__Position__13.Y - v38 - 0) / (v26 - 0)) + (1 - (0.25 + 0.55 * ((v24 - 0) / 40))) - 0.65) / 0.9500000000000001))), 3);
	end;
	u13 = p3.counterDriftPid;
	u13 = u13.Calculate;
	u13 = u13(u13, p4, 0, v14.Z);
	u13 = 15 * v20;
	local v39 = p3.pitchPid:Calculate(p4, u13, math.deg(v17));
	u13 = 0;
	local v40 = l__CFrame__12:VectorToObjectSpace(l__MoveDirection__19) * Vector3.new(1, 0, 1);
	local v41 = math.atan2(v40.Z, -v40.X);
	local v42 = l__MoveDirection__19.Magnitude > 0.05;
	if v42 then
		u13 = p3.yawPid:Calculate(p4, math.deg((v22 + v41 - v22 + math.pi) % (2 * math.pi) - math.pi + v22), math.deg(v22));
	end;
	if v42 then
		local v43 = -math.pi;
		local v44 = -1 + 2 * ((v41 - v43) / (math.pi - v43));
	else
		v44 = 0;
	end;
	p3.windSound.Volume = 0 + 0.5 * ((math.abs(v24) - 0) / 40);
	local v45 = false;
	if os.clock() - p3.lastJumpTimestamp >= 0.5 then
		v45 = l__Humanoid__18.Jump or false;
	end;
	if v45 then
		p3.hoverboard:ApplyImpulse(Vector3.new(0, 3250, 0));
		p3.lastJumpTimestamp = os.clock();
	end;
	p3.worldSpaceForce.Force = Vector3.new(0, v25, 0);
	p3.localSpaceForce.Force = Vector3.new(-p3.movePid:Calculate(p4, -36 + 76 * ((v20 - -0.9) / 1.9), v24), 0, u13);
	p3.angularVelocity.AngularVelocity = Vector3.new(p3.rollPid:Calculate(p4, 25 * v44, math.deg(v15)), u13, v39);
end;
function v3.setCharacterMassless(p7, p8)
	local v46, v47, v48 = ipairs(p7.character:GetDescendants());
	while true do
		v46(v47, v48);
		if not v46 then
			break;
		end;
		v48 = v46;
		if v47 ~= p7.hoverboard and v47:IsA("BasePart") then
			v47.Massless = p8;
		end;	
	end;
end;
local l__default__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v3.dismountHoverboard(p9)
	l__default__14.Client:Get("RemoteName"):SendToServer();
end;
function v3.Destroy(p10)
	if not p10:isOwn() then
		return nil;
	end;
	l__default__4.Debug("Local hoverboard destroyed");
	p10.character.HumanoidRootPart.Anchored = false;
	local l__character__49 = p10.character;
	if l__character__49 ~= nil then
		local l__Humanoid__50 = l__character__49.Humanoid;
		if l__Humanoid__50 ~= nil then
			l__Humanoid__50:ChangeState(Enum.HumanoidStateType.Running);
		end;
	end;
	p10.hoverSound:Destroy();
	p10.windSound:Destroy();
	p10.actionButtonMaid:DoCleaning();
end;
function v3.isOwn(p11)
	return p11.hoverboard.Parent == p11.character;
end;
v3.Tag = "Hoverboard";
return v3;
