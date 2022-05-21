-- Script Hash: 1bd818483137edc57e2698c0ef3a1fdb803c6c69f216fb32ce84205caf6e4fbaa919c543717e54590e83e40a4ed5c7ee
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
local v11 = math.rad(90);
local v12 = {};
v12.__index = v12;
function v12.new(p1, p2)
	local v13 = setmetatable({}, v12);
	v13.f = p1;
	v13.p = p2;
	v13.v = p2 * 0;
	return v13;
end;
local l__math_pi__2 = math.pi;
local l__math_exp__3 = math.exp;
function v12.Update(p3, p4, p5)
	local v14 = p3.f * 2 * l__math_pi__2;
	local l__v__15 = p3.v;
	local v16 = p5 - p3.p;
	local v17 = l__math_exp__3(-v14 * p4);
	local v18 = p5 + (l__v__15 * p4 - v16 * (v14 * p4 + 1)) * v17;
	p3.p = v18;
	p3.v = (v14 * p4 * (v16 * v14 - l__v__15) + l__v__15) * v17;
	return v18;
end;
function v12.Reset(p6, p7)
	p6.p = p7;
	p6.v = p7 * 0;
end;
local v19 = Vector3.new();
local v20 = Vector2.new();
local v21 = v12.new(1.5, Vector3.new());
local v22 = v12.new(1, Vector2.new());
local v23 = v12.new(4, 0);
local v24 = {};
local u4 = function(p8)
	return (l__math_exp__3(2 * p8) - 1) / (l__math_exp__3(2) - 1);
end;
local l__math_sign__5 = math.sign;
local u6 = function(p9)
	return u4((p9 - 0.15) / 0.85);
