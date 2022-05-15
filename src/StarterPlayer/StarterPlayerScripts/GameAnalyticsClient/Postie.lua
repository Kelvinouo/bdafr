
-- Decompiled with the Synapse X Luau decompiler.

local v1 = nil;
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
if not script:FindFirstChild("Sent") then
	local v3 = Instance.new("RemoteEvent");
	v3.Name = "Sent";
	v3.Parent = script;
end;
if not script:FindFirstChild("Received") then
	local v4 = Instance.new("RemoteEvent");
	v4.Name = "Received";
	v4.Parent = script;
end;
v1 = script.Received;
local v5 = {};
local u1 = game:GetService("RunService"):IsServer();
local u2 = {};
local l__HttpService__3 = game:GetService("HttpService");
local function u4(p1, ...)
	local v6 = Instance.new("BindableEvent");
	local u5 = table.pack(...);
	v6.Event:Connect(function()
		p1(table.unpack(u5, 1, u5.n));
	end);
	v6:Fire();
	v6:Destroy();
end;
local l__Sent__6 = script.Sent;
function v5.InvokeClient(p2, p3, p4, ...)
	assert(u1, "Postie.InvokeClient can only be called from the server");
	assert(typeof(p2) == "string", "bad argument #1 to Postie.InvokeClient, expects string");
	local v7 = false;
	if typeof(p3) == "Instance" then
		v7 = p3:IsA("Player");
	end;
	assert(v7, "bad argument #2 to Postie.InvokeClient, expects Instance<Player>");
	assert(typeof(p4) == "number", "bad argument #3 to Postie.InvokeClient, expects number");
	local v8 = Instance.new("BindableEvent");
	local u7 = l__HttpService__3:GenerateGUID(false);
	local u8 = false;
	local u9 = #u2 + 1;
	u2[u9] = function(p5, p6, ...)
		if p5 ~= p3 or p6 ~= u7 then
			return false;
		end;
		u8 = true;
		table.remove(u2, u9);
		v8:Fire(true, ...);
		return true;
	end;
	u4(function()
		wait(p4);
		if u8 then
			return;
		end;
		table.remove(u2, u9);
		v8:Fire(false);
	end);
	l__Sent__6:FireClient(p3, p2, u7, ...);
	return v8.Event:Wait();
end;
function v5.InvokeServer(p7, p8, ...)
	assert(not u1, "Postie.InvokeServer can only be called from the client");
	assert(typeof(p7) == "string", "bad argument #1 to Postie.InvokeServer, expects string");
	assert(typeof(p8) == "number", "bad argument #2 to Postie.InvokeServer, expects number");
	local v9 = Instance.new("BindableEvent");
	local u10 = l__HttpService__3:GenerateGUID(false);
	local u11 = false;
	local u12 = #u2 + 1;
	u2[u12] = function(p9, ...)
		if p9 ~= u10 then
			return false;
		end;
		u11 = true;
		table.remove(u2, u12);
		v9:Fire(true, ...);
		return true;
	end;
	u4(function()
		wait(p8);
		if u11 then
			return;
		end;
		table.remove(u2, u12);
		v9:Fire(false);
	end);
	l__Sent__6:FireServer(p7, u10, ...);
	return v9.Event:Wait();
end;
local u13 = {};
function v5.SetCallback(p10, p11)
	assert(typeof(p10) == "string", "bad argument #1 to Postie.SetCallback, expects string");
	u13[p10] = p11;
end;
function v5.GetCallback(p12)
	assert(typeof(p12) == "string", "bad argument #1 to Postie.GetCallback, expects string");
	return u13[p12];
end;
if u1 then
	v1.OnServerEvent:Connect(function(...)
		for v10, v11 in ipairs(u2) do
			if v11(...) then
				return;
			end;
		end;
	end);
	l__Sent__6.OnServerEvent:Connect(function(p13, p14, p15, ...)
		local v12 = u13[p14];
		v1:FireClient(p13, p15, v12 and v12(p13, ...));
	end);
	return v5;
end;
v1.OnClientEvent:Connect(function(...)
	for v13, v14 in ipairs(u2) do
		if v14(...) then
			return;
		end;
	end;
end);
l__Sent__6.OnClientEvent:Connect(function(p16, p17, ...)
	local v15 = u13[p16];
	v1:FireServer(p17, v15 and v15(...));
end);
return v5;

