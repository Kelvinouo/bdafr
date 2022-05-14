-- Decompiled with the Synapse X Luau decompiler.

local v1, v2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserCameraToggleDontSetMouseIconEveryFrame");
end);
local v3 = v1 or v2;
local l__Players__4 = game:GetService("Players");
if v3 then
	local v5 = nil;
else
	v5 = l__Players__4.LocalPlayer:GetMouse();
end;
if v3 then
	local v6 = require(script.Parent:WaitForChild("CameraUtils"));
else
	v6 = nil;
end;
local v7 = {};
v7.__index = v7;
local l__GameSettings__1 = UserSettings().GameSettings;
function v7.new()
	local v8 = setmetatable({}, v7);
	v8.isMouseLocked = false;
	v8.savedMouseCursor = nil;
	v8.boundKeys = { Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift };
	v8.mouseLockToggledEvent = Instance.new("BindableEvent");
	local v9 = script:FindFirstChild("BoundKeys");
	if not v9 or not v9:IsA("StringValue") then
		if v9 then
			v9:Destroy();
		end;
		v9 = Instance.new("StringValue");
		v9.Name = "BoundKeys";
		v9.Value = "LeftShift,RightShift";
		v9.Parent = script;
	end;
	if v9 then
		v9.Changed:Connect(function(p1)
			v8:OnBoundKeysObjectChanged(p1);
		end);
		v8:OnBoundKeysObjectChanged(v9.Value);
	end;
	l__GameSettings__1.Changed:Connect(function(p2)
		if p2 == "ControlMode" or p2 == "ComputerMovementMode" then
			v8:UpdateMouseLockAvailability();
		end;
	end);
	l__Players__4.LocalPlayer:GetPropertyChangedSignal("DevEnableMouseLock"):Connect(function()
		v8:UpdateMouseLockAvailability();
	end);
	l__Players__4.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function()
		v8:UpdateMouseLockAvailability();
	end);
	v8:UpdateMouseLockAvailability();
	return v8;
end;
function v7.GetIsMouseLocked(p3)
	return p3.isMouseLocked;
end;
function v7.GetBindableToggleEvent(p4)
	return p4.mouseLockToggledEvent.Event;
end;
function v7.GetMouseLockOffset(p5)
	local l__CameraOffset__10 = script:FindFirstChild("CameraOffset");
	if l__CameraOffset__10 and l__CameraOffset__10:IsA("Vector3Value") then
		return l__CameraOffset__10.Value;
	end;
	if l__CameraOffset__10 then
		l__CameraOffset__10:Destroy();
	end;
	local v11 = Instance.new("Vector3Value");
	v11.Name = "CameraOffset";
	v11.Value = Vector3.new(1.75, 0, 0);
	v11.Parent = script;
	if v11 and v11.Value then
		return v11.Value;
	end;
	return Vector3.new(1.75, 0, 0);
end;
function v7.UpdateMouseLockAvailability(p6)
	local v12 = l__Players__4.LocalPlayer.DevEnableMouseLock and (l__GameSettings__1.ControlMode == Enum.ControlMode.MouseLockSwitch and (l__GameSettings__1.ComputerMovementMode ~= Enum.ComputerMovementMode.ClickToMove and l__Players__4.LocalPlayer.DevComputerMovementMode ~= Enum.DevComputerMovementMode.Scriptable));
	if v12 ~= p6.enabled then
		p6:EnableMouseLock(v12);
	end;
end;
function v7.OnBoundKeysObjectChanged(p7, p8)
	p7.boundKeys = {};
	local v13, v14, v15 = string.gmatch(p8, "[^%s,]+");
	while true do
		local v16 = v13(v14, v15);
		if not v16 then
			break;
		end;
		for v17, v18 in pairs(Enum.KeyCode:GetEnumItems()) do
			if v16 == v18.Name then
				p7.boundKeys[#p7.boundKeys + 1] = v18;
				break;
			end;
		end;	
	end;
	p7:UnbindContextActions();
	p7:BindContextActions();
end;
function v7.OnMouseLockToggled(p9)
	p9.isMouseLocked = not p9.isMouseLocked;
	if p9.isMouseLocked then
		local l__CursorImage__19 = script:FindFirstChild("CursorImage");
		if l__CursorImage__19 and l__CursorImage__19:IsA("StringValue") and l__CursorImage__19.Value then
			if v3 then
				v6.setMouseIconOverride(l__CursorImage__19.Value);
			else
				p9.savedMouseCursor = v5.Icon;
				v5.Icon = l__CursorImage__19.Value;
			end;
		else
			if l__CursorImage__19 then
				l__CursorImage__19:Destroy();
			end;
			local v20 = Instance.new("StringValue");
			v20.Name = "CursorImage";
			v20.Value = "rbxasset://textures/MouseLockedCursor.png";
			v20.Parent = script;
			if v3 then
				v6.setMouseIconOverride("rbxasset://textures/MouseLockedCursor.png");
			else
				p9.savedMouseCursor = v5.Icon;
				v5.Icon = "rbxasset://textures/MouseLockedCursor.png";
			end;
		end;
	elseif v3 then
		v6.restoreMouseIcon();
	elseif p9.savedMouseCursor then
		v5.Icon = p9.savedMouseCursor;
		p9.savedMouseCursor = nil;
	end;
	p9.mouseLockToggledEvent:Fire();
end;
function v7.DoMouseLockSwitch(p10, p11, p12, p13)
	if p12 ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Pass;
	end;
	p10:OnMouseLockToggled();
	return Enum.ContextActionResult.Sink;
end;
local l__ContextActionService__2 = game:GetService("ContextActionService");
local l__Value__3 = Enum.ContextActionPriority.Default.Value;
function v7.BindContextActions(p14)
	l__ContextActionService__2:BindActionAtPriority("MouseLockSwitchAction", function(p15, p16, p17)
		return p14:DoMouseLockSwitch(p15, p16, p17);
	end, false, l__Value__3, unpack(p14.boundKeys));
end;
function v7.UnbindContextActions(p18)
	l__ContextActionService__2:UnbindAction("MouseLockSwitchAction");
end;
function v7.IsMouseLocked(p19)
	return p19.enabled and p19.isMouseLocked;
end;
function v7.EnableMouseLock(p20, p21)
	if p21 ~= p20.enabled then
		p20.enabled = p21;
		if p20.enabled then
			p20:BindContextActions();
			return;
		end;
		if v3 then
			v6.restoreMouseIcon();
		elseif v5.Icon ~= "" then
			v5.Icon = "";
		end;
		p20:UnbindContextActions();
		if p20.isMouseLocked then
			p20.mouseLockToggledEvent:Fire();
		end;
		p20.isMouseLocked = false;
	end;
end;
return v7;
