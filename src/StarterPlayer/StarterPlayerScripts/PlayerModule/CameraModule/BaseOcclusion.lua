-- Script Hash: 8d1bafa3b8f3c4bc030a1d15ad0f29c1ff08f7f35b34d883cf8cb6a410e20f035b4a7c2d2afa715854fca5f51cbf14cf
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
v1.__index = v1;
local v2 = {};
function v2.__call(p1, ...)
	return v1.new(...);
end;
setmetatable(v1, v2);
function v1.new()
	return setmetatable({}, v1);
end;
function v1.CharacterAdded(p2, p3, p4)

end;
function v1.CharacterRemoving(p5, p6, p7)

end;
function v1.OnCameraSubjectChanged(p8, p9)

end;
function v1.GetOcclusionMode(p10)
	warn("BaseOcclusion GetOcclusionMode must be overridden by derived classes");
	return nil;
end;
function v1.Enable(p11, p12)
	warn("BaseOcclusion Enable must be overridden by derived classes");
end;
function v1.Update(p13, p14, p15, p16)
	warn("BaseOcclusion Update must be overridden by derived classes");
	return p15, p16;
end;
return v1;
