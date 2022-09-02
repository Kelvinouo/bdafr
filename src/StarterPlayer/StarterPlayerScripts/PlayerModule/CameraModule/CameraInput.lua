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
	return UserSettings():IsUserFeatureEnabled("UserResetTouchStateOnMenuOpen");
end);
local v14 = Instance.new("BindableEvent");
local v15 = Instance.new("BindableEvent");
local u1 = v14;
l__UserInputService__2.InputBegan:Connect(function(p1, p2)
	if not p2 and p1.UserInputType == Enum.UserInputType.MouseButton2 then
		u1:Fire();
	end;
end);
local u2 = v15;
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
	local l__CurrentCamera__16 = workspace.CurrentCamera;
	if not l__CurrentCamera__16 then
		return p6;
	end;
	local v17 = l__CurrentCamera__16.CFrame:ToEulerAnglesYXZ();
	if p6.Y * v17 >= 0 then
		return p6;
	end;
	return Vector2.new(1, (1 - (2 * math.abs(v17) / math.pi) ^ 0.75) * 0.75 + 0.25) * p6;
end;
local u3 = 0.016666666666666666;
l__RunService__3.Stepped:Connect(function(p7, p8)
	u3 = p8;
end);
local v18 = {};
local u4 = 0;
local v19 = {
	Thumbstick2 = Vector2.new()
};
local v20 = {
	Movement = Vector2.new(), 
	Wheel = 0, 
	Pan = Vector2.new(), 
	Pinch = 0
};
local v21 = {
	Move = Vector2.new(), 
	Pinch = 0
};
local v22 = Instance.new("BindableEvent");
v18.gamepadZoomPress = v22.Event;
local v23 = l__VRService__5.VREnabled and Instance.new("BindableEvent") or nil;
if l__VRService__5.VREnabled then
	v18.gamepadReset = v23.Event;
end;
function v18.getRotationActivated()
	local v24 = true;
	if not (u4 > 0) then
		v24 = v19.Thumbstick2.Magnitude > 0;
	end;
	return v24;
end;
local u5 = {
	Left = 0, 
	Right = 0, 
	I = 0, 
	O = 0
};
function v18.getRotation(p9)
	local v25 = Vector2.new(1, l__UserGameSettings__4:GetCameraYInvertValue());
	local v26 = Vector2.new(u5.Right - u5.Left, 0) * u3;
	if p9 then
		v26 = Vector2.new();
	end;
	return (v26 * 2.0943951023931953 + v19.Thumbstick2 * v11 + v20.Movement * v8 + v20.Pan * v9 + u2(v21.Move) * v10) * v25;
end;
function v18.getZoomDelta()
	return (u5.O - u5.I) * 0.1 + (-v20.Wheel + v20.Pinch) * 1 + -v21.Pinch * 0.04;
end;
local u6 = nil;
local function u7(p10)
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
local u8 = {};
local u9 = nil;
local u10 = v12 or v13;
local function u11(p11, p12)
	assert(p11.UserInputType == Enum.UserInputType.Touch);
	assert(p11.UserInputState == Enum.UserInputState.Begin);
	if u6 == nil and u7(p11.Position) and not p12 then
		u6 = p11;
		return;
	end;
	if not p12 then
		u4 = math.max(0, u4 + 1);
	end;
	u8[p11] = p12;
end;
local function u12(p13, p14)
	assert(p13.UserInputType == Enum.UserInputType.Touch);
	assert(p13.UserInputState == Enum.UserInputState.Change);
	if p13 == u6 then
		return;
	end;
	if u8[p13] == nil then
		u8[p13] = p14;
	end;
	local v34 = {};
	for v35, v36 in pairs(u8) do
		if not v36 then
			table.insert(v34, v35);
		end;
	end;
	if #v34 == 1 and u8[p13] == false then
		local l__Delta__37 = p13.Delta;
		v21.Move = v21.Move + Vector2.new(l__Delta__37.X, l__Delta__37.Y);
	end;
	if #v34 ~= 2 then
		u9 = nil;
		return;
	end;
	local l__Magnitude__38 = (v34[1].Position - v34[2].Position).Magnitude;
	if u9 then
		v21.Pinch = v21.Pinch + (l__Magnitude__38 - u9);
	end;
	u9 = l__Magnitude__38;
end;
local function u13(p15, p16)
	assert(p15.UserInputType == Enum.UserInputType.Touch);
	assert(p15.UserInputState == Enum.UserInputState.End);
	if p15 == u6 then
		u6 = nil;
	end;
	if u8[p15] == false then
		u9 = nil;
		u4 = math.max(0, u4 - 1);
	end;
	u8[p15] = nil;
end;
local u14 = false;
local function u15()
	for v39, v40 in pairs({ v19, u5, v20, v21 }) do
		for v41, v42 in pairs(v40) do
			if type(v42) == "boolean" then
				v40[v41] = false;
			else
				v40[v41] = v40[v41] * 0;
			end;
		end;
	end;
end;
local function u16()
	u8 = {};
	u6 = nil;
	u9 = nil;
	if u10 then
		u4 = 0;
	end;
end;
local function u17(p17, p18, p19)
	local l__Position__43 = p19.Position;
	v19[p19.KeyCode.Name] = Vector2.new(u1(l__Position__43.X), -u1(l__Position__43.Y));
	return Enum.ContextActionResult.Pass;
