-- Script Hash: 8771ae6871a6a3008bd19ad6fe5ca6fb3566b45493787185452574b76c00f88bade02ca8949fafd50a225b8c0349e386
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(script.OctreeRegionUtils);
local v2 = {
	ClassName = "Octree"
};
v2.__index = v2;
function v2.new()
	return setmetatable({
		MaxDepth = 4, 
		MaxRegionSize = table.create(3, 512), 
		RegionHashMap = {}
	}, v2);
end;
function v2.ClearNodes(p1)
	p1.MaxDepth = 4;
	p1.MaxRegionSize = table.create(3, 512);
	table.clear(p1.RegionHashMap);
end;
function v2.GetAllNodes(p2)
	local v3 = {};
	local v4 = 0;
	for v5, v6 in next, p2.RegionHashMap do
		for v7, v8 in ipairs(v6) do
			for v9 in next, v8.Nodes do
				v4 = v4 + 1;
				v3[v4] = v9;
			end;
		end;
	end;
	return v3;
end;
local l__new__1 = require(script.OctreeNode).new;
function v2.CreateNode(p3, p4, p5)
	if typeof(p4) ~= "Vector3" then
		error("Bad position value");
	end;
	if not p5 then
		error("Bad object value.");
	end;
	local v10 = l__new__1(p3, p5);
	v10:SetPosition(p4);
	return v10;
end;
local u2 = math.sqrt(3) / 2;
local l__GetNeighborsWithinRadius__3 = v1.GetNeighborsWithinRadius;
function v2.RadiusSearch(p6, p7, p8)
	if typeof(p7) ~= "Vector3" then
		error("Bad position value");
	end;
	if type(p8) ~= "number" then
		error("Bad radius value");
	end;
	local l__X__11 = p7.X;
	local l__Y__12 = p7.Y;
	local l__Z__13 = p7.Z;
	local v14 = {};
	local v15 = {};
	local v16 = 0;
	local v17 = 0;
	local v18 = p8 + u2 * p6.MaxRegionSize[1];
	local v19 = v18 * v18 + 1E-09;
	for v20, v21 in next, p6.RegionHashMap do
		for v22, v23 in ipairs(v21) do
			local l__Position__24 = v23.Position;
			local v25 = l__X__11 - l__Position__24[1];
			local v26 = l__Y__12 - l__Position__24[2];
			local v27 = l__Z__13 - l__Position__24[3];
			if v25 * v25 + v26 * v26 + v27 * v27 <= v19 then
				local v28, v29 = l__GetNeighborsWithinRadius__3(v23, p8, l__X__11, l__Y__12, l__Z__13, v14, v15, p6.MaxDepth, v16, v17);
				v16 = v28;
				v17 = v29;
			end;
		end;
	end;
	return v14, v15;
end;
local function u4(p9, p10)
	return p9.Distance2 < p10.Distance2;
end;
function v2.KNearestNeighborsSearch(p11, p12, p13, p14)
	if typeof(p12) ~= "Vector3" then
		error("Bad position value");
	end;
	if type(p14) ~= "number" then
		error("Bad radius value");
	end;
	local l__X__30 = p12.X;
	local l__Y__31 = p12.Y;
	local l__Z__32 = p12.Z;
	local v33 = {};
	local v34 = {};
	local v35 = 0;
	local v36 = 0;
	local v37 = p14 + u2 * p11.MaxRegionSize[1];
	local v38 = v37 * v37 + 1E-09;
	for v39, v40 in next, p11.RegionHashMap do
		for v41, v42 in ipairs(v40) do
			local l__Position__43 = v42.Position;
			local v44 = l__X__30 - l__Position__43[1];
			local v45 = l__Y__31 - l__Position__43[2];
			local v46 = l__Z__32 - l__Position__43[3];
			if v44 * v44 + v45 * v45 + v46 * v46 <= v38 then
				local v47, v48 = l__GetNeighborsWithinRadius__3(v42, p14, l__X__30, l__Y__31, l__Z__32, v33, v34, p11.MaxDepth, v35, v36);
				v35 = v47;
				v36 = v48;
			end;
		end;
	end;
	local v49 = table.create(v36);
	for v50, v51 in ipairs(v34) do
		v49[v50] = {
			Distance2 = v51, 
			Index = v50
		};
	end;
	table.sort(v49, u4);
	local v52 = math.min(v36, p13);
	local v53 = table.create(v52);
	local v54 = table.create(v52);
	for v55 = 1, v52 do
		local v56 = v49[v55];
		v54[v55] = v56.Distance2;
		v53[v55] = v33[v56.Index];
	end;
	return v53, v54;
