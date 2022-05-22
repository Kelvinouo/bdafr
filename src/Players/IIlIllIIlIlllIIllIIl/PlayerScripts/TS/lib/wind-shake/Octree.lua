-- Script Hash: 4766250f08b2698b10a107d5200a496bb5a27c6ee883cc4e7fe05fe2a73bac00eeef9c737a63edf3a6f7b0a836822560
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
			for v9, v10 in next, v8.Nodes do
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
	local v11 = l__new__1(p3, p5);
	v11:SetPosition(p4);
	return v11;
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
	local l__X__12 = p7.X;
	local l__Y__13 = p7.Y;
	local l__Z__14 = p7.Z;
	local v15 = {};
	local v16 = {};
	local v17 = 0;
	local v18 = 0;
	local v19 = p8 + u2 * p6.MaxRegionSize[1];
	local v20 = v19 * v19 + 1E-09;
	for v21, v22 in next, p6.RegionHashMap do
		for v23, v24 in ipairs(v22) do
			local l__Position__25 = v24.Position;
			local v26 = l__X__12 - l__Position__25[1];
			local v27 = l__Y__13 - l__Position__25[2];
			local v28 = l__Z__14 - l__Position__25[3];
			if v26 * v26 + v27 * v27 + v28 * v28 <= v20 then
				local v29, v30 = l__GetNeighborsWithinRadius__3(v24, p8, l__X__12, l__Y__13, l__Z__14, v15, v16, p6.MaxDepth, v17, v18);
				v17 = v29;
				v18 = v30;
			end;
		end;
	end;
	return v15, v16;
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
	local l__X__31 = p12.X;
	local l__Y__32 = p12.Y;
	local l__Z__33 = p12.Z;
	local v34 = {};
	local v35 = {};
	local v36 = 0;
	local v37 = 0;
	local v38 = p14 + u2 * p11.MaxRegionSize[1];
	local v39 = v38 * v38 + 1E-09;
	for v40, v41 in next, p11.RegionHashMap do
		for v42, v43 in ipairs(v41) do
			local l__Position__44 = v43.Position;
			local v45 = l__X__31 - l__Position__44[1];
			local v46 = l__Y__32 - l__Position__44[2];
			local v47 = l__Z__33 - l__Position__44[3];
			if v45 * v45 + v46 * v46 + v47 * v47 <= v39 then
				local v48, v49 = l__GetNeighborsWithinRadius__3(v43, p14, l__X__31, l__Y__32, l__Z__33, v34, v35, p11.MaxDepth, v36, v37);
				v36 = v48;
				v37 = v49;
			end;
		end;
	end;
	local v50 = table.create(v37);
	for v51, v52 in ipairs(v35) do
		v50[v51] = {
			Distance2 = v52, 
			Index = v51
		};
	end;
	table.sort(v50, u4);
	local v53 = math.min(v37, p13);
	local v54 = table.create(v53);
	local v55 = table.create(v53);
	for v56 = 1, v53 do
		local v57 = v50[v56];
		v55[v56] = v57.Distance2;
		v54[v56] = v34[v57.Index];
	end;
	return v54, v55;
end;
local function u5(p15, p16, p17, p18)
	local l__RegionHashMap__58 = p15.RegionHashMap;
	local l__MaxRegionSize__59 = p15.MaxRegionSize;
	local v60 = l__MaxRegionSize__59[1];
	local v61 = l__MaxRegionSize__59[2];
	local v62 = l__MaxRegionSize__59[3];
	local v63 = math.floor(p16 / v60 + 0.5);
	local v64 = math.floor(p17 / v61 + 0.5);
	local v65 = math.floor(p18 / v62 + 0.5);
	local v66 = v63 * 73856093 + v64 * 19351301 + v65 * 83492791;
	local v67 = l__RegionHashMap__58[v66];
	if not v67 then
		v67 = {};
		l__RegionHashMap__58[v66] = v67;
	end;
	local v68 = v60 * v63;
	local v69 = v61 * v64;
	local v70 = v62 * v65;
	for v71, v72 in ipairs(v67) do
		local l__Position__73 = v72.Position;
		if l__Position__73[1] == v68 and l__Position__73[2] == v69 and l__Position__73[3] == v70 then
			return v72;
		end;
	end;
	local v74 = v60 / 2;
	local v75 = v61 / 2;
	local v76 = v62 / 2;
	local v77 = {
		Depth = 1, 
		LowerBounds = { v68 - v74, v69 - v75, v70 - v76 }, 
		NodeCount = 0, 
		Nodes = {}, 
		Parent = nil, 
		ParentIndex = nil, 
		Position = { v68, v69, v70 }, 
		Size = { v60, v61, v62 }, 
		SubRegions = {}, 
		UpperBounds = { v68 + v74, v69 + v75, v70 + v76 }
	};
	table.insert(v67, v77);
	return v77;
end;
local u6 = { { 0.25, 0.25, -0.25 }, { -0.25, 0.25, -0.25 }, { 0.25, 0.25, 0.25 }, { -0.25, 0.25, 0.25 }, { 0.25, -0.25, -0.25 }, { -0.25, -0.25, -0.25 }, { 0.25, -0.25, 0.25 }, { -0.25, -0.25, 0.25 } };
function v2.GetOrCreateLowestSubRegion(p19, p20, p21, p22)
	local v78 = nil;
	local v79 = u5(p19, p20, p21, p22);
	v78 = v79;
	for v80 = v79.Depth, p19.MaxDepth do
		local l__Position__81 = v78.Position;
		if l__Position__81[1] < p20 then
			local v82 = 1;
		else
			v82 = 2;
		end;
		if p21 <= l__Position__81[2] then
			v82 = v82 + 4;
		end;
		if l__Position__81[3] <= p22 then
			v82 = v82 + 2;
		end;
		local l__SubRegions__83 = v78.SubRegions;
		local v84 = l__SubRegions__83[v82];
		if not v84 then
			local l__Size__85 = v78.Size;
			local v86 = u6[v82];
			local v87 = l__Size__85[1];
			local v88 = l__Size__85[2];
			local v89 = l__Size__85[3];
			local v90 = l__Position__81[1] + v86[1] * v87;
			local v91 = l__Position__81[2] + v86[2] * v88;
			local v92 = l__Position__81[3] + v86[3] * v89;
			local v93 = v87 / 2;
			local v94 = v88 / 2;
			local v95 = v89 / 2;
			local v96 = v93 / 2;
			local v97 = v94 / 2;
			local v98 = v95 / 2;
			v84 = {
				Depth = v78 and v78.Depth + 1 or 1, 
				LowerBounds = { v90 - v96, v91 - v97, v92 - v98 }, 
				NodeCount = 0, 
				Nodes = {}, 
				Parent = v78, 
				ParentIndex = v82, 
				Position = { v90, v91, v92 }, 
				Size = { v93, v94, v95 }, 
				SubRegions = {}, 
				UpperBounds = { v90 + v96, v91 + v97, v92 + v98 }
			};
			l__SubRegions__83[v82] = v84;
		end;
		v78 = v84;
	end;
	return local v99;
end;
return v2;
