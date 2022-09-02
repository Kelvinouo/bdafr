-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@flamework", "core").out);
local l__Reflect__3 = v2.Reflect;
local l__Controller__4 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Controller;
local v5 = setmetatable({}, {
	__tostring = function()
		return "InventoryDraggingController";
	end
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1)
	p1.screenSinks = {};
end;
local l__UserInputService__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).UserInputService;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function v5.onStart(p2)
	l__UserInputService__1.InputBegan:Connect(function(p3, p4)
		if table.find({ Enum.UserInputType.MouseButton1, Enum.UserInputType.Touch }, p3.UserInputType) == nil then
			return nil;
		end;
		local v7 = p2:getActiveScreenSink(p3);
		if v7 ~= nil then
			v7.inputEventOccured("began", p3);
		end;
	end);
	l__UserInputService__1.InputEnded:Connect(function(p5, p6)
		if not p2.pickedUpInventoryItem then
			return nil;
		end;
		if table.find({ Enum.UserInputType.MouseButton1, Enum.UserInputType.Touch }, p5.UserInputType) == nil then
			return nil;
		end;
		local v8 = p2.pickedUpInventoryItem;
		if v8 ~= nil then
			v8 = v8.inputObject;
		end;
		if p5 == v8 then
			local v9 = p2:getActiveScreenSink(p5);
			if v9 then
				v9.inputEventOccured("ended", p5);
			else
				l__KnitClient__2.Controllers.ItemDropController:dropHotbarItem(p2.pickedUpInventoryItem.slotId);
			end;
			p2:deselectInventoryItem();
		end;
	end);
end;
local l__PlaceUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__getItemMeta__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__Flamework__6 = v2.Flamework;
function v5.dragItem(p7, p8, p9, p10)
	if l__PlaceUtil__3.isGameServer() and l__KnitClient__2.Controllers.SpectateController:isSpectating() then
		return nil;
	end;
	local l__hotbar__10 = l__ClientStore__4:getState().Inventory.observedInventory.hotbar;
	if not l__hotbar__10 then
		return nil;
	end;
	local v11 = l__hotbar__10[p8 + 1];
	if not v11.item then
		return nil;
	end;
	local v12 = l__getItemMeta__5(v11.item.itemType).image;
	if v12 == nil then
		v12 = "";
	end;
	l__Flamework__6.resolveDependency("client/controllers/global/mouse-icon/mouse-icon-controller@MouseIconController"):setMouseIcon(v12);
	p7.pickedUpInventoryItem = {
		slotId = p8, 
		slotData = v11.item, 
		inputObject = p9
	};
end;
function v5.dragItemOntoSlot(p11, p12, p13, p14)
	if not p11.pickedUpInventoryItem then
		return nil;
	end;
	if p11.pickedUpInventoryItem.inputObject ~= p13 then
		print("Wrong input objec.t.");
		return nil;
	end;
	if p11.pickedUpInventoryItem.slotId ~= p12 then
		l__ClientStore__4:dispatch({
			type = "InventorySwapHotbarSlots", 
			slotIndex1 = p12, 
			slotIndex2 = p11.pickedUpInventoryItem.slotId
		});
	end;
	p11:deselectInventoryItem();
end;
function v5.deselectInventoryItem(p15)
	if not p15.pickedUpInventoryItem then
		return nil;
	end;
	p15.pickedUpInventoryItem = nil;
	l__Flamework__6.resolveDependency("client/controllers/global/mouse-icon/mouse-icon-controller@MouseIconController"):clearMouseIcon();
end;
function v5.getActiveDragItem(p16)
	return p16.pickedUpInventoryItem;
end;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v5.registerScreenSink(p17, p18, p19, p20)
	local v13 = u7.new();
	local v14 = {
		position = p18, 
		size = p19, 
		inputEventOccured = p20, 
		maid = v13
	};
	table.insert(p17.screenSinks, v14);
	v13:GiveTask(function()
		local v15 = (table.find(p17.screenSinks, v14) and 0) - 1;
		if v15 >= 0 then
			table.remove(p17.screenSinks, v15 + 1);
		end;
	end);
	return v14;
end;
function v5.getActiveScreenSink(p21, p22)
	local v16, v17, v18 = ipairs(p21.screenSinks);
	while true do
		v16(v17, v18);
		if not v16 then
			break;
		end;
		v18 = v16;
		local v19 = v17.position + v17.size;
		local l__position__20 = v17.position;
		local v21 = Vector2.new(math.max(v19.X, l__position__20.X), math.max(v19.Y, l__position__20.Y));
		local v22 = Vector2.new(math.min(v19.X, l__position__20.X), math.min(v19.Y, l__position__20.Y));
		if v22.Y < p22.Position.Y and p22.Position.Y < v21.Y and v22.X < p22.Position.X and p22.Position.X < v21.X then
			return v17;
		end;	
	end;
	return nil;
end;
l__Reflect__3.defineMetadata(v5, "identifier", "client/controllers/global/inventory/inventory-dragging-controller@InventoryDraggingController");
l__Reflect__3.defineMetadata(v5, "flamework:implements", { "$:flamework@OnStart" });
l__Reflect__3.decorate(v5, "$:flamework@Controller", l__Controller__4, { {} });
return {
	InventoryDraggingController = v5
};
