-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "HangGliderController";
	end, 
	__index = l__HandKnitController__5
});
v6.__index = v6;
local u1 = v6;
function u1.new(...)
	local v7 = setmetatable({}, u1);
	return v7:constructor(...) and v7;
end;
local u2 = l__HandKnitController__5;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "HangGliderController";
	p1.maid = u3.new();
	p1.activeGliderMaid = u3.new();
	p1.acceptedGlidingStates = {
		[Enum.HumanoidStateType.FallingDown] = true, 
		[Enum.HumanoidStateType.Flying] = true, 
		[Enum.HumanoidStateType.Jumping] = true, 
		[Enum.HumanoidStateType.Freefall] = true
	};
	p1.hangGliderActive = false;
	p1.activeForces = {};
end;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__5 = v2.SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__CollectionService__7 = v4.CollectionService;
local l__TweenService__8 = v4.TweenService;
local l__Players__9 = v4.Players;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
	l__default__4.Client:OnEvent("RemoteName", function(p3)
		local l__player__8 = p3.player;
		local l__Character__9 = l__player__8.Character;
		if p3.active and l__Character__9 then
			local v10 = l__SoundManager__5:playSound(l__GameSound__6.GLIDER_GLIDE, {
				parent = l__Character__9.PrimaryPart, 
				position = l__Character__9:GetPrimaryPartCFrame().Position, 
				rollOffMaxDistance = 150, 
				volumeMultiplier = 0
			});
			if v10 then
				v10.Looped = true;
				l__CollectionService__7:AddTag(v10, l__player__8.Name .. ":glider_loop_sound");
				l__TweenService__8:Create(v10, TweenInfo.new(0.6), {
					Volume = 2
				}):Play();
				return;
			end;
		else
			for v11, v12 in ipairs((l__CollectionService__7:GetTagged(l__player__8.Name .. ":glider_loop_sound"))) do
				v12:Stop();
				v12:Destroy();
			end;
		end;
	end);
	local l__Character__13 = l__Players__9.LocalPlayer.Character;
	if l__Character__13 then
		p2:registerCharacter(l__Character__13);
	end;
	l__Players__9.LocalPlayer.CharacterAdded:Connect(function(p4)
		p2:registerCharacter(p4);
	end);
	l__default__4.Client:OnEvent("RemoteName", function(p5)
		if p5.active == false and p5.player.UserId == l__Players__9.LocalPlayer.UserId then
			p2:closeHangGlider();
		end;
	end);
end;
function u1.registerCharacter(p6, p7)
	p7:WaitForChild("Humanoid").StateChanged:Connect(function(p8, p9)
		if p6.acceptedGlidingStates[p9] == nil and p6.hangGliderActive then
			p6:sendCloseHangGliderEvent();
		end;
	end);
