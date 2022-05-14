-- Decompiled with the Synapse X Luau decompiler.

local v1 = {
	PointCloud = function(p1, p2)
		local v2 = p1[1];
		local v3 = p1[1]:Dot(p2);
		for v4 = 2, #p1 do
			local v5 = p1[v4]:Dot(p2);
			if v3 < v5 then
				v2 = p1[v4];
				v3 = v5;
			end;
		end;
		return v2;
	end
};
local u1 = Vector3.new(1, 0, 0);
local function u2(p3, p4, p5, p6)
	local v6 = -(p3 - p5):Dot(p6) / p4:Dot(p6);
	return p3 + v6 * p4, v6;
end;
local u3 = Vector3.new(0, 0, 0);
function v1.Cylinder(p7, p8)
	local v7, v8 = unpack(p7);
	p8 = v7:VectorToObjectSpace(p8);
	local v9 = math.min(v8.y, v8.z);
	local v10 = p8:Dot(u1);
	local v11 = Vector3.new(v8.x, 0, 0);
	if v10 == 0 then
		local v12 = p8.Unit * v9;
	else
		local v13 = v10 > 0 and v11 or -v11;
		local v14, v15 = u2(u3, p8, v13, u1);
		v12 = v13 + (v14 - v13).Unit * v9;
	end;
	return v7:PointToWorldSpace(v12);
end;
function v1.Ellipsoid(p9, p10)
	local v16, v17 = unpack(p9);
	return v16:PointToWorldSpace(v17 * (v17 * v16:VectorToObjectSpace(p10)).Unit);
end;
return v1;
