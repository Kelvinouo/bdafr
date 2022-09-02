-- Decompiled with the Synapse X Luau decompiler.

local l__ContextActionService__1 = game:GetService("ContextActionService");
local l__Players__2 = game:GetService("Players");
local l__RunService__3 = game:GetService("RunService");
local l__StarterGui__4 = game:GetService("StarterGui");
local l__UserInputService__5 = game:GetService("UserInputService");
local l__Workspace__6 = game:GetService("Workspace");
local v7 = l__Players__2.LocalPlayer;
if not v7 then
	l__Players__2:GetPropertyChangedSignal("LocalPlayer"):Wait();
	v7 = l__Players__2.LocalPlayer;
end;
local u1 = l__Workspace__6.CurrentCamera;
l__Workspace__6:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	local l__CurrentCamera__8 = l__Workspace__6.CurrentCamera;
	if l__CurrentCamera__8 then
		u1 = l__CurrentCamera__8;
	end;
end);
local v9 = Vector3.new(1, 1, 1) * 64;
local v10 = Vector2.new(0.75, 1) * 8;
local v11 = {};
v11.__index = v11;
function v11.new(p1, p2)
	local v12 = setmetatable({}, v11);
	v12.f = p1;
	v12.p = p2;
	v12.v = p2 * 0;
	return v12;
end;
local l__math_pi__2 = math.pi;
local l__math_exp__3 = math.exp;
function v11.Update(p3, p4, p5)
	local v13 = p3.f * 2 * l__math_pi__2;
	local l__v__14 = p3.v;
	local v15 = p5 - p3.p;
	local v16 = l__math_exp__3(-v13 * p4);
	local v17 = p5 + (l__v__14 * p4 - v15 * (v13 * p4 + 1)) * v16;
	p3.p = v17;
	p3.v = (v13 * p4 * (v15 * v13 - l__v__14) + l__v__14) * v16;
	return v17;
end;
function v11.Reset(p6, p7)
	p6.p = p7;
	p6.v = p7 * 0;
end;
local v18 = Vector3.new();
local v19 = Vector2.new();
local v20 = v11.new(1.5, Vector3.new());
local v21 = v11.new(1, Vector2.new());
local v22 = v11.new(4, 0);
local v23 = {};
local l__math_sign__4 = math.sign;
local l__math_abs__5 = math.abs;
local l__math_clamp__6 = math.clamp;
local v24 = {
	Delta = Vector2.new(), 
	MouseWheel = 0
};
local v25 = Vector2.new(1, 1);
local u7 = 1;
local u8 = {
	W = 0, 
	A = 0, 
	S = 0, 
	D = 0, 
	E = 0, 
	Q = 0, 
	U = 0, 
	H = 0, 
	J = 0, 
	K = 0, 
	I = 0, 
	Y = 0, 
	Up = 0, 
	Down = 0, 
	LeftShift = 0, 
	RightShift = 0
};
local function u9(p8)
	return l__math_sign__4(p8) * l__math_clamp__6((l__math_exp__3(2 * ((l__math_abs__5(p8) - 0.15) / 0.85)) - 1) / 6.38905609893065, 0, 1);
end;
local u10 = {
	ButtonX = 0, 
	ButtonY = 0, 
	DPadDown = 0, 
	DPadUp = 0, 
	ButtonL2 = 0, 
	ButtonR2 = 0, 
	Thumbstick1 = Vector2.new(), 
	Thumbstick2 = Vector2.new()
};
local u11 = Vector3.new(1, 1, 1);
local u12 = Vector3.new(1, 1, 1);
function v23.Vel(p9)
	u7 = l__math_clamp__6(u7 + p9 * (u8.Up - u8.Down) * 0.75, 0.01, 4);
	if l__UserInputService__5:IsKeyDown(Enum.KeyCode.LeftShift) or l__UserInputService__5:IsKeyDown(Enum.KeyCode.RightShift) then
		local v26 = 0.25;
	else
		v26 = 1;
	end;
	return (Vector3.new(u9(u10.Thumbstick1.X), u9(u10.ButtonR2) - u9(u10.ButtonL2), u9(-u10.Thumbstick1.Y)) * u11 + Vector3.new(u8.D - u8.A + u8.K - u8.H, u8.E - u8.Q + u8.I - u8.Y, u8.S - u8.W + u8.J - u8.U) * u12) * (u7 * v26);
end;
local u13 = Vector2.new(1, 1) * (l__math_pi__2 / 8);
local u14 = v25 * (l__math_pi__2 / 64);
function v23.Pan(p10)
	v24.Delta = Vector2.new();
	return Vector2.new(u9(u10.Thumbstick2.Y), u9(-u10.Thumbstick2.X)) * u13 + v24.Delta * u14;
end;
function v23.Fov(p11)
	v24.MouseWheel = 0;
	return (u10.ButtonX - u10.ButtonY) * 0.25 + v24.MouseWheel * 1;
