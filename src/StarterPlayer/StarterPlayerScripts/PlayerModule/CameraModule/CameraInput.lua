-- Decompiled with the Synapse X Luau decompiler.

local l__ContextActionService__1 = game:GetService("ContextActionService");
local l__UserInputService__2 = game:GetService("UserInputService");
local l__RunService__3 = game:GetService("RunService");
local l__UserGameSettings__4 = UserSettings():GetService("UserGameSettings");
local l__VRService__5 = game:GetService("VRService");
local l__StarterGui__6 = game:GetService("StarterGui");
local l__LocalPlayer__7 = game:GetService("Players").LocalPlayer;
local v8 = Vector2.new(1, 0.77) * 0.008726646259971648;
local v9 = Vector2.new(1, 0.77) * 0.12217304763960307;
local v10 = Vector2.new(1, 0.66) * 0.017453292519943295;
local v11 = Vector2.new(1, 0.77) * 0.06981317007977318;
local v12, v13 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFlagEnableNewVRSystem");
end);
local v14 = v12 or v13;
local v15, v16 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFlagEnableVRUpdate2");
end);
local v17 = Instance.new("BindableEvent");
local v18 = Instance.new("BindableEvent");
local u1 = v17;
l__UserInputService__2.InputBegan:Connect(function(p1, p2)
	if not p2 and p1.UserInputType == Enum.UserInputType.MouseButton2 then
		u1:Fire();
	end;
end);
local u2 = v18;
l__UserInputService__2.InputEnded:Connect(function(p3, p4)
	if p3.UserInputType == Enum.UserInputType.MouseButton2 then
		u2:Fire();
	end;
end);
u1 = nil;
u1 = function(p5)
	return math.sign(p5) * math.clamp((math.exp(2 * ((math.abs(p5) - 0.1) / 0.9)) - 1) / 6.38905609893065, 0, 1);
end;
u2 = function(p6)
	local l__CurrentCamera__19 = workspace.CurrentCamera;
	if not l__CurrentCamera__19 then
		return p6;
	end;
	local v20 = l__CurrentCamera__19.CFrame:ToEulerAnglesYXZ();
	if p6.Y * v20 >= 0 then
		return p6;
	end;
	return Vector2.new(1, (1 - (2 * math.abs(v20) / math.pi) ^ 0.75) * 0.75 + 0.25) * p6;
end;
local u3 = 0.016666666666666666;
l__RunService__3.Stepped:Connect(function(p7, p8)
	u3 = p8;
end);
local v21 = {};
local u4 = 0;
local v22 = Instance.new("BindableEvent");
v21.gamepadZoomPress = v22.Event;
if l__VRService__5.VREnabled then
	local v23 = v14 and Instance.new("BindableEvent") or nil;
else
	v23 = nil;
end;
if l__VRService__5.VREnabled and v14 then
	v21.gamepadReset = v23.Event;
end;
local u5 = {
	Thumbstick2 = Vector2.new()
};
function v21.getRotationActivated()
	local v24 = true;
	if not (u4 > 0) then
		v24 = u5.Thumbstick2.Magnitude > 0;
	end;
	return v24;
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
function v21.getRotation(p9)
	local v25 = Vector2.new(1, l__UserGameSettings__4:GetCameraYInvertValue());
	local v26 = Vector2.new(u6.Right - u6.Left, 0) * u3;
	if p9 then
		v26 = Vector2.new();
	end;
	return (v26 * 2.0943951023931953 + u5.Thumbstick2 * v11 + u7.Movement * v8 + u7.Pan * v9 + u2(u8.Move) * v10) * v25;
end;
function v21.getZoomDelta()
	return (u6.O - u6.I) * 0.1 + (-u7.Wheel + u7.Pinch) * 1 + -u8.Pinch * 0.04;
