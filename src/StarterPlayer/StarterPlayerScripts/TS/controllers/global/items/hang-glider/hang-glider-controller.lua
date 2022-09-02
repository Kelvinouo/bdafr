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
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1, ...)
	l__HandKnitController__5.constructor(p1, ...);
	p1.Name = "HangGliderController";
	p1.maid = u2.new();
	p1.activeGliderMaid = u2.new();
	p1.acceptedGlidingStates = {
		[Enum.HumanoidStateType.FallingDown] = true, 
		[Enum.HumanoidStateType.Flying] = true, 
		[Enum.HumanoidStateType.Jumping] = true, 
		[Enum.HumanoidStateType.Freefall] = true
	};
	p1.hangGliderActive = false;
	p1.activeForces = {};
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__4 = v2.SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__CollectionService__6 = v4.CollectionService;
local l__TweenService__7 = v4.TweenService;
local l__Players__8 = v4.Players;
function u1.KnitStart(p2)
	l__HandKnitController__5.KnitStart(p2);
	l__default__3.Client:OnEvent("RemoteName", function(p3)
		local l__player__8 = p3.player;
		local l__Character__9 = l__player__8.Character;
		if p3.active and l__Character__9 then
			local v10 = l__SoundManager__4:playSound(l__GameSound__5.GLIDER_GLIDE, {
				parent = l__Character__9.PrimaryPart, 
				position = l__Character__9:GetPrimaryPartCFrame().Position, 
				rollOffMaxDistance = 150, 
				volumeMultiplier = 0
			});
			if v10 then
				v10.Looped = true;
				l__CollectionService__6:AddTag(v10, l__player__8.Name .. ":glider_loop_sound");
				l__TweenService__7:Create(v10, TweenInfo.new(0.6), {
					Volume = 2
				}):Play();
				return;
			end;
		else
			local v11, v12, v13 = ipairs((l__CollectionService__6:GetTagged(l__player__8.Name .. ":glider_loop_sound")));
			while true do
				v11(v12, v13);
				if not v11 then
					break;
				end;
				v13 = v11;
				v12:Stop();
				v12:Destroy();			
			end;
		end;
	end);
	local l__Character__14 = l__Players__8.LocalPlayer.Character;
	if l__Character__14 then
		p2:registerCharacter(l__Character__14);
	end;
	l__Players__8.LocalPlayer.CharacterAdded:Connect(function(p4)
		p2:registerCharacter(p4);
	end);
	l__default__3.Client:OnEvent("RemoteName", function(p5)
		if p5.active == false and p5.player.UserId == l__Players__8.LocalPlayer.UserId then
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
local l__KnitClient__9 = v3.KnitClient;
local l__GameAnimationUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__RunService__13 = v4.RunService;
local l__Workspace__14 = v4.Workspace;
local u15 = v2.ConstantManager.registerConstants(script, {
	DragConstant = 6
});
local l__DeviceUtil__16 = v2.DeviceUtil;
local u17 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__BedwarsImageId__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsUI__19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local l__MobileButton__20 = v2.MobileButton;
local l__Flamework__21 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__ActionButton__22 = v2.ActionButton;
function u1.openHangGlider(p10)
	local l__Character__15 = l__Players__8.LocalPlayer.Character;
	if not l__Character__15 then
		return nil;
	end;
	l__default__3.Client:Get("RemoteName"):SendToServer({});
	p10.hangGliderActive = true;
	p10.activeGliderMaid:GiveTask((l__KnitClient__9.Controllers.SprintController:getMovementStatusModifier():addModifier({
		blockSprint = true, 
		constantSpeedMultiplier = 2.5
	})));
	l__KnitClient__9.Controllers.MobileShiftLockController:enable();
	local u23 = l__GameAnimationUtil__10.playAnimation(l__Players__8.LocalPlayer, l__AnimationType__11.HANG_GLIDER_HANG, {
		looped = true
	});
	p10.activeGliderMaid:GiveTask(function()
		if u23 ~= nil then
			u23:Stop();
		end;
	end);
	local l__Humanoid__16 = l__Character__15:WaitForChild("Humanoid");
	local v17 = {
		Name = "LiftForce", 
		Force = Vector3.new(0, 0, 0), 
		Parent = l__Humanoid__16.RootPart, 
		ApplyAtCenterOfMass = true, 
		RelativeTo = Enum.ActuatorRelativeTo.World
	};
	local v18 = l__Humanoid__16.RootPart;
	if v18 ~= nil then
		v18 = v18:WaitForChild("RootRigAttachment");
	end;
	v17.Attachment0 = v18;
	local v19 = u12("VectorForce", v17);
	local v20 = {
		Name = "AlignmentForce", 
		Parent = l__Humanoid__16.RootPart
	};
	local v21 = l__Humanoid__16.RootPart;
	if v21 ~= nil then
		v21 = v21:WaitForChild("RootRigAttachment");
	end;
	v20.Attachment0 = v21;
	v20.RigidityEnabled = true;
	v20.Mode = Enum.OrientationAlignmentMode.OneAttachment;
	local v22 = u12("AlignOrientation", v20);
	table.insert(p10.activeForces, v19);
	table.insert(p10.activeForces, v22);
	l__Character__15.PrimaryPart.AssemblyLinearVelocity = l__Character__15.PrimaryPart.AssemblyLinearVelocity * Vector3.new(1, 0.5, 1);
	l__RunService__13:BindToRenderStep("HangGliderThrust", Enum.RenderPriority.Last.Value, function()
		l__Humanoid__16:Move(Vector3.new(0, 0, -1), true);
	end);
	local u24 = 0;
	local u25 = l__RunService__13.Stepped:Connect(function(p11)
		local l__PrimaryPart__23 = l__Character__15.PrimaryPart;
		local l__CurrentCamera__24 = l__Workspace__14.CurrentCamera;
		local l__Humanoid__25 = l__Character__15:WaitForChild("Humanoid");
		local l__AssemblyLinearVelocity__26 = l__PrimaryPart__23.AssemblyLinearVelocity;
		local v27 = l__Humanoid__25.RootPart;
		if v27 ~= nil then
			v27 = v27.AssemblyMass;
		end;
		local v28 = v27;
		if v28 == 0 or v28 ~= v28 or not v28 then
			v28 = 0;
		end;
		local v29 = math.clamp(math.sign(l__CurrentCamera__24.CFrame.LookVector.Y) * l__CurrentCamera__24.CFrame:ToOrientation(), 0.01, 1.5707963267948966);
		local v30 = math.clamp(1 - math.min(v29, 0.2617993877991494) / 1.5707963267948966, 0.01, 1);
		if v29 < 0.2617993877991494 then
			l__PrimaryPart__23.CFrame = CFrame.new(l__PrimaryPart__23.Position, l__PrimaryPart__23.Position + l__CurrentCamera__24.CFrame.LookVector);
		else
			l__PrimaryPart__23.CFrame = l__PrimaryPart__23.CFrame * CFrame.Angles(math.sign(l__CurrentCamera__24.CFrame.LookVector.Y) * 0.2617993877991494, 0, 0);
		end;
		v22.CFrame = l__CurrentCamera__24.CFrame;
		if u24 > 0.5 then
			local v31 = 0.5 * (v30 / 0.2617993877991494);
			if math.sign(l__CurrentCamera__24.CFrame.LookVector.Y) == 1 and l__Humanoid__25.WalkSpeed > 0 then
				l__Humanoid__25.WalkSpeed = l__Humanoid__25.WalkSpeed - v31;
			elseif l__Humanoid__25.WalkSpeed < 37 then
				l__Humanoid__25.WalkSpeed = l__Humanoid__25.WalkSpeed + v31;
			end;
			u24 = u24 - 0.5;
		end;
		u24 = u24 + p11;
		local v32 = { -1, 1 };
		local v33 = { 0.7, 1.25 };
		local v34 = { 0, 35 };
		local v35 = { -0.3, 0 };
		v19.Force = Vector3.new(0, (l__Workspace__14.Gravity * math.max(0.7, ((1 - v30) * math.sign(l__CurrentCamera__24.CFrame.LookVector.Y) - v32[1]) * (v33[2] - v33[1]) / (v32[2] - v32[1]) + v33[1] + (((l__AssemblyLinearVelocity__26 * Vector3.new(1, 0, 1)).Magnitude - v34[1]) * (v35[2] - v35[1]) / (v34[2] - v34[1]) + v35[1])) - u15.DragConstant * (math.pow(math.clamp(l__AssemblyLinearVelocity__26.Y, -100, 100), 2) / 2) * math.sign(l__Character__15.PrimaryPart.AssemblyLinearVelocity.Y) / 13) * v28, 0);
	end);
	p10.activeGliderMaid:GiveTask(function()
		u25:Disconnect();
	end);
	if l__DeviceUtil__16.isMobileControls() then
		local v36 = {};
		local v37 = {
			Image = l__BedwarsImageId__18.DOWN_MOBILE, 
			Position = l__BedwarsUI__19:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0)
		};
		function v37.OnClick()
			p10:sendCloseHangGliderEvent();
		end;
		v36[#v36 + 1] = u17.createElement(l__MobileButton__20, v37);
		local u26 = u17.mount(u17.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, v36), l__Players__8.LocalPlayer:WaitForChild("PlayerGui"));
		p10.activeGliderMaid:GiveTask(function()
			u17.unmount(u26);
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
		p10.activeGliderMaid:GiveTask((l__Flamework__21.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u17.createElement(l__ActionButton__22, v38))));
	end;