end;
local function u15(p12, p13, p14)
	if p13 == Enum.UserInputState.Begin then
		local v27 = 1;
	else
		v27 = 0;
	end;
	u8[p14.KeyCode.Name] = v27;
	return Enum.ContextActionResult.Sink;
end;
local l__Value__16 = Enum.ContextActionPriority.High.Value;
local function u17(p15, p16, p17)
	local l__Delta__28 = p17.Delta;
	v24.Delta = Vector2.new(-l__Delta__28.y, -l__Delta__28.x);
	return Enum.ContextActionResult.Sink;
end;
local function u18(p18, p19, p20)
	v24[p20.UserInputType.Name] = -p20.Position.z;
	return Enum.ContextActionResult.Sink;
end;
local function u19(p21, p22, p23)
	if p22 == Enum.UserInputState.Begin then
		local v29 = 1;
	else
		v29 = 0;
	end;
	u10[p23.KeyCode.Name] = v29;
	return Enum.ContextActionResult.Sink;
end;
local function u20(p24, p25, p26)
	u10[p26.KeyCode.Name] = p26.Position.z;
	return Enum.ContextActionResult.Sink;
end;
local function u21(p27, p28, p29)
	u10[p29.KeyCode.Name] = p29.Position;
	return Enum.ContextActionResult.Sink;
end;
function v23.StartCapture()
	l__ContextActionService__1:BindActionAtPriority("FreecamKeyboard", u15, false, l__Value__16, Enum.KeyCode.W, Enum.KeyCode.U, Enum.KeyCode.A, Enum.KeyCode.H, Enum.KeyCode.S, Enum.KeyCode.J, Enum.KeyCode.D, Enum.KeyCode.K, Enum.KeyCode.E, Enum.KeyCode.I, Enum.KeyCode.Q, Enum.KeyCode.Y, Enum.KeyCode.Up, Enum.KeyCode.Down);
	l__ContextActionService__1:BindActionAtPriority("FreecamMousePan", u17, false, l__Value__16, Enum.UserInputType.MouseMovement);
	l__ContextActionService__1:BindActionAtPriority("FreecamMouseWheel", u18, false, l__Value__16, Enum.UserInputType.MouseWheel);
	l__ContextActionService__1:BindActionAtPriority("FreecamGamepadButton", u19, false, l__Value__16, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY);
	l__ContextActionService__1:BindActionAtPriority("FreecamGamepadTrigger", u20, false, l__Value__16, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2);
	l__ContextActionService__1:BindActionAtPriority("FreecamGamepadThumbstick", u21, false, l__Value__16, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2);
end;
function v23.StopCapture()
	u7 = 1;
	for v30, v31 in pairs(u10) do
		u10[v30] = v31 * 0;
	end;
	for v32, v33 in pairs(u8) do
		u8[v32] = v33 * 0;
	end;
	for v34, v35 in pairs(v24) do
		v24[v34] = v35 * 0;
	end;
	l__ContextActionService__1:UnbindAction("FreecamKeyboard");
	l__ContextActionService__1:UnbindAction("FreecamMousePan");
	l__ContextActionService__1:UnbindAction("FreecamMouseWheel");
	l__ContextActionService__1:UnbindAction("FreecamGamepadButton");
	l__ContextActionService__1:UnbindAction("FreecamGamepadTrigger");
	l__ContextActionService__1:UnbindAction("FreecamGamepadThumbstick");
end;
local u22 = 0;
local l__math_tan__23 = math.tan;
local l__math_rad__24 = math.rad;
local l__math_sqrt__25 = math.sqrt;
local u26 = v19;
local u27 = v18;
local function u28(p30)
	local l__ViewportSize__36 = u1.ViewportSize;
	local v37 = 2 * l__math_tan__23(u22 / 2);
	local v38 = l__ViewportSize__36.x / l__ViewportSize__36.y * v37;
	local l__rightVector__39 = p30.rightVector;
	local l__upVector__40 = p30.upVector;
	local l__lookVector__41 = p30.lookVector;
	local v42 = Vector3.new();
	local v43 = 512;
	for v44 = 0, 1, 0.5 do
		for v45 = 0, 1, 0.5 do
			local v46 = l__rightVector__39 * ((v44 - 0.5) * v38) - l__upVector__40 * ((v45 - 0.5) * v37) + l__lookVector__41;
			local v47 = p30.p + v46 * 0.1;
			local v48, v49 = l__Workspace__6:FindPartOnRay(Ray.new(v47, v46.unit * v43));
			local l__magnitude__50 = (v49 - v47).magnitude;
			if l__magnitude__50 < v43 then
				v43 = l__magnitude__50;
				v42 = v46.unit;
			end;
		end;
	end;
	return l__lookVector__41:Dot(v42) * v43;
