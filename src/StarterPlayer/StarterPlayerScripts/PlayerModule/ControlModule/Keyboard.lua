-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(script.Parent:WaitForChild("BaseCharacterController"));
local v2 = setmetatable({}, v1);
v2.__index = v2;
function v2.new(p1)
	local v3 = setmetatable(v1.new(), v2);
	v3.CONTROL_ACTION_PRIORITY = p1;
	v3.textFocusReleasedConn = nil;
	v3.textFocusGainedConn = nil;
	v3.windowFocusReleasedConn = nil;
	v3.forwardValue = 0;
	v3.backwardValue = 0;
	v3.leftValue = 0;
	v3.rightValue = 0;
	v3.jumpEnabled = true;
	return v3;
end;
local l__UserInputService__1 = game:GetService("UserInputService");
local u2 = Vector3.new(0, 0, 0);
function v2.Enable(p2, p3)
	if not l__UserInputService__1.KeyboardEnabled then
		return false;
	end;
	if p3 == p2.enabled then
		return true;
	end;
	p2.forwardValue = 0;
	p2.backwardValue = 0;
	p2.leftValue = 0;
	p2.rightValue = 0;
	p2.moveVector = u2;
	p2.jumpRequested = false;
	p2:UpdateJump();
	if p3 then
		p2:BindContextActions();
		p2:ConnectFocusEventListeners();
	else
		p2:UnbindContextActions();
		p2:DisconnectFocusEventListeners();
	end;
	p2.enabled = p3;
	return true;
end;
function v2.UpdateMovement(p4, p5)
	if p5 == Enum.UserInputState.Cancel then
		p4.moveVector = u2;
		return;
	end;
	p4.moveVector = Vector3.new(p4.leftValue + p4.rightValue, 0, p4.forwardValue + p4.backwardValue);
end;
function v2.UpdateJump(p6)
	p6.isJumping = p6.jumpRequested;
end;
local l__ContextActionService__3 = game:GetService("ContextActionService");
function v2.BindContextActions(p7)
	l__ContextActionService__3:BindActionAtPriority("moveForwardAction", function(p8, p9, p10)
		if p9 == Enum.UserInputState.Begin then
			local v4 = -1;
		else
			v4 = 0;
		end;
		p7.forwardValue = v4;
		p7:UpdateMovement(p9);
		return Enum.ContextActionResult.Pass;
	end, false, p7.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterForward);
	l__ContextActionService__3:BindActionAtPriority("moveBackwardAction", function(p11, p12, p13)
		if p12 == Enum.UserInputState.Begin then
			local v5 = 1;
		else
			v5 = 0;
		end;
		p7.backwardValue = v5;
		p7:UpdateMovement(p12);
		return Enum.ContextActionResult.Pass;
	end, false, p7.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterBackward);
	l__ContextActionService__3:BindActionAtPriority("moveLeftAction", function(p14, p15, p16)
		if p15 == Enum.UserInputState.Begin then
			local v6 = -1;
		else
			v6 = 0;
		end;
		p7.leftValue = v6;
		p7:UpdateMovement(p15);
		return Enum.ContextActionResult.Pass;
	end, false, p7.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterLeft);
	l__ContextActionService__3:BindActionAtPriority("moveRightAction", function(p17, p18, p19)
		if p18 == Enum.UserInputState.Begin then
			local v7 = 1;
		else
			v7 = 0;
		end;
		p7.rightValue = v7;
		p7:UpdateMovement(p18);
		return Enum.ContextActionResult.Pass;
	end, false, p7.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterRight);
	l__ContextActionService__3:BindActionAtPriority("jumpAction", function(p20, p21, p22)
		local v8 = p7.jumpEnabled and p21 == Enum.UserInputState.Begin;
		p7.jumpRequested = v8;
		p7:UpdateJump();
		return Enum.ContextActionResult.Pass;
	end, false, p7.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterJump);
end;
function v2.UnbindContextActions(p23)
	l__ContextActionService__3:UnbindAction("moveForwardAction");
	l__ContextActionService__3:UnbindAction("moveBackwardAction");
	l__ContextActionService__3:UnbindAction("moveLeftAction");
	l__ContextActionService__3:UnbindAction("moveRightAction");
	l__ContextActionService__3:UnbindAction("jumpAction");
end;
function v2.ConnectFocusEventListeners(p24)
	local function v9()
		p24.moveVector = u2;
		p24.forwardValue = 0;
		p24.backwardValue = 0;
		p24.leftValue = 0;
		p24.rightValue = 0;
		p24.jumpRequested = false;
		p24:UpdateJump();
	end;
	p24.textFocusReleasedConn = l__UserInputService__1.TextBoxFocusReleased:Connect(v9);
	p24.textFocusGainedConn = l__UserInputService__1.TextBoxFocused:Connect(function(p25)
		p24.jumpRequested = false;
		p24:UpdateJump();
	end);
	p24.windowFocusReleasedConn = l__UserInputService__1.WindowFocused:Connect(v9);
end;
function v2.DisconnectFocusEventListeners(p26)
	if p26.textFocusReleasedConn then
		p26.textFocusReleasedConn:Disconnect();
		p26.textFocusReleasedConn = nil;
	end;
	if p26.textFocusGainedConn then
		p26.textFocusGainedConn:Disconnect();
		p26.textFocusGainedConn = nil;
	end;
	if p26.windowFocusReleasedConn then
		p26.windowFocusReleasedConn:Disconnect();
		p26.windowFocusReleasedConn = nil;
	end;
end;
return v2;
