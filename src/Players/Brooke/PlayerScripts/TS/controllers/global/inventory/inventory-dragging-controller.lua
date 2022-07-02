-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@flamework", "core").out);
local l__Reflect__3 = v2.Reflect;
local l__Controller__4 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Controller;
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v6 = setmetatable({}, {
	__tostring = function()
		return "InventoryDraggingController";
	end
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
function v6.constructor(p1)

end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__InventoryBackground__2 = v1.import(script, script.Parent, "ui", "inventory-background").InventoryBackground;
local l__Players__3 = v5.Players;
local l__UserInputService__4 = v5.UserInputService;
function v6.onStart(p2)
	u1.mount(u1.createFragment({
		InventoryBackgroundGui = u1.createElement("ScreenGui", {
			ResetOnSpawn = false, 
			IgnoreGuiInset = true, 
			DisplayOrder = -1
		}, { u1.createElement(l__InventoryBackground__2, {
				Transparency = 1
			}) })
	}), l__Players__3.LocalPlayer:WaitForChild("PlayerGui"));
	l__UserInputService__4.InputEnded:Connect(function(p3, p4)
		if p3.UserInputType == Enum.UserInputType.MouseButton1 and p3.UserInputState == Enum.UserInputState.End then
			p2:deselectInventoryItem();
		end;
	end);
end;
local l__PlaceUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__KnitClient__6 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__ClientStore__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__getItemMeta__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__Flamework__9 = v2.Flamework;
function v6.dragItem(p5, p6, p7)
	if l__PlaceUtil__5.isGameServer() and l__KnitClient__6.Controllers.SpectateController:isSpectating() then
		return nil;
	end;
	local l__hotbar__8 = l__ClientStore__7:getState().Inventory.observedInventory.hotbar;
	if not l__hotbar__8 then
		return nil;
	end;
	local v9 = l__hotbar__8[p6 + 1];
	if not v9.item then
		return nil;
	end;
	local v10 = l__getItemMeta__8(v9.item.itemType).image;
	if v10 == nil then
		v10 = "";
	end;
	l__Flamework__9.resolveDependency("client/controllers/global/mouse-icon/mouse-icon-controller@MouseIconController"):setMouseIcon(v10);
	p5.pickedUpInventoryItem = {
		slotId = p6, 
		slotData = v9.item
	};
end;
function v6.dragItemOntoSlot(p8, p9, p10)
	if not p8.pickedUpInventoryItem then
		return nil;
	end;
	if p8.pickedUpInventoryItem.slotId ~= p9 then
		l__ClientStore__7:dispatch({
			type = "InventorySwapHotbarSlots", 
			slotIndex1 = p9, 
			slotIndex2 = p8.pickedUpInventoryItem.slotId
		});
	end;
	p8:deselectInventoryItem();
end;
function v6.deselectInventoryItem(p11)
	if not p11.pickedUpInventoryItem then
		return nil;
	end;
	p11.pickedUpInventoryItem = nil;
	l__Flamework__9.resolveDependency("client/controllers/global/mouse-icon/mouse-icon-controller@MouseIconController"):clearMouseIcon();
end;
function v6.getActiveDragItem(p12)
	return p12.pickedUpInventoryItem;
end;
l__Reflect__3.defineMetadata(v6, "identifier", "client/controllers/global/inventory/inventory-dragging-controller@InventoryDraggingController");
l__Reflect__3.defineMetadata(v6, "flamework:implements", { "$:flamework@OnStart" });
l__Reflect__3.decorate(v6, "$:flamework@Controller", l__Controller__4, { {} });
return {
	InventoryDraggingController = v6
};
