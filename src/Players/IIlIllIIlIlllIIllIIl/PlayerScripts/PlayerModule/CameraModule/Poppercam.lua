-- Script Hash: aae04519e5b4c7124c8a777caccafa4c099aafb1f71979f77a4f820591195f17df5efd5cbb790a7df1a09487fae3d5f8
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
v1.__index = v1;
local u1 = CFrame.new();
function v1.new()
	return setmetatable({
		lastCFrame = nil
	}, v1);
end;
local u2 = function(p1)
	local v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13 = p1:components();
	return CFrame.new(0, 0, 0, v5, v6, v7, v8, v9, v10, v11, v12, v13);
end;
local u3 = function(p2)
	local v14, v15 = p2:toAxisAngle();
	return v14 * v15;
end;
local u4 = function(p3)
	local l__magnitude__16 = p3.magnitude;
	if not (l__magnitude__16 > 1E-05) then
		return u1;
	end;
	return CFrame.fromAxisAngle(p3, l__magnitude__16);
end;
function v1.Step(p4, p5, p6)
	local v17 = p4.lastCFrame and p6;
	p4.lastCFrame = p6;
	local l__Position__18 = p6.Position;
	local v19 = u2(p6);
	local v20 = u3(v19 * u2(v17):inverse()) / p5;
	local u5 = (l__Position__18 - v17.p) / p5;
	return {
		extrapolate = function(p7)
			return u4(v20 * p7) * v19 + (u5 * p7 + l__Position__18);
		end, 
		posVelocity = u5, 
		rotVelocity = v20
	};
end;
function v1.Reset(p8)
	p8.lastCFrame = nil;
end;
u1 = require;
u4 = script;
u3 = u4.Parent;
u2 = "BaseOcclusion";
u4 = u3;
u3 = u3.WaitForChild;
u1 = u1(u3(u4, u2));
u3 = setmetatable;
u4 = {};
u2 = u1;
u3 = u3(u4, u2);
u3.__index = u3;
u4 = function()
	local v21 = setmetatable(u1.new(), u3);
	v21.focusExtrapolator = v1.new();
	return v21;
end;
u3.new = u4;
u4 = function(p9)
	return Enum.DevCameraOcclusionMode.Zoom;
end;
u3.GetOcclusionMode = u4;
u4 = function(p10, p11)
	p10.focusExtrapolator:Reset();
end;
u3.Enable = u4;
local u6 = require(script.Parent:WaitForChild("ZoomController"));
u4 = function(p12, p13, p14, p15, p16)
	local v22 = CFrame.new(p15.p, p14.p) * CFrame.new(0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1);
	return v22 * CFrame.new(0, 0, (u6.Update(p13, v22, (p12.focusExtrapolator:Step(p13, v22))))), p15;
end;
u3.Update = u4;
u4 = function(p17, p18, p19)

end;
u3.CharacterAdded = u4;
u4 = function(p20, p21, p22)

end;
u3.CharacterRemoving = u4;
u4 = function(p23, p24)

end;
u3.OnCameraSubjectChanged = u4;
return u3;
