
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(script.Parent:WaitForChild("BaseCharacterController"));
local v2 = setmetatable({}, v1);
v2.__index = v2;
local l__Enum_UserInputType_None__1 = Enum.UserInputType.None;
function v2.new(p1)
	local v3 = setmetatable(v1.new(), v2);
	v3.CONTROL_ACTION_PRIORITY = p1;
	v3.forwardValue = 0;
	v3.backwardValue = 0;
	v3.leftValue = 0;
	v3.rightValue = 0;
	v3.activeGamepad = l__Enum_UserInputType_None__1;
	v3.gamepadConnectedConn = nil;
	v3.gamepadDisconnectedConn = nil;
	return v3;
end;
local l__UserInputService__2 = game:GetService("UserInputService");
local u3 = Vector3.new(0, 0, 0);
function v2.Enable(p2, p3)
	if not l__UserInputService__2.GamepadEnabled then
		return false;
	end;
	if p3 == p2.enabled then
		return true;
	end;
	p2.forwardValue = 0;
	p2.backwardValue = 0;
	p2.leftValue = 0;
	p2.rightValue = 0;
	p2.moveVector = u3;
	p2.isJumping = false;
	if p3 then
		p2.activeGamepad = p2:GetHighestPriorityGamepad();
		if p2.activeGamepad == l__Enum_UserInputType_None__1 then
			return false;
		end;
		p2:BindContextActions();
		p2:ConnectGamepadConnectionListeners();
	else
		p2:UnbindContextActions();
		p2:DisconnectGamepadConnectionListeners();
		p2.activeGamepad = l__Enum_UserInputType_None__1;
	end;
	p2.enabled = p3;
	return true;
end;
function v2.GetHighestPriorityGamepad(p4)
	local v4 = l__Enum_UserInputType_None__1;
	for v5, v6 in pairs((l__UserInputService__2:GetConnectedGamepads())) do
		if v6.Value < v4.Value then
			v4 = v6;
		end;
	end;
	return v4;
end;
local l__ContextActionService__4 = game:GetService("ContextActionService");
function v2.BindContextActions(p5)
	if p5.activeGamepad == l__Enum_UserInputType_None__1 then
		return false;
	end;
	l__ContextActionService__4:BindActivate(p5.activeGamepad, Enum.KeyCode.ButtonR2);
	l__ContextActionService__4:BindActionAtPriority("jumpAction", function(p6, p7, p8)
		p5.isJumping = p7 == Enum.UserInputState.Begin;
		return Enum.ContextActionResult.Sink;
	end, false, p5.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonA);
	l__ContextActionService__4:BindActionAtPriority("moveThumbstick", function(p9, p10, p11)
		if p10 == Enum.UserInputState.Cancel then
			p5.moveVector = u3;
			return Enum.ContextActionResult.Sink;
		end;
		if p5.activeGamepad ~= p11.UserInputType then
			return Enum.ContextActionResult.Pass;
		end;
		if p11.KeyCode ~= Enum.KeyCode.Thumbstick1 then
			return;
		end;
		if p11.Position.magnitude > 0.2 then
			p5.moveVector = Vector3.new(p11.Position.X, 0, -p11.Position.Y);
		else
			p5.moveVector = u3;
		end;
		return Enum.ContextActionResult.Sink;
	end, false, p5.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Thumbstick1);
	return true;
end;
function v2.UnbindContextActions(p12)
	if p12.activeGamepad ~= l__Enum_UserInputType_None__1 then
		l__ContextActionService__4:UnbindActivate(p12.activeGamepad, Enum.KeyCode.ButtonR2);
	end;
	l__ContextActionService__4:UnbindAction("moveThumbstick");
	l__ContextActionService__4:UnbindAction("jumpAction");
end;
function v2.OnNewGamepadConnected(p13)
	local v7 = p13:GetHighestPriorityGamepad();
	if v7 == p13.activeGamepad then
		return;
	end;
	if v7 == l__Enum_UserInputType_None__1 then
		warn("Gamepad:OnNewGamepadConnected found no connected gamepads");
		p13:UnbindContextActions();
		return;
	end;
	if p13.activeGamepad ~= l__Enum_UserInputType_None__1 then
		p13:UnbindContextActions();
	end;
	p13.activeGamepad = v7;
	p13:BindContextActions();
end;
function v2.OnCurrentGamepadDisconnected(p14)
	if p14.activeGamepad ~= l__Enum_UserInputType_None__1 then
		l__ContextActionService__4:UnbindActivate(p14.activeGamepad, Enum.KeyCode.ButtonR2);
	end;
	local v8 = p14:GetHighestPriorityGamepad();
	if p14.activeGamepad ~= l__Enum_UserInputType_None__1 and v8 == p14.activeGamepad then
		warn("Gamepad:OnCurrentGamepadDisconnected found the supposedly disconnected gamepad in connectedGamepads.");
		p14:UnbindContextActions();
		p14.activeGamepad = l__Enum_UserInputType_None__1;
		return;
	end;
	if v8 == l__Enum_UserInputType_None__1 then
		p14:UnbindContextActions();
		p14.activeGamepad = l__Enum_UserInputType_None__1;
		return;
	end;
	p14.activeGamepad = v8;
	l__ContextActionService__4:BindActivate(p14.activeGamepad, Enum.KeyCode.ButtonR2);
end;
function v2.ConnectGamepadConnectionListeners(p15)
	p15.gamepadConnectedConn = l__UserInputService__2.GamepadConnected:Connect(function(p16)
		p15:OnNewGamepadConnected();
	end);
	p15.gamepadDisconnectedConn = l__UserInputService__2.GamepadDisconnected:Connect(function(p17)
		if p15.activeGamepad == p17 then
			p15:OnCurrentGamepadDisconnected();
		end;
	end);
end;
function v2.DisconnectGamepadConnectionListeners(p18)
	if p18.gamepadConnectedConn then
		p18.gamepadConnectedConn:Disconnect();
		p18.gamepadConnectedConn = nil;
	end;
	if p18.gamepadDisconnectedConn then
		p18.gamepadDisconnectedConn:Disconnect();
		p18.gamepadDisconnectedConn = nil;
	end;
end;
return v2;

