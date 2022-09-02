-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
v1.__index = v1;
local l__GameSettings__1 = UserSettings().GameSettings;
local l__Players__2 = game:GetService("Players");
function v1.new()
	local v2 = setmetatable({}, v1);
	v2.isMouseLocked = false;
	v2.savedMouseCursor = nil;
	v2.boundKeys = { Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift };
	v2.mouseLockToggledEvent = Instance.new("BindableEvent");
	local v3 = script:FindFirstChild("BoundKeys");
	if not v3 or not v3:IsA("StringValue") then
		if v3 then
			v3:Destroy();
		end;
		v3 = Instance.new("StringValue");
		assert(v3, "");
		v3.Name = "BoundKeys";
		v3.Value = "LeftShift,RightShift";
		v3.Parent = script;
	end;
	if v3 then
		v3.Changed:Connect(function(p1)
			v2:OnBoundKeysObjectChanged(p1);
		end);
		v2:OnBoundKeysObjectChanged(v3.Value);
	end;
	l__GameSettings__1.Changed:Connect(function(p2)
		if p2 == "ControlMode" or p2 == "ComputerMovementMode" then
			v2:UpdateMouseLockAvailability();
		end;
	end);
	l__Players__2.LocalPlayer:GetPropertyChangedSignal("DevEnableMouseLock"):Connect(function()
		v2:UpdateMouseLockAvailability();
	end);
	l__Players__2.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function()
		v2:UpdateMouseLockAvailability();
	end);
	v2:UpdateMouseLockAvailability();
	return v2;
end;
function v1.GetIsMouseLocked(p3)
	return p3.isMouseLocked;
end;
function v1.GetBindableToggleEvent(p4)
	return p4.mouseLockToggledEvent.Event;
end;
function v1.GetMouseLockOffset(p5)
	local l__CameraOffset__4 = script:FindFirstChild("CameraOffset");
	if l__CameraOffset__4 and l__CameraOffset__4:IsA("Vector3Value") then
		return l__CameraOffset__4.Value;
	end;
	if l__CameraOffset__4 then
		l__CameraOffset__4:Destroy();
	end;
	local v5 = Instance.new("Vector3Value");
	assert(v5, "");
	v5.Name = "CameraOffset";
	v5.Value = Vector3.new(1.75, 0, 0);
	v5.Parent = script;
	if v5 and v5.Value then
		return v5.Value;
	end;
	return Vector3.new(1.75, 0, 0);
end;
function v1.UpdateMouseLockAvailability(p6)
	local v6 = l__Players__2.LocalPlayer.DevEnableMouseLock and (l__GameSettings__1.ControlMode == Enum.ControlMode.MouseLockSwitch and (l__GameSettings__1.ComputerMovementMode ~= Enum.ComputerMovementMode.ClickToMove and l__Players__2.LocalPlayer.DevComputerMovementMode ~= Enum.DevComputerMovementMode.Scriptable));
	if v6 ~= p6.enabled then
		p6:EnableMouseLock(v6);
	end;
end;
function v1.OnBoundKeysObjectChanged(p7, p8)
	p7.boundKeys = {};
	local v7, v8, v9 = string.gmatch(p8, "[^%s,]+");
	while true do
		local v10 = v7(v8, v9);
		if not v10 then
			break;
		end;
		for v11, v12 in pairs(Enum.KeyCode:GetEnumItems()) do
			if v10 == v12.Name then
				p7.boundKeys[#p7.boundKeys + 1] = v12;
				break;
			end;
		end;	
	end;
	p7:UnbindContextActions();
	p7:BindContextActions();
end;
local u3 = require(script.Parent:WaitForChild("CameraUtils"));
function v1.OnMouseLockToggled(p9)
	p9.isMouseLocked = not p9.isMouseLocked;
	if p9.isMouseLocked then
		local l__CursorImage__13 = script:FindFirstChild("CursorImage");
		if l__CursorImage__13 and l__CursorImage__13:IsA("StringValue") and l__CursorImage__13.Value then
			u3.setMouseIconOverride(l__CursorImage__13.Value);
		else
			if l__CursorImage__13 then
				l__CursorImage__13:Destroy();
			end;
			local v14 = Instance.new("StringValue");
			assert(v14, "");
			v14.Name = "CursorImage";
			v14.Value = "rbxasset://textures/MouseLockedCursor.png";
			v14.Parent = script;
			u3.setMouseIconOverride("rbxasset://textures/MouseLockedCursor.png");
		end;
	else
		u3.restoreMouseIcon();
	end;
	p9.mouseLockToggledEvent:Fire();
end;
function v1.DoMouseLockSwitch(p10, p11, p12, p13)
	if p12 ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Pass;
	end;
	p10:OnMouseLockToggled();
	return Enum.ContextActionResult.Sink;
end;
local l__ContextActionService__4 = game:GetService("ContextActionService");
local l__Value__5 = Enum.ContextActionPriority.Default.Value;
function v1.BindContextActions(p14)
	l__ContextActionService__4:BindActionAtPriority("MouseLockSwitchAction", function(p15, p16, p17)
		return p14:DoMouseLockSwitch(p15, p16, p17);
	end, false, l__Value__5, unpack(p14.boundKeys));
end;
function v1.UnbindContextActions(p18)
	l__ContextActionService__4:UnbindAction("MouseLockSwitchAction");
end;
function v1.IsMouseLocked(p19)
	return p19.enabled and p19.isMouseLocked;
end;
function v1.EnableMouseLock(p20, p21)
	if p21 ~= p20.enabled then
		p20.enabled = p21;
		if not p20.enabled then
			u3.restoreMouseIcon();
			p20:UnbindContextActions();
			if p20.isMouseLocked then
				p20.mouseLockToggledEvent:Fire();
			end;
			p20.isMouseLocked = false;
			return;
		end;
	else
		return;
	end;
	p20:BindContextActions();
end;
return v1;