end;
local u9 = v15 or v16;
local u10 = nil;
local function u11(p10)
	local v27 = l__LocalPlayer__7:FindFirstChildOfClass("PlayerGui");
	local v28 = v27 and v27:FindFirstChild("TouchGui");
	local v29 = v28 and v28:FindFirstChild("TouchControlFrame");
	local v30 = v29 and v29:FindFirstChild("DynamicThumbstickFrame");
	if not v30 then
		return false;
	end;
	if not v28.Enabled then
		return false;
	end;
	local l__AbsolutePosition__31 = v30.AbsolutePosition;
	local v32 = l__AbsolutePosition__31 + v30.AbsoluteSize;
	local v33 = false;
	if l__AbsolutePosition__31.X <= p10.X then
		v33 = false;
		if l__AbsolutePosition__31.Y <= p10.Y then
			v33 = false;
			if p10.X <= v32.X then
				v33 = p10.Y <= v32.Y;
			end;
		end;
	end;
	return v33;
end;
local u12 = {};
local u13 = nil;
local function u14(p11, p12)
	assert(p11.UserInputType == Enum.UserInputType.Touch);
	assert(p11.UserInputState == Enum.UserInputState.Begin);
	if u10 == nil and u11(p11.Position) and not p12 then
		u10 = p11;
		return;
	end;
	if not p12 then
		u4 = math.max(0, u4 + 1);
	end;
	u12[p11] = p12;
end;
local function u15(p13, p14)
	assert(p13.UserInputType == Enum.UserInputType.Touch);
	assert(p13.UserInputState == Enum.UserInputState.Change);
	if p13 == u10 then
		return;
	end;
	if u12[p13] == nil then
		u12[p13] = p14;
	end;
	local v34 = {};
	for v35, v36 in pairs(u12) do
		if not v36 then
			table.insert(v34, v35);
		end;
	end;
	if #v34 == 1 and u12[p13] == false then
		local l__Delta__37 = p13.Delta;
		u8.Move = u8.Move + Vector2.new(l__Delta__37.X, l__Delta__37.Y);
	end;
	if #v34 ~= 2 then
		u13 = nil;
		return;
	end;
	local l__Magnitude__38 = (v34[1].Position - v34[2].Position).Magnitude;
	if u13 then
		u8.Pinch = u8.Pinch + (l__Magnitude__38 - u13);
	end;
	u13 = l__Magnitude__38;
end;
local function u16(p15, p16)
	assert(p15.UserInputType == Enum.UserInputType.Touch);
	assert(p15.UserInputState == Enum.UserInputState.End);
	if p15 == u10 then
		u10 = nil;
	end;
	if u12[p15] == false then
		u13 = nil;
		u4 = math.max(0, u4 - 1);
	end;
	u12[p15] = nil;
end;
local u17 = false;
local function u18()
	for v39, v40 in pairs({ u5, u6, u7, u8 }) do
		for v41, v42 in pairs(v40) do
			if type(v42) == "boolean" then
				v40[v41] = false;
			else
				v40[v41] = v40[v41] * 0;
			end;
		end;
	end;
end;
local function u19()
	u12 = {};
	u10 = nil;
	u13 = nil;
end;
local function u20(p17, p18, p19)
	local l__Position__43 = p19.Position;
	u5[p19.KeyCode.Name] = Vector2.new(u1(l__Position__43.X), -u1(l__Position__43.Y));
	if not u9 then
		return;
	end;
	return Enum.ContextActionResult.Pass;
end;
local l__Value__21 = Enum.ContextActionPriority.Default.Value;
local function u22(p20, p21, p22)
	if p21 == Enum.UserInputState.Begin then
		local v44 = 1;
	else
		v44 = 0;
	end;
	u6[p22.KeyCode.Name] = v44;
end;
local function u23(p23, p24, p25)
	if p24 == Enum.UserInputState.Begin then
		v23:Fire();
	end;
end;
local function u24(p26, p27, p28)
	if p27 == Enum.UserInputState.Begin then
		v22:Fire();
	end;
end;
local u25 = {};
local function u26(p29, p30)
	if p29.UserInputType == Enum.UserInputType.Touch then
		u14(p29, p30);
		return;
	end;
	if p29.UserInputType == Enum.UserInputType.MouseButton2 and not p30 then
		u4 = math.max(0, u4 + 1);
	end;
end;
local function u27(p31, p32)
	if p31.UserInputType == Enum.UserInputType.Touch then
		u15(p31, p32);
		return;
	end;
	if p31.UserInputType == Enum.UserInputType.MouseMovement then
		local l__Delta__45 = p31.Delta;
		u7.Movement = Vector2.new(l__Delta__45.X, l__Delta__45.Y);
	end;
