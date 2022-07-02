-- Decompiled with the Synapse X Luau decompiler.

local function u1(p1, p2)
	if p1.instance == nil then
		return;
	end;
	p1.instance = nil;
	local l__connections__1 = p1.connections;
	if l__connections__1 then
		for v2, v3 in ipairs(l__connections__1) do
			v3:Disconnect();
		end;
		table.clear(l__connections__1);
	end;
	if p2 and p1.alias then
		p2[p1.alias] = nil;
	end;
	local l__children__4 = p1.children;
	if l__children__4 then
		for v5, v6 in pairs(l__children__4) do
			u1(v6, p2);
		end;
	end;
end;
local v7 = {};
v7.__index = v7;
local function u2(p3)
	local v8 = string.split(p3, "/");
	for v9 = #v8, 1, -1 do
		if v8[v9] == "" then
			table.remove(v8, v9);
		end;
	end;
	return v8;
end;
function v7.new(p4, p5)
	local v10 = {};
	local v11 = 1;
	for v12, v13 in pairs(p4) do
		v10[v12] = u2(v13);
		v11 = v11 + 1;
	end;
	return setmetatable({
		_boundFn = p5, 
		_parsedManifest = v10, 
		_manifestSizeTarget = v11, 
		_dtorMap = {}, 
		_connections = {}, 
		_rootInstToRootNode = {}, 
		_rootInstToManifest = {}
	}, v7);
end;
function v7._startBoundFn(p6, p7, p8)
	local l___dtorMap__14 = p6._dtorMap;
	local v15 = l___dtorMap__14[p7];
	if v15 then
		v15();
		l___dtorMap__14[p7] = nil;
	end;
	local v16 = p6._boundFn(p8);
	if v16 then
		l___dtorMap__14[p7] = v16;
	end;
end;
function v7._stopBoundFn(p9, p10)
	local l___dtorMap__17 = p9._dtorMap;
	local v18 = l___dtorMap__17[p10];
	if v18 then
		v18();
		l___dtorMap__17[p10] = nil;
	end;
end;
function v7.bindRoot(p11, p12)
	debug.profilebegin("AtomicBinding:BindRoot");
	local l___parsedManifest__19 = p11._parsedManifest;
	local l___rootInstToManifest__20 = p11._rootInstToManifest;
	assert(l___rootInstToManifest__20[p12] == nil);
	local v21 = {};
	l___rootInstToManifest__20[p12] = v21;
	debug.profilebegin("BuildTree");
	local v22 = {
		alias = "root", 
		instance = p12
	};
	if next(l___parsedManifest__19) then
		v22.children = {};
		v22.connections = {};
	end;
	p11._rootInstToRootNode[p12] = v22;
	for v23, v24 in pairs(l___parsedManifest__19) do
		local v25 = v22;
		local v26, v27, v28 = ipairs(v24);
		while true do
			local v29, v30 = v26(v27, v28);
			if not v29 then
				break;
			end;
			local v31 = v25.children[v30] or {};
			if v29 == #v24 then
				if v31.alias ~= nil then
					error("Multiple aliases assigned to one instance");
				end;
				v31.alias = v23;
			else
				v31.children = v31.children or {};
				v31.connections = v31.connections or {};
			end;
			v25.children[v30] = v31;
			v25 = v31;		
		end;
	end;
	debug.profileend();
	local l___manifestSizeTarget__3 = p11._manifestSizeTarget;
	local function u4(p13)
		local v32 = assert(p13.instance);
		local l__children__33 = p13.children;
		local l__alias__34 = p13.alias;
		local v35 = not l__children__33;
		if l__alias__34 then
			v21[l__alias__34] = v32;
		end;
		if not v35 then
			for v36, v37 in ipairs(v32:GetChildren()) do
				local v38 = l__children__33[v37.Name];
				if v38 and v38.instance == nil then
					v38.instance = v37;
					u4(v38);
				end;
			end;
			table.insert(p13.connections, v32.ChildAdded:Connect(function(p14)
				local v39 = l__children__33[p14.Name];
				if not v39 or v39.instance ~= nil then
					return;
				end;
				v39.instance = p14;
				u4(v39);
			end));
			table.insert(p13.connections, v32.ChildRemoved:Connect(function(p15)
				local l__Name__40 = p15.Name;
				local v41 = l__children__33[l__Name__40];
				if not v41 then
					return;
				end;
				if v41.instance ~= p15 then
					return;
				end;
				p11:_stopBoundFn(p12);
				u1(v41, v21);
				assert(v41.instance == nil);
				local v42 = v32:FindFirstChild(l__Name__40);
				if v42 then
					local v43 = l__children__33[v42.Name];
					if v43 then
						if v43.instance ~= nil then
							return;
						end;
						v43.instance = v42;
						u4(v43);
					end;
				end;
			end));
		end;
		if v35 then
			local v44 = 0;
			for v45 in pairs(v21) do
				v44 = v44 + 1;
			end;
			assert(v44 <= l___manifestSizeTarget__3, v44);
			if v44 == l___manifestSizeTarget__3 then
				p11:_startBoundFn(p12, v21);
			end;
		end;
	end;
	debug.profilebegin("ResolveTree");
	u4(v22);
	debug.profileend();
	debug.profileend();
end;
function v7.unbindRoot(p16, p17)
	local l___rootInstToRootNode__46 = p16._rootInstToRootNode;
	local l___rootInstToManifest__47 = p16._rootInstToManifest;
	p16:_stopBoundFn(p17);
	local v48 = l___rootInstToRootNode__46[p17];
	if v48 then
		u1(v48, (assert(l___rootInstToManifest__47[p17])));
		l___rootInstToRootNode__46[p17] = nil;
	end;
	l___rootInstToManifest__47[p17] = nil;
end;
function v7.destroy(p18)
	debug.profilebegin("AtomicBinding:destroy");
	for v49, v50 in pairs(p18._dtorMap) do
		v50:destroy();
	end;
	table.clear(p18._dtorMap);
	for v51, v52 in ipairs(p18._connections) do
		v52:Disconnect();
	end;
	table.clear(p18._connections);
	local l___rootInstToManifest__53 = p18._rootInstToManifest;
	for v54, v55 in pairs(p18._rootInstToRootNode) do
		u1(v55, (assert(l___rootInstToManifest__53[v54])));
	end;
	table.clear(p18._rootInstToManifest);
	table.clear(p18._rootInstToRootNode);
	debug.profileend();
end;
return v7;
