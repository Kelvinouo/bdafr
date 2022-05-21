-- Script Hash: 86c4485be1cbfa6fe412ddafa330127753c8ce6ad87a92ece15059c8a7758402effe1cf8d9d4c89cb7f44283a856f2cd
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
v1.__index = v1;
function v1.new()
	local v2 = setmetatable({}, v1);
	v2.cameras = require(script:WaitForChild("CameraModule"));
	v2.controls = require(script:WaitForChild("ControlModule"));
	return v2;
end;
function v1.GetCameras(p1)
	return p1.cameras;
end;
function v1.GetControls(p2)
	return p2.controls;
end;
function v1.GetClickToMoveController(p3)
	return p3.controls:GetClickToMoveController();
end;
return v1.new();
