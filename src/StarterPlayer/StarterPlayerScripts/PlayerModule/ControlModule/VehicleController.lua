-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
v1.__index = v1;
local u1 = Vector3.new(0, 0, 0);
function v1.new(p1)
	local v2 = setmetatable({}, v1);
	v2.CONTROL_ACTION_PRIORITY = p1;
	v2.enabled = false;
	v2.vehicleSeat = nil;
	v2.throttle = 0;
	v2.steer = 0;
	v2.acceleration = 0;
	v2.decceleration = 0;
	v2.turningRight = 0;
	v2.turningLeft = 0;
	v2.vehicleMoveVector = u1;
	v2.autoPilot = {};
	v2.autoPilot.MaxSpeed = 0;
	v2.autoPilot.MaxSteeringAngle = 0;
	return v2;
end;
local l__ContextActionService__2 = game:GetService("ContextActionService");
function v1.BindContextActions(p2)
	l__ContextActionService__2:BindActionAtPriority("throttleAccel", function(p3, p4, p5)
		p2:OnThrottleAccel(p3, p4, p5);
		return Enum.ContextActionResult.Pass;
	end, false, p2.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonR2);
	l__ContextActionService__2:BindActionAtPriority("throttleDeccel", function(p6, p7, p8)
		p2:OnThrottleDeccel(p6, p7, p8);
		return Enum.ContextActionResult.Pass;
	end, false, p2.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonL2);
	l__ContextActionService__2:BindActionAtPriority("arrowSteerRight", function(p9, p10, p11)
		p2:OnSteerRight(p9, p10, p11);
		return Enum.ContextActionResult.Pass;
	end, false, p2.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Right);
	l__ContextActionService__2:BindActionAtPriority("arrowSteerLeft", function(p12, p13, p14)
		p2:OnSteerLeft(p12, p13, p14);
		return Enum.ContextActionResult.Pass;
	end, false, p2.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Left);
end;
function v1.Enable(p15, p16, p17)
	if p16 == p15.enabled and p17 == p15.vehicleSeat then
		return;
	end;
	p15.enabled = p16;
	p15.vehicleMoveVector = u1;
	if p16 then
		if not p17 then
			return;
		end;
	else
		l__ContextActionService__2:UnbindAction("throttleAccel");
		l__ContextActionService__2:UnbindAction("throttleDeccel");
		l__ContextActionService__2:UnbindAction("arrowSteerRight");
		l__ContextActionService__2:UnbindAction("arrowSteerLeft");
		p15.vehicleSeat = nil;
		return;
	end;
	p15.vehicleSeat = p17;
	p15:SetupAutoPilot();
	p15:BindContextActions();
end;
function v1.OnThrottleAccel(p18, p19, p20, p21)
	if p20 == Enum.UserInputState.End or p20 == Enum.UserInputState.Cancel then
		p18.acceleration = 0;
	else
		p18.acceleration = -1;
	end;
	p18.throttle = p18.acceleration + p18.decceleration;
end;
function v1.OnThrottleDeccel(p22, p23, p24, p25)
	if p24 == Enum.UserInputState.End or p24 == Enum.UserInputState.Cancel then
		p22.decceleration = 0;
	else
		p22.decceleration = 1;
	end;
	p22.throttle = p22.acceleration + p22.decceleration;
end;
function v1.OnSteerRight(p26, p27, p28, p29)
	if p28 == Enum.UserInputState.End or p28 == Enum.UserInputState.Cancel then
		p26.turningRight = 0;
	else
		p26.turningRight = 1;
	end;
	p26.steer = p26.turningRight + p26.turningLeft;
end;
function v1.OnSteerLeft(p30, p31, p32, p33)
	if p32 == Enum.UserInputState.End or p32 == Enum.UserInputState.Cancel then
		p30.turningLeft = 0;
	else
		p30.turningLeft = -1;
	end;
	p30.steer = p30.turningRight + p30.turningLeft;
end;
function v1.Update(p34, p35, p36, p37)
	if not p34.vehicleSeat then
		return p35, false;
	end;
	if p36 then
		p35 = p35 + Vector3.new(p34.steer, 0, p34.throttle);
		if p37 then

		end;
		p34.vehicleSeat.ThrottleFloat = -p35.Z;
		p34.vehicleSeat.SteerFloat = p35.X;
		return p35, true;
	end;
	local v3 = p34.vehicleSeat.Occupant.RootPart.CFrame:VectorToObjectSpace(p35);
	p34.vehicleSeat.ThrottleFloat = p34:ComputeThrottle(v3);
	p34.vehicleSeat.SteerFloat = p34:ComputeSteer(v3);
	return u1, true;
end;
function v1.ComputeThrottle(p38, p39)
	if p39 == u1 then
		return 0;
	end;
	return -p39.Z;
end;
function v1.ComputeSteer(p40, p41)
	if p41 == u1 then
		return 0;
	end;
	return -math.atan2(-p41.x, -p41.z) * (180 / math.pi) / p40.autoPilot.MaxSteeringAngle;
end;
function v1.SetupAutoPilot(p42)
	p42.autoPilot.MaxSpeed = p42.vehicleSeat.MaxSpeed;
	p42.autoPilot.MaxSteeringAngle = 35;
end;
return v1;
