
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(script.Parent.Promise);
local v2 = {
	Promise = v1
};
local l__RunService__1 = game:GetService("RunService");
local l__ReplicatedFirst__2 = game:GetService("ReplicatedFirst");
local function u3(p1)
	return l__RunService__1:IsStudio() and p1:FindFirstAncestorWhichIsA("Plugin") ~= nil;
end;
function v2.getModule(p2, p3, p4)
	if p4 == nil then
		p4 = p3;
		p3 = "@rbxts";
	end;
	if l__RunService__1:IsRunning() and p2:IsDescendantOf(l__ReplicatedFirst__2) then
		warn("roblox-ts packages should not be used from ReplicatedFirst!");
	end;
	if l__RunService__1:IsRunning() and l__RunService__1:IsClient() and not u3(p2) and not game:IsLoaded() then
		game.Loaded:Wait();
	end;
	local l__node_modules__3 = script.Parent:FindFirstChild("node_modules");
	if not l__node_modules__3 then
		error("Could not find any modules!", 2);
	end;
	while true do
		local v4 = p2:FindFirstChild("node_modules");
		if v4 and v4 ~= l__node_modules__3 then
			v4 = v4:FindFirstChild("@rbxts");
		end;
		if v4 then
			local v5 = v4:FindFirstChild(p4);
			if v5 then
				return v5;
			end;
		end;
		p2 = p2.Parent;
		if p2 == nil then
			break;
		end;
		if p2 == l__node_modules__3 then
			break;
		end;	
	end;
	return (l__node_modules__3:FindFirstChild(p3 and "@rbxts") and l__node_modules__3):FindFirstChild(p4) or error("Could not find module: " .. p4, 2);
end;
local u4 = {};
local u5 = {};
function v2.import(p5, p6, ...)
	for v6 = 1, select("#", ...) do
		p6 = p6:WaitForChild((select(v6, ...)));
	end;
	if p6.ClassName ~= "ModuleScript" then
		error("Failed to import! Expected ModuleScript, got " .. p6.ClassName, 2);
	end;
	u4[p5] = p6;
	local v7 = p6;
	local v8 = 0;
	while v7 do
		v8 = v8 + 1;
		v7 = u4[v7];
		if v7 == p6 then
			local v9 = nil;
			v9 = v7.Name;
			for v10 = 1, v8 do
				v7 = u4[v7];
				v9 = v9 .. "  \226\135\146 " .. v7.Name;
			end;
			error("Failed to import! Detected a circular dependency chain: " .. local v11, 2);
		end;	
	end;
	if not u5[p6] then
		if _G[p6] then
			error("Invalid module access! Do you have two TS runtimes trying to import this? " .. p6:GetFullName(), 2);
		end;
		_G[p6] = v2;
		u5[p6] = true;
	end;
	if u4[p5] == p6 then
		u4[p5] = nil;
	end;
	return require(p6);
end;
function v2.instanceof(p7, p8)
	if type(p8) == "table" and type(p8.instanceof) == "function" then
		return p8.instanceof(p7);
	end;
	if type(p7) == "table" then
		p7 = getmetatable(p7);
		while p7 ~= nil do
			if p7 == p8 then
				return true;
			end;
			local v12 = getmetatable(p7);
			if v12 then
				p7 = v12.__index;
			else
				p7 = nil;
			end;		
		end;
	end;
	return false;
end;
function v2.async(p9)
	return function(...)
		local u6 = { ... };
		local u7 = select("#", ...);
		return v1.new(function(p10, p11)
			coroutine.wrap(function()
				local v13 = nil;
				local v14 = nil;
				v14, v13 = pcall(p9, unpack(u6, 1, u7));
				if v14 then
					p10(v13);
					return;
				end;
				p11(v13);
			end)();
		end);
	end;
end;
function v2.await(p12)
	local v15 = nil;
	if not v1.is(p12) then
		return p12;
	end;
	local v16 = nil;
	v16, v15 = p12:awaitStatus();
	if v16 == v1.Status.Resolved then
		return v15;
	end;
	if v16 ~= v1.Status.Rejected then
		error("The awaited Promise was cancelled", 2);
		return;
	end;
	error(v15, 2);
end;
function v2.bit_lrsh(p13, p14)
	local v17 = nil;
	local v18 = math.abs(p13);
	v17 = bit32.rshift(v18, p14);
	if p13 == v18 then
		return v17;
	end;
	return -v17 - 1;
end;
v2.TRY_RETURN = 1;
v2.TRY_BREAK = 2;
v2.TRY_CONTINUE = 3;
function v2.try(p15, p16, p17)
	local u8 = nil;
	local u9 = nil;
	local v19, v20, v21 = xpcall(p15, function(p18)
		u8 = p18;
		u9 = debug.traceback();
	end);
	if not v19 and p16 then
		local v22, v23 = p16(u8, u9);
		if v22 then
			v20 = v22;
			v21 = v23;
		end;
	end;
	if p17 then
		local v24, v25 = p17();
		if v24 then
			v20 = v24;
			v21 = v25;
		end;
	end;
	return v20, v21;
end;
function v2.generator(p19)
	local v26 = {};
	local u10 = coroutine.create(p19);
	function v26.next(...)
		if coroutine.status(u10) == "dead" then
			return {
				done = true
			};
		end;
		local v27, v28 = coroutine.resume(u10, ...);
		if v27 == false then
			error(v28, 2);
		end;
		return {
			value = v28, 
			done = coroutine.status(u10) == "dead"
		};
	end;
	return v26;
end;
return v2;

