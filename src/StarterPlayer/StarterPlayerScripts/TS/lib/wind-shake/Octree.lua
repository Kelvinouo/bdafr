-- Decompiled with the Synapse X Luau decompiler.

local v1 = {
	ClassName = "Octree"
};
v1.__index = v1;
function v1.new()
	return setmetatable({
		MaxDepth = 4, 
		MaxRegionSize = table.create(3, 512), 
		RegionHashMap = {}
	}, v1);
end;
function v1.ClearNodes(p1)
	p1.MaxDepth = 4;
	p1.MaxRegionSize = table.create(3, 512);
	table.clear(p1.RegionHashMap);
end;
function v1.GetAllNodes(p2)
	local v2 = {};
	local v3 = 0;
	for v4, v5 in next, p2.RegionHashMap do
		for v6, v7 in ipairs(v5) do
			for v8 in next, v7.Nodes do
				v3 = v3 + 1;
				v2[v3] = v8;
			end;
		end;
	end;
	return v2;
end;
local l__new__1 = require(script.OctreeNode).new;
function v1.CreateNode(p3, p4, p5)
	if typeof(p4) ~= "Vector3" then
		error("Bad position value");
	end;
	if not p5 then
		error("Bad object value.");
	end;
	local v9 = l__new__1(p3, p5);
	v9:SetPosition(p4);
	return v9;
end;
local l__GetNeighborsWithinRadius__2 = require(script.OctreeRegionUtils).GetNeighborsWithinRadius;
function v1.RadiusSearch(p6, p7, p8)
	if typeof(p7) ~= "Vector3" then
		error("Bad position value");
	end;
	if type(p8) ~= "number" then
		error("Bad radius value");
	end;
	local l__X__10 = p7.X;
	local l__Y__11 = p7.Y;
	local l__Z__12 = p7.Z;
	local v13 = {};
	local v14 = {};
	local v15 = 0;
	local v16 = 0;
	local v17 = p8 + 0.8660254037844386 * p6.MaxRegionSize[1];
	local v18 = v17 * v17 + 1E-09;
	for v19, v20 in next, p6.RegionHashMap do
		for v21, v22 in ipairs(v20) do
			local l__Position__23 = v22.Position;
			local v24 = l__X__10 - l__Position__23[1];
			local v25 = l__Y__11 - l__Position__23[2];
			local v26 = l__Z__12 - l__Position__23[3];
			if v24 * v24 + v25 * v25 + v26 * v26 <= v18 then
				local v27, v28 = l__GetNeighborsWithinRadius__2(v22, p8, l__X__10, l__Y__11, l__Z__12, v13, v14, p6.MaxDepth, v15, v16);
				v15 = v27;
				v16 = v28;
			end;
		end;
	end;
	return v13, v14;
end;
local function u3(p9, p10)
	return p9.Distance2 < p10.Distance2;
end;
function v1.KNearestNeighborsSearch(p11, p12, p13, p14)
	if typeof(p12) ~= "Vector3" then
		error("Bad position value");
	end;
	if type(p14) ~= "number" then
		error("Bad radius value");
	end;
	local l__X__29 = p12.X;
	local l__Y__30 = p12.Y;
	local l__Z__31 = p12.Z;
	local v32 = {};
	local v33 = {};
	local v34 = 0;
	local v35 = 0;
	local v36 = p14 + 0.8660254037844386 * p11.MaxRegionSize[1];
	local v37 = v36 * v36 + 1E-09;
	for v38, v39 in next, p11.RegionHashMap do
		for v40, v41 in ipairs(v39) do
			local l__Position__42 = v41.Position;
			local v43 = l__X__29 - l__Position__42[1];
			local v44 = l__Y__30 - l__Position__42[2];
			local v45 = l__Z__31 - l__Position__42[3];
			if v43 * v43 + v44 * v44 + v45 * v45 <= v37 then
				local v46, v47 = l__GetNeighborsWithinRadius__2(v41, p14, l__X__29, l__Y__30, l__Z__31, v32, v33, p11.MaxDepth, v34, v35);
				v34 = v46;
				v35 = v47;
			end;
		end;
	end;
	local v48 = table.create(v35);
	for v49, v50 in ipairs(v33) do
		v48[v49] = {
			Distance2 = v50, 
			Index = v49
		};
	end;
	table.sort(v48, u3);
	local v51 = math.min(v35, p13);
	local v52 = table.create(v51);
	local v53 = table.create(v51);
	for v54 = 1, v51 do
		local v55 = v48[v54];
		v53[v54] = v55.Distance2;
		v52[v54] = v32[v55.Index];
	end;
	return v52, v53;
