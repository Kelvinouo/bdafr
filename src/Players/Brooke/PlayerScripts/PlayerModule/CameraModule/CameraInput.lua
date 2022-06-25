-- Script Hash: 8dbdc3a1e2a2bb346928cc5adf0e857c03e5f54bf1ff5d285fd6b68eb4f3ec4c23e05c00daa2afc799eb4bdd409f6f86
-- Decompiled with the Synapse X Luau decompiler.

local l__ContextActionService__1 = game:GetService("ContextActionService");
local l__UserInputService__2 = game:GetService("UserInputService");
local l__RunService__3 = game:GetService("RunService");
local l__UserGameSettings__4 = UserSettings():GetService("UserGameSettings");
local l__VRService__5 = game:GetService("VRService");
local l__StarterGui__6 = game:GetService("StarterGui");
local l__LocalPlayer__7 = game:GetService("Players").LocalPlayer;
local v8 = math.rad(120);
local v9 = Vector2.new(1, 0.77) * math.rad(0.5);
local v10 = Vector2.new(1, 0.77) * math.rad(7);
local v11 = Vector2.new(1, 0.66) * math.rad(1);
local v12 = Vector2.new(1, 0.77) * math.rad(4);
local v13, v14 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFlagEnableNewVRSystem");
end);
local v15 = v13 or v14;
local v16, v17 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFlagEnableVRUpdate2");
end);
local v18 = Instance.new("BindableEvent");
local v19 = Instance.new("BindableEvent");
local u1 = v18;
l__UserInputService__2.InputBegan:Connect(function(p1, p2)
	if not p2 and p1.UserInputType == Enum.UserInputType.MouseButton2 then
		u1:Fire();
	end;
end);
local u2 = v19;
l__UserInputService__2.InputEnded:Connect(function(p3, p4)
	if p3.UserInputType == Enum.UserInputType.MouseButton2 then
		u2:Fire();
	end;
end);
u1 = nil;
u1 = function(p5)
	return math.sign(p5) * math.clamp((math.exp(2 * ((math.abs(p5) - 0.1) / 0.9)) - 1) / (math.exp(2) - 1), 0, 1);
end;
u2 = function(p6)
	local l__CurrentCamera__20 = workspace.CurrentCamera;
	if not l__CurrentCamera__20 then
		return p6;
	end;
	local v21 = l__CurrentCamera__20.CFrame:ToEulerAnglesYXZ();
	if p6.Y * v21 >= 0 then
		return p6;
	end;
	return Vector2.new(1, (1 - (2 * math.abs(v21) / math.pi) ^ 0.75) * 0.75 + 0.25) * p6;
end;
local u3 = 0.016666666666666666;
l__RunService__3.Stepped:Connect(function(p7, p8)
	u3 = p8;
end);
local v22 = {};
local u4 = 0;
local v23 = Instance.new("BindableEvent");
v22.gamepadZoomPress = v23.Event;
if l__VRService__5.VREnabled then
	local v24 = v15 and Instance.new("BindableEvent") or nil;
else
	v24 = nil;
end;
if l__VRService__5.VREnabled and v15 then
	v22.gamepadReset = v24.Event;
end;
local u5 = {
	Thumbstick2 = Vector2.new()
};
function v22.getRotationActivated()
	local v25 = true;
	if not (u4 > 0) then
		v25 = u5.Thumbstick2.Magnitude > 0;
	end;
	return v25;
end;
local u6 = {
	Left = 0, 
	Right = 0, 
	I = 0, 
	O = 0
};
local u7 = {
	Movement = Vector2.new(), 
	Wheel = 0, 
	Pan = Vector2.new(), 
	Pinch = 0
};
local u8 = {
	Move = Vector2.new(), 
	Pinch = 0
};
function v22.getRotation(p9)
	local v26 = Vector2.new(1, l__UserGameSettings__4:GetCameraYInvertValue());
	local v27 = Vector2.new(u6.Right - u6.Left, 0) * u3;
	if p9 then
		v27 = Vector2.new();
	end;
	return (v27 * v8 + u5.Thumbstick2 * v12 + u7.Movement * v9 + u7.Pan * v10 + u2(u8.Move) * v11) * v26;
end;
function v22.getZoomDelta()
	return (u6.O - u6.I) * 0.1 + (-u7.Wheel + u7.Pinch) * 1 + -u8.Pinch * 0.04;
