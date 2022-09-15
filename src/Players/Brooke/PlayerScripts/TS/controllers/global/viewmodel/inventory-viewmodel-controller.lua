-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "InventoryViewmodelController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
function u1.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "InventoryViewmodelController";
end;
local l__ClientStore__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function u1.KnitStart(p2)
	l__ClientStore__2.changed:connect(function(p3, p4)
		if p3.Inventory.observedInventory.inventory.hand ~= p4.Inventory.observedInventory.inventory.hand then
			v1.Promise.defer(function()
				p2:handleStore(p3);
			end);
		end;
	end);
	p2:handleStore(l__ClientStore__2:getState());
end;
local l__ItemUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local l__KnitClient__4 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function u1.handleStore(p5, p6)
	local v5 = p6.Inventory.observedInventory.inventory.hand;
	if v5 ~= nil then
		v5 = v5.itemType;
	end;
	if not v5 then
		l__KnitClient__4.Controllers.ViewmodelController:setHeldItem(nil);
		return;
	end;
	local v6 = p6.Inventory.observedInventory.inventory.hand;
	if v6 ~= nil then
		v6 = v6.itemSkin;
	end;
	l__KnitClient__4.Controllers.ViewmodelController:setHeldItem((l__ItemUtil__3.createItemInstance(v5, 1, v6)));
end;
u1 = l__KnitClient__4.CreateController;
u1 = u1(u1.new());
return {
	InventoryViewmodelController = u1
};
