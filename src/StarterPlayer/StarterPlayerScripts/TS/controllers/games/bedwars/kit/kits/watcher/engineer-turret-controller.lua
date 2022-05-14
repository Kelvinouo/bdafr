-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "CameraTurretController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local u2 = l__KnitController__3;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "CameraTurretController";
end;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
end;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function u1.getNextTurret(p3)
	local v6 = p3:getTurrets();
	local l__engineerSelectedTurret__7 = l__ClientStore__3:getState().Kit.engineerSelectedTurret;
	if l__engineerSelectedTurret__7 == nil then
		return v6[1];
	end;
	local v8 = v6[(table.find(v6, l__engineerSelectedTurret__7) and 0) - 1 + 1 + 1];
	if v8 ~= nil then
		return v8;
	end;
	return v6[1];
end;
function u1.getBackTurret(p4)
	local v9 = p4:getTurrets();
	local l__engineerSelectedTurret__10 = l__ClientStore__3:getState().Kit.engineerSelectedTurret;
	if l__engineerSelectedTurret__10 == nil then
		return v9[1];
	end;
	local v11 = v9[(table.find(v9, l__engineerSelectedTurret__10) and 0) - 1 - 1 + 1];
	if v11 ~= nil then
		return v11;
	end;
	return v9[#v9 - 1 + 1];
end;
local l__CollectionService__4 = v2.CollectionService;
local l__Players__5 = v2.Players;
function u1.getTurrets(p5)
	local v12 = l__CollectionService__4:GetTagged("engineer-turret");
	local function v13(p6)
		return p6:GetAttribute("PlacedByUserId") == l__Players__5.LocalPlayer.UserId;
	end;
	local v14 = {};
	local v15 = 0;
	for v16, v17 in ipairs(v12) do
		if v13(v17, v16 - 1, v12) == true then
			v15 = v15 + 1;
			v14[v15] = v17;
		end;
	end;
	return v14;
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
