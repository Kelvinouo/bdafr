
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = setmetatable({}, {
	__tostring = function()
		return "RotatingMotor6DComponent";
	end
});
v2.__index = v2;
function v2.new(...)
	local v3 = setmetatable({}, v2);
	return v3:constructor(...) and v3;
end;
local u1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "attribute-config");
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").Attribute.new("RotationSpeed", v1.import(script, v1.getModule(script, "@rbxts", "t").lib.ts).t.number);
function v2.constructor(p1, p2)
	p1.instance = p2;
	p1.lastHeartbeat = os.clock();
	if not p2:IsA("Motor6D") then
		error("RotatingObjects must be of class Motor6D");
	end;
	p1.config = u1.new(p2, { u2 });
end;
function v2.HeartbeatUpdate(p3)
	local v4 = os.clock();
	p3.lastHeartbeat = v4;
	p3.instance.C0 = p3.instance.C0 * CFrame.Angles(0, math.rad(p3.config.Values.RotationSpeed * (v4 - p3.lastHeartbeat)), 0);
end;
function v2.Destroy(p4)

end;
v2.Tag = "RotatingMotor6D";
return v2;

