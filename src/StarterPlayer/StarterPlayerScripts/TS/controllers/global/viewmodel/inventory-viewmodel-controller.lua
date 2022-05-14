-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "InventoryViewmodelController";
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
	p1.Name = "InventoryViewmodelController";
end;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function u1.KnitStart(p2)
	l__ClientStore__3.changed:connect(function(p3, p4)
		if p3.Inventory.observedInventory.inventory.hand ~= p4.Inventory.observedInventory.inventory.hand then
			v1.Promise.defer(function()
				p2:handleStore(p3);
			end);
		end;
	end);
	p2:handleStore(l__ClientStore__3:getState());
end;
local l__ItemUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
function u1.handleStore(p5, p6)
	local v6 = p6.Inventory.observedInventory.inventory.hand;
	if v6 ~= nil then
		v6 = v6.itemType;
	end;
	if not v6 then
		l__KnitClient__2.Controllers.ViewmodelController:setHeldItem(nil);
		return;
	end;
	local v7 = p6.Inventory.observedInventory.inventory.hand;
	if v7 ~= nil then
		v7 = v7.itemSkin;
	end;
	l__KnitClient__2.Controllers.ViewmodelController:setHeldItem((l__ItemUtil__4.createItemInstance(v6, 1, v7)));
end;
u2 = l__KnitClient__2.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	InventoryViewmodelController = u2
};
return u1;
