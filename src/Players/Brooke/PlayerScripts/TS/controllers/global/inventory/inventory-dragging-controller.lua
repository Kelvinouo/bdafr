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
	p1.screenSinks = {};
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__InventoryBackground__2 = v1.import(script, script.Parent, "ui", "inventory-background").InventoryBackground;
local l__Players__3 = v5.Players;
local l__UserInputService__4 = v5.UserInputService;
local l__KnitClient__5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
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
	l__UserInputService__4.InputBegan:Connect(function(p3, p4)
		if table.find({ Enum.UserInputType.MouseButton1, Enum.UserInputType.Touch }, p3.UserInputType) == nil then
			return nil;
		end;
		local v8 = p2:getActiveScreenSink(p3);
		if v8 ~= nil then
			v8.inputEventOccured("began", p3);
		end;
	end);
	l__UserInputService__4.InputEnded:Connect(function(p5, p6)
		if not p2.pickedUpInventoryItem then
			return nil;
		end;
		if table.find({ Enum.UserInputType.MouseButton1, Enum.UserInputType.Touch }, p5.UserInputType) == nil then
			return nil;
		end;
		local v9 = p2.pickedUpInventoryItem;
		if v9 ~= nil then
			v9 = v9.inputObject;
		end;
		if p5 == v9 then
			local v10 = p2:getActiveScreenSink(p5);
			if v10 then
				v10.inputEventOccured("ended", p5);
			else
				l__KnitClient__5.Controllers.ItemDropController:dropHotbarItem(p2.pickedUpInventoryItem.slotId);
			end;
			p2:deselectInventoryItem();
		end;
	end);
end;
local l__PlaceUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__ClientStore__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__getItemMeta__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__Flamework__9 = v2.Flamework;
function v6.dragItem(p7, p8, p9, p10)
	if l__PlaceUtil__6.isGameServer() and l__KnitClient__5.Controllers.SpectateController:isSpectating() then
		return nil;
	end;
	local l__hotbar__11 = l__ClientStore__7:getState().Inventory.observedInventory.hotbar;
	if not l__hotbar__11 then
		return nil;
	end;
	local v12 = l__hotbar__11[p8 + 1];
	if not v12.item then
		return nil;
	end;
	local v13 = l__getItemMeta__8(v12.item.itemType).image;
	if v13 == nil then
		v13 = "";
	end;
	l__Flamework__9.resolveDependency("client/controllers/global/mouse-icon/mouse-icon-controller@MouseIconController"):setMouseIcon(v13);
	p7.pickedUpInventoryItem = {
		slotId = p8, 
		slotData = v12.item, 
		inputObject = p9
	};
end;
function v6.dragItemOntoSlot(p11, p12, p13, p14)
	if not p11.pickedUpInventoryItem then
		return nil;
	end;
	if p11.pickedUpInventoryItem.inputObject ~= p13 then
		print("Wrong input objec.t.");
		return nil;
	end;
	if p11.pickedUpInventoryItem.slotId ~= p12 then
		l__ClientStore__7:dispatch({
			type = "InventorySwapHotbarSlots", 
			slotIndex1 = p12, 
			slotIndex2 = p11.pickedUpInventoryItem.slotId
		});
	end;
	p11:deselectInventoryItem();
end;
function v6.deselectInventoryItem(p15)
	if not p15.pickedUpInventoryItem then
		return nil;
	end;
	p15.pickedUpInventoryItem = nil;
	l__Flamework__9.resolveDependency("client/controllers/global/mouse-icon/mouse-icon-controller@MouseIconController"):clearMouseIcon();
end;
function v6.getActiveDragItem(p16)
	return p16.pickedUpInventoryItem;
end;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v6.registerScreenSink(p17, p18, p19, p20)
	local v14 = u10.new();
	local v15 = {
		position = p18, 
		size = p19, 
		inputEventOccured = p20, 
		maid = v14
	};
	table.insert(p17.screenSinks, v15);
	v14:GiveTask(function()
		local v16 = (table.find(p17.screenSinks, v15) and 0) - 1;
		if v16 >= 0 then
			table.remove(p17.screenSinks, v16 + 1);
		end;
	end);
	return v15;
end;
function v6.getActiveScreenSink(p21, p22)
	for v17, v18 in ipairs(p21.screenSinks) do
		local v19 = v18.position + v18.size;
		local l__position__20 = v18.position;
		local v21 = Vector2.new(math.max(v19.X, l__position__20.X), math.max(v19.Y, l__position__20.Y));
		local v22 = Vector2.new(math.min(v19.X, l__position__20.X), math.min(v19.Y, l__position__20.Y));
		if v22.Y < p22.Position.Y and p22.Position.Y < v21.Y and v22.X < p22.Position.X and p22.Position.X < v21.X then
			return v18;
		end;
	end;
	return nil;
end;
l__Reflect__3.defineMetadata(v6, "identifier", "client/controllers/global/inventory/inventory-dragging-controller@InventoryDraggingController");
l__Reflect__3.defineMetadata(v6, "flamework:implements", { "$:flamework@OnStart" });
l__Reflect__3.decorate(v6, "$:flamework@Controller", l__Controller__4, { {} });
return {
	InventoryDraggingController = v6
};