end;
local function u5(p15, p16, p17, p18)
	local l__RegionHashMap__57 = p15.RegionHashMap;
	local l__MaxRegionSize__58 = p15.MaxRegionSize;
	local v59 = l__MaxRegionSize__58[1];
	local v60 = l__MaxRegionSize__58[2];
	local v61 = l__MaxRegionSize__58[3];
	local v62 = math.floor(p16 / v59 + 0.5);
	local v63 = math.floor(p17 / v60 + 0.5);
	local v64 = math.floor(p18 / v61 + 0.5);
	local v65 = v62 * 73856093 + v63 * 19351301 + v64 * 83492791;
	local v66 = l__RegionHashMap__57[v65];
	if not v66 then
		v66 = {};
		l__RegionHashMap__57[v65] = v66;
	end;
	local v67 = v59 * v62;
	local v68 = v60 * v63;
	local v69 = v61 * v64;
	for v70, v71 in ipairs(v66) do
		local l__Position__72 = v71.Position;
		if l__Position__72[1] == v67 and l__Position__72[2] == v68 and l__Position__72[3] == v69 then
			return v71;
		end;
	end;
	local v73 = v59 / 2;
	local v74 = v60 / 2;
	local v75 = v61 / 2;
	local v76 = {
		Depth = 1, 
		LowerBounds = { v67 - v73, v68 - v74, v69 - v75 }, 
		NodeCount = 0, 
		Nodes = {}, 
		Parent = nil, 
		ParentIndex = nil, 
		Position = { v67, v68, v69 }, 
		Size = { v59, v60, v61 }, 
		SubRegions = {}, 
		UpperBounds = { v67 + v73, v68 + v74, v69 + v75 }
	};
	table.insert(v66, v76);
	return v76;
end;
local u6 = { { 0.25, 0.25, -0.25 }, { -0.25, 0.25, -0.25 }, { 0.25, 0.25, 0.25 }, { -0.25, 0.25, 0.25 }, { 0.25, -0.25, -0.25 }, { -0.25, -0.25, -0.25 }, { 0.25, -0.25, 0.25 }, { -0.25, -0.25, 0.25 } };
function v2.GetOrCreateLowestSubRegion(p19, p20, p21, p22)
	local v77 = nil;
	local v78 = u5(p19, p20, p21, p22);
	v77 = v78;
	for v79 = v78.Depth, p19.MaxDepth do
		local l__Position__80 = v77.Position;
		if l__Position__80[1] < p20 then
			local v81 = 1;
		else
			v81 = 2;
		end;
		if p21 <= l__Position__80[2] then
			v81 = v81 + 4;
		end;
		if l__Position__80[3] <= p22 then
			v81 = v81 + 2;
		end;
		local l__SubRegions__82 = v77.SubRegions;
		local v83 = l__SubRegions__82[v81];
		if not v83 then
			local l__Size__84 = v77.Size;
			local v85 = u6[v81];
			local v86 = l__Size__84[1];
			local v87 = l__Size__84[2];
			local v88 = l__Size__84[3];
			local v89 = l__Position__80[1] + v85[1] * v86;
			local v90 = l__Position__80[2] + v85[2] * v87;
			local v91 = l__Position__80[3] + v85[3] * v88;
			local v92 = v86 / 2;
			local v93 = v87 / 2;
			local v94 = v88 / 2;
			local v95 = v92 / 2;
			local v96 = v93 / 2;
			local v97 = v94 / 2;
			v83 = {
				Depth = v77 and v77.Depth + 1 or 1, 
				LowerBounds = { v89 - v95, v90 - v96, v91 - v97 }, 
				NodeCount = 0, 
				Nodes = {}, 
				Parent = v77, 
				ParentIndex = v81, 
				Position = { v89, v90, v91 }, 
				Size = { v92, v93, v94 }, 
				SubRegions = {}, 
				UpperBounds = { v89 + v95, v90 + v96, v91 + v97 }
			};
			l__SubRegions__82[v81] = v83;
		end;
		v77 = v83;
	end;
	return local v98;
end;
return v2;
