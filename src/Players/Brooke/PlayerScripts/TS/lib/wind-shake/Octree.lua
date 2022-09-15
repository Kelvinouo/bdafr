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
		local v6, v7, v8 = ipairs(v5);
		while true do
			v6(v7, v8);
			if not v6 then
				break;
			end;
			v8 = v6;
			for v9 in next, v7.Nodes do
				v3 = v3 + 1;
				v2[v3] = v9;
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
	local v10 = l__new__1(p3, p5);
	v10:SetPosition(p4);
	return v10;
end;
local l__GetNeighborsWithinRadius__2 = require(script.OctreeRegionUtils).GetNeighborsWithinRadius;
function v1.RadiusSearch(p6, p7, p8)
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
	local v18 = p8 + 0.8660254037844386 * p6.MaxRegionSize[1];
	local v19 = v18 * v18 + 1E-09;
	for v20, v21 in next, p6.RegionHashMap do
		local v22, v23, v24 = ipairs(v21);
		while true do
			v22(v23, v24);
			if not v22 then
				break;
			end;
			v24 = v22;
			local l__Position__25 = v23.Position;
			local v26 = l__X__11 - l__Position__25[1];
			local v27 = l__Y__12 - l__Position__25[2];
			local v28 = l__Z__13 - l__Position__25[3];
			if v26 * v26 + v27 * v27 + v28 * v28 <= v19 then
				local v29, v30 = l__GetNeighborsWithinRadius__2(v23, p8, l__X__11, l__Y__12, l__Z__13, v14, v15, p6.MaxDepth, v16, v17);
				v16 = v29;
				v17 = v30;
			end;		
		end;
	end;
	return v14, v15;
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
	local l__X__31 = p12.X;
	local l__Y__32 = p12.Y;
	local l__Z__33 = p12.Z;
	local v34 = {};
	local v35 = {};
	local v36 = 0;
	local v37 = 0;
	local v38 = p14 + 0.8660254037844386 * p11.MaxRegionSize[1];
	local v39 = v38 * v38 + 1E-09;
	for v40, v41 in next, p11.RegionHashMap do
		local v42, v43, v44 = ipairs(v41);
		while true do
			v42(v43, v44);
			if not v42 then
				break;
			end;
			v44 = v42;
			local l__Position__45 = v43.Position;
			local v46 = l__X__31 - l__Position__45[1];
			local v47 = l__Y__32 - l__Position__45[2];
			local v48 = l__Z__33 - l__Position__45[3];
			if v46 * v46 + v47 * v47 + v48 * v48 <= v39 then
				local v49, v50 = l__GetNeighborsWithinRadius__2(v43, p14, l__X__31, l__Y__32, l__Z__33, v34, v35, p11.MaxDepth, v36, v37);
				v36 = v49;
				v37 = v50;
			end;		
		end;
	end;
	local v51 = table.create(v37);
	local v52, v53, v54 = ipairs(v35);
	while true do
		v52(v53, v54);
		if not v52 then
			break;
		end;
		v54 = v52;
		v51[v52] = {
			Distance2 = v53, 
			Index = v52
		};	
	end;
	table.sort(v51, u3);
	local v55 = math.min(v37, p13);
	local v56 = table.create(v55);
	local v57 = table.create(v55);
	for v58 = 1, v55 do
		local v59 = v51[v58];
		v57[v58] = v59.Distance2;
		v56[v58] = v34[v59.Index];
	end;
	return v56, v57;
end;
local function u4(p15, p16, p17, p18)
	local l__RegionHashMap__60 = p15.RegionHashMap;
	local l__MaxRegionSize__61 = p15.MaxRegionSize;
	local v62 = l__MaxRegionSize__61[1];
	local v63 = l__MaxRegionSize__61[2];
	local v64 = l__MaxRegionSize__61[3];
	local v65 = math.floor(p16 / v62 + 0.5);
	local v66 = math.floor(p17 / v63 + 0.5);
	local v67 = math.floor(p18 / v64 + 0.5);
	local v68 = v65 * 73856093 + v66 * 19351301 + v67 * 83492791;
	local v69 = l__RegionHashMap__60[v68];
	if not v69 then
		v69 = {};
		l__RegionHashMap__60[v68] = v69;
	end;
	local v70 = v62 * v65;
	local v71 = v63 * v66;
	local v72 = v64 * v67;
	local v73, v74, v75 = ipairs(v69);
	while true do
		v73(v74, v75);
		if not v73 then
			break;
		end;
		v75 = v73;
		local l__Position__76 = v74.Position;
		if l__Position__76[1] == v70 and l__Position__76[2] == v71 and l__Position__76[3] == v72 then
			return v74;
		end;	
	end;
	local v77 = v62 / 2;
	local v78 = v63 / 2;
	local v79 = v64 / 2;
	local v80 = {
		Depth = 1, 
		LowerBounds = { v70 - v77, v71 - v78, v72 - v79 }, 
		NodeCount = 0, 
		Nodes = {}, 
		Parent = nil, 
		ParentIndex = nil, 
		Position = { v70, v71, v72 }, 
		Size = { v62, v63, v64 }, 
		SubRegions = {}, 
		UpperBounds = { v70 + v77, v71 + v78, v72 + v79 }
	};
	table.insert(v69, v80);
	return v80;
end;
local u5 = { { 0.25, 0.25, -0.25 }, { -0.25, 0.25, -0.25 }, { 0.25, 0.25, 0.25 }, { -0.25, 0.25, 0.25 }, { 0.25, -0.25, -0.25 }, { -0.25, -0.25, -0.25 }, { 0.25, -0.25, 0.25 }, { -0.25, -0.25, 0.25 } };
function v1.GetOrCreateLowestSubRegion(p19, p20, p21, p22)
	local v81 = nil;
	local v82 = u4(p19, p20, p21, p22);
	v81 = v82;
	for v83 = v82.Depth, p19.MaxDepth do
		local l__Position__84 = v81.Position;
		if l__Position__84[1] < p20 then
			local v85 = 1;
		else
			v85 = 2;
		end;
		if p21 <= l__Position__84[2] then
			v85 = v85 + 4;
		end;
		if l__Position__84[3] <= p22 then
			v85 = v85 + 2;
		end;
		local l__SubRegions__86 = v81.SubRegions;
		local v87 = l__SubRegions__86[v85];
		if not v87 then
			local l__Size__88 = v81.Size;
			local v89 = u5[v85];
			local v90 = l__Size__88[1];
			local v91 = l__Size__88[2];
			local v92 = l__Size__88[3];
			local v93 = l__Position__84[1] + v89[1] * v90;
			local v94 = l__Position__84[2] + v89[2] * v91;
			local v95 = l__Position__84[3] + v89[3] * v92;
			local v96 = v90 / 2;
			local v97 = v91 / 2;
			local v98 = v92 / 2;
			local v99 = v96 / 2;
			local v100 = v97 / 2;
			local v101 = v98 / 2;
			v87 = {
				Depth = v81 and v81.Depth + 1 or 1, 
				LowerBounds = { v93 - v99, v94 - v100, v95 - v101 }, 
				NodeCount = 0, 
				Nodes = {}, 
				Parent = v81, 
				ParentIndex = v85, 
				Position = { v93, v94, v95 }, 
				Size = { v96, v97, v98 }, 
				SubRegions = {}, 
				UpperBounds = { v93 + v99, v94 + v100, v95 + v101 }
			};
			l__SubRegions__86[v85] = v87;
		end;
		v81 = v87;
	end;
	return local v102;
end;
return v1;
