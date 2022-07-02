-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
v1.__index = v1;
local u1 = CFrame.new();
function v1.new()
	return setmetatable({
		lastCFrame = nil
	}, v1);
end;
function v1.Step(p1, p2, p3)
	local v2 = p1.lastCFrame and p3;
	p1.lastCFrame = p3;
	local l__Position__3 = p3.Position;
	local v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15 = p3:components();
	local v16 = CFrame.new(0, 0, 0, v7, v8, v9, v10, v11, v12, v13, v14, v15);
	local v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28 = v2:components();
	local v29, v30 = (v16 * CFrame.new(0, 0, 0, v20, v21, v22, v23, v24, v25, v26, v27, v28):inverse()):toAxisAngle();
	local u2 = (l__Position__3 - v2.p) / p2;
	local u3 = v29 * v30 / p2;
	return {
		extrapolate = function(p4)
			local v31 = u3 * p4;
			local l__magnitude__32 = v31.magnitude;
			if l__magnitude__32 > 1E-05 then
				local v33 = CFrame.fromAxisAngle(v31, l__magnitude__32);
			else
				v33 = u1;
			end;
			return v33 * v16 + (u2 * p4 + l__Position__3);
		end, 
		posVelocity = u2, 
		rotVelocity = u3
	};
end;
function v1.Reset(p5)
	p5.lastCFrame = nil;
end;
u1 = require;
u1 = u1(script.Parent:WaitForChild("BaseOcclusion"));
local v34 = setmetatable({}, u1);
v34.__index = v34;
function v34.new()
	local v35 = setmetatable(u1.new(), v34);
	v35.focusExtrapolator = v1.new();
	return v35;
end;
function v34.GetOcclusionMode(p6)
	return Enum.DevCameraOcclusionMode.Zoom;
end;
function v34.Enable(p7, p8)
	p7.focusExtrapolator:Reset();
end;
local u4 = require(script.Parent:WaitForChild("ZoomController"));
function v34.Update(p9, p10, p11, p12, p13)
	local v36 = CFrame.new(p12.p, p11.p) * CFrame.new(0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1);
	return v36 * CFrame.new(0, 0, (u4.Update(p10, v36, (p9.focusExtrapolator:Step(p10, v36))))), p12;
end;
function v34.CharacterAdded(p14, p15, p16)

end;
function v34.CharacterRemoving(p17, p18, p19)

end;
function v34.OnCameraSubjectChanged(p20, p21)

end;
return v34;
