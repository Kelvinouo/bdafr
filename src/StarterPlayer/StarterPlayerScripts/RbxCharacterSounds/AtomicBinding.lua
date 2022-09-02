-- Script Hash: 32e6d812a327eb964cf46e0b1e51e1b748626bed03f9d2873d78bb8ae8f7572252ce451fe3ff36617021f78a39fa6ceb
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
	for v20 in pairs(p11) do
		v19 = v19 + 1;
	end;
	assert(v19 <= p12, v19);
	return v19 == p12;
end;
function v7.bindRoot(p13, p14)
	debug.profilebegin("AtomicBinding:BindRoot");
	local l___parsedManifest__21 = p13._parsedManifest;
	local l___rootInstToManifest__22 = p13._rootInstToManifest;
	assert(l___rootInstToManifest__22[p14] == nil);
	local v23 = {};
	l___rootInstToManifest__22[p14] = v23;
	debug.profilebegin("BuildTree");
	local v24 = {
		alias = "root", 
		instance = p14
	};
	if next(l___parsedManifest__21) then
		v24.children = {};
		v24.connections = {};
	end;
	p13._rootInstToRootNode[p14] = v24;
	for v25, v26 in pairs(l___parsedManifest__21) do
		local v27 = v24;
		local v28, v29, v30 = ipairs(v26);
		while true do
			local v31, v32 = v28(v29, v30);
			if not v31 then
				break;
			end;
			local v33 = v27.children[v32] or {};
			if v31 == #v26 then
				if v33.alias ~= nil then
					error("Multiple aliases assigned to one instance");
				end;
				v33.alias = v25;
			else
				v33.children = v33.children or {};
				v33.connections = v33.connections or {};
			end;
			v27.children[v32] = v33;
			v27 = v33;		
		end;
	end;
	debug.profileend();
	local l___manifestSizeTarget__4 = p13._manifestSizeTarget;
	local function u5(p15)
		local v34 = assert(p15.instance);
		local l__children__35 = p15.children;
		local l__alias__36 = p15.alias;
		local v37 = not l__children__35;
		if l__alias__36 then
			v23[l__alias__36] = v34;
		end;
		if not v37 then
			local function u6(p16)
				local v38 = l__children__35[p16.Name];
				if not v38 or v38.instance ~= nil then
					return;
				end;
				v38.instance = p16;
				u5(v38);
			end;
			for v39, v40 in ipairs(v34:GetChildren()) do
				u6(v40);
			end;
			table.insert(p15.connections, v34.ChildAdded:Connect(u6));
			table.insert(p15.connections, v34.ChildRemoved:Connect(function(p17)
				local l__Name__41 = p17.Name;
				local v42 = l__children__35[l__Name__41];
				if not v42 then
					return;
				end;
				if v42.instance ~= p17 then
					return;
				end;
				p13:_stopBoundFn(p14);
				u1(v42, v23);
				assert(v42.instance == nil);
				local v43 = v34:FindFirstChild(l__Name__41);
				if v43 then
					u6(v43);
				end;
			end));
		end;
		if v37 and u3(v23, l___manifestSizeTarget__4) then
			p13:_startBoundFn(p14, v23);
		end;
	end;
	debug.profilebegin("ResolveTree");
	u5(v24);
	debug.profileend();
	debug.profileend();
end;
function v7.unbindRoot(p18, p19)
	local l___rootInstToRootNode__44 = p18._rootInstToRootNode;
	local l___rootInstToManifest__45 = p18._rootInstToManifest;
	p18:_stopBoundFn(p19);
	local v46 = l___rootInstToRootNode__44[p19];
	if v46 then
		u1(v46, (assert(l___rootInstToManifest__45[p19])));
		l___rootInstToRootNode__44[p19] = nil;
	end;
	l___rootInstToManifest__45[p19] = nil;
end;
function v7.destroy(p20)
	debug.profilebegin("AtomicBinding:destroy");
	for v47, v48 in pairs(p20._dtorMap) do
		v48:destroy();
	end;
	table.clear(p20._dtorMap);
	for v49, v50 in ipairs(p20._connections) do
		v50:Disconnect();
	end;
	table.clear(p20._connections);
	local l___rootInstToManifest__51 = p20._rootInstToManifest;
	for v52, v53 in pairs(p20._rootInstToRootNode) do
		u1(v53, (assert(l___rootInstToManifest__51[v52])));
	end;
	table.clear(p20._rootInstToManifest);
	table.clear(p20._rootInstToRootNode);
	debug.profileend();
end;
return v7;
