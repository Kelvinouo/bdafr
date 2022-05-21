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
local l__DeviceUtil__9 = v2.DeviceUtil;
local l__InventoryHeader__10 = v1.import(script, script.Parent.Parent.Parent, "ui", "inventory-header").InventoryHeader;
local l__ColorUtil__11 = v2.ColorUtil;
local l__EmptyButton__12 = v2.EmptyButton;
local l__SlideIn__13 = v2.SlideIn;
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
			local l__hotbar__9 = p2.props.Inventory.observedInventory.hotbar;
			local u14 = p2.props.Inventory.observedInventory.inventory.items[v7 + 1];
			local function v10(p3)
				return p3.item == u14;
			end;
			local v11 = nil;
			for v12, v13 in ipairs(l__hotbar__9) do
				if v10(v13, v12 - 1, l__hotbar__9) == true then
					v11 = v13;
					break;
				end;
			end;
			if v11 then
				u14 = nil;
			end;
		end;
		if nil then
			table.insert(v6, nil);
		end;	
	end;
	table.sort(v6, function(p4, p5)
		return p4.addedToBackpackTime < p5.addedToBackpackTime;
	end);
	local v14 = 0;
	local v15 = false;
	while true do
		if v15 then
			v14 = v14 + 1;
		else
			v15 = true;
		end;
		if not (v14 < 24) then
			break;
		end;
		local v16 = nil;
		if v14 < #v6 then
			v16 = v6[v14 + 1];
		end;
		local v17 = {};
		local v18 = {
			InvItem = v16, 
			AutoSelect = v14 == 0, 
			LayoutOrder = v14
		};
		v18.OnClick = v1.async(function()
			if not v16 then
				return;
			end;
			local v19 = l__getItemMeta__3(v16.itemType);
			if v19.armor and l__ClientStore__4:getState().Inventory.observedInventory.inventory.armor[v19.armor.slot + 1] == "empty" then
				l__ClientStore__4:dispatch({
					type = "InventorySetArmorItem", 
					item = v16, 
					armorSlot = v19.armor.slot
				});
				l__SoundManager__5:playSound(l__RandomUtil__6.fromList(l__GameSound__7.ARMOR_EQUIP));
			end;
			local l__hotbar__20 = l__ClientStore__4:getState().Inventory.observedInventory.hotbar;
			local function v21(p6)
				return p6.item == nil;
			end;
			local v22 = -1;
			for v23, v24 in ipairs(l__hotbar__20) do
				if v21(v24, v23 - 1, l__hotbar__20) == true then
					v22 = v23 - 1;
					break;
				end;
			end;
			if v22 > -1 then
				l__ClientStore__4:dispatch({
					type = "InventoryAddToHotbar", 
					slot = v22, 
					item = v16
				});
			end;
			return true;
		end);
		function v18.SendToHotbarSlot(p7)
			if v16 then
				l__ClientStore__4:dispatch({
					type = "InventoryAddToHotbar", 
					slot = p7, 
					item = v16
				});
			end;
		end;
		v17[1] = v3.createElement("UIPadding", {
			PaddingTop = UDim.new(0.025), 
			PaddingBottom = UDim.new(0.025), 
			PaddingLeft = UDim.new(0.025), 
			PaddingRight = UDim.new(0.025)
		});
		v17[2] = v3.createElement(l__InventoryTile__2, v18);
		table.insert(v5, (v3.createElement(l__Empty__1, {
			Size = UDim2.fromScale(1, 1), 
			LayoutOrder = v14
		}, v17)));	
	end;
	local v25 = {};
	local v26 = 0;
	local v27 = false;
	while true do
		local v28 = v26;
		if v27 then
			v28 = v28 + 1;
		else
			v27 = true;
		end;
		if not (v28 < 3) then
			break;
		end;
		local v29 = nil;
		if v28 < #p2.props.Inventory.observedInventory.inventory.armor then
			local v30 = p2.props.Inventory.observedInventory.inventory.armor[v28 + 1];
			if v30 ~= "empty" then
				v29 = v30;
			end;
		end;
		local v31 = {};
		local v32 = {
			InvItem = v29, 
			LayoutOrder = v28
		};
		v32.OnClick = v1.async(function()
			if not v29 then
				return;
			end;
			l__ClientStore__4:dispatch({
				type = "InventorySetArmorItem", 
				item = nil, 
				armorSlot = v28
			});
			l__SoundManager__5:playSound(l__RandomUtil__6.fromList(l__GameSound__7.ARMOR_UNEQUIP));
			return true;
		end);
		function v32.SendToHotbarSlot()
			if v29 then
				l__ClientStore__4:dispatch({
					type = "InventorySetArmorItem", 
					item = nil, 
					armorSlot = v28
				});
				l__SoundManager__5:playSound(l__RandomUtil__6.fromList(l__GameSound__7.ARMOR_UNEQUIP));
			end;
		end;
		v31[1] = v3.createElement("UIPadding", {
			PaddingTop = UDim.new(0.025), 
			PaddingBottom = UDim.new(0.025), 
			PaddingLeft = UDim.new(0.025), 
			PaddingRight = UDim.new(0.025)
		});
		v31[2] = v3.createElement(l__InventoryTile__2, v32);
		table.insert(v25, (v3.createElement(l__Empty__1, {
			Size = UDim2.fromScale(1, 1)
		}, v31)));
		v26 = v28;	
	end;
	local v33 = { v3.createElement(l__DarkBackground__8, {
			Transparent = false, 
			AppId = p2.props.AppId
		}) };
	local v34 = {};
	local v35 = {};
	if l__DeviceUtil__9.isSmallScreen() then
		local v36 = 0.45;
	else
		v36 = 0.5;
	end;
	if l__DeviceUtil__9.isSmallScreen() then
		local v37 = 0.5;
	else
		v37 = 0.38;
	end;
	v35.Size = UDim2.fromScale(v36, v37);
	if l__DeviceUtil__9.isSmallScreen() then
		local v38 = 0.68;
	else
		v38 = 0.72;
	end;
	v35.Position = UDim2.fromScale(0.5, v38);
	v35.AnchorPoint = Vector2.new(0.5, 1);
	v35.BorderSizePixel = 0;
	v35.BackgroundTransparency = 1;
	local v39 = { v3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1.5
		}), v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Center"
		}) };
	local v40 = #v39;
	local v41 = {
		Size = UDim2.fromScale(0.5, 0.75)
	};
	local v42 = { v3.createElement("UIListLayout", {
			FillDirection = "Vertical"
		}), v3.createElement(l__InventoryHeader__10, {
			Title = "Armor"
		}), v3.createElement(l__Empty__1, {
			Size = UDim2.fromScale(0, 0.01)
		}) };
	local v43 = {
		Size = UDim2.fromScale(1, 1), 
		AnchorPoint = Vector2.new(1, 0), 
		BorderSizePixel = 0, 
		BackgroundColor3 = l__ColorUtil__11.hexColor(1713718), 
		BackgroundTransparency = 0.25
	};
	local v44 = { v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			VerticalAlignment = "Center"
		}), v3.createElement("UICorner", {
			CornerRadius = UDim.new(0.025, 0)
		}), v3.createElement("Frame", {
			Size = UDim2.fromScale(0.6666666666666666, 1), 
			BorderSizePixel = 0, 
			BackgroundTransparency = 1
		}) };
	local v45 = {
		Size = UDim2.fromScale(0.3333333333333333, 1), 
		BorderSizePixel = 0, 
		BackgroundTransparency = 1
	};
	local v46 = { v3.createElement("UIGridLayout", {
			FillDirection = "Vertical", 
			CellSize = UDim2.fromScale(0.96, 0.32), 
			CellPadding = UDim2.fromScale(0, 0), 
			SortOrder = "LayoutOrder", 
			VerticalAlignment = "Center", 
			HorizontalAlignment = "Center"
		}) };
	local v47 = #v46;
	for v48, v49 in ipairs(v25) do
		v46[v47 + v48] = v49;
	end;
	v44[#v44 + 1] = v3.createElement("Frame", v45, v46);
	v42[#v42 + 1] = v3.createElement(l__EmptyButton__12, v43, v44);
	v39[v40 + 1] = v3.createElement(l__Empty__1, v41, v42);
	v39[v40 + 2] = v3.createElement(l__Empty__1, {
		Size = UDim2.fromScale(0.08, 0)
	});
	local v50 = {
		Size = UDim2.fromScale(1, 1)
	};
	local v51 = { v3.createElement("UIListLayout", {
			FillDirection = "Vertical"
		}), v3.createElement(l__InventoryHeader__10, {
			Title = "Inventory"
		}), v3.createElement(l__Empty__1, {
			Size = UDim2.fromScale(0, 0.01)
		}) };
	local v52 = {
		Size = UDim2.fromScale(1, 1)
	};
	local v53 = { v3.createElement("UIListLayout", {
			FillDirection = "Horizontal"
		}) };
	local v54 = {
		Size = UDim2.fromScale(1, 1), 
		BackgroundTransparency = 0, 
		BackgroundColor3 = l__ColorUtil__11.hexColor(1713718), 
		BorderSizePixel = 0
	};
	local v55 = { v3.createElement("UIGridLayout", {
			FillDirection = "Horizontal", 
			CellSize = UDim2.fromScale(0.16666666666666666, 0.25), 
			CellPadding = UDim2.fromScale(0, 0), 
			SortOrder = "LayoutOrder"
		}) };
	local v56 = #v55;
	for v57, v58 in ipairs(v5) do
		v55[v56 + v57] = v58;
	end;
	v53[#v53 + 1] = v3.createElement("Frame", v54, v55);
	v51[#v51 + 1] = v3.createElement(l__EmptyButton__12, v52, v53);
	v39[v40 + 3] = v3.createElement(l__Empty__1, v50, v51);
	v34[#v34 + 1] = v3.createElement("Frame", v35, v39);
	v33[#v33 + 1] = v3.createElement(l__SlideIn__13, {}, v34);
	return v3.createElement("ScreenGui", {
		DisplayOrder = 1
	}, v33);
end;
return {
	InventoryApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p8, p9)
		local v59 = {
			Inventory = p8.Inventory
		};
		for v60, v61 in pairs(p9) do
			v59[v60] = v61;
		end;
		return v59;
	end)(v4)
};