end;
local v51 = {};
local u29 = {
	Backpack = true, 
	Chat = true, 
	Health = true, 
	PlayerList = true
};
local u30 = {
	BadgesNotificationsActive = true, 
	PointsNotificationsActive = true
};
local u31 = {};
local u32 = nil;
local u33 = nil;
local u34 = nil;
local u35 = nil;
local u36 = nil;
local u37 = nil;
function v51.Push()
	for v52 in pairs(u29) do
		u29[v52] = l__StarterGui__4:GetCoreGuiEnabled(Enum.CoreGuiType[v52]);
		l__StarterGui__4:SetCoreGuiEnabled(Enum.CoreGuiType[v52], false);
	end;
	for v53 in pairs(u30) do
		u30[v53] = l__StarterGui__4:GetCore(v53);
		l__StarterGui__4:SetCore(v53, false);
	end;
	local v54 = v7:FindFirstChildOfClass("PlayerGui");
	if v54 then
		for v55, v56 in pairs(v54:GetChildren()) do
			if v56:IsA("ScreenGui") and v56.Enabled then
				u31[#u31 + 1] = v56;
				v56.Enabled = false;
			end;
		end;
	end;
	u32 = u1.FieldOfView;
	u1.FieldOfView = 70;
	u33 = u1.CameraType;
	u1.CameraType = Enum.CameraType.Custom;
	u34 = u1.CFrame;
	u35 = u1.Focus;
	u36 = l__UserInputService__5.MouseIconEnabled;
	l__UserInputService__5.MouseIconEnabled = false;
	u37 = l__UserInputService__5.MouseBehavior;
	l__UserInputService__5.MouseBehavior = Enum.MouseBehavior.Default;
end;
function v51.Pop()
	for v57, v58 in pairs(u29) do
		l__StarterGui__4:SetCoreGuiEnabled(Enum.CoreGuiType[v57], v58);
	end;
	for v59, v60 in pairs(u30) do
		l__StarterGui__4:SetCore(v59, v60);
	end;
	for v61, v62 in pairs(u31) do
		if v62.Parent then
			v62.Enabled = true;
		end;
	end;
	u1.FieldOfView = u32;
	u32 = nil;
	u1.CameraType = u33;
	u33 = nil;
	u1.CFrame = u34;
	u34 = nil;
	u1.Focus = u35;
	u35 = nil;
	l__UserInputService__5.MouseIconEnabled = u36;
	u36 = nil;
	l__UserInputService__5.MouseBehavior = u37;
	u37 = nil;
end;
local function u38(p31)
	local v63 = v20:Update(p31, v23.Vel(p31));
	local v64 = l__math_sqrt__25(0.7002075382097097 / l__math_tan__23(l__math_rad__24(u22 / 2)));
	u22 = l__math_clamp__6(u22 + v22:Update(p31, v23.Fov(p31)) * 300 * (p31 / v64), 1, 120);
	u26 = u26 + v21:Update(p31, v23.Pan(p31)) * v10 * (p31 / v64);
	u26 = Vector2.new(l__math_clamp__6(u26.x, -1.5707963267948966, 1.5707963267948966), u26.y % (2 * l__math_pi__2));
	local v65 = CFrame.new(u27) * CFrame.fromOrientation(u26.x, u26.y, 0) * CFrame.new(v63 * v9 * p31);
	u27 = v65.p;
	u1.CFrame = v65;
	u1.Focus = v65 * CFrame.new(0, 0, -u28(v65));
	u1.FieldOfView = u22;
end;
local u39 = false;
local function u40()
	l__Workspace__6:SetAttribute("FreecamEnabled", true);
	local l__CFrame__66 = u1.CFrame;
	u26 = Vector2.new(l__CFrame__66:toEulerAnglesYXZ());
	u27 = l__CFrame__66.p;
	u22 = u1.FieldOfView;
	v20:Reset(Vector3.new());
	v21:Reset(Vector2.new());
	v22:Reset(0);
	v51.Push();
	l__RunService__3:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, u38);
	v23.StartCapture();
end;
local u41 = { Enum.KeyCode.LeftShift, Enum.KeyCode.P };
local function u42(p32)
	for v67 = 1, #p32 - 1 do
		if not l__UserInputService__5:IsKeyDown(p32[v67]) then
			return;
		end;
	end;
	if u39 then
		l__Workspace__6:SetAttribute("FreecamEnabled", false);
		v23.StopCapture();
		l__RunService__3:UnbindFromRenderStep("Freecam");
		v51.Pop();
	else
		u40();
	end;
	u39 = not u39;
end;
l__ContextActionService__1:BindActionAtPriority("FreecamToggle", function(p33, p34, p35)
	if p34 == Enum.UserInputState.Begin and p35.KeyCode == u41[#u41] then
		u42(u41);
	end;
	return Enum.ContextActionResult.Pass;
end, false, Enum.ContextActionPriority.Low.Value, u41[#u41]);
