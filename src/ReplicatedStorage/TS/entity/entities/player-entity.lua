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
function v3.constructor(p1, p2, p3)
	l__InventoryEntity__2.constructor(p1, p3);
	p1.player = p2;
end;
function v3.onServerSetup(p4)
	l__InventoryEntity__2.onServerSetup(p4);
end;
function v3.getPlayer(p5)
	return p5.player;
end;
local l__GamePlayerUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
function v3.canAttack(p6, p7)
	if not l__InventoryEntity__2.canAttack(p6, p7) then
		return false;
	end;
	if v1.instanceof(p7, v3) and l__GamePlayerUtil__1.getGamePlayer(p7:getPlayer()):getTeamId() == l__GamePlayerUtil__1.getGamePlayer(p6:getPlayer()):getTeamId() then
		return false;
	end;
	return true;
end;
return {
	PlayerEntity = v3
};
