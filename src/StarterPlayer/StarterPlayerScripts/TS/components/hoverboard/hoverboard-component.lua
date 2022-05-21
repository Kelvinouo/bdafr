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
local u1 = v1.import(script, script.Parent.Parent.Parent, "lib", "pid");
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
	local function v5()
		return u2.ray(Ray.new());
	end;
	local v6 = table.create(#u3);
	for v7, v8 in ipairs(u3) do
		v6[v7] = v5(v8, v7 - 1, u3);
	end;
	p1.debugRays = v6;
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
local function u13(p3, p4, p5, p6, p7)
	return p6 + (p7 - p6) * ((p3 - p4) / (p5 - p4));
end;
local function u14(p8)
	return 1 - math.pow(1 - p8, 3);
end;
local function u15(p9, p10)
	return (p10 - p9 + math.pi) % (2 * math.pi) - math.pi + p9;
end;
function v3.SteppedUpdate(p11, p12)
	if not p11:isOwn() then
		return nil;
	end;
	local l__CFrame__12 = p11.hoverboard.CFrame;
	local l__Position__13 = l__CFrame__12.Position;
	local v14 = l__CFrame__12:VectorToObjectSpace(p11.hoverboard.AssemblyLinearVelocity);
	local v15, v16, v17 = l__CFrame__12:ToOrientation();
	local l__Humanoid__18 = p11.character.Humanoid;
	local l__MoveDirection__19 = l__Humanoid__18.MoveDirection;
	local v20 = -l__CFrame__12:VectorToObjectSpace(l__MoveDirection__19).X;
	local l__LookVector__21 = l__CFrame__12.LookVector;
	local v22 = math.atan2(l__LookVector__21.Z, l__LookVector__21.X) + math.pi * 0.5;
	local v23 = p11.hoverboard.AssemblyLinearVelocity * Vector3.new(1, 0, 1);
	local v24 = v23.Magnitude * -math.sign(l__CFrame__12:VectorToObjectSpace(v23).X);
	local v25 = 0;
	local v26 = 5 + (0.1 * math.sin((os.clock() - 0) / 0.5) + 0);
	local u16 = Vector3.new(0, -v26, 0);
	local function v27(p13, p14)
		local v28 = l__Workspace__8:Raycast((l__CFrame__12 * p13).Position, u16, p11.raycastParams);
		if not v28 then
			return nil;
		end;
		return v28.Position.Y;
	end;
	local v29 = {};
	local v30 = 0;
	for v31, v32 in ipairs(u3) do
		local v33 = v27(v32, v31 - 1, u3);
		if v33 ~= nil then
			v30 = v30 + 1;
			v29[v30] = v33;
		end;
	end;
	if #v29 > 0 then
		local v34 = nil;
		if #v29 == 0 then
			error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.");
		end;
		v34 = v29[1];
		local function v35(p15, p16)
			if p16 < p15 then
				return p15;
			end;
			return p16;
		end;
		for v36 = 2, #v29 do
			v34 = v35(v34, v29[v36], v36 - 1, v29);
		end;
		v25 = p11.levitationPid:Calculate(p12, local v37 + v26, l__Position__13.Y);
		p11.hoverSound.PlaybackSpeed = u14(1 - u13(u13(l__Position__13.Y - v37, 0, v26, 0.4, 0.8) + (1 - u13(v24, 0, 40, 0.25, 0.8)), 0.65, 1.6, 0, 1));
	end;
	u16 = p11.counterDriftPid;
	u16 = u16.Calculate;
	u16 = u16(u16, p12, 0, v14.Z);
	u16 = 15 * v20;
	local v38 = p11.pitchPid:Calculate(p12, u16, math.deg(v17));
	u16 = 0;
	local v39 = l__CFrame__12:VectorToObjectSpace(l__MoveDirection__19) * Vector3.new(1, 0, 1);
	local v40 = math.atan2(v39.Z, -v39.X);
	local v41 = l__MoveDirection__19.Magnitude > 0.05;
	if v41 then
		u16 = p11.yawPid:Calculate(p12, math.deg(u15(v22, v22 + v40)), math.deg(v22));
	end;
	if v41 then
		local v42 = u13(v40, -math.pi, math.pi, -1, 1);
	else
		v42 = 0;
	end;
	p11.windSound.Volume = u13(math.abs(v24), 0, 40, 0, 0.5);
	local v43 = false;
	if os.clock() - p11.lastJumpTimestamp >= 0.5 then
		v43 = l__Humanoid__18.Jump or false;
	end;
	if v43 then
		p11.hoverboard:ApplyImpulse(Vector3.new(0, 3250, 0));
		p11.lastJumpTimestamp = os.clock();
	end;
	p11.worldSpaceForce.Force = Vector3.new(0, v25, 0);
	p11.localSpaceForce.Force = Vector3.new(-p11.movePid:Calculate(p12, u13(v20, -0.9, 1, -36, 40), v24), 0, u16);
	p11.angularVelocity.AngularVelocity = Vector3.new(p11.rollPid:Calculate(p12, 25 * v42, math.deg(v15)), u16, v38);
end;
function v3.setCharacterMassless(p17, p18)
	for v44, v45 in ipairs(p17.character:GetDescendants()) do
		if v45 ~= p17.hoverboard and v45:IsA("BasePart") then
			v45.Massless = p18;
		end;
	end;
end;
local l__default__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v3.dismountHoverboard(p19)
	l__default__17.Client:Get("RemoteName"):SendToServer();
end;
function v3.Destroy(p20)
	if not p20:isOwn() then
		return nil;
	end;
	l__default__4.Debug("Local hoverboard destroyed");
	p20.character.HumanoidRootPart.Anchored = false;
	local l__character__46 = p20.character;
	if l__character__46 ~= nil then
		local l__Humanoid__47 = l__character__46.Humanoid;
		if l__Humanoid__47 ~= nil then
			l__Humanoid__47:ChangeState(Enum.HumanoidStateType.Running);
		end;
	end;
	p20.hoverSound:Destroy();
	p20.windSound:Destroy();
	p20.actionButtonMaid:DoCleaning();
end;
function v3.isOwn(p21)
	return p21.hoverboard.Parent == p21.character;
end;
v3.Tag = "Hoverboard";
return v3;
