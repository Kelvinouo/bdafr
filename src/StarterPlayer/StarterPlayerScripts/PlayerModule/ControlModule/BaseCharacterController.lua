-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
v1.__index = v1;
local u1 = Vector3.new(0, 0, 0);
function v1.new()
	local v2 = setmetatable({}, v1);
	v2.enabled = false;
	v2.moveVector = u1;
	v2.moveVectorIsCameraRelative = true;
	v2.isJumping = false;
	return v2;
end;
function v1.OnRenderStepped(p1, p2)

end;
function v1.GetMoveVector(p3)
	return p3.moveVector;
end;
function v1.IsMoveVectorCameraRelative(p4)
	return p4.moveVectorIsCameraRelative;
end;
function v1.GetIsJumping(p5)
	return p5.isJumping;
end;
function v1.Enable(p6, p7)
	error("BaseCharacterController:Enable must be overridden in derived classes and should not be called.");
	return false;
end;
return v1;
