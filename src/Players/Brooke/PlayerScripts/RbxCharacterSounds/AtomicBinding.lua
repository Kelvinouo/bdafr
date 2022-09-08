-- Decompiled with the Synapse X Luau decompiler.

local function u1(p1, p2)
	if p1.instance == nil then
		return;
	end;
	p1.instance = nil;
	local l__connections__1 = p1.connections;
	if l__connections__1 then
		local v2, v3, v4 = ipairs(l__connections__1);
		while true do
			v2(v3, v4);
			if not v2 then
				break;
			end;
			v4 = v2;
			v3:Disconnect();		
		end;
		table.clear(l__connections__1);
	end;
	if p2 and p1.alias then
		p2[p1.alias] = nil;
	end;
	local l__children__5 = p1.children;
	if l__children__5 then
		for v6, v7 in pairs(l__children__5) do
			u1(v7, p2);
		end;
	end;
end;
local v8 = {};
v8.__index = v8;
local function u2(p3)
	local v9 = string.split(p3, "/");
	for v10 = #v9, 1, -1 do
		if v9[v10] == "" then
			table.remove(v9, v10);
		end;
	end;
	return v9;
end;
function v8.new(p4, p5)
	local v11 = {};
	local v12 = 1;
	for v13, v14 in pairs(p4) do
		v11[v13] = u2(v14);
		v12 = v12 + 1;
	end;
	return setmetatable({
		_boundFn = p5, 
		_parsedManifest = v11, 
		_manifestSizeTarget = v12, 
		_dtorMap = {}, 
		_connections = {}, 
		_rootInstToRootNode = {}, 
		_rootInstToManifest = {}
	}, v8);
end;
function v8._startBoundFn(p6, p7, p8)
	local l___dtorMap__15 = p6._dtorMap;
	local v16 = l___dtorMap__15[p7];
	if v16 then
		v16();
		l___dtorMap__15[p7] = nil;
	end;
	local v17 = p6._boundFn(p8);
	if v17 then
		l___dtorMap__15[p7] = v17;
	end;
end;
function v8._stopBoundFn(p9, p10)
	local l___dtorMap__18 = p9._dtorMap;
	local v19 = l___dtorMap__18[p10];
	if v19 then
		v19();
		l___dtorMap__18[p10] = nil;
	end;
end;
function v8.bindRoot(p11, p12)
	debug.profilebegin("AtomicBinding:BindRoot");
	local l___parsedManifest__20 = p11._parsedManifest;
	local l___rootInstToManifest__21 = p11._rootInstToManifest;
	assert(l___rootInstToManifest__21[p12] == nil);
	local v22 = {};
	l___rootInstToManifest__21[p12] = v22;
	debug.profilebegin("BuildTree");
	local v23 = {
		alias = "root", 
		instance = p12
	};
	if next(l___parsedManifest__20) then
		v23.children = {};
		v23.connections = {};
	end;
	p11._rootInstToRootNode[p12] = v23;
	for v24, v25 in pairs(l___parsedManifest__20) do
		local v26 = v23;
		local v27, v28, v29 = ipairs(v25);
		while true do
			v27(v28, v29);
			if not v27 then
				break;
			end;
			local v30 = v26.children[v28] or {};
			if v27 == #v25 then
				if v30.alias ~= nil then
					error("Multiple aliases assigned to one instance");
				end;
				v30.alias = v24;
			else
				v30.children = v30.children or {};
				v30.connections = v30.connections or {};
			end;
			v26.children[v28] = v30;
			v26 = v30;		
		end;
	end;
	debug.profileend();
	local l___manifestSizeTarget__3 = p11._manifestSizeTarget;
	local function u4(p13)
		local v31 = assert(p13.instance);
		local l__children__32 = p13.children;
		local l__alias__33 = p13.alias;
		local v34 = not l__children__32;
		if l__alias__33 then
			v22[l__alias__33] = v31;
		end;
		if not v34 then
			local v35, v36, v37 = ipairs(v31:GetChildren());
			while true do
				v35(v36, v37);
				if not v35 then
					break;
				end;
				v37 = v35;
				local v38 = l__children__32[v36.Name];
				if v38 and v38.instance == nil then
					v38.instance = v36;
					u4(v38);
				end;			
			end;
			table.insert(p13.connections, v31.ChildAdded:Connect(function(p14)
				local v39 = l__children__32[p14.Name];
				if not v39 or v39.instance ~= nil then
					return;
				end;
				v39.instance = p14;
				u4(v39);
			end));
			table.insert(p13.connections, v31.ChildRemoved:Connect(function(p15)
				local l__Name__40 = p15.Name;
				local v41 = l__children__32[l__Name__40];
				if not v41 then
					return;
				end;
				if v41.instance ~= p15 then
					return;
				end;
				p11:_stopBoundFn(p12);
				u1(v41, v22);
				assert(v41.instance == nil);
				local v42 = v31:FindFirstChild(l__Name__40);
				if v42 then
					local v43 = l__children__32[v42.Name];
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
		if v34 then
			local v44 = 0;
			for v45 in pairs(v22) do
				v44 = v44 + 1;
			end;
			assert(v44 <= l___manifestSizeTarget__3, v44);
			if v44 == l___manifestSizeTarget__3 then
				p11:_startBoundFn(p12, v22);
			end;
		end;
	end;
	debug.profilebegin("ResolveTree");
	u4(v23);
	debug.profileend();
	debug.profileend();
end;
function v8.unbindRoot(p16, p17)
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
function v8.destroy(p18)
	debug.profilebegin("AtomicBinding:destroy");
	for v49, v50 in pairs(p18._dtorMap) do
		v50:destroy();
	end;
	table.clear(p18._dtorMap);
	local v51, v52, v53 = ipairs(p18._connections);
	while true do
		v51(v52, v53);
		if not v51 then
			break;
		end;
		v53 = v51;
		v52:Disconnect();	
	end;
	table.clear(p18._connections);
	local l___rootInstToManifest__54 = p18._rootInstToManifest;
	for v55, v56 in pairs(p18._rootInstToRootNode) do
		u1(v56, (assert(l___rootInstToManifest__54[v55])));
	end;
	table.clear(p18._rootInstToManifest);
	table.clear(p18._rootInstToRootNode);
	debug.profileend();
end;
return v8;
