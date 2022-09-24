-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "SprintController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__StatusModifier__3 = v2.StatusModifier;
local l__MathExtras__4 = v2.MathExtras;
function u1.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "SprintController";
	p1.sprintMaid = u2.new();
	p1.sprinting = false;
	p1.moveSpeedMultiplier = 1;
	p1.blockSprint = false;
	p1.movementStatusModifier = l__StatusModifier__3.new(function(p2)
		local v7 = 0;
		local v8 = false;
		local v9 = false;
		local v10, v11, v12 = ipairs(p2);
		while true do
			v10(v11, v12);
			if not v10 then
				break;
			end;
			if v11.moveSpeedMultiplier ~= nil then
				if v11.moveSpeedMultiplier ~= 0 then
					v7 = v7 + l__MathExtras__4:getPercentFromMultiplier(v11.moveSpeedMultiplier);
				else
					v9 = true;
				end;
			end;
			if v11.blockSprint ~= nil then
				local v13 = v8;
				if not v8 then
					v13 = v11.blockSprint;
				end;
				v8 = v13;
			end;		
		end;
		p1.blockSprint = v8;
		if v9 then
			local v14 = 0;
		else
			v14 = l__MathExtras__4:getMultiplierFromPercent(v7);
		end;
		p1.moveSpeedMultiplier = v14;
		local v15, v16, v17 = ipairs(p2);
		while true do
			v15(v16, v17);
			if not v15 then
				break;
			end;
			v17 = v15;
			local l__constantSpeedMultiplier__18 = v16.constantSpeedMultiplier;
			if l__constantSpeedMultiplier__18 ~= nil then
				p1.moveSpeedMultiplier = l__constantSpeedMultiplier__18;
			end;		
		end;
		if p1.blockSprint then
			p1:stopSprinting();
		end;
		if p1.sprinting then
			p1:setSpeed(20);
			return;
		end;
		p1:setSpeed(14);
	end);
end;
local l__Players__5 = v3.Players;
local l__ContextActionService__6 = v3.ContextActionService;
local l__DeviceUtil__7 = v2.DeviceUtil;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__SprintUI__9 = v1.import(script, script.Parent, "ui", "sprint-ui").SprintUI;
local l__UserInputService__10 = v3.UserInputService;
local l__WatchCharacter__11 = v2.WatchCharacter;
local l__KnitClient__12 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__Workspace__13 = v3.Workspace;
local l__ContentProvider__14 = v3.ContentProvider;
local u15 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__BedwarsImageId__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
function u1.KnitStart(p3)
	l__Players__5.LocalPlayer.CharacterAdded:Connect(function()
		p3.movementStatusModifier:clear();
	end);
	l__ContextActionService__6:BindAction("sprint", function(p4, p5, p6)
		if p5 == Enum.UserInputState.Begin then
			p3:startSprinting();
			return;
		end;
		if p5 == Enum.UserInputState.End then
			p3:stopSprinting();
		end;
	end, false, Enum.KeyCode.LeftShift);
	p3:setSpeed(14);
	if l__DeviceUtil__7.isMobileControls() then
		u8.mount(u8.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, { u8.createElement(l__SprintUI__9, {
				OnClick = function()
					if p3.sprinting then
						p3:stopSprinting();
						return;
					end;
					p3:startSprinting();
				end
			}) }), l__Players__5.LocalPlayer:WaitForChild("PlayerGui"));
	end;
	if l__UserInputService__10.GamepadEnabled then
		l__ContextActionService__6:BindAction("sprint-gamepad", function(p7, p8, p9)
			if p8 == Enum.UserInputState.Begin then
				if not p3.sprinting then
					p3:startSprinting();
					return;
				end;
			else
				return;
			end;
			p3:stopSprinting();
		end, false, Enum.KeyCode.ButtonL3);
		l__ContextActionService__6:UnbindAction("id");
	end;
	l__WatchCharacter__11(function(p10, p11)
		if p10 == l__Players__5.LocalPlayer then
			if not p3.sprinting then
				p3:stopSprinting();
				return;
			end;
		else
			return;
		end;
		p3:startSprinting();
	end);
	l__KnitClient__12.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p12)
		if p3.sprinting then
			local v19 = 1.1;
		else
			v19 = 1;
		end;
		l__Workspace__13.CurrentCamera.FieldOfView = l__KnitClient__12.Controllers.FovController:getFOV() * v19;
	end);
	task.spawn(function()
		if l__DeviceUtil__7.isMobileControls() then
			l__ContentProvider__14:PreloadAsync({ u15("ImageLabel", {
					Image = l__BedwarsImageId__16.SPRINT_ON_MOBILE
				}) });
		end;
	end);
end;
function u1.getMovementStatusModifier(p13)
	return p13.movementStatusModifier;
end;
function u1.setSpeed(p14, p15)
	if l__Players__5.LocalPlayer.Character then
		local l__Humanoid__20 = l__Players__5.LocalPlayer.Character:WaitForChild("Humanoid");
		if l__Humanoid__20 then
			l__Humanoid__20.WalkSpeed = p15 * p14.moveSpeedMultiplier;
		end;
	end;
end;
local l__TweenService__17 = v3.TweenService;
function u1.startSprinting(p16)
	local v21 = l__Workspace__13:GetAttribute("FreecamEnabled");
	if v21 ~= 0 and v21 == v21 and v21 ~= "" and v21 then
		return print("Blocking sprint while in freecam");
	end;
	if p16.blockSprint then
		return nil;
	end;
	p16.sprinting = true;
	l__Players__5.LocalPlayer:SetAttribute("Sprinting", true);
	p16:setSpeed(20);
	l__TweenService__17:Create(l__Workspace__13.CurrentCamera, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
		FieldOfView = l__KnitClient__12.Controllers.FovController:getFOV() * 1.1
	}):Play();
	p16.sprintMaid:GiveTask(function()
		p16:setSpeed(14);
		l__TweenService__17:Create(l__Workspace__13.CurrentCamera, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
			FieldOfView = l__KnitClient__12.Controllers.FovController:getFOV()
		}):Play();
	end);
end;
function u1.stopSprinting(p17)
	l__Players__5.LocalPlayer:SetAttribute("Sprinting", false);
	if not p17.sprinting then
		return nil;
	end;
	p17.sprintMaid:DoCleaning();
	p17.sprinting = false;
end;
u1 = l__KnitClient__12.CreateController;
u1 = u1(u1.new());
return {
	SprintController = u1
};
