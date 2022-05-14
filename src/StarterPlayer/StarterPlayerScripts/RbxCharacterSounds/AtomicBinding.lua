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
local function u3(p11, p12)
	local v19 = 0;
	for v20, v21 in pairs(p11) do
		v19 = v19 + 1;
	end;
	assert(v19 <= p12, v19);
	return v19 == p12;
end;
function v7.bindRoot(p13, p14)
	debug.profilebegin("AtomicBinding:BindRoot");
	local l___parsedManifest__22 = p13._parsedManifest;
	local l___rootInstToManifest__23 = p13._rootInstToManifest;
	assert(l___rootInstToManifest__23[p14] == nil);
	local v24 = {};
	l___rootInstToManifest__23[p14] = v24;
	debug.profilebegin("BuildTree");
	local v25 = {
		alias = "root", 
		instance = p14
	};
	if next(l___parsedManifest__22) then
		v25.children = {};
		v25.connections = {};
	end;
	p13._rootInstToRootNode[p14] = v25;
	for v26, v27 in pairs(l___parsedManifest__22) do
		local v28 = v25;
		local v29, v30, v31 = ipairs(v27);
		while true do
			local v32, v33 = v29(v30, v31);
			if not v32 then
				break;
			end;
			local v34 = v28.children[v33] or {};
			if v32 == #v27 then
				if v34.alias ~= nil then
					error("Multiple aliases assigned to one instance");
				end;
				v34.alias = v26;
			else
				v34.children = v34.children or {};
				v34.connections = v34.connections or {};
			end;
			v28.children[v33] = v34;
			v28 = v34;		
		end;
	end;
	debug.profileend();
	local l___manifestSizeTarget__4 = p13._manifestSizeTarget;
	local function u5(p15)
		local v35 = assert(p15.instance);
		local l__children__36 = p15.children;
		local l__alias__37 = p15.alias;
		local v38 = not l__children__36;
		if l__alias__37 then
			v24[l__alias__37] = v35;
		end;
		if not v38 then
			local function u6(p16)
				local v39 = l__children__36[p16.Name];
				if not v39 or v39.instance ~= nil then
					return;
				end;
				v39.instance = p16;
				u5(v39);
			end;
			for v40, v41 in ipairs(v35:GetChildren()) do
				u6(v41);
			end;
			table.insert(p15.connections, v35.ChildAdded:Connect(u6));
			table.insert(p15.connections, v35.ChildRemoved:Connect(function(p17)
				local l__Name__42 = p17.Name;
				local v43 = l__children__36[l__Name__42];
				if not v43 then
					return;
				end;
				if v43.instance ~= p17 then
					return;
				end;
				p13:_stopBoundFn(p14);
				u1(v43, v24);
				assert(v43.instance == nil);
				local v44 = v35:FindFirstChild(l__Name__42);
				if v44 then
					u6(v44);
				end;
			end));
		end;
		if v38 and u3(v24, l___manifestSizeTarget__4) then
			p13:_startBoundFn(p14, v24);
		end;
	end;
	debug.profilebegin("ResolveTree");
	u5(v25);
	debug.profileend();
	debug.profileend();
end;
function v7.unbindRoot(p18, p19)
	local l___rootInstToRootNode__45 = p18._rootInstToRootNode;
	local l___rootInstToManifest__46 = p18._rootInstToManifest;
	p18:_stopBoundFn(p19);
	local v47 = l___rootInstToRootNode__45[p19];
	if v47 then
		u1(v47, (assert(l___rootInstToManifest__46[p19])));
		l___rootInstToRootNode__45[p19] = nil;
	end;
	l___rootInstToManifest__46[p19] = nil;
end;
function v7.destroy(p20)
	debug.profilebegin("AtomicBinding:destroy");
	for v48, v49 in pairs(p20._dtorMap) do
		v49:destroy();
	end;
	table.clear(p20._dtorMap);
	for v50, v51 in ipairs(p20._connections) do
		v51:Disconnect();
	end;
	table.clear(p20._connections);
	local l___rootInstToManifest__52 = p20._rootInstToManifest;
	for v53, v54 in pairs(p20._rootInstToRootNode) do
		u1(v54, (assert(l___rootInstToManifest__52[v53])));
	end;
	table.clear(p20._rootInstToManifest);
	table.clear(p20._rootInstToRootNode);
	debug.profileend();
end;
return v7;