end;
local l__Value__18 = Enum.ContextActionPriority.Default.Value;
local function u19(p20, p21, p22)
	if p21 == Enum.UserInputState.Begin then
		local v44 = 1;
	else
		v44 = 0;
	end;
	u5[p22.KeyCode.Name] = v44;
end;
local function u20(p23, p24, p25)
	if p24 == Enum.UserInputState.Begin then
		v23:Fire();
	end;
end;
local function u21(p26, p27, p28)
	if p27 == Enum.UserInputState.Begin then
		v22:Fire();
	end;
end;
local u22 = {};
local function u23(p29, p30)
	if p29.UserInputType == Enum.UserInputType.Touch then
		u11(p29, p30);
		return;
	end;
	if p29.UserInputType == Enum.UserInputType.MouseButton2 and not p30 then
		u4 = math.max(0, u4 + 1);
	end;
end;
local function u24(p31, p32)
	if p31.UserInputType == Enum.UserInputType.Touch then
		u12(p31, p32);
		return;
	end;
	if p31.UserInputType == Enum.UserInputType.MouseMovement then
		local l__Delta__45 = p31.Delta;
		v20.Movement = Vector2.new(l__Delta__45.X, l__Delta__45.Y);
	end;
end;
local function u25(p33, p34)
	if p33.UserInputType == Enum.UserInputType.Touch then
		u13(p33, p34);
		return;
	end;
	if p33.UserInputType == Enum.UserInputType.MouseButton2 then
		u4 = math.max(0, u4 - 1);
	end;
end;
local function u26(p35, p36, p37, p38)
	if not p38 then
		v20.Wheel = p35;
		v20.Pan = p36;
		v20.Pinch = -p37;
	end;
end;
function v18.setInputEnabled(p39)
	if u14 == p39 then
		return;
	end;
	u14 = p39;
	u15();
	u16();
	if u14 then
		l__ContextActionService__1:BindActionAtPriority("RbxCameraThumbstick", u17, false, l__Value__18, Enum.KeyCode.Thumbstick2);
		l__ContextActionService__1:BindActionAtPriority("RbxCameraKeypress", u19, false, l__Value__18, Enum.KeyCode.Left, Enum.KeyCode.Right, Enum.KeyCode.I, Enum.KeyCode.O);
		if l__VRService__5.VREnabled then
			l__ContextActionService__1:BindAction("RbxCameraGamepadReset", u20, false, Enum.KeyCode.ButtonL3);
		end;
		l__ContextActionService__1:BindAction("RbxCameraGamepadZoom", u21, false, Enum.KeyCode.ButtonR3);
		table.insert(u22, l__UserInputService__2.InputBegan:Connect(u23));
		table.insert(u22, l__UserInputService__2.InputChanged:Connect(u24));
		table.insert(u22, l__UserInputService__2.InputEnded:Connect(u25));
		table.insert(u22, l__UserInputService__2.PointerAction:Connect(u26));
		if u10 then
			table.insert(u22, game:GetService("GuiService").MenuOpened:connect(u16));
			return;
		end;
	else
		l__ContextActionService__1:UnbindAction("RbxCameraThumbstick");
		l__ContextActionService__1:UnbindAction("RbxCameraMouseMove");
		l__ContextActionService__1:UnbindAction("RbxCameraMouseWheel");
		l__ContextActionService__1:UnbindAction("RbxCameraKeypress");
		l__ContextActionService__1:UnbindAction("RbxCameraGamepadZoom");
		if l__VRService__5.VREnabled then
			l__ContextActionService__1:UnbindAction("RbxCameraGamepadReset");
		end;
		for v46, v47 in pairs(u22) do
			v47:Disconnect();
		end;
		u22 = {};
	end;
end;
function v18.getInputEnabled()
	return u14;
end;
function v18.resetInputForFrameEnd()
	v20.Movement = Vector2.new();
	v21.Move = Vector2.new();
	v21.Pinch = 0;
	v20.Wheel = 0;
	v20.Pan = Vector2.new();
	v20.Pinch = 0;
end;
l__UserInputService__2.WindowFocused:Connect(u15);
l__UserInputService__2.WindowFocusReleased:Connect(u15);
local u27 = false;
function v18.getHoldPan()
	return u27;
end;
local u28 = false;
function v18.getTogglePan()
	return u28;
end;
function v18.getPanning()
	return u28 or u27;
end;
function v18.setTogglePan(p40)
	u28 = p40;
end;
local u29 = false;
local u30 = nil;
local u31 = nil;
local l__Event__32 = v14.Event;
local u33 = 0;
local l__Event__34 = v15.Event;
function v18.enableCameraToggleInput()
	if u29 then
		return;
	end;
	u29 = true;
	u27 = false;
	u28 = false;
	if u30 then
		u30:Disconnect();
	end;
	if u31 then
		u31:Disconnect();
	end;
	u30 = l__Event__32:Connect(function()
		u27 = true;
		u33 = tick();
	end);
	u31 = l__Event__34:Connect(function()
		u27 = false;
		if tick() - u33 < 0.3 and (u28 or l__UserInputService__2:GetMouseDelta().Magnitude < 2) then
			u28 = not u28;
		end;
	end);
end;
function v18.disableCameraToggleInput()
	if not u29 then
		return;
	end;
	u29 = false;
	if u30 then
		u30:Disconnect();
		u30 = nil;
	end;
	if u31 then
		u31:Disconnect();
		u31 = nil;
	end;
end;
return v18;
