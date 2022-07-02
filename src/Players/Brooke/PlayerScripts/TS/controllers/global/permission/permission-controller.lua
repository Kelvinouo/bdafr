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
	local v6 = l__default__2.Client:Get("RemoteName"):CallServer(p4);
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
function v3.playerHasPermission(p5, p6, p7)
	local v7 = p5:getPlayerPermissions(p6);
	if not v7 then
		return false;
	end;
	return table.find(v7, p7) ~= nil;
end;
function v3.playerHasPermissions(p8, p9, p10)
	local v8 = p8:getPlayerPermissions(p9);
	if not v8 then
		return false;
	end;
	local v9 = true;
	for v10, v11 in ipairs(p10) do
		if table.find(v8, v11) == nil then
			v9 = false;
			break;
		end;
	end;
	return v9;
end;
function v3.playerHasAnyPermissions(p11, p12, p13)
	local v12 = p11:getPlayerPermissions(p12);
	if not v12 then
		return false;
	end;
	local v13 = false;
	for v14, v15 in ipairs(p13) do
		if table.find(v12, v15) ~= nil then
			v13 = true;
			break;
		end;
	end;
	return v13;
end;
function v3.playerIsStaffMember(p14, p15)
	return p14:playerHasAnyPermissions(p15, { 0, 2, 4, 6, 5, 1 });
end;
function v3.hasAllKitsUnlocked(p16, p17)
	local v16 = p16:getPlayerPermissions(p17.UserId);
	if v16 and table.find(v16, 9) ~= nil then
		return true;
	end;
	if p16:playerIsStaffMember(p17) then
		return true;
	end;
	if p17:GetRankInGroup(5774246) >= 100 then
		return true;
	end;
	return false;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