end;
local u9 = v16 or v17;
local u10 = nil;
local function u11(p10)
	local v28 = l__LocalPlayer__7:FindFirstChildOfClass("PlayerGui");
	local v29 = v28 and v28:FindFirstChild("TouchGui");
	local v30 = v29 and v29:FindFirstChild("TouchControlFrame");
	local v31 = v30 and v30:FindFirstChild("DynamicThumbstickFrame");
	if not v31 then
		return false;
	end;
	if not v29.Enabled then
		return false;
	end;
	local l__AbsolutePosition__32 = v31.AbsolutePosition;
	local v33 = l__AbsolutePosition__32 + v31.AbsoluteSize;
	local v34 = false;
	if l__AbsolutePosition__32.X <= p10.X then
		v34 = false;
		if l__AbsolutePosition__32.Y <= p10.Y then
			v34 = false;
			if p10.X <= v33.X then
				v34 = p10.Y <= v33.Y;
			end;
		end;
	end;
	return v34;
end;
local function u12()
	u4 = math.max(0, u4 + 1);
end;
local u13 = {};
local u14 = nil;
local function u15()
	u4 = math.max(0, u4 - 1);
end;
local function u16(p11, p12)
	assert(p11.UserInputType == Enum.UserInputType.Touch);
	assert(p11.UserInputState == Enum.UserInputState.Begin);
	if u10 == nil and u11(p11.Position) and not p12 then
		u10 = p11;
		return;
	end;
	if not p12 then
		u12();
	end;
	u13[p11] = p12;
end;
local function u17(p13, p14)
	assert(p13.UserInputType == Enum.UserInputType.Touch);
	assert(p13.UserInputState == Enum.UserInputState.Change);
	if p13 == u10 then
		return;
	end;
	if u13[p13] == nil then
		u13[p13] = p14;
	end;
	local v35 = {};
	for v36, v37 in pairs(u13) do
		if not v37 then
			table.insert(v35, v36);
		end;
	end;
	if #v35 == 1 and u13[p13] == false then
		local l__Delta__38 = p13.Delta;
		u8.Move = u8.Move + Vector2.new(l__Delta__38.X, l__Delta__38.Y);
	end;
	if #v35 ~= 2 then
		u14 = nil;
		return;
	end;
	local l__Magnitude__39 = (v35[1].Position - v35[2].Position).Magnitude;
	if u14 then
		u8.Pinch = u8.Pinch + (l__Magnitude__39 - u14);
	end;
	u14 = l__Magnitude__39;
end;
local function u18(p15)
	local l__Delta__40 = p15.Delta;
	u7.Movement = Vector2.new(l__Delta__40.X, l__Delta__40.Y);
end;
local function u19(p16, p17)
	assert(p16.UserInputType == Enum.UserInputType.Touch);
	assert(p16.UserInputState == Enum.UserInputState.End);
	if p16 == u10 then
		u10 = nil;
	end;
	if u13[p16] == false then
		u14 = nil;
		u15();
	end;
	u13[p16] = nil;
end;
local u20 = false;
local function u21()
	for v41, v42 in pairs({ u5, u6, u7, u8 }) do
		for v43, v44 in pairs(v42) do
			if type(v44) == "boolean" then
				v42[v43] = false;
			else
				v42[v43] = v42[v43] * 0;
			end;
		end;
	end;
end;
local function u22()
	u13 = {};
	u10 = nil;
	u14 = nil;
end;
local function u23(p18, p19, p20)
	local l__Position__45 = p20.Position;
	u5[p20.KeyCode.Name] = Vector2.new(u1(l__Position__45.X), -u1(l__Position__45.Y));
	if not u9 then
		return;
	end;
	return Enum.ContextActionResult.Pass;
end;
local l__Value__24 = Enum.ContextActionPriority.Default.Value;
local function u25(p21, p22, p23)
	if p22 == Enum.UserInputState.Begin then
		local v46 = 1;
	else
		v46 = 0;
	end;
	u6[p23.KeyCode.Name] = v46;
end;
local function u26(p24, p25, p26)
	if p25 == Enum.UserInputState.Begin then
		v24:Fire();
	end;
end;
local function u27(p27, p28, p29)
	if p28 == Enum.UserInputState.Begin then
		v23:Fire();
	end;
end;
local u28 = {};
local function u29(p30, p31)
	if p30.UserInputType == Enum.UserInputType.Touch then
		u16(p30, p31);
		return;
	end;
	if p30.UserInputType == Enum.UserInputType.MouseButton2 and not p31 then
		u12();
	end;
