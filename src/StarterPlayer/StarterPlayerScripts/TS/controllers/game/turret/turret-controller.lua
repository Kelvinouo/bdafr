-- Script Hash: c2ce5eb043e8a98515a7371e4b73a5cb081f897eb53141faabfe293f5c19b519fc4e79dc779d28392e9eba6774304d42
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "TurretController";
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
	p1.Name = "TurretController";
end;
local l__CollectionService__2 = v2.CollectionService;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__CollectionService__2:GetInstanceRemovedSignal("Turret"):Connect(function(p3)
		if l__ClientStore__3:getState().Game.selectedTurret ~= p3 then
			return nil;
		end;
		l__ClientStore__3:dispatch({
			type = "SetSpectatedTurret", 
			selectedTurret = nil
		});
	end);
end;
function v4.getNextTurret(p4, p5)
	local v6 = p4:getTurrets(p5);
	local l__selectedTurret__7 = l__ClientStore__3:getState().Game.selectedTurret;
	if l__selectedTurret__7 == nil then
		return v6[1];
	end;
	local v8 = (table.find(v6, l__selectedTurret__7) and 0) - 1;
	if v8 == -1 then
		v8 = 0;
	end;
	local v9 = v6[v8 + 1 + 1];
	if v9 ~= nil then
		return v9;
	end;
	return v6[1];
end;
function v4.getBackTurret(p6, p7)
	local v10 = p6:getTurrets(p7);
	local l__selectedTurret__11 = l__ClientStore__3:getState().Game.selectedTurret;
	if l__selectedTurret__11 == nil then
		return v10[1];
	end;
	local v12 = v10[(table.find(v10, l__selectedTurret__11) and 0) - 1 - 1 + 1];
	if v12 ~= nil then
		return v12;
	end;
	return v10[#v10 - 1 + 1];
end;
local l__Players__4 = v2.Players;
function v4.getTurrets(p8, p9)
	local v13 = l__CollectionService__2:GetTagged(p9);
	local function v14(p10)
		return p10:GetAttribute("PlacedByUserId") == l__Players__4.LocalPlayer.UserId;
	end;
	local v15 = {};
	local v16 = 0;
	for v17, v18 in ipairs(v13) do
		if v14(v18, v17 - 1, v13) == true then
			v16 = v16 + 1;
			v15[v16] = v18;
		end;
	end;
	return v15;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
