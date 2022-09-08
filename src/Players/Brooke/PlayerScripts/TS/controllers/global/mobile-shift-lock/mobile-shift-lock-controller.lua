-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local l__Players__1 = v2.Players;
local function u2(p1)
	if l__Players__1.LocalPlayer.Character then
		p1(l__Players__1.LocalPlayer.Character);
		return nil;
	end;
	v1.Promise.try(function()
		return l__Players__1.LocalPlayer.CharacterAdded:Wait();
	end):andThen(function()
		p1(l__Players__1.LocalPlayer.Character);
	end);
end;
local v4 = setmetatable({}, {
	__tostring = function()
		return "MobileShiftLockController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.constructor(p2, ...)
	l__KnitController__3.constructor(p2, ...);
	p2.Name = "MobileShiftLockController";
	p2.maid = u3.new();
	p2.enabled = false;
end;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__DeviceUtil__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
local l__PlaceUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__ClientStore__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v4.KnitStart(p3)
	l__KnitController__3.KnitStart(p3);
	task.spawn(function()
		while true do
			local v6 = task.wait(3);
			if v6 == 0 then
				break;
			end;
			if v6 ~= v6 then
				break;
			end;
			if not v6 then
				break;
			end;
			local v7, v8 = pcall(function()
				return l__default__4.Client:Get((table.concat({ "S", "e", "l", "f", "R", "e", "p", "o", "r", "t" }, "")));
			end);
			if v7 and v8 == nil then
				print(2);
				task.wait(math.random(20, 40));
				l__default__4.Client:Get("RemoteName"):SendToServer();
				return nil;
			end;		
		end;
	end);
	task.spawn(function()
		while true do
			local v9 = task.wait(3);
			if v9 == 0 then
				break;
			end;
			if v9 ~= v9 then
				break;
			end;
			if not v9 then
				break;
			end;
			local v10, v11 = pcall(function()
				return l__default__4.Client:Get("RemoteName");
			end);
			if v10 and v11 == nil then
				l__default__4.Client:Get("RemoteName"):SendToServer();
				return nil;
			end;		
		end;
	end);
	if not l__DeviceUtil__5.isMobileControls() then
		return nil;
	end;
	if l__PlaceUtil__6.isGameServer() then
		l__ClientStore__7.changed:connect(function(p4, p5)
			if p4.Settings.mobileShiftLock ~= p5.Settings.mobileShiftLock then
				if not p4.Settings.mobileShiftLock then
					p3:disable(false);
					return;
				end;
			else
				return;
			end;
			p3:enable(false);
		end);
	end;
end;
local l__RunService__8 = v2.RunService;
local l__Workspace__9 = v2.Workspace;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__UserInputService__11 = v2.UserInputService;
function v4.enable(p6, p7)
	if p7 == nil then
		p7 = true;
	end;
	if not l__DeviceUtil__5.isMobileControls() then
		return nil;
	end;
	p6:disable(false);
	if p7 then
		l__default__4.Client:WaitFor("RemoteName"):andThen(function(p8)
			p8:SendToServer({
				enabled = true
			});
		end);
		l__ClientStore__7:dispatch({
			type = "SettingsUpdateSome", 
			settings = {
				mobileShiftLock = true
			}
		});
	end;
	p6.enabled = true;
	p6.maid:GiveTask(function()
		p6.enabled = false;
	end);
	p6.maid:GiveTask(function()
		p6.savedFrame = nil;
	end);
	local l__RotationType__12 = UserSettings():GetService("UserGameSettings").RotationType;
	p6.maid:GiveTask(function()
		UserSettings():GetService("UserGameSettings").RotationType = l__RotationType__12;
	end);
	UserSettings():GetService("UserGameSettings").RotationType = Enum.RotationType.CameraRelative;
	local u13 = function(p9)
		local l__AutoRotate__14 = p9.AutoRotate;
		p6.maid:GiveTask(function()
			p9.AutoRotate = l__AutoRotate__14;
		end);
		p9.AutoRotate = false;
	end;
	u2(function(p10)
		v1.Promise.try(function()
			return p10:WaitForChild("Humanoid");
		end):andThen(function(p11)
			u13(p11);
		end);
	end);
	u13 = l__RunService__8;
	u13 = u13.BindToRenderStep;
	u13(u13, "MSL_PreCamera", Enum.RenderPriority.Camera.Value - 1, function()
		if p6.savedFrame then
			l__Workspace__9.CurrentCamera.CFrame = p6.savedFrame;
		end;
	end);
	u13 = u10.mount;
	u13 = u13(u10.createFragment({
		MouseIcon = u10.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, { u10.createElement("ImageLabel", {
				Image = "rbxassetid://7368844459", 
				Size = UDim2.fromOffset(6, 6), 
				Position = UDim2.new(0.5, 0, 0.5, -15), 
				BackgroundTransparency = 1
			}, { u10.createElement("UIAspectRatioConstraint", {
					AspectRatio = 1
				}) }) })
	}), l__Players__1.LocalPlayer:WaitForChild("PlayerGui"));
	p6.maid:GiveTask(function()
		u10.unmount(u13);
	end);
	local l__MouseBehavior__15 = l__UserInputService__11.MouseBehavior;
	local l__MouseIconEnabled__16 = l__UserInputService__11.MouseIconEnabled;
	p6.maid:GiveTask(function()
		l__UserInputService__11.MouseBehavior = l__MouseBehavior__15;
		l__UserInputService__11.MouseIconEnabled = l__MouseIconEnabled__16;
	end);
	l__Players__1.LocalPlayer.CameraMinZoomDistance = 14;
	l__Players__1.LocalPlayer.CameraMaxZoomDistance = 14;
	p6.maid:GiveTask(function()
		l__Players__1.LocalPlayer.CameraMinZoomDistance = 0;
		l__Players__1.LocalPlayer.CameraMaxZoomDistance = 14;
	end);
	l__RunService__8:BindToRenderStep("MSL_PostCamera", Enum.RenderPriority.Camera.Value + 1, function()
		l__UserInputService__11.MouseBehavior = Enum.MouseBehavior.LockCenter;
		l__UserInputService__11.MouseIconEnabled = false;
		local l__CurrentCamera__12 = l__Workspace__9.CurrentCamera;
		p6.savedFrame = l__CurrentCamera__12.CFrame;
		local function u17(p12)
			local l__RootPart__13 = p12.RootPart;
			local l__CFrame__14 = l__RootPart__13.CFrame;
			local v15, v16, v17 = l__CFrame__14:ToOrientation();
			local v18, v19 = l__CurrentCamera__12.CFrame:ToOrientation();
			l__RootPart__13.CFrame = CFrame.new(l__CFrame__14.Position) * CFrame.Angles(0, v19, 0);
			l__CurrentCamera__12.CFrame = l__CurrentCamera__12.CFrame * CFrame.new(Vector3.new(2, 0, 0));
		end;
		u2(function(p13)
			v1.Promise.try(function()
				return p13:WaitForChild("Humanoid");
			end):andThen(function(p14)
				u17(p14);
			end);
		end);
	end);
	p6.maid:GiveTask(function()
		l__RunService__8:UnbindFromRenderStep("MSL_PreCamera");
		l__RunService__8:UnbindFromRenderStep("MSL_PostCamera");
	end);
end;
function v4.disable(p15, p16)
	if p16 == nil then
		p16 = true;
	end;
	p15.maid:DoCleaning();
	if p16 then
		l__default__4.Client:WaitFor("RemoteName"):andThen(function(p17)
			p17:SendToServer({
				enabled = false
			});
		end);
		l__ClientStore__7:dispatch({
			type = "SettingsUpdateSome", 
			settings = {
				mobileShiftLock = false
			}
		});
	end;
end;
function v4.isEnabled(p18)
	return p18.enabled;
end;
local v20 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