end;
local l__ClientStore__27 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function u1.closeHangGlider(p12)
	p12.hangGliderActive = false;
	local v39, v40, v41 = ipairs(p12.activeForces);
	while true do
		v39(v40, v41);
		if not v39 then
			break;
		end;
		v41 = v39;
		v40:Destroy();	
	end;
	table.clear(p12.activeForces);
	l__RunService__13:UnbindFromRenderStep("HangGliderThrust");
	local l__Humanoid__42 = l__Players__8.LocalPlayer.Character:WaitForChild("Humanoid");
	if l__Humanoid__42 then
		l__Humanoid__42.WalkSpeed = 14;
	end;
	if not l__DeviceUtil__16.isMobileControls() then
		l__KnitClient__9.Controllers.MobileShiftLockController:disable();
	elseif not l__ClientStore__27:getState().Settings.mobileShiftLock then
		l__KnitClient__9.Controllers.MobileShiftLockController:disable();
	end;
	p12.activeGliderMaid:DoCleaning();
end;
function u1.sendCloseHangGliderEvent(p13)
	l__default__3.Client:Get("RemoteName"):SendToServer({});
end;
function u1.canOpenHangGlider(p14)
	if p14.acceptedGlidingStates[l__Players__8.LocalPlayer.Character:FindFirstChild("Humanoid"):GetState()] ~= nil then
		return true;
	end;
	return false;
