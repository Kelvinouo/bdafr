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
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "PermissionController";
	p1.playerPermissions = {};
end;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v3.getPlayerPermissions(p3, p4)
	local v5 = nil;
	if type(p4) == "number" then
		if p3.playerPermissions[p4] ~= nil then
			return p3.playerPermissions[p4];
		end;
	elseif p3.playerPermissions[p4.UserId] ~= nil then
		return p3.playerPermissions[p4.UserId];
	end;
	local v6 = l__default__1.Client:Get("RemoteName"):CallServer(p4);
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
	local v10, v11, v12 = ipairs(p10);
	while true do
		v10(v11, v12);
		if not v10 then
			break;
		end;
		v12 = v10;
		if table.find(v8, v11) == nil then
			v9 = false;
			break;
		end;	
	end;
	return v9;
end;
function v3.playerHasAnyPermissions(p11, p12, p13)
	local v13 = p11:getPlayerPermissions(p12);
	if not v13 then
		return false;
	end;
	local v14 = false;
	local v15, v16, v17 = ipairs(p13);
	while true do
		v15(v16, v17);
		if not v15 then
			break;
		end;
		v17 = v15;
		if table.find(v13, v16) ~= nil then
			v14 = true;
			break;
		end;	
	end;
	return v14;
end;
function v3.playerIsStaffMember(p14, p15)
	return p14:playerHasAnyPermissions(p15, { 0, 2, 4, 6, 5, 1 });
end;
local l__PlaceUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
function v3.hasAllKitsUnlocked(p16, p17)
	local v18 = p16:getPlayerPermissions(p17.UserId);
	if v18 and table.find(v18, 9) ~= nil then
		return true;
	end;
	if p16:playerIsStaffMember(p17) then
		return true;
	end;
	if p17:GetRankInGroup(5774246) >= 100 then
		return true;
	end;
	if l__PlaceUtil__2.isStaging() then
		return true;
	end;
	return false;
end;
local v19 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