end;
local function u4(p15, p16, p17, p18)
	local l__RegionHashMap__56 = p15.RegionHashMap;
	local l__MaxRegionSize__57 = p15.MaxRegionSize;
	local v58 = l__MaxRegionSize__57[1];
	local v59 = l__MaxRegionSize__57[2];
	local v60 = l__MaxRegionSize__57[3];
	local v61 = math.floor(p16 / v58 + 0.5);
	local v62 = math.floor(p17 / v59 + 0.5);
	local v63 = math.floor(p18 / v60 + 0.5);
	local v64 = v61 * 73856093 + v62 * 19351301 + v63 * 83492791;
	local v65 = l__RegionHashMap__56[v64];
	if not v65 then
		v65 = {};
		l__RegionHashMap__56[v64] = v65;
	end;
	local v66 = v58 * v61;
	local v67 = v59 * v62;
	local v68 = v60 * v63;
	for v69, v70 in ipairs(v65) do
		local l__Position__71 = v70.Position;
		if l__Position__71[1] == v66 and l__Position__71[2] == v67 and l__Position__71[3] == v68 then
			return v70;
		end;
	end;
	local v72 = v58 / 2;
	local v73 = v59 / 2;
	local v74 = v60 / 2;
	local v75 = {
		Depth = 1, 
		LowerBounds = { v66 - v72, v67 - v73, v68 - v74 }, 
		NodeCount = 0, 
		Nodes = {}, 
		Parent = nil, 
		ParentIndex = nil, 
		Position = { v66, v67, v68 }, 
		Size = { v58, v59, v60 }, 
		SubRegions = {}, 
		UpperBounds = { v66 + v72, v67 + v73, v68 + v74 }
	};
	table.insert(v65, v75);
	return v75;
end;
local u5 = { { 0.25, 0.25, -0.25 }, { -0.25, 0.25, -0.25 }, { 0.25, 0.25, 0.25 }, { -0.25, 0.25, 0.25 }, { 0.25, -0.25, -0.25 }, { -0.25, -0.25, -0.25 }, { 0.25, -0.25, 0.25 }, { -0.25, -0.25, 0.25 } };
function v1.GetOrCreateLowestSubRegion(p19, p20, p21, p22)
	local v76 = nil;
	local v77 = u4(p19, p20, p21, p22);
	v76 = v77;
	for v78 = v77.Depth, p19.MaxDepth do
		local l__Position__79 = v76.Position;
		if l__Position__79[1] < p20 then
			local v80 = 1;
		else
			v80 = 2;
		end;
		if p21 <= l__Position__79[2] then
			v80 = v80 + 4;
		end;
		if l__Position__79[3] <= p22 then
			v80 = v80 + 2;
		end;
		local l__SubRegions__81 = v76.SubRegions;
		local v82 = l__SubRegions__81[v80];
		if not v82 then
			local l__Size__83 = v76.Size;
			local v84 = u5[v80];
			local v85 = l__Size__83[1];
			local v86 = l__Size__83[2];
			local v87 = l__Size__83[3];
			local v88 = l__Position__79[1] + v84[1] * v85;
			local v89 = l__Position__79[2] + v84[2] * v86;
			local v90 = l__Position__79[3] + v84[3] * v87;
			local v91 = v85 / 2;
			local v92 = v86 / 2;
			local v93 = v87 / 2;
			local v94 = v91 / 2;
			local v95 = v92 / 2;
			local v96 = v93 / 2;
			v82 = {
				Depth = v76 and v76.Depth + 1 or 1, 
				LowerBounds = { v88 - v94, v89 - v95, v90 - v96 }, 
				NodeCount = 0, 
				Nodes = {}, 
				Parent = v76, 
				ParentIndex = v80, 
				Position = { v88, v89, v90 }, 
				Size = { v91, v92, v93 }, 
				SubRegions = {}, 
				UpperBounds = { v88 + v94, v89 + v95, v90 + v96 }
			};
			l__SubRegions__81[v80] = v82;
		end;
		v76 = v82;
	end;
	return local v97;
end;
return v1;
