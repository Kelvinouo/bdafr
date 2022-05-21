-- Script Hash: a920ff4ae5d8e0d9f29d3c7e834e653bda547a9b4989e9867deb1fa22d3a54d77718440f6f7b3fbd35a5023b7e6717dc
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = setmetatable({}, {
	__tostring = function()
		return "RotatingObjectComponent";
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
	if not p2:IsA("Model") then
		error("RotatingObjects must be of class Model");
	end;
	p1.config = u1.new(p2, { u2 });
end;
function v2.HeartbeatUpdate(p3)
	if p3.instance.PrimaryPart ~= nil then
		local v4 = os.clock();
		p3.lastHeartbeat = v4;
		p3.instance:SetPrimaryPartCFrame(p3.instance:GetPrimaryPartCFrame() * CFrame.Angles(0, math.rad(p3.config.Values.RotationSpeed * (v4 - p3.lastHeartbeat)), 0));
	end;
end;
function v2.Destroy(p4)

end;
v2.Tag = "RotatingObject";
return v2;
