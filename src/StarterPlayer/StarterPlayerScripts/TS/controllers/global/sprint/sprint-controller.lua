
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitClient__4 = v3.KnitClient;
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v7 = setmetatable({}, {
	__tostring = function()
		return "SprintController";
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
local l__StatusModifier__4 = v2.StatusModifier;
local l__MathExtras__5 = v2.MathExtras;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "SprintController";
	p1.sprintMaid = l__Maid__3.new();
	p1.sprinting = false;
	p1.moveSpeedMultiplier = 1;
	p1.blockSprint = false;
	p1.movementStatusModifier = l__StatusModifier__4.new(function(p2)
		local v9 = 0;
		local v10 = false;
		local v11 = false;
		local v12, v13, v14 = ipairs(p2);
		while true do
			local v15, v16 = v12(v13, v14);
			if not v15 then
				break;
			end;
			if v16.moveSpeedMultiplier ~= nil then
				if v16.moveSpeedMultiplier ~= 0 then
					v9 = v9 + l__MathExtras__5:getPercentFromMultiplier(v16.moveSpeedMultiplier);
				else
					v11 = true;
				end;
			end;
			if v16.blockSprint ~= nil then
				local v17 = v10;
				if not v10 then
					v17 = v16.blockSprint;
				end;
				v10 = v17;
			end;		
		end;
		p1.blockSprint = v10;
		if v11 then
			local v18 = 0;
		else
			v18 = l__MathExtras__5:getMultiplierFromPercent(v9);
		end;
		p1.moveSpeedMultiplier = v18;
		for v19, v20 in ipairs(p2) do
			local l__constantSpeedMultiplier__21 = v20.constantSpeedMultiplier;
			if l__constantSpeedMultiplier__21 ~= nil then
				p1.moveSpeedMultiplier = l__constantSpeedMultiplier__21;
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
local l__Players__6 = v5.Players;
local l__ContextActionService__7 = v5.ContextActionService;
local l__DeviceUtil__8 = v2.DeviceUtil;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__SprintUI__10 = v1.import(script, script.Parent, "ui", "sprint-ui").SprintUI;
local l__UserInputService__11 = v5.UserInputService;
local l__WatchCharacter__12 = v2.WatchCharacter;
local l__Workspace__13 = v5.Workspace;
local l__ContentProvider__14 = v5.ContentProvider;
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
	l__KnitClient__4.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p12)
		if p3.sprinting then
			local v22 = 1.1;
		else
			v22 = 1;
		end;
		l__Workspace__13.CurrentCamera.FieldOfView = p3:getBaseFOV() * v22;
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
		local l__Humanoid__23 = l__Players__6.LocalPlayer.Character:WaitForChild("Humanoid");
		if l__Humanoid__23 then
			l__Humanoid__23.WalkSpeed = p15 * p14.moveSpeedMultiplier;
		end;
	end;
end;
local l__TweenService__17 = v5.TweenService;
function u1.startSprinting(p16)
	local v24 = l__Workspace__13:GetAttribute("FreecamEnabled");
	if v24 ~= 0 and v24 == v24 and v24 ~= "" and v24 then
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
	local v25 = nil;
	v25 = l__KnitClient__4.Controllers.CameraPerspectiveController:getCameraPerspective();
	if l__DeviceUtil__8.isMobileControls() then
		if v25 == l__CameraPerspective__18.FIRST_PERSON then
			return 80;
		else
			return 70;
		end;
	end;
	if v25 == l__CameraPerspective__18.FIRST_PERSON then
		return 82;
	end;
	return 70;
end;
u2 = l__KnitClient__4.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	SprintController = u2
};
return u1;