end;
local l__math_abs__7 = math.abs;
local l__math_clamp__8 = math.clamp;
u4 = {};
u6 = 0;
u4.ButtonX = u6;
u6 = 0;
u4.ButtonY = u6;
u6 = 0;
u4.DPadDown = u6;
u6 = 0;
u4.DPadUp = u6;
u6 = 0;
u4.ButtonL2 = u6;
u6 = 0;
u4.ButtonR2 = u6;
u6 = Vector2.new;
u6 = u6();
u4.Thumbstick1 = u6;
u6 = Vector2.new;
u6 = u6();
u4.Thumbstick2 = u6;
u6 = {
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
local v25 = {
	Delta = Vector2.new(), 
	MouseWheel = 0
};
local v26 = Vector2.new(1, 1);
local u9 = 1;
local function u10(p10)
	return l__math_sign__5(p10) * l__math_clamp__8(u6(l__math_abs__7(p10)), 0, 1);
end;
local u11 = Vector3.new(1, 1, 1);
local u12 = Vector3.new(1, 1, 1);
function v24.Vel(p11)
	u9 = l__math_clamp__8(u9 + p11 * (u6.Up - u6.Down) * 0.75, 0.01, 4);
	if l__UserInputService__5:IsKeyDown(Enum.KeyCode.LeftShift) or l__UserInputService__5:IsKeyDown(Enum.KeyCode.RightShift) then
		local v27 = 0.25;
	else
		v27 = 1;
	end;
	return (Vector3.new(u10(u4.Thumbstick1.X), u10(u4.ButtonR2) - u10(u4.ButtonL2), u10(-u4.Thumbstick1.Y)) * u11 + Vector3.new(u6.D - u6.A + u6.K - u6.H, u6.E - u6.Q + u6.I - u6.Y, u6.S - u6.W + u6.J - u6.U) * u12) * (u9 * v27);
end;
local u13 = Vector2.new(1, 1) * (l__math_pi__2 / 8);
local u14 = v26 * (l__math_pi__2 / 64);
function v24.Pan(p12)
	v25.Delta = Vector2.new();
	return Vector2.new(u10(u4.Thumbstick2.Y), u10(-u4.Thumbstick2.X)) * u13 + v25.Delta * u14;
end;
function v24.Fov(p13)
	v25.MouseWheel = 0;
	return (u4.ButtonX - u4.ButtonY) * 0.25 + v25.MouseWheel * 1;
end;
local function u15(p14, p15, p16)
	if p15 == Enum.UserInputState.Begin then
		local v28 = 1;
	else
		v28 = 0;
	end;
	u6[p16.KeyCode.Name] = v28;
	return Enum.ContextActionResult.Sink;
end;
local l__Value__16 = Enum.ContextActionPriority.High.Value;
local function u17(p17, p18, p19)
	local l__Delta__29 = p19.Delta;
	v25.Delta = Vector2.new(-l__Delta__29.y, -l__Delta__29.x);
	return Enum.ContextActionResult.Sink;
end;
local function u18(p20, p21, p22)
	v25[p22.UserInputType.Name] = -p22.Position.z;
	return Enum.ContextActionResult.Sink;
end;
local function u19(p23, p24, p25)
	if p24 == Enum.UserInputState.Begin then
		local v30 = 1;
	else
		v30 = 0;
	end;
	u4[p25.KeyCode.Name] = v30;
	return Enum.ContextActionResult.Sink;
end;
local function u20(p26, p27, p28)
	u4[p28.KeyCode.Name] = p28.Position.z;
	return Enum.ContextActionResult.Sink;
end;
local function u21(p29, p30, p31)
	u4[p31.KeyCode.Name] = p31.Position;
	return Enum.ContextActionResult.Sink;
end;
function v24.StartCapture()
	l__ContextActionService__1:BindActionAtPriority("FreecamKeyboard", u15, false, l__Value__16, Enum.KeyCode.W, Enum.KeyCode.U, Enum.KeyCode.A, Enum.KeyCode.H, Enum.KeyCode.S, Enum.KeyCode.J, Enum.KeyCode.D, Enum.KeyCode.K, Enum.KeyCode.E, Enum.KeyCode.I, Enum.KeyCode.Q, Enum.KeyCode.Y, Enum.KeyCode.Up, Enum.KeyCode.Down);
	l__ContextActionService__1:BindActionAtPriority("FreecamMousePan", u17, false, l__Value__16, Enum.UserInputType.MouseMovement);
	l__ContextActionService__1:BindActionAtPriority("FreecamMouseWheel", u18, false, l__Value__16, Enum.UserInputType.MouseWheel);
	l__ContextActionService__1:BindActionAtPriority("FreecamGamepadButton", u19, false, l__Value__16, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY);
	l__ContextActionService__1:BindActionAtPriority("FreecamGamepadTrigger", u20, false, l__Value__16, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2);
	l__ContextActionService__1:BindActionAtPriority("FreecamGamepadThumbstick", u21, false, l__Value__16, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2);
end;
local function u22(p32)
	for v31, v32 in pairs(p32) do
		p32[v31] = v32 * 0;
	end;
end;
function v24.StopCapture()
	u9 = 1;
	u22(u4);
	u22(u6);
	u22(v25);
	l__ContextActionService__1:UnbindAction("FreecamKeyboard");
	l__ContextActionService__1:UnbindAction("FreecamMousePan");
	l__ContextActionService__1:UnbindAction("FreecamMouseWheel");
	l__ContextActionService__1:UnbindAction("FreecamGamepadButton");
	l__ContextActionService__1:UnbindAction("FreecamGamepadTrigger");
	l__ContextActionService__1:UnbindAction("FreecamGamepadThumbstick");
end;
local u23 = 0;
local l__math_tan__24 = math.tan;
local l__math_rad__25 = math.rad;
local l__math_sqrt__26 = math.sqrt;
local u27 = v20;
local u28 = v19;
local function u29(p33)
	local l__ViewportSize__33 = u1.ViewportSize;
	local v34 = 2 * l__math_tan__24(u23 / 2);
	local v35 = l__ViewportSize__33.x / l__ViewportSize__33.y * v34;
	local l__rightVector__36 = p33.rightVector;
	local l__upVector__37 = p33.upVector;
	local l__lookVector__38 = p33.lookVector;
	local v39 = Vector3.new();
	local v40 = 512;
	for v41 = 0, 1, 0.5 do
		for v42 = 0, 1, 0.5 do
			local v43 = l__rightVector__36 * ((v41 - 0.5) * v35) - l__upVector__37 * ((v42 - 0.5) * v34) + l__lookVector__38;
			local v44 = p33.p + v43 * 0.1;
			local v45, v46 = l__Workspace__6:FindPartOnRay(Ray.new(v44, v43.unit * v40));
			local l__magnitude__47 = (v46 - v44).magnitude;
			if l__magnitude__47 < v40 then
				v40 = l__magnitude__47;
				v39 = v43.unit;
			end;
		end;
	end;
	return l__lookVector__38:Dot(v39) * v40;
end;
local v48 = {};
local u30 = {
	Backpack = true, 
	Chat = true, 
	Health = true, 
	PlayerList = true
};
local u31 = {
	BadgesNotificationsActive = true, 
	PointsNotificationsActive = true
};
local u32 = {};
local u33 = nil;
local u34 = nil;
local u35 = nil;
local u36 = nil;
local u37 = nil;
local u38 = nil;
function v48.Push()
	for v49, v50 in pairs(u30) do
		u30[v49] = l__StarterGui__4:GetCoreGuiEnabled(Enum.CoreGuiType[v49]);
		l__StarterGui__4:SetCoreGuiEnabled(Enum.CoreGuiType[v49], false);
	end;
	for v51, v52 in pairs(u31) do
		u31[v51] = l__StarterGui__4:GetCore(v51);
		l__StarterGui__4:SetCore(v51, false);
	end;
	local v53 = v7:FindFirstChildOfClass("PlayerGui");
	if v53 then
		for v54, v55 in pairs(v53:GetChildren()) do
			if v55:IsA("ScreenGui") and v55.Enabled then
				u32[#u32 + 1] = v55;
				v55.Enabled = false;
			end;
		end;
	end;
	u33 = u1.FieldOfView;
	u1.FieldOfView = 70;
	u34 = u1.CameraType;
	u1.CameraType = Enum.CameraType.Custom;
	u35 = u1.CFrame;
	u36 = u1.Focus;
	u37 = l__UserInputService__5.MouseIconEnabled;
	l__UserInputService__5.MouseIconEnabled = false;
	u38 = l__UserInputService__5.MouseBehavior;
	l__UserInputService__5.MouseBehavior = Enum.MouseBehavior.Default;
end;
function v48.Pop()
	for v56, v57 in pairs(u30) do
		l__StarterGui__4:SetCoreGuiEnabled(Enum.CoreGuiType[v56], v57);
	end;
	for v58, v59 in pairs(u31) do
		l__StarterGui__4:SetCore(v58, v59);
	end;
	for v60, v61 in pairs(u32) do
		if v61.Parent then
			v61.Enabled = true;
		end;
	end;
	u1.FieldOfView = u33;
	u33 = nil;
	u1.CameraType = u34;
	u34 = nil;
	u1.CFrame = u35;
	u35 = nil;
	u1.Focus = u36;
	u36 = nil;
	l__UserInputService__5.MouseIconEnabled = u37;
	u37 = nil;
	l__UserInputService__5.MouseBehavior = u38;
	u38 = nil;
end;
local function u39(p34)
	local v62 = v21:Update(p34, v24.Vel(p34));
	local v63 = l__math_sqrt__26(l__math_tan__24(l__math_rad__25(35)) / l__math_tan__24(l__math_rad__25(u23 / 2)));
	u23 = l__math_clamp__8(u23 + v23:Update(p34, v24.Fov(p34)) * 300 * (p34 / v63), 1, 120);
	u27 = u27 + v22:Update(p34, v24.Pan(p34)) * v10 * (p34 / v63);
	u27 = Vector2.new(l__math_clamp__8(u27.x, -v11, v11), u27.y % (2 * l__math_pi__2));
	local v64 = CFrame.new(u28) * CFrame.fromOrientation(u27.x, u27.y, 0) * CFrame.new(v62 * v9 * p34);
	u28 = v64.p;
	u1.CFrame = v64;
	u1.Focus = v64 * CFrame.new(0, 0, -u29(v64));
	u1.FieldOfView = u23;
end;
local u40 = false;
local function u41()
	l__Workspace__6:SetAttribute("FreecamEnabled", false);
	v24.StopCapture();
	l__RunService__3:UnbindFromRenderStep("Freecam");
	v48.Pop();
end;
local function u42()
	l__Workspace__6:SetAttribute("FreecamEnabled", true);
	local l__CFrame__65 = u1.CFrame;
	u27 = Vector2.new(l__CFrame__65:toEulerAnglesYXZ());
	u28 = l__CFrame__65.p;
	u23 = u1.FieldOfView;
	v21:Reset(Vector3.new());
	v22:Reset(Vector2.new());
	v23:Reset(0);
	v48.Push();
	l__RunService__3:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, u39);
	v24.StartCapture();
end;
local function u43()
	if u40 then
		u41();
	else
		u42();
	end;
	u40 = not u40;
end;
local u44 = { Enum.KeyCode.LeftShift, Enum.KeyCode.P };
local function u45(p35)
	for v66 = 1, #p35 - 1 do
		if not l__UserInputService__5:IsKeyDown(p35[v66]) then
			return;
		end;
	end;
	u43();
end;
l__ContextActionService__1:BindActionAtPriority("FreecamToggle", function(p36, p37, p38)
	if p37 == Enum.UserInputState.Begin and p38.KeyCode == u44[#u44] then
		u45(u44);
	end;
	return Enum.ContextActionResult.Pass;
end, false, Enum.ContextActionPriority.Low.Value, u44[#u44]);
