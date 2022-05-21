-- Script Hash: c6e99ff951c5ee24e320093b57c83e22a2ca7afb159655b957094d3896a7f7b43048783e99457ec3cb7a4e3956dff20a
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__InventoryEntity__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "inventory-entity").InventoryEntity;
local v3 = setmetatable({}, {
	__tostring = function()
		return "PlayerEntity";
	end, 
	__index = l__InventoryEntity__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__InventoryEntity__2;
function v3.constructor(p1, p2, p3)
	u1.constructor(p1, p3);
	p1.player = p2;
end;
function v3.onServerSetup(p4)
	u1.onServerSetup(p4);
end;
function v3.getPlayer(p5)
	return p5.player;
end;
local l__GamePlayerUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
function v3.canAttack(p6, p7)
	if not u1.canAttack(p6, p7) then
		return false;
	end;
	if v1.instanceof(p7, v3) and l__GamePlayerUtil__2.getGamePlayer(p7:getPlayer()):getTeamId() == l__GamePlayerUtil__2.getGamePlayer(p6:getPlayer()):getTeamId() then
		return false;
	end;
	return true;
end;
u1 = {
	PlayerEntity = v3
};
return l__InventoryEntity__2;
