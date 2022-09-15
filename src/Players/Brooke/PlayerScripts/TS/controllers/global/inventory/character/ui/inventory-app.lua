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
local l__PlaceUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__KnitClient__14 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__BedwarsImageId__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__Flamework__16 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__TooltipContainer__18 = v2.TooltipContainer;
local l__AutoSizedText__19 = v2.AutoSizedText;
local l__SlideIn__20 = v2.SlideIn;
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
			local u21 = p2.props.Inventory.observedInventory.inventory.items[v7 + 1];
			local v9 = nil;
			local v10, v11, v12 = ipairs(p2.props.Inventory.observedInventory.hotbar);
			while true do
				v10(v11, v12);
				if not v10 then
					break;
				end;
				v12 = v10;
				if v11.item == u21 == true then
					v9 = v11;
					break;
				end;			
			end;
			if v9 then
				u21 = nil;
			end;
		end;
		if nil then
			table.insert(v6, nil);
		end;	
	end;
	table.sort(v6, function(p3, p4)
		return p3.addedToBackpackTime < p4.addedToBackpackTime;
	end);
	local v13 = 0;
	local v14 = false;
	while true do
		if v14 then
			v13 = v13 + 1;
		else
			v14 = true;
		end;
		if not (v13 < 24) then
			break;
		end;
		local v15 = nil;
		if v13 < #v6 then
			v15 = v6[v13 + 1];
		end;
		local v16 = {};
		local v17 = {
			InvItem = v15, 
			AutoSelect = v13 == 0, 
			LayoutOrder = v13
		};
		v17.OnClick = v1.async(function()
			if not v15 then
				return;
			end;
			local v18 = l__getItemMeta__3(v15.itemType);
			if v18.armor and l__ClientStore__4:getState().Inventory.observedInventory.inventory.armor[v18.armor.slot + 1] == "empty" then
				l__ClientStore__4:dispatch({
					type = "InventorySetArmorItem", 
					item = v15, 
					armorSlot = v18.armor.slot
				});
				l__SoundManager__5:playSound(l__RandomUtil__6.fromList(l__GameSound__7.ARMOR_EQUIP));
			end;
			if v18.backpack and l__ClientStore__4:getState().Inventory.observedInventory.inventory.backpack == nil then
				l__ClientStore__4:dispatch({
					type = "InventorySetBackpack", 
					item = v15
				});
				l__SoundManager__5:playSound(l__RandomUtil__6.fromList(l__GameSound__7.ARMOR_EQUIP));
			end;
			local v19 = -1;
			local v20, v21, v22 = ipairs(l__ClientStore__4:getState().Inventory.observedInventory.hotbar);
			while true do
				v20(v21, v22);
				if not v20 then
					break;
				end;
				v22 = v20;
				if v21.item == nil == true then
					v19 = v20 - 1;
					break;
				end;			
			end;
			if v19 > -1 and not v18.backpack and not v18.armor then
				l__ClientStore__4:dispatch({
					type = "InventoryAddToHotbar", 
					slot = v19, 
					item = v15
				});
			end;
			return true;
		end);
		function v17.SendToHotbarSlot(p5)
			if v15 then
				l__ClientStore__4:dispatch({
					type = "InventoryAddToHotbar", 
					slot = p5, 
					item = v15
				});
			end;
		end;
		v16[1] = v3.createElement("UIPadding", {
			PaddingTop = UDim.new(0.025), 
			PaddingBottom = UDim.new(0.025), 
			PaddingLeft = UDim.new(0.025), 
			PaddingRight = UDim.new(0.025)
		});
		v16[2] = v3.createElement(l__InventoryTile__2, v17);
		table.insert(v5, (v3.createElement(l__Empty__1, {
			Size = UDim2.fromScale(1, 1), 
			LayoutOrder = v13
		}, v16)));	
	end;
	local v23 = {};
	local v24 = 0;
	local v25 = false;
	while true do
		local v26 = v24;
		if v25 then
			v26 = v26 + 1;
		else
			v25 = true;
		end;
		if not (v26 < 3) then
			break;
		end;
		local v27 = nil;
		if v26 < #p2.props.Inventory.observedInventory.inventory.armor then
			local v28 = p2.props.Inventory.observedInventory.inventory.armor[v26 + 1];
			if v28 ~= "empty" then
				v27 = v28;
			end;
		end;
		local v29 = {};
		local v30 = {
			InvItem = v27, 
			LayoutOrder = v26
		};
		v30.OnClick = v1.async(function()
			if not v27 then
				return;
			end;
			l__ClientStore__4:dispatch({
				type = "InventorySetArmorItem", 
				item = nil, 
				armorSlot = v26
			});
			l__SoundManager__5:playSound(l__RandomUtil__6.fromList(l__GameSound__7.ARMOR_UNEQUIP));
			return true;
		end);
		function v30.SendToHotbarSlot()
			if v27 then
				l__ClientStore__4:dispatch({
					type = "InventorySetArmorItem", 
					item = nil, 
					armorSlot = v26
				});
				l__SoundManager__5:playSound(l__RandomUtil__6.fromList(l__GameSound__7.ARMOR_UNEQUIP));
			end;
		end;
		v29[1] = v3.createElement("UIPadding", {
			PaddingTop = UDim.new(0.025), 
			PaddingBottom = UDim.new(0.025), 
			PaddingLeft = UDim.new(0.025), 
			PaddingRight = UDim.new(0.025)
		});
		v29[2] = v3.createElement(l__InventoryTile__2, v30);
		table.insert(v23, (v3.createElement(l__Empty__1, {
			Size = UDim2.fromScale(1, 1)
		}, v29)));
		v24 = v26;	
	end;
	local l__backpack__31 = p2.props.Inventory.observedInventory.inventory.backpack;
	local v32 = nil;
	if l__backpack__31 then
		v32 = l__backpack__31;
	end;
	local v33 = {};
	local v34 = {
		InvItem = v32, 
		LayoutOrder = 0
	};
	v34.OnClick = v1.async(function()
		if not v32 then
			return;
		end;
		l__ClientStore__4:dispatch({
			type = "InventorySetBackpack", 
			item = nil
		});
		l__SoundManager__5:playSound(l__RandomUtil__6.fromList(l__GameSound__7.ARMOR_UNEQUIP));
		return true;
	end);
	function v34.SendToHotbarSlot()
		if v32 then
			l__ClientStore__4:dispatch({
				type = "InventorySetBackpack", 
				item = nil
			});
			l__SoundManager__5:playSound(l__RandomUtil__6.fromList(l__GameSound__7.ARMOR_UNEQUIP));
		end;
	end;
	v33[1] = v3.createElement("UIPadding", {
		PaddingTop = UDim.new(0.025), 
		PaddingBottom = UDim.new(0.025), 
		PaddingLeft = UDim.new(0.025), 
		PaddingRight = UDim.new(0.025)
	});
	v33[2] = v3.createElement(l__InventoryTile__2, v34);
	local v35 = v3.createElement(l__Empty__1, {
		Size = UDim2.fromScale(1, 1)
	}, v33);
	local v36 = { v3.createElement(l__DarkBackground__8, {
			Transparent = false, 
			AppId = p2.props.AppId
		}) };
	local v37 = {};
	local v38 = {};
	if l__DeviceUtil__9.isSmallScreen() then
		local v39 = 0.45;
	else
		v39 = 0.5;
	end;
	if l__DeviceUtil__9.isSmallScreen() then
		local v40 = 0.5;
	else
		v40 = 0.38;
	end;
	v38.Size = UDim2.fromScale(v39, v40);
	if l__DeviceUtil__9.isSmallScreen() then
		local v41 = 0.68;
	else
		v41 = 0.72;
	end;
	v38.Position = UDim2.fromScale(0.5, v41);
	v38.AnchorPoint = Vector2.new(0.5, 1);
	v38.BorderSizePixel = 0;
	v38.BackgroundTransparency = 1;
	local v42 = { v3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1.5
		}), v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Center"
		}) };
	local v43 = #v42;
	local v44 = {
		Size = UDim2.fromScale(0.5, 0.75)
	};
	local v45 = { v3.createElement("UIListLayout", {
			FillDirection = "Vertical"
		}), v3.createElement(l__InventoryHeader__10, {
			Title = "Armor"
		}), v3.createElement(l__Empty__1, {
			Size = UDim2.fromScale(0, 0.01)
		}) };
	local v46 = {
		Size = UDim2.fromScale(1, 1), 
		AnchorPoint = Vector2.new(1, 0), 
		BorderSizePixel = 0, 
		BackgroundColor3 = l__ColorUtil__11.hexColor(1713718), 
		BackgroundTransparency = 0.25
	};
	local v47 = { v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			VerticalAlignment = "Center"
		}), v3.createElement("UICorner", {
			CornerRadius = UDim.new(0.025, 0)
		}), v3.createElement("Frame", {
			Size = UDim2.fromScale(0.3333333333333333, 1), 
			BorderSizePixel = 0, 
			BackgroundTransparency = 1
		}), v3.createElement("Frame", {
			Size = UDim2.fromScale(0.3333333333333333, 1), 
			BorderSizePixel = 0, 
			BackgroundTransparency = 1
		}, { v3.createElement("UIGridLayout", {
				FillDirection = "Vertical", 
				CellSize = UDim2.fromScale(0.96, 0.32), 
				CellPadding = UDim2.fromScale(0, 0), 
				SortOrder = "LayoutOrder", 
				VerticalAlignment = "Center", 
				HorizontalAlignment = "Center"
			}), v35 }) };
	local v48 = {
		Size = UDim2.fromScale(0.3333333333333333, 1), 
		BorderSizePixel = 0, 
		BackgroundTransparency = 1
	};
	local v49 = { v3.createElement("UIGridLayout", {
			FillDirection = "Vertical", 
			CellSize = UDim2.fromScale(0.96, 0.32), 
			CellPadding = UDim2.fromScale(0, 0), 
			SortOrder = "LayoutOrder", 
			VerticalAlignment = "Center", 
			HorizontalAlignment = "Center"
		}) };
	local v50 = #v49;
	local v51, v52, v53 = ipairs(v23);
	while true do
		v51(v52, v53);
		if not v51 then
			break;
		end;
		v53 = v51;
		v49[v50 + v51] = v52;	
	end;
	v47[#v47 + 1] = v3.createElement("Frame", v48, v49);
	v45[#v45 + 1] = v3.createElement(l__EmptyButton__12, v46, v47);
	v42[v43 + 1] = v3.createElement(l__Empty__1, v44, v45);
	v42[v43 + 2] = v3.createElement(l__Empty__1, {
		Size = UDim2.fromScale(0.08, 0)
	});
	local v54 = {
		Size = UDim2.fromScale(1, 1)
	};
	local v55 = { v3.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			HorizontalAlignment = "Right", 
			Padding = UDim.new(0, 6)
		}), v3.createElement(l__InventoryHeader__10, {
			Title = "Inventory"
		}), v3.createElement(l__Empty__1, {
			Size = UDim2.fromScale(0, 0.01)
		}) };
	local v56 = #v55;
	local v57 = {
		Size = UDim2.fromScale(1, 1)
	};
	local v58 = { v3.createElement("UIListLayout", {
			FillDirection = "Horizontal"
		}) };
	local v59 = {
		Size = UDim2.fromScale(1, 1), 
		BackgroundTransparency = 0, 
		BackgroundColor3 = l__ColorUtil__11.hexColor(1713718), 
		BorderSizePixel = 0
	};
	local v60 = { v3.createElement("UIGridLayout", {
			FillDirection = "Horizontal", 
			CellSize = UDim2.fromScale(0.16666666666666666, 0.25), 
			CellPadding = UDim2.fromScale(0, 0), 
			SortOrder = "LayoutOrder"
		}) };
	local v61 = #v60;
	local v62, v63, v64 = ipairs(v5);
	while true do
		v62(v63, v64);
		if not v62 then
			break;
		end;
		v64 = v62;
		v60[v61 + v62] = v63;	
	end;
	v58[#v58 + 1] = v3.createElement("Frame", v59, v60);
	v55[v56 + 1] = v3.createElement(l__EmptyButton__12, v57, v58);
	local v65 = l__PlaceUtil__13.isGameServer() and (l__KnitClient__14.Controllers.GamemodeController:isLocalPlayerInCreativeMode() and v3.createFragment({
		OpenCreativeInventoryBtn = v3.createElement("ImageButton", {
			Size = UDim2.fromScale(0.15, 0.15), 
			Image = l__BedwarsImageId__15.ELLIPSIS, 
			ScaleType = "Fit", 
			BackgroundColor3 = Color3.fromHex("6b6fbf"), 
			BorderSizePixel = 0, 
			Active = true, 
			[v3.Event.Activated] = function()
				l__Flamework__16.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(l__BedwarsAppIds__17.INVENTORY);
				l__KnitClient__14.Controllers.GamemodeController:toggleCreativeInventory();
			end
		}, { v3.createElement("UICorner", {
				CornerRadius = UDim.new(0.1, 0)
			}), v3.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1
			}), v3.createElement(l__TooltipContainer__18, {}, { v3.createElement(l__AutoSizedText__19, {
					Text = "Open Creative Inventory", 
					Font = Enum.Font.SourceSansBold, 
					TextSize = 16, 
					Limits = Vector2.new(300, 60)
				}), v3.createElement(l__AutoSizedText__19, {
					Text = "[C] Hotkey", 
					Font = Enum.Font.SourceSansSemibold, 
					TextSize = 14, 
					Limits = Vector2.new(300, 500)
				}) }) })
	}));
	if v65 then
		v55[v56 + 2] = v65;
	end;
	v42[v43 + 3] = v3.createElement(l__Empty__1, v54, v55);
	v37[#v37 + 1] = v3.createElement("Frame", v38, v42);
	v36[#v36 + 1] = v3.createElement(l__SlideIn__20, {}, v37);
	return v3.createElement("ScreenGui", {
		DisplayOrder = 1
	}, v36);
end;
return {
	InventoryApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p6, p7)
		local v66 = {
			Inventory = p6.Inventory
		};
		for v67, v68 in pairs(p7) do
			v66[v67] = v68;
		end;
		return v66;
	end)(v4)
};
