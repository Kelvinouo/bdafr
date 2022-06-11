-- Script Hash: 908a810af40d8b2eb9d3396429cb3c66145478f5a6c75612402c316f43494862168cae4cccdaca9673aec8be04a05384
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "WorldController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "WorldController";
end;
local l__PlaceUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__RunService__3 = v2.RunService;
local l__Workspace__4 = v2.Workspace;
local l__WorldUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "world-util").WorldUtil;
local l__ClientSyncEvents__6 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	if not l__PlaceUtil__2.isGameServer() then
		return nil;
	end;
	local u7 = nil;
	l__RunService__3.Heartbeat:Connect(function()
		local v6 = l__Workspace__4.CurrentCamera;
		if v6 ~= nil then
			v6 = v6.CFrame.Position;
		end;
		if not v6 then
			return nil;
		end;
		local v7 = l__WorldUtil__5:getWorldFromPosition(v6);
		if v7 ~= nil then
			v7 = v7.Name;
		end;
		if v7 ~= u7 then
			l__ClientSyncEvents__6.ChangeWorld:fire(v7, u7);
			u7 = v7;
		end;
	end);
end;
function v4.watchLocalWorld(p3, p4)
	local v8 = l__Workspace__4.CurrentCamera;
	if v8 ~= nil then
		v8 = v8.CFrame.Position;
	end;
	if v8 then
		local v9 = l__WorldUtil__5:getWorldFromPosition(v8);
	else
		v9 = nil;
	end;
	task.spawn(function()
		p4(v9);
	end);
	return l__ClientSyncEvents__6.ChangeWorld:connect(function(p5)
		local l__toWorldId__10 = p5.toWorldId;
		if l__toWorldId__10 ~= "" and l__toWorldId__10 then
			local v11 = l__Workspace__4:WaitForChild("Map"):WaitForChild("Worlds"):FindFirstChild(p5.toWorldId);
		else
			v11 = nil;
		end;
		task.spawn(function()
			p4(v11);
		end);
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