end;
local function u30(p32, p33)
	if p32.UserInputType == Enum.UserInputType.Touch then
		u17(p32, p33);
		return;
	end;
	if p32.UserInputType == Enum.UserInputType.MouseMovement then
		u18(p32);
	end;
end;
local function u31(p34, p35)
	if p34.UserInputType == Enum.UserInputType.Touch then
		u19(p34, p35);
		return;
	end;
	if p34.UserInputType == Enum.UserInputType.MouseButton2 then
		u15();
	end;
end;
local function u32(p36, p37, p38, p39)
	if not p39 then
		u7.Wheel = p36;
		u7.Pan = p37;
		u7.Pinch = -p38;
	end;
end;
function v22.setInputEnabled(p40)
	if u20 == p40 then
		return;
	end;
	u20 = p40;
	u21();
	u22();
	if not u20 then
		l__ContextActionService__1:UnbindAction("RbxCameraThumbstick");
		l__ContextActionService__1:UnbindAction("RbxCameraMouseMove");
		l__ContextActionService__1:UnbindAction("RbxCameraMouseWheel");
		l__ContextActionService__1:UnbindAction("RbxCameraKeypress");
		if v15 then
			l__ContextActionService__1:UnbindAction("RbxCameraGamepadZoom");
			if l__VRService__5.VREnabled then
				l__ContextActionService__1:UnbindAction("RbxCameraGamepadReset");
			end;
		end;
		for v47, v48 in pairs(u28) do
			v48:Disconnect();
		end;
		u28 = {};
		return;
	end;
	l__ContextActionService__1:BindActionAtPriority("RbxCameraThumbstick", u23, false, l__Value__24, Enum.KeyCode.Thumbstick2);
	l__ContextActionService__1:BindActionAtPriority("RbxCameraKeypress", u25, false, l__Value__24, Enum.KeyCode.Left, Enum.KeyCode.Right, Enum.KeyCode.I, Enum.KeyCode.O);
	if l__VRService__5.VREnabled and v15 then
		l__ContextActionService__1:BindAction("RbxCameraGamepadReset", u26, false, Enum.KeyCode.ButtonL3);
	end;
	l__ContextActionService__1:BindAction("RbxCameraGamepadZoom", u27, false, Enum.KeyCode.ButtonR3);
	table.insert(u28, l__UserInputService__2.InputBegan:Connect(u29));
	table.insert(u28, l__UserInputService__2.InputChanged:Connect(u30));
	table.insert(u28, l__UserInputService__2.InputEnded:Connect(u31));
	table.insert(u28, l__UserInputService__2.PointerAction:Connect(u32));
end;
function v22.getInputEnabled()
	return u20;
end;
function v22.resetInputForFrameEnd()
	u7.Movement = Vector2.new();
	u8.Move = Vector2.new();
	u8.Pinch = 0;
	u7.Wheel = 0;
	u7.Pan = Vector2.new();
	u7.Pinch = 0;
end;
l__UserInputService__2.WindowFocused:Connect(u21);
l__UserInputService__2.WindowFocusReleased:Connect(u21);
local u33 = false;
function v22.getHoldPan()
	return u33;
end;
local u34 = false;
function v22.getTogglePan()
	return u34;
end;
function v22.getPanning()
	return u34 or u33;
end;
function v22.setTogglePan(p41)
	u34 = p41;
end;
local u35 = false;
local u36 = nil;
local u37 = nil;
local l__Event__38 = v18.Event;
local u39 = 0;
local l__Event__40 = v19.Event;
function v22.enableCameraToggleInput()
	if u35 then
		return;
	end;
	u35 = true;
	u33 = false;
	u34 = false;
	if u36 then
		u36:Disconnect();
	end;
	if u37 then
		u37:Disconnect();
	end;
	u36 = l__Event__38:Connect(function()
		u33 = true;
		u39 = tick();
	end);
	u37 = l__Event__40:Connect(function()
		u33 = false;
		if tick() - u39 < 0.3 and (u34 or l__UserInputService__2:GetMouseDelta().Magnitude < 2) then
			u34 = not u34;
		end;
	end);
end;
function v22.disableCameraToggleInput()
	if not u35 then
		return;
	end;
	u35 = false;
	if u36 then
		u36:Disconnect();
		u36 = nil;
	end;
	if u37 then
		u37:Disconnect();
		u37 = nil;
	end;
end;
return v22;
