-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitClient__4 = v3.KnitClient;
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v7 = setmetatable({}, {
	__tostring = function()
		return "CannonController";
	end, 
	__index = l__KnitController__6
});
v7.__index = v7;
local u1 = v7;
function u1.new(...)
	local v8 = setmetatable({}, u1);
	return v8:constructor(...) and v8;
end;
local u2 = l__KnitController__6;
local l__Maid__3 = v3.Maid;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "CannonController";
	p1.aimingMaid = l__Maid__3.new();
	p1.aiming = false;
end;
local l__CollectionTagAdded__4 = v2.CollectionTagAdded;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Players__7 = v5.Players;
local l__TweenService__8 = v5.TweenService;
local l__default__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__10 = v2.SoundManager;
local l__GameSound__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__BlockEngine__12 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
function u1.KnitStart(p2)
	l__CollectionTagAdded__4("cannon", function(p3)
		u5("ProximityPrompt", {
			Name = "AimPrompt", 
			KeyboardKeyCode = l__Theme__6.promptKeyboardKey, 
			HoldDuration = 0.2, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 10, 
			ActionText = "Aim Cannon", 
			ClickablePrompt = false, 
			Parent = p3
		}).Triggered:Connect(function(p4)
			if p4 == l__Players__7.LocalPlayer then
				p2:startAiming(p3);
			end;
		end);
		u5("ProximityPrompt", {
			Name = "StopAimingPrompt", 
			KeyboardKeyCode = l__Theme__6.promptKeyboardKey, 
			HoldDuration = 0, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 10, 
			ActionText = "Stop Aiming", 
			Enabled = false, 
			Parent = p3
		}).Triggered:Connect(function(p5)
			if p5 == l__Players__7.LocalPlayer then
				p2:stopAiming();
			end;
		end);
		u5("ProximityPrompt", {
			Name = "FirePrompt", 
			KeyboardKeyCode = l__Theme__6.promptKeyboardKey, 
			HoldDuration = 0.4, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 10, 
			ActionText = "Shoot TNT", 
			Enabled = false, 
			ClickablePrompt = false, 
			Parent = p3
		}).Triggered:Connect(function(p6)
			if p6 == l__Players__7.LocalPlayer then
				l__KnitClient__4.Controllers.CannonHandController:fireCannon(p3);
			end;
		end);
		u5("ProximityPrompt", {
			Name = "LaunchSelfPrompt", 
			KeyboardKeyCode = Enum.KeyCode.X, 
			HoldDuration = 0.4, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 10, 
			ActionText = "Launch Self", 
			UIOffset = Vector2.new(0, -80), 
			Enabled = true, 
			ClickablePrompt = false, 
			Parent = p3
		}).Triggered:Connect(function(p7)
			if p7 == l__Players__7.LocalPlayer then
				l__KnitClient__4.Controllers.CannonHandController:launchSelf(p3);
			end;
		end);
		local function u13()
			local v9 = p3:GetAttribute("LookVector") or Vector3.new();
			if p3:FindFirstChild("Base") then
				l__TweenService__8:Create(p3.Base, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
					CFrame = CFrame.new(p3.Base.Position, p3.Base.Position + v9 * (Vector3.new(1, 0, 1) * 5)) * CFrame.Angles(0, math.rad(-90), 0)
				}):Play();
			end;
			if p3:FindFirstChild("Barrel") then
				l__TweenService__8:Create(p3.Barrel, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
					CFrame = CFrame.new(p3.Barrel.Position, p3.Barrel.Position + v9 * 5) * CFrame.Angles(0, math.rad(-90), 0)
				}):Play();
			end;
		end;
		p3:GetAttributeChangedSignal("LookVector"):Connect(function()
			u13();
		end);
		u13();
	end);
	l__default__9.Client:WaitFor("RemoteName"):andThen(function(p8)
		p8:Connect(function(p9)
			local v10 = {};
			if p9.player == l__Players__7.LocalPlayer then
				local v11 = nil;
			else
				v11 = l__BlockEngine__12:getWorldPosition(p9.cannonBlockPos);
			end;
			v10.position = v11;
			v10.rollOffMaxDistance = 220;
			l__SoundManager__10:playSound(l__GameSound__11.CANNON_FIRE, v10);
		end);
	end);
end;
local l__Workspace__14 = v5.Workspace;
local l__ContextActionService__15 = v5.ContextActionService;
function u1.startAiming(p10, p11)
	p10:stopAiming();
	p10.aiming = true;
	p10.aimingMaid:GiveTask(function()
		p10.aiming = false;
	end);
	l__KnitClient__4.Controllers.CannonHandController:updateAllCannonPrompts();
	p10.aimingMaid:GiveTask(function()
		l__KnitClient__4.Controllers.CannonHandController:updateAllCannonPrompts();
	end);
	p10.aimingMaid:GiveTask(p11.AncestryChanged:Connect(function(p12, p13)
		if p13 == nil then
			p10:stopAiming();
		end;
	end));
	l__Workspace__14.CurrentCamera.CameraSubject = p11.Camera;
	l__Players__7.LocalPlayer.CameraMinZoomDistance = 6.5;
	l__Players__7.LocalPlayer.CameraMaxZoomDistance = 6.5;
	p10.aimingMaid:GiveTask(function()
		local v12 = l__Players__7.LocalPlayer.Character;
		if v12 ~= nil then
			v12 = v12:FindFirstChild("Humanoid");
		end;
		l__Workspace__14.CurrentCamera.CameraSubject = v12;
		l__Players__7.LocalPlayer.CameraMinZoomDistance = 0;
		l__Players__7.LocalPlayer.CameraMaxZoomDistance = 14;
	end);
	v1.Promise.defer(function()
		while true do
			local l__CurrentCamera__13 = l__Workspace__14.CurrentCamera;
			if l__CurrentCamera__13 then
				l__default__9.Client:Get("RemoteName"):SendToServer({
					cannonBlockPos = l__BlockEngine__12:getBlockPosition(p11.Position), 
					lookVector = l__CurrentCamera__13.CFrame.LookVector
				});
			end;
			if not { wait(0.2) } then
				break;
			end;
			if not p10.aiming then
				break;
			end;		
		end;
	end);
	l__ContextActionService__15:BindAction("cannon-stop-aiming", function(p14, p15, p16)
		p10:stopAiming();
	end, false, Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2);
	p10.aimingMaid:GiveTask(function()
		l__ContextActionService__15:UnbindAction("cannon-stop-aiming");
	end);
	if l__Players__7.LocalPlayer.Character then
		local l__Position__16 = l__Players__7.LocalPlayer.Character:GetPrimaryPartCFrame().Position;
		v1.Promise.defer(function()
			while { wait(0.2) } and p10.aiming do
				local v14 = l__Players__7.LocalPlayer.Character;
				if v14 ~= nil then
					v14 = v14:GetPrimaryPartCFrame().Position;
				end;
				local v15 = v14;
				if v15 == nil then
					v15 = Vector3.new();
				end;
				if (v15 - l__Position__16).Magnitude > 6 then
					p10:stopAiming();
				end;			
			end;
		end);
	end;
end;
function u1.stopAiming(p17)
	p17.aimingMaid:DoCleaning();
end;
function u1.isAiming(p18)
	return p18.aiming;
end;
local l__CollectionService__17 = v5.CollectionService;
function u1.getCannons(p19)
	return l__CollectionService__17:GetTagged("cannon");
end;
u2 = l__KnitClient__4.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
