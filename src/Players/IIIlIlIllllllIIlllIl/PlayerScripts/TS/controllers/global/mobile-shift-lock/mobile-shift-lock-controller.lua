-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__Players__1 = v3.Players;
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
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "MobileShiftLockController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u3 = l__KnitController__4;
local l__Maid__4 = v2.Maid;
function v5.constructor(p2, ...)
	u3.constructor(p2, ...);
	p2.Name = "MobileShiftLockController";
	p2.maid = l__Maid__4.new();
	p2.enabled = false;
end;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__DeviceUtil__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
local l__PlaceUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__ClientStore__8 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v5.KnitStart(p3)
	u3.KnitStart(p3);
	task.spawn(function()
		while true do
			local v7 = task.wait(3);
			if v7 == 0 then
				break;
			end;
			if v7 ~= v7 then
				break;
			end;
			if not v7 then
				break;
			end;
			local v8, v9 = pcall(function()
				return l__default__5.Client:Get((table.concat({ "S", "e", "l", "f", "R", "e", "p", "o", "r", "t" }, "")));
			end);
			if v8 and v9 == nil then
				print(2);
				task.wait(math.random(20, 40));
				l__default__5.Client:Get("RemoteName"):SendToServer();
				return nil;
			end;		
		end;
	end);
	task.spawn(function()
		while true do
			local v10 = task.wait(3);
			if v10 == 0 then
				break;
			end;
			if v10 ~= v10 then
				break;
			end;
			if not v10 then
				break;
			end;
			local v11, v12 = pcall(function()
				return l__default__5.Client:Get("RemoteName");
			end);
			if v11 and v12 == nil then
				l__default__5.Client:Get("RemoteName"):SendToServer();
				return nil;
			end;		
		end;
	end);
	if not l__DeviceUtil__6.isMobileControls() then
		return nil;
	end;
	if l__PlaceUtil__7.isGameServer() then
		l__ClientStore__8.changed:connect(function(p4, p5)
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
local function u9(p6)
	u2(function(p7)
		v1.Promise.try(function()
			return p7:WaitForChild("Humanoid");
		end):andThen(function(p8)
			p6(p8);
		end);
	end);
end;
local l__RunService__10 = v3.RunService;
local l__Workspace__11 = v3.Workspace;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__UserInputService__13 = v3.UserInputService;
function v5.enable(p9, p10)
	if p10 == nil then
		p10 = true;
	end;
	p9:disable(false);
	if p10 then
		l__default__5.Client:WaitFor("RemoteName"):andThen(function(p11)
			p11:SendToServer({
				enabled = true
			});
		end);
		l__ClientStore__8:dispatch({
			type = "SettingsUpdateSome", 
			settings = {
				mobileShiftLock = true
			}
		});
	end;
	p9.enabled = true;
	p9.maid:GiveTask(function()
		p9.enabled = false;
	end);
	p9.maid:GiveTask(function()
		p9.savedFrame = nil;
	end);
	local l__RotationType__14 = UserSettings():GetService("UserGameSettings").RotationType;
	p9.maid:GiveTask(function()
		UserSettings():GetService("UserGameSettings").RotationType = l__RotationType__14;
	end);
	UserSettings():GetService("UserGameSettings").RotationType = Enum.RotationType.CameraRelative;
	u9(function(p12)
		local l__AutoRotate__15 = p12.AutoRotate;
		p9.maid:GiveTask(function()
			p12.AutoRotate = l__AutoRotate__15;
		end);
		p12.AutoRotate = false;
	end);
	l__RunService__10:BindToRenderStep("MSL_PreCamera", Enum.RenderPriority.Camera.Value - 1, function()
		if p9.savedFrame then
			l__Workspace__11.CurrentCamera.CFrame = p9.savedFrame;
		end;
	end);
	local u16 = u12.mount(u12.createFragment({
		MouseIcon = u12.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, { u12.createElement("ImageLabel", {
				Image = "rbxassetid://7368844459", 
				Size = UDim2.fromOffset(6, 6), 
				Position = UDim2.new(0.5, 0, 0.5, -15), 
				BackgroundTransparency = 1
			}, { u12.createElement("UIAspectRatioConstraint", {
					AspectRatio = 1
				}) }) })
	}), l__Players__1.LocalPlayer:WaitForChild("PlayerGui"));
	p9.maid:GiveTask(function()
		u12.unmount(u16);
	end);
	local l__MouseBehavior__17 = l__UserInputService__13.MouseBehavior;
	local l__MouseIconEnabled__18 = l__UserInputService__13.MouseIconEnabled;
	p9.maid:GiveTask(function()
		l__UserInputService__13.MouseBehavior = l__MouseBehavior__17;
		l__UserInputService__13.MouseIconEnabled = l__MouseIconEnabled__18;
	end);
	l__Players__1.LocalPlayer.CameraMinZoomDistance = 14;
	l__Players__1.LocalPlayer.CameraMaxZoomDistance = 14;
	p9.maid:GiveTask(function()
		l__Players__1.LocalPlayer.CameraMinZoomDistance = 0;
		l__Players__1.LocalPlayer.CameraMaxZoomDistance = 14;
	end);
	l__RunService__10:BindToRenderStep("MSL_PostCamera", Enum.RenderPriority.Camera.Value + 1, function()
		l__UserInputService__13.MouseBehavior = Enum.MouseBehavior.LockCenter;
		l__UserInputService__13.MouseIconEnabled = false;
		local l__CurrentCamera__13 = l__Workspace__11.CurrentCamera;
		p9.savedFrame = l__CurrentCamera__13.CFrame;
		u9(function(p13)
			local l__RootPart__14 = p13.RootPart;
			local l__CFrame__15 = l__RootPart__14.CFrame;
			local v16, v17, v18 = l__CFrame__15:ToOrientation();
			local v19, v20 = l__CurrentCamera__13.CFrame:ToOrientation();
			l__RootPart__14.CFrame = CFrame.new(l__CFrame__15.Position) * CFrame.Angles(0, v20, 0);
			l__CurrentCamera__13.CFrame = l__CurrentCamera__13.CFrame * CFrame.new(Vector3.new(2, 0, 0));
		end);
	end);
	p9.maid:GiveTask(function()
		l__RunService__10:UnbindFromRenderStep("MSL_PreCamera");
		l__RunService__10:UnbindFromRenderStep("MSL_PostCamera");
	end);
end;
function v5.disable(p14, p15)
	if p15 == nil then
		p15 = true;
	end;
	p14.maid:DoCleaning();
	if p15 then
		l__default__5.Client:WaitFor("RemoteName"):andThen(function(p16)
			p16:SendToServer({
				enabled = false
			});
		end);
		l__ClientStore__8:dispatch({
			type = "SettingsUpdateSome", 
			settings = {
				mobileShiftLock = false
			}
		});
	end;
end;
function v5.isEnabled(p17)
	return p17.enabled;
end;
u3 = v2.KnitClient.CreateController;
u3 = u3(v5.new());
return nil;