end;
local l__KnitClient__10 = v3.KnitClient;
local l__GameAnimationUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local u13 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__RunService__14 = v4.RunService;
local l__Workspace__15 = v4.Workspace;
local u16 = v2.ConstantManager.registerConstants(script, {
	DragConstant = 6
});
local l__DeviceUtil__17 = v2.DeviceUtil;
local u18 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__BedwarsImageId__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsUI__20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local l__MobileButton__21 = v2.MobileButton;
local l__Flamework__22 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__ActionButton__23 = v2.ActionButton;
function u1.openHangGlider(p10)
	local l__Character__14 = l__Players__9.LocalPlayer.Character;
	if not l__Character__14 then
		return nil;
	end;
	l__default__4.Client:Get("RemoteName"):SendToServer({});
	p10.hangGliderActive = true;
	p10.activeGliderMaid:GiveTask((l__KnitClient__10.Controllers.SprintController:getMovementStatusModifier():addModifier({
		blockSprint = true, 
		constantSpeedMultiplier = 2.5
	})));
	l__KnitClient__10.Controllers.MobileShiftLockController:enable();
	local u24 = l__GameAnimationUtil__11.playAnimation(l__Players__9.LocalPlayer, l__AnimationType__12.HANG_GLIDER_HANG, {
		looped = true
	});
	p10.activeGliderMaid:GiveTask(function()
		if u24 ~= nil then
			u24:Stop();
		end;
	end);
	local l__Humanoid__15 = l__Character__14:WaitForChild("Humanoid");
	local v16 = {
		Name = "LiftForce", 
		Force = Vector3.new(0, 0, 0), 
		Parent = l__Humanoid__15.RootPart, 
		ApplyAtCenterOfMass = true, 
		RelativeTo = Enum.ActuatorRelativeTo.World
	};
	local v17 = l__Humanoid__15.RootPart;
	if v17 ~= nil then
		v17 = v17:WaitForChild("RootRigAttachment");
	end;
	v16.Attachment0 = v17;
	local v18 = u13("VectorForce", v16);
	local v19 = {
		Name = "AlignmentForce", 
		Parent = l__Humanoid__15.RootPart
	};
	local v20 = l__Humanoid__15.RootPart;
	if v20 ~= nil then
		v20 = v20:WaitForChild("RootRigAttachment");
	end;
	v19.Attachment0 = v20;
	v19.RigidityEnabled = true;
	v19.Mode = Enum.OrientationAlignmentMode.OneAttachment;
	local v21 = u13("AlignOrientation", v19);
	table.insert(p10.activeForces, v18);
	table.insert(p10.activeForces, v21);
	local v22 = math.rad(15);
	l__Character__14.PrimaryPart.AssemblyLinearVelocity = l__Character__14.PrimaryPart.AssemblyLinearVelocity * Vector3.new(1, 0.5, 1);
	l__RunService__14:BindToRenderStep("HangGliderThrust", Enum.RenderPriority.Last.Value, function()
		l__Humanoid__15:Move(Vector3.new(0, 0, -1), true);
	end);
	local u25 = 0;
	local u26 = l__RunService__14.Stepped:Connect(function(p11)
		local l__PrimaryPart__23 = l__Character__14.PrimaryPart;
		local l__CurrentCamera__24 = l__Workspace__15.CurrentCamera;
		local l__Humanoid__25 = l__Character__14:WaitForChild("Humanoid");
		local l__AssemblyLinearVelocity__26 = l__PrimaryPart__23.AssemblyLinearVelocity;
		local v27 = l__Humanoid__25.RootPart;
		if v27 ~= nil then
			v27 = v27.AssemblyMass;
		end;
		local v28 = v27;
		if v28 == 0 or v28 ~= v28 or not v28 then
			v28 = 0;
		end;
		local v29 = math.clamp(math.sign(l__CurrentCamera__24.CFrame.LookVector.Y) * l__CurrentCamera__24.CFrame:ToOrientation(), 0.01, math.rad(90));
		local v30 = math.clamp(1 - math.min(v29, v22) / math.rad(90), 0.01, 1);
		if v29 < v22 then
			l__PrimaryPart__23.CFrame = CFrame.new(l__PrimaryPart__23.Position, l__PrimaryPart__23.Position + l__CurrentCamera__24.CFrame.LookVector);
		else
			l__PrimaryPart__23.CFrame = l__PrimaryPart__23.CFrame * CFrame.Angles(math.sign(l__CurrentCamera__24.CFrame.LookVector.Y) * v22, 0, 0);
		end;
		v21.CFrame = l__CurrentCamera__24.CFrame;
		if u25 > 0.5 then
			local v31 = 0.5 * (v30 / v22);
			if math.sign(l__CurrentCamera__24.CFrame.LookVector.Y) == 1 and l__Humanoid__25.WalkSpeed > 0 then
				l__Humanoid__25.WalkSpeed = l__Humanoid__25.WalkSpeed - v31;
			elseif l__Humanoid__25.WalkSpeed < 37 then
				l__Humanoid__25.WalkSpeed = l__Humanoid__25.WalkSpeed + v31;
			end;
			u25 = u25 - 0.5;
		end;
		u25 = u25 + p11;
		local v32 = { -1, 1 };
		local v33 = { 0.7, 1.25 };
		local v34 = { 0, 35 };
		local v35 = { -0.3, 0 };
		v18.Force = Vector3.new(0, (l__Workspace__15.Gravity * math.max(0.7, ((1 - v30) * math.sign(l__CurrentCamera__24.CFrame.LookVector.Y) - v32[1]) * (v33[2] - v33[1]) / (v32[2] - v32[1]) + v33[1] + (((l__AssemblyLinearVelocity__26 * Vector3.new(1, 0, 1)).Magnitude - v34[1]) * (v35[2] - v35[1]) / (v34[2] - v34[1]) + v35[1])) - u16.DragConstant * (math.pow(math.clamp(l__AssemblyLinearVelocity__26.Y, -100, 100), 2) / 2) * math.sign(l__Character__14.PrimaryPart.AssemblyLinearVelocity.Y) / 13) * v28, 0);
	end);
	p10.activeGliderMaid:GiveTask(function()
		u26:Disconnect();
	end);
	if l__DeviceUtil__17.isMobileControls() then
		local v36 = {};
		local v37 = {
			Image = l__BedwarsImageId__19.DOWN_MOBILE, 
			Position = l__BedwarsUI__20:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0)
		};
		function v37.OnClick()
			p10:sendCloseHangGliderEvent();
		end;
		v36[#v36 + 1] = u18.createElement(l__MobileButton__21, v37);
		local u27 = u18.mount(u18.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, v36), l__Players__9.LocalPlayer:WaitForChild("PlayerGui"));
		p10.activeGliderMaid:GiveTask(function()
			u18.unmount(u27);
		end);
	else
		local v38 = {
			actionName = "HangGliderDismount", 
			interactionKey = Enum.KeyCode.X, 
			gamepadInteractionKey = Enum.KeyCode.ButtonB
		};
		function v38.onActivated()
			if p10.hangGliderActive then
				p10:sendCloseHangGliderEvent();
			end;
		end;
		v38.text = "Dismount Glider";
		p10.activeGliderMaid:GiveTask((l__Flamework__22.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u18.createElement(l__ActionButton__23, v38))));
	end;
