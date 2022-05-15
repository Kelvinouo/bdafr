
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {
	ClassName = "OctreeNode"
};
v1.__index = v1;
function v1.new(p1, p2)
	return setmetatable({
		Octree = p1 or error("No octree"), 
		Object = p2 or error("No object"), 
		CurrentLowestRegion = nil, 
		Position = nil, 
		PositionX = nil, 
		PositionY = nil, 
		PositionZ = nil
	}, v1);
end;
function v1.KNearestNeighborsSearch(p3, p4, p5)
	return p3.Octree:KNearestNeighborsSearch(p3.Position, p4, p5);
end;
function v1.GetObject(p6)
	warn("OctreeNode:GetObject is deprecated.");
	return p6.Object;
end;
function v1.RadiusSearch(p7, p8)
	return p7.Octree:RadiusSearch(p7.Position, p8);
end;
function v1.GetPosition(p9)
	warn("OctreeNode:GetPosition is deprecated.");
	return p9.Position;
end;
function v1.GetRawPosition(p10)
	return p10.PositionX, p10.PositionY, p10.PositionZ;
end;
function v1.SetPosition(p11, p12)
	if p11.Position == p12 then
		return;
	end;
	local l__X__2 = p12.X;
	local l__Y__3 = p12.Y;
	local l__Z__4 = p12.Z;
	p11.PositionX = l__X__2;
	p11.PositionY = l__Y__3;
	p11.PositionZ = l__Z__4;
	p11.Position = p12;
	if p11.CurrentLowestRegion then
		local l__CurrentLowestRegion__5 = p11.CurrentLowestRegion;
		local l__LowerBounds__6 = l__CurrentLowestRegion__5.LowerBounds;
		local l__UpperBounds__7 = l__CurrentLowestRegion__5.UpperBounds;
		if l__LowerBounds__6[1] <= l__X__2 and l__X__2 <= l__UpperBounds__7[1] and l__LowerBounds__6[2] <= l__Y__3 and l__Y__3 <= l__UpperBounds__7[2] and l__LowerBounds__6[3] <= l__Z__4 and l__Z__4 <= l__UpperBounds__7[3] then
			return;
		end;
	end;
	local v8 = p11.Octree:GetOrCreateLowestSubRegion(l__X__2, l__Y__3, l__Z__4);
	if p11.CurrentLowestRegion then
		local l__CurrentLowestRegion__9 = p11.CurrentLowestRegion;
		if l__CurrentLowestRegion__9.Depth ~= v8.Depth then
			error("fromLowest.Depth ~= toLowest.Depth");
		end;
		if l__CurrentLowestRegion__9 == v8 then
			error("fromLowest == toLowest");
		end;
		local v10 = l__CurrentLowestRegion__9;
		local v11 = v8;
		while v10 ~= v11 do
			local l__Nodes__12 = v10.Nodes;
			if not l__Nodes__12[p11] then
				error("CurrentFrom.Nodes doesn't have a node here.");
			end;
			local l__NodeCount__13 = v10.NodeCount;
			if l__NodeCount__13 <= 0 then
				error("NodeCount is <= 0.");
			end;
			local v14 = l__NodeCount__13 - 1;
			l__Nodes__12[p11] = nil;
			v10.NodeCount = v14;
			local l__ParentIndex__15 = v10.ParentIndex;
			if v14 <= 0 and l__ParentIndex__15 then
				local l__Parent__16 = v10.Parent;
				if not l__Parent__16 then
					error("CurrentFrom.Parent doesn't exist.");
				end;
				local l__SubRegions__17 = l__Parent__16.SubRegions;
				if l__SubRegions__17[l__ParentIndex__15] ~= v10 then
					error("Failed equality check.");
				end;
				l__SubRegions__17[l__ParentIndex__15] = nil;
			end;
			local l__Nodes__18 = v11.Nodes;
			if l__Nodes__18[p11] then
				error("CurrentTo.Nodes already has a node here.");
			end;
			l__Nodes__18[p11] = p11;
			v11.NodeCount = v11.NodeCount + 1;
			v10 = v10.Parent;
			v11 = v11.Parent;		
		end;
	else
		local v19 = v8;
		while v19 do
			local l__Nodes__20 = v19.Nodes;
			if not l__Nodes__20[p11] then
				l__Nodes__20[p11] = p11;
				v19.NodeCount = v19.NodeCount + 1;
			end;
			v19 = v19.Parent;		
		end;
	end;
	p11.CurrentLowestRegion = v8;
end;
function v1.Destroy(p13)
	local l__CurrentLowestRegion__21 = p13.CurrentLowestRegion;
	if l__CurrentLowestRegion__21 then
		local v22 = l__CurrentLowestRegion__21;
		while v22 do
			local l__Nodes__23 = v22.Nodes;
			if not l__Nodes__23[p13] then
				error("CurrentFrom.Nodes doesn't have a node here.");
			end;
			local l__NodeCount__24 = v22.NodeCount;
			if l__NodeCount__24 <= 0 then
				error("NodeCount is <= 0.");
			end;
			local v25 = l__NodeCount__24 - 1;
			l__Nodes__23[p13] = nil;
			v22.NodeCount = v25;
			local l__Parent__26 = v22.Parent;
			local l__ParentIndex__27 = v22.ParentIndex;
			if v25 <= 0 and l__ParentIndex__27 then
				if not l__Parent__26 then
					error("Current.Parent doesn't exist.");
				end;
				local l__SubRegions__28 = l__Parent__26.SubRegions;
				if l__SubRegions__28[l__ParentIndex__27] ~= v22 then
					error("Failed equality check.");
				end;
				l__SubRegions__28[l__ParentIndex__27] = nil;
			end;
			v22 = l__Parent__26;		
		end;
	end;
end;
return v1;

