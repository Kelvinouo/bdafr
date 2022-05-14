-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "PermissionController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "PermissionController";
	p1.playerPermissions = {};
end;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v3.getPlayerPermissions(p3, p4)
	local v5 = nil;
	if type(p4) == "number" then
		if p3.playerPermissions[p4] ~= nil then
			return p3.playerPermissions[p4];
		end;
	elseif p3.playerPermissions[p4.UserId] ~= nil then
		return p3.playerPermissions[p4.UserId];
	end;
	local v6 = l__default__2.Client:Get("GetPlayerPermissions"):CallServer(p4);
	if v6 then
		if type(p4) ~= "number" then
			p3.playerPermissions[p4.UserId] = v6;
			v5 = v6;
			return v5;
		end;
	else
		v5 = v6;
		return v5;
	end;
	p3.playerPermissions[p4] = v6;
	return v6;
end;
v3.playerHasPermission = v1.async(function(p5, p6, p7)
	local v7 = v1.await(p5:getPlayerPermissions(p6));
	if not v7 then
		return false;
	end;
	return table.find(v7, p7) ~= nil;
end);
v3.playerHasPermissions = v1.async(function(p8, p9, p10)
	local v8 = v1.await(p8:getPlayerPermissions(p9));
	if not v8 then
		return false;
	end;
	local function v9(p11)
		return table.find(v8, p11) ~= nil;
	end;
	local v10 = true;
	for v11, v12 in ipairs(p10) do
		if not v9(v12, v11 - 1, p10) then
			v10 = false;
			break;
		end;
	end;
	return v10;
end);
v3.playerHasAnyPermissions = v1.async(function(p12, p13, p14)
	local v13 = v1.await(p12:getPlayerPermissions(p13));
	if not v13 then
		return false;
	end;
	local function v14(p15)
		return table.find(v13, p15) ~= nil;
	end;
	local v15 = false;
	for v16, v17 in ipairs(p14) do
		if v14(v17, v16 - 1, p14) then
			v15 = true;
			break;
		end;
	end;
	return v15;
end);
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