end;
local l__ClientStore__28 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function u1.closeHangGlider(p12)
	p12.hangGliderActive = false;
	for v39, v40 in ipairs(p12.activeForces) do
		v40:Destroy();
	end;
	table.clear(p12.activeForces);
	l__RunService__14:UnbindFromRenderStep("HangGliderThrust");
	local l__Humanoid__41 = l__Players__9.LocalPlayer.Character:WaitForChild("Humanoid");
	if l__Humanoid__41 then
		l__Humanoid__41.WalkSpeed = 14;
	end;
	if not l__DeviceUtil__17.isMobileControls() then
		l__KnitClient__10.Controllers.MobileShiftLockController:disable();
	elseif not l__ClientStore__28:getState().Settings.mobileShiftLock then
		l__KnitClient__10.Controllers.MobileShiftLockController:disable();
	end;
	p12.activeGliderMaid:DoCleaning();
end;
function u1.sendCloseHangGliderEvent(p13)
	l__default__4.Client:Get("RemoteName"):SendToServer({});
end;
function u1.canOpenHangGlider(p14)
	if p14.acceptedGlidingStates[l__Players__9.LocalPlayer.Character:FindFirstChild("Humanoid"):GetState()] ~= nil then
		return true;
	end;
	return false;
end;
local l__ItemType__29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function u1.isRelevantItem(p15, p16)
	return p16.itemType == l__ItemType__29.HANG_GLIDER;
end;
local l__ColorUtil__30 = v2.ColorUtil;
local l__ContextActionService__31 = v4.ContextActionService;
function u1.onEnable(p17, p18)
	local l__tool__42 = p18.tool;
	local v43 = l__ClientStore__28:getState().Game.myTeam;
	if v43 ~= nil then
		v43 = v43.color;
	end;
	local v44 = v43;
	if v44 == nil then
		v44 = Color3.fromRGB(255, 255, 255);
	end;
	l__tool__42.Handle.LightStripe.Color = v44;
	l__tool__42.Handle.DarkStripe.Color = l__ColorUtil__30.darken(v44, 0.5);
	l__ContextActionService__31:BindAction("open-glider", function(p19, p20, p21)
		if p20 == Enum.UserInputState.Begin then
			if p17.hangGliderActive then
				return nil;
			end;
			if p17:canOpenHangGlider() then
				p17:openHangGlider();
				return;
			end;
		else
			return;
		end;
		return nil;
	end, false, Enum.UserInputType.MouseButton1);
	p17.maid:GiveTask(function()
		l__ContextActionService__31:UnbindAction("open-glider");
	end);
	if l__DeviceUtil__17.isMobileControls() then
		p17:setupYield(function()
			local u32 = u18.mount(u18.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u18.createElement(l__MobileButton__21, {
					Image = l__BedwarsImageId__19.UP_MOBILE, 
					Position = l__BedwarsUI__20:getActionMobileButtonPosition(), 
					OnClick = function()
						if p17.hangGliderActive then
							p17:sendCloseHangGliderEvent();
							return nil;
						end;
						if not p17:canOpenHangGlider() then
							return nil;
						end;
						p17:openHangGlider();
					end
				}) }), l__Players__9.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u18.unmount(u32);
			end;
		end);
	end;
end;
function u1.onDisable(p22)
	p22.maid:DoCleaning();
end;
u2 = v3.KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
