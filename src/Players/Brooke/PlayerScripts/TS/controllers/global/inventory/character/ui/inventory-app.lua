-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("InventoryAppBase");
function v4.init(p1)

end;
local l__Empty__1 = v2.Empty;
local l__InventoryTile__2 = v1.import(script, script.Parent.Parent.Parent, "ui", "inventory-tile").InventoryTile;
local l__getItemMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__SoundManager__5 = v2.SoundManager;
local l__RandomUtil__6 = v2.RandomUtil;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__DarkBackground__8 = v2.DarkBackground;
local l__Flamework__9 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__KnitClient__10 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__DeviceUtil__11 = v2.DeviceUtil;
local l__InventoryHeader__12 = v1.import(script, script.Parent.Parent.Parent, "ui", "inventory-header").InventoryHeader;
local l__ColorUtil__13 = v2.ColorUtil;
local l__EmptyButton__14 = v2.EmptyButton;
local l__SlideIn__15 = v2.SlideIn;
function v4.render(p2)
	local v5 = {};
	local v6 = {};
	local v7 = 0;
	local v8 = false;
	while true do
		if v8 then
			v7 = v7 + 1;
		else
			v8 = true;
		end;
		if not (v7 < 32) then
			break;
		end;
		if v7 < #p2.props.Inventory.observedInventory.inventory.items then
			local u16 = p2.props.Inventory.observedInventory.inventory.items[v7 + 1];
			local v9 = nil;
			for v10, v11 in ipairs(p2.props.Inventory.observedInventory.hotbar) do
				if v11.item == u16 == true then
					v9 = v11;
					break;
				end;
			end;
			if v9 then
				u16 = nil;
			end;
		end;
		if nil then
			table.insert(v6, nil);
		end;	
	end;
	table.sort(v6, function(p3, p4)
		return p3.addedToBackpackTime < p4.addedToBackpackTime;
	end);
	local v12 = 0;
	local v13 = false;
	while true do
		if v13 then
			v12 = v12 + 1;
		else
			v13 = true;
		end;
		if not (v12 < 24) then
			break;
		end;
		local v14 = nil;
		if v12 < #v6 then
			v14 = v6[v12 + 1];
		end;
		local v15 = {};
		local v16 = {
			InvItem = v14, 
			AutoSelect = v12 == 0, 
			LayoutOrder = v12
		};
		v16.OnClick = v1.async(function()
			if not v14 then
				return;
			end;
			local v17 = l__getItemMeta__3(v14.itemType);
			if v17.armor and l__ClientStore__4:getState().Inventory.observedInventory.inventory.armor[v17.armor.slot + 1] == "empty" then
				l__ClientStore__4:dispatch({
					type = "InventorySetArmorItem", 
					item = v14, 
					armorSlot = v17.armor.slot
				});
				l__SoundManager__5:playSound(l__RandomUtil__6.fromList(l__GameSound__7.ARMOR_EQUIP));
			end;
			local v18 = -1;
			for v19, v20 in ipairs(l__ClientStore__4:getState().Inventory.observedInventory.hotbar) do
				if v20.item == nil == true then
					v18 = v19 - 1;
					break;
				end;
			end;
			if v18 > -1 then
				l__ClientStore__4:dispatch({
					type = "InventoryAddToHotbar", 
					slot = v18, 
					item = v14
				});
			end;
			return true;
		end);
		function v16.SendToHotbarSlot(p5)
			if v14 then
				l__ClientStore__4:dispatch({
					type = "InventoryAddToHotbar", 
					slot = p5, 
					item = v14
				});
			end;
		end;
		v15[1] = v3.createElement("UIPadding", {
			PaddingTop = UDim.new(0.025), 
			PaddingBottom = UDim.new(0.025), 
			PaddingLeft = UDim.new(0.025), 
			PaddingRight = UDim.new(0.025)
		});
		v15[2] = v3.createElement(l__InventoryTile__2, v16);
		table.insert(v5, (v3.createElement(l__Empty__1, {
			Size = UDim2.fromScale(1, 1), 
			LayoutOrder = v12
		}, v15)));	
	end;
	local v21 = {};
	local v22 = 0;
	local v23 = false;
	while true do
		local v24 = v22;
		if v23 then
			v24 = v24 + 1;
		else
			v23 = true;
		end;
		if not (v24 < 3) then
			break;
		end;
		local v25 = nil;
		if v24 < #p2.props.Inventory.observedInventory.inventory.armor then
			local v26 = p2.props.Inventory.observedInventory.inventory.armor[v24 + 1];
			if v26 ~= "empty" then
				v25 = v26;
			end;
		end;
		local v27 = {};
		local v28 = {
			InvItem = v25, 
			LayoutOrder = v24
		};
		v28.OnClick = v1.async(function()
			if not v25 then
				return;
			end;
			l__ClientStore__4:dispatch({
				type = "InventorySetArmorItem", 
				item = nil, 
				armorSlot = v24
			});
			l__SoundManager__5:playSound(l__RandomUtil__6.fromList(l__GameSound__7.ARMOR_UNEQUIP));
			return true;
		end);
		function v28.SendToHotbarSlot()
			if v25 then
				l__ClientStore__4:dispatch({
					type = "InventorySetArmorItem", 
					item = nil, 
					armorSlot = v24
				});
				l__SoundManager__5:playSound(l__RandomUtil__6.fromList(l__GameSound__7.ARMOR_UNEQUIP));
			end;
		end;
		v27[1] = v3.createElement("UIPadding", {
			PaddingTop = UDim.new(0.025), 
			PaddingBottom = UDim.new(0.025), 
			PaddingLeft = UDim.new(0.025), 
			PaddingRight = UDim.new(0.025)
		});
		v27[2] = v3.createElement(l__InventoryTile__2, v28);
		table.insert(v21, (v3.createElement(l__Empty__1, {
			Size = UDim2.fromScale(1, 1)
		}, v27)));
		v22 = v24;	
	end;
	local v29 = { v3.createElement(l__DarkBackground__8, {
			Transparent = false, 
			AppId = p2.props.AppId, 
			OnMouseButton1Up = function()
				local v30 = l__Flamework__9.resolveDependency("client/controllers/global/inventory/inventory-dragging-controller@InventoryDraggingController"):getActiveDragItem();
				if not v30 then
					return nil;
				end;
				l__KnitClient__10.Controllers.ItemDropController:dropHotbarItem(v30.slotId);
			end
		}) };
	local v31 = {};
	local v32 = {};
	if l__DeviceUtil__11.isSmallScreen() then
		local v33 = 0.45;
	else
		v33 = 0.5;
	end;
	if l__DeviceUtil__11.isSmallScreen() then
		local v34 = 0.5;
	else
		v34 = 0.38;
	end;
	v32.Size = UDim2.fromScale(v33, v34);
	if l__DeviceUtil__11.isSmallScreen() then
		local v35 = 0.68;
	else
		v35 = 0.72;
	end;
	v32.Position = UDim2.fromScale(0.5, v35);
	v32.AnchorPoint = Vector2.new(0.5, 1);
	v32.BorderSizePixel = 0;
	v32.BackgroundTransparency = 1;
	local v36 = { v3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1.5
		}), v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Center"
		}) };
	local v37 = #v36;
	local v38 = {
		Size = UDim2.fromScale(0.5, 0.75)
	};
	local v39 = { v3.createElement("UIListLayout", {
			FillDirection = "Vertical"
		}), v3.createElement(l__InventoryHeader__12, {
			Title = "Armor"
		}), v3.createElement(l__Empty__1, {
			Size = UDim2.fromScale(0, 0.01)
		}) };
	local v40 = {
		Size = UDim2.fromScale(1, 1), 
		AnchorPoint = Vector2.new(1, 0), 
		BorderSizePixel = 0, 
		BackgroundColor3 = l__ColorUtil__13.hexColor(1713718), 
		BackgroundTransparency = 0.25
	};
	local v41 = { v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			VerticalAlignment = "Center"
		}), v3.createElement("UICorner", {
			CornerRadius = UDim.new(0.025, 0)
		}), v3.createElement("Frame", {
			Size = UDim2.fromScale(0.6666666666666666, 1), 
			BorderSizePixel = 0, 
			BackgroundTransparency = 1
		}) };
	local v42 = {
		Size = UDim2.fromScale(0.3333333333333333, 1), 
		BorderSizePixel = 0, 
		BackgroundTransparency = 1
	};
	local v43 = { v3.createElement("UIGridLayout", {
			FillDirection = "Vertical", 
			CellSize = UDim2.fromScale(0.96, 0.32), 
			CellPadding = UDim2.fromScale(0, 0), 
			SortOrder = "LayoutOrder", 
			VerticalAlignment = "Center", 
			HorizontalAlignment = "Center"
		}) };
	local v44 = #v43;
	for v45, v46 in ipairs(v21) do
		v43[v44 + v45] = v46;
	end;
	v41[#v41 + 1] = v3.createElement("Frame", v42, v43);
	v39[#v39 + 1] = v3.createElement(l__EmptyButton__14, v40, v41);
	v36[v37 + 1] = v3.createElement(l__Empty__1, v38, v39);
	v36[v37 + 2] = v3.createElement(l__Empty__1, {
		Size = UDim2.fromScale(0.08, 0)
	});
	local v47 = {
		Size = UDim2.fromScale(1, 1)
	};
	local v48 = { v3.createElement("UIListLayout", {
			FillDirection = "Vertical"
		}), v3.createElement(l__InventoryHeader__12, {
			Title = "Inventory"
		}), v3.createElement(l__Empty__1, {
			Size = UDim2.fromScale(0, 0.01)
		}) };
	local v49 = {
		Size = UDim2.fromScale(1, 1)
	};
	local v50 = { v3.createElement("UIListLayout", {
			FillDirection = "Horizontal"
		}) };
	local v51 = {
		Size = UDim2.fromScale(1, 1), 
		BackgroundTransparency = 0, 
		BackgroundColor3 = l__ColorUtil__13.hexColor(1713718), 
		BorderSizePixel = 0
	};
	local v52 = { v3.createElement("UIGridLayout", {
			FillDirection = "Horizontal", 
			CellSize = UDim2.fromScale(0.16666666666666666, 0.25), 
			CellPadding = UDim2.fromScale(0, 0), 
			SortOrder = "LayoutOrder"
		}) };
	local v53 = #v52;
	for v54, v55 in ipairs(v5) do
		v52[v53 + v54] = v55;
	end;
	v50[#v50 + 1] = v3.createElement("Frame", v51, v52);
	v48[#v48 + 1] = v3.createElement(l__EmptyButton__14, v49, v50);
	v36[v37 + 3] = v3.createElement(l__Empty__1, v47, v48);
	v31[#v31 + 1] = v3.createElement("Frame", v32, v36);
	v29[#v29 + 1] = v3.createElement(l__SlideIn__15, {}, v31);
	return v3.createElement("ScreenGui", {
		DisplayOrder = 1
	}, v29);
end;
return {
	InventoryApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p6, p7)
		local v56 = {
			Inventory = p6.Inventory
		};
		for v57, v58 in pairs(p7) do
			v56[v57] = v58;
		end;
		return v56;
	end)(v4)
};
