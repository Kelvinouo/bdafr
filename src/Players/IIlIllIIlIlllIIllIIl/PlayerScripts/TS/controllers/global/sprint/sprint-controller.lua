-- Script Hash: 83922ecccb0808164999edd0fb1c28892ad7ef9a38b1c2b7d2b6b30e74a0a9af27903de9dc165c8523d9d002d015d62f
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "SprintController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
local u1 = v6;
function u1.new(...)
	local v7 = setmetatable({}, u1);
	return v7:constructor(...) and v7;
end;
local u2 = l__KnitController__5;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__StatusModifier__4 = v2.StatusModifier;
local l__MathExtras__5 = v2.MathExtras;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "SprintController";
	p1.sprintMaid = u3.new();
	p1.sprinting = false;
	p1.moveSpeedMultiplier = 1;
	p1.blockSprint = false;
	p1.movementStatusModifier = l__StatusModifier__4.new(function(p2)
		local v8 = 0;
		local v9 = false;
		local v10 = false;
		local v11, v12, v13 = ipairs(p2);
		while true do
			local v14, v15 = v11(v12, v13);
			if not v14 then
				break;
			end;
			if v15.moveSpeedMultiplier ~= nil then
				if v15.moveSpeedMultiplier ~= 0 then
					v8 = v8 + l__MathExtras__5:getPercentFromMultiplier(v15.moveSpeedMultiplier);
				else
					v10 = true;
				end;
			end;
			if v15.blockSprint ~= nil then
				local v16 = v9;
				if not v9 then
					v16 = v15.blockSprint;
				end;
				v9 = v16;
			end;		
		end;
		p1.blockSprint = v9;
		if v10 then
			local v17 = 0;
		else
			v17 = l__MathExtras__5:getMultiplierFromPercent(v8);
		end;
		p1.moveSpeedMultiplier = v17;
		for v18, v19 in ipairs(p2) do
			local l__constantSpeedMultiplier__20 = v19.constantSpeedMultiplier;
			if l__constantSpeedMultiplier__20 ~= nil then
				p1.moveSpeedMultiplier = l__constantSpeedMultiplier__20;
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
local l__Players__6 = v4.Players;
local l__ContextActionService__7 = v4.ContextActionService;
local l__DeviceUtil__8 = v2.DeviceUtil;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__SprintUI__10 = v1.import(script, script.Parent, "ui", "sprint-ui").SprintUI;
local l__UserInputService__11 = v4.UserInputService;
local l__WatchCharacter__12 = v2.WatchCharacter;
local l__Workspace__13 = v4.Workspace;
local l__ContentProvider__14 = v4.ContentProvider;
local u15 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__BedwarsImageId__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
function u1.KnitStart(p3)
	l__Players__6.LocalPlayer.CharacterAdded:Connect(function()
		p3.movementStatusModifier:clear();
	end);
	l__ContextActionService__7:BindAction("sprint", function(p4, p5, p6)
		if p5 == Enum.UserInputState.Begin then
			p3:startSprinting();
			return;
		end;
		if p5 == Enum.UserInputState.End then
			p3:stopSprinting();
		end;
	end, false, Enum.KeyCode.LeftShift);
	p3:setSpeed(14);
	if l__DeviceUtil__8.isMobileControls() then
		u9.mount(u9.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, { u9.createElement(l__SprintUI__10, {
				OnClick = function()
					if p3.sprinting then
						p3:stopSprinting();
						return;
					end;
					p3:startSprinting();
				end
			}) }), l__Players__6.LocalPlayer:WaitForChild("PlayerGui"));
	else
		print("NOT MOUNTING SPRINT UI!");
	end;
	if l__UserInputService__11.GamepadEnabled then
		l__ContextActionService__7:BindAction("sprint-gamepad", function(p7, p8, p9)
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
	end;
	l__WatchCharacter__12(function(p10, p11)
		if p10 == l__Players__6.LocalPlayer then
			if not p3.sprinting then
				p3:stopSprinting();
				return;
			end;
		else
			return;
		end;
		p3:startSprinting();
	end);
	l__KnitClient__3.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p12)
		if p3.sprinting then
			local v21 = 1.1;
		else
			v21 = 1;
		end;
		l__Workspace__13.CurrentCamera.FieldOfView = p3:getBaseFOV() * v21;
	end);
	task.spawn(function()
		if l__DeviceUtil__8.isMobileControls() then
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
	if l__Players__6.LocalPlayer.Character then
		local l__Humanoid__22 = l__Players__6.LocalPlayer.Character:WaitForChild("Humanoid");
		if l__Humanoid__22 then
			l__Humanoid__22.WalkSpeed = p15 * p14.moveSpeedMultiplier;
		end;
	end;
end;
local l__TweenService__17 = v4.TweenService;
function u1.startSprinting(p16)
	local v23 = l__Workspace__13:GetAttribute("FreecamEnabled");
	if v23 ~= 0 and v23 == v23 and v23 ~= "" and v23 then
		return print("Blocking sprint while in freecam");
	end;
	if p16.blockSprint then
		return nil;
	end;
	p16.sprinting = true;
	l__Players__6.LocalPlayer:SetAttribute("Sprinting", true);
	p16:setSpeed(20);
	l__TweenService__17:Create(l__Workspace__13.CurrentCamera, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
		FieldOfView = p16:getBaseFOV() * 1.1
	}):Play();
	p16.sprintMaid:GiveTask(function()
		p16:setSpeed(14);
		l__TweenService__17:Create(l__Workspace__13.CurrentCamera, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
			FieldOfView = p16:getBaseFOV()
		}):Play();
	end);
end;
function u1.stopSprinting(p17)
	l__Players__6.LocalPlayer:SetAttribute("Sprinting", false);
	if not p17.sprinting then
		return nil;
	end;
	p17.sprintMaid:DoCleaning();
	p17.sprinting = false;
end;
local l__CameraPerspective__18 = v1.import(script, script.Parent.Parent, "first-person", "camera-perspective").CameraPerspective;
function u1.getBaseFOV(p18)
	local v24 = nil;
	v24 = l__KnitClient__3.Controllers.CameraPerspectiveController:getCameraPerspective();
	if l__DeviceUtil__8.isMobileControls() then
		if v24 == l__CameraPerspective__18.FIRST_PERSON then
			return 80;
		else
			return 70;
		end;
	end;
	if v24 == l__CameraPerspective__18.FIRST_PERSON then
		return 82;
	end;
	return 70;
end;
u2 = l__KnitClient__3.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	SprintController = u2
};
return u1;