end;
local l__ItemType__28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function u1.isRelevantItem(p15, p16)
	return p16.itemType == l__ItemType__28.HANG_GLIDER;
end;
local l__ColorUtil__29 = v2.ColorUtil;
local l__ContextActionService__30 = v4.ContextActionService;
function u1.onEnable(p17, p18)
	local l__tool__43 = p18.tool;
	local v44 = l__ClientStore__27:getState().Game.myTeam;
	if v44 ~= nil then
		v44 = v44.color;
	end;
	local v45 = v44;
	if v45 == nil then
		v45 = Color3.fromRGB(255, 255, 255);
	end;
	l__tool__43.Handle.LightStripe.Color = v45;
	l__tool__43.Handle.DarkStripe.Color = l__ColorUtil__29.darken(v45, 0.5);
	l__ContextActionService__30:BindAction("open-glider", function(p19, p20, p21)
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
		l__ContextActionService__30:UnbindAction("open-glider");
	end);
	if l__DeviceUtil__16.isMobileControls() then
		p17:setupYield(function()
			local u31 = u17.mount(u17.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u17.createElement(l__MobileButton__20, {
					Image = l__BedwarsImageId__18.UP_MOBILE, 
					Position = l__BedwarsUI__19:getActionMobileButtonPosition(), 
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
				}) }), l__Players__8.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u17.unmount(u31);
			end;
		end);
	end;
end;
function u1.onDisable(p22)
	p22.maid:DoCleaning();
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(u1.new());
return nil;