end;
local function u28(p33, p34)
	if p33.UserInputType == Enum.UserInputType.Touch then
		u16(p33, p34);
		return;
	end;
	if p33.UserInputType == Enum.UserInputType.MouseButton2 then
		u4 = math.max(0, u4 - 1);
	end;
end;
local function u29(p35, p36, p37, p38)
	if not p38 then
		u7.Wheel = p35;
		u7.Pan = p36;
		u7.Pinch = -p37;
	end;
end;
function v21.setInputEnabled(p39)
	if u17 == p39 then
		return;
	end;
	u17 = p39;
	u18();
	u19();
	if not u17 then
		l__ContextActionService__1:UnbindAction("RbxCameraThumbstick");
		l__ContextActionService__1:UnbindAction("RbxCameraMouseMove");
		l__ContextActionService__1:UnbindAction("RbxCameraMouseWheel");
		l__ContextActionService__1:UnbindAction("RbxCameraKeypress");
		if v14 then
			l__ContextActionService__1:UnbindAction("RbxCameraGamepadZoom");
			if l__VRService__5.VREnabled then
				l__ContextActionService__1:UnbindAction("RbxCameraGamepadReset");
			end;
		end;
		for v46, v47 in pairs(u25) do
			v47:Disconnect();
		end;
		u25 = {};
		return;
	end;
	l__ContextActionService__1:BindActionAtPriority("RbxCameraThumbstick", u20, false, l__Value__21, Enum.KeyCode.Thumbstick2);
	l__ContextActionService__1:BindActionAtPriority("RbxCameraKeypress", u22, false, l__Value__21, Enum.KeyCode.Left, Enum.KeyCode.Right, Enum.KeyCode.I, Enum.KeyCode.O);
	if l__VRService__5.VREnabled and v14 then
		l__ContextActionService__1:BindAction("RbxCameraGamepadReset", u23, false, Enum.KeyCode.ButtonL3);
	end;
	l__ContextActionService__1:BindAction("RbxCameraGamepadZoom", u24, false, Enum.KeyCode.ButtonR3);
	table.insert(u25, l__UserInputService__2.InputBegan:Connect(u26));
	table.insert(u25, l__UserInputService__2.InputChanged:Connect(u27));
	table.insert(u25, l__UserInputService__2.InputEnded:Connect(u28));
	table.insert(u25, l__UserInputService__2.PointerAction:Connect(u29));
end;
function v21.getInputEnabled()
	return u17;
end;
function v21.resetInputForFrameEnd()
	u7.Movement = Vector2.new();
	u8.Move = Vector2.new();
	u8.Pinch = 0;
	u7.Wheel = 0;
	u7.Pan = Vector2.new();
	u7.Pinch = 0;
end;
l__UserInputService__2.WindowFocused:Connect(u18);
l__UserInputService__2.WindowFocusReleased:Connect(u18);
local u30 = false;
function v21.getHoldPan()
	return u30;
end;
local u31 = false;
function v21.getTogglePan()
	return u31;
end;
function v21.getPanning()
	return u31 or u30;
end;
function v21.setTogglePan(p40)
	u31 = p40;
end;
local u32 = false;
local u33 = nil;
local u34 = nil;
local l__Event__35 = v17.Event;
local u36 = 0;
local l__Event__37 = v18.Event;
function v21.enableCameraToggleInput()
	if u32 then
		return;
	end;
	u32 = true;
	u30 = false;
	u31 = false;
	if u33 then
		u33:Disconnect();
	end;
	if u34 then
		u34:Disconnect();
	end;
	u33 = l__Event__35:Connect(function()
		u30 = true;
		u36 = tick();
	end);
	u34 = l__Event__37:Connect(function()
		u30 = false;
		if tick() - u36 < 0.3 and (u31 or l__UserInputService__2:GetMouseDelta().Magnitude < 2) then
			u31 = not u31;
		end;
	end);
end;
function v21.disableCameraToggleInput()
	if not u32 then
		return;
	end;
	u32 = false;
	if u33 then
		u33:Disconnect();
		u33 = nil;
	end;
	if u34 then
		u34:Disconnect();
		u34 = nil;
	end;
end;
return v21;
