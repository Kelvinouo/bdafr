-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(script.Parent.Promise);
local v2 = {
	Promise = v1
};
local l__RunService__1 = game:GetService("RunService");
local l__ReplicatedFirst__2 = game:GetService("ReplicatedFirst");
function v2.getModule(p1, p2, p3)
	if p3 == nil then
		p3 = p2;
		p2 = "@rbxts";
	end;
	if l__RunService__1:IsRunning() and p1:IsDescendantOf(l__ReplicatedFirst__2) then
		warn("roblox-ts packages should not be used from ReplicatedFirst!");
	end;
	if l__RunService__1:IsRunning() and l__RunService__1:IsClient() and ((not l__RunService__1:IsStudio() or p1:FindFirstAncestorWhichIsA("Plugin") == nil) and not game:IsLoaded()) then
		game.Loaded:Wait();
	end;
	local l__node_modules__3 = script.Parent:FindFirstChild("node_modules");
	if not l__node_modules__3 then
		error("Could not find any modules!", 2);
	end;
	while true do
		local v4 = p1:FindFirstChild("node_modules");
		if v4 and v4 ~= l__node_modules__3 then
			v4 = v4:FindFirstChild("@rbxts");
		end;
		if v4 then
			local v5 = v4:FindFirstChild(p3);
			if v5 then
				return v5;
			end;
		end;
		p1 = p1.Parent;
		if p1 == nil then
			break;
		end;
		if p1 == l__node_modules__3 then
			break;
		end;	
	end;
	return (l__node_modules__3:FindFirstChild(p2 and "@rbxts") and l__node_modules__3):FindFirstChild(p3) or error("Could not find module: " .. p3, 2);
end;
local u3 = {};
local u4 = {};
function v2.import(p4, p5, ...)
	for v6 = 1, select("#", ...) do
		p5 = p5:WaitForChild((select(v6, ...)));
	end;
	if p5.ClassName ~= "ModuleScript" then
		error("Failed to import! Expected ModuleScript, got " .. p5.ClassName, 2);
	end;
	u3[p4] = p5;
	local v7 = p5;
	local v8 = 0;
	while v7 do
		v8 = v8 + 1;
		v7 = u3[v7];
		if v7 == p5 then
			local v9 = nil;
			v9 = v7.Name;
			for v10 = 1, v8 do
				v7 = u3[v7];
				v9 = v9 .. "  \226\135\146 " .. v7.Name;
			end;
			error("Failed to import! Detected a circular dependency chain: " .. local v11, 2);
		end;	
	end;
	if not u4[p5] then
		if _G[p5] then
			error("Invalid module access! Do you have two TS runtimes trying to import this? " .. p5:GetFullName(), 2);
		end;
		_G[p5] = v2;
		u4[p5] = true;
	end;
	if u3[p4] == p5 then
		u3[p4] = nil;
	end;
	return require(p5);
end;
function v2.instanceof(p6, p7)
	if type(p7) == "table" and type(p7.instanceof) == "function" then
		return p7.instanceof(p6);
	end;
	if type(p6) == "table" then
		p6 = getmetatable(p6);
		while p6 ~= nil do
			if p6 == p7 then
				return true;
			end;
			local v12 = getmetatable(p6);
			if v12 then
				p6 = v12.__index;
			else
				p6 = nil;
			end;		
		end;
	end;
	return false;
end;
function v2.async(p8)
	return function(...)
		local u5 = { ... };
		local u6 = select("#", ...);
		return v1.new(function(p9, p10)
			coroutine.wrap(function()
				local v13 = nil;
				local v14 = nil;
				v14, v13 = pcall(p8, unpack(u5, 1, u6));
				if v14 then
					p9(v13);
					return;
				end;
				p10(v13);
			end)();
		end);
	end;
end;
function v2.await(p11)
	local v15 = nil;
	if not v1.is(p11) then
		return p11;
	end;
	local v16 = nil;
	v16, v15 = p11:awaitStatus();
	if v16 == v1.Status.Resolved then
		return v15;
	end;
	if v16 ~= v1.Status.Rejected then
		error("The awaited Promise was cancelled", 2);
		return;
	end;
	error(v15, 2);
end;
function v2.bit_lrsh(p12, p13)
	local v17 = nil;
	local v18 = math.abs(p12);
	v17 = bit32.rshift(v18, p13);
	if p12 == v18 then
		return v17;
	end;
	return -v17 - 1;
end;
v2.TRY_RETURN = 1;
v2.TRY_BREAK = 2;
v2.TRY_CONTINUE = 3;
function v2.try(p14, p15, p16)
	local u7 = nil;
	local u8 = nil;
	local v19, v20, v21 = xpcall(p14, function(p17)
		u7 = p17;
		u8 = debug.traceback();
	end);
	if not v19 and p15 then
		local v22, v23 = p15(u7, u8);
		if v22 then
			v20 = v22;
			v21 = v23;
		end;
	end;
	if p16 then
		local v24, v25 = p16();
		if v24 then
			v20 = v24;
			v21 = v25;
		end;
	end;
	return v20, v21;
end;
function v2.generator(p18)
	local v26 = {};
	local u9 = coroutine.create(p18);
	function v26.next(...)
		if coroutine.status(u9) == "dead" then
			return {
				done = true
			};
		end;
		local v27, v28 = coroutine.resume(u9, ...);
		if v27 == false then
			error(v28, 2);
		end;
		return {
			value = v28, 
			done = coroutine.status(u9) == "dead"
		};
	end;
	return v26;
end;
return v2;
