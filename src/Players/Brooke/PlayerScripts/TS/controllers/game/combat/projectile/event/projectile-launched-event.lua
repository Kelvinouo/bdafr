-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CancellableEvent__2 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).CancellableEvent;
local v3 = setmetatable({}, {
	__tostring = function()
		return "ProjectileLaunchedEvent";
	end, 
	__index = l__CancellableEvent__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p1, p2, p3, p4, p5, p6)
	l__CancellableEvent__2.constructor(p1);
	p1.projectileType = p2;
	p1.projectile = p3;
	p1.launchVelocity = p4;
	p1.origin = p5;
	p1.shooter = p6;
end;
local l__Players__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v3.isLocalShooter(p7)
	local v5 = false;
	if p7.shooter ~= nil then
		v5 = p7.shooter == l__Players__1.LocalPlayer.Character;
	end;
	return v5;
end;
local l__InventoryUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
function v3.getShooterHandItem(p8)
	if not p8.shooter then
		return nil;
	end;
	local v6 = l__Players__1:GetPlayerFromCharacter(p8.shooter);
	if not v6 then
		return nil;
	end;
	return l__InventoryUtil__2.getInventory(v6).hand;
end;
return {
	ProjectileLaunchedEvent = v3
};
