-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__BedwarsShopCategoryMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-meta").BedwarsShopCategoryMeta;
local l__DeviceUtil__2 = v2.DeviceUtil;
local l__InventoryUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__Players__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__7 = v2.ColorUtil;
local l__Empty__8 = v2.Empty;
local l__Button__9 = v2.Button;
local l__items__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").items;
local l__KnitClient__11 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__BedwarsShopItemCard__12 = v1.import(script, script.Parent, "shop-item-card").BedwarsShopItemCard;
local l__shopPurchaseItem__13 = v1.import(script, script.Parent.Parent, "api", "purchase-item").shopPurchaseItem;
local l__BedwarsShop__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
return {
	ShopCategoryUnlockable = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u5)(function(p1, p2)
		local v3, v4 = p2.useState(Vector2.new(347, 261));
		local v5 = l__BedwarsShopCategoryMeta__1[p1.Category];
		if l__DeviceUtil__2.isSmallScreen() then
			local v6 = 8;
		else
			v6 = 14;
		end;
		local v7 = true;
		if v5.purchase and not l__DeviceUtil__2.isHoarceKat() then
			local v8 = v5.purchase;
			if v8 ~= nil then
				v8 = v8.currency;
			end;
			local v9 = v5.purchase;
			if v9 ~= nil then
				v9 = v9.price;
			end;
			v7 = l__InventoryUtil__3.hasEnough(l__Players__4.LocalPlayer, v8, v9);
		end;
		if l__DeviceUtil__2.isSmallScreen() then
			local v10 = 79;
		else
			v10 = 69;
		end;
		local v11 = math.floor(v3.X * (v10 / 347));
		local v12 = math.floor(v3.X * 0.01488095238095238);
		if v5.purchase then
			local v13 = p1.store.Game.unlockedShopCategories[p1.Category] == nil;
		else
			v13 = false;
		end;
		local v14 = {
			Size = p1.Size or UDim2.new(0.5, -0.02, 0, 0), 
			AutomaticSize = "Y", 
			LayoutOrder = p1.LayoutOrder
		};
		v14[u5.Change.AbsoluteSize] = function(p3)
			v4(p3.AbsoluteSize);
		end;
		local v15 = {};
		local v16 = {
			VerticalAlignment = "Top", 
			HorizontalAlignment = "Left", 
			FillDirection = "Vertical", 
			SortOrder = "LayoutOrder"
		};
		if l__DeviceUtil__2.isSmallScreen() then
			local v17 = 4;
		else
			v17 = 8;
		end;
		v16.Padding = UDim.new(0, v17);
		v15.TitleLayout = u5.createElement("UIListLayout", v16);
		local v18 = #v15;
		local v19 = {};
		if l__DeviceUtil__2.isSmallScreen() then
			local v20 = 35;
		else
			v20 = 50;
		end;
		v19.Size = UDim2.new(1, 0, 0, v20);
		v19.BackgroundColor3 = l__Theme__6.backgroundSecondary;
		v19.BorderSizePixel = 0;
		local v21 = { u5.createElement("UICorner", {
				CornerRadius = UDim.new(0, 5)
			}), u5.createElement("UIPadding", {
				PaddingLeft = UDim.new(0.03, 0), 
				PaddingRight = UDim.new(0.03, 0)
			}) };
		local v22 = #v21;
		local v23 = { u5.createElement("UIListLayout", {
				VerticalAlignment = "Center", 
				HorizontalAlignment = "Left", 
				FillDirection = "Horizontal", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0.07, 0)
			}) };
		local v24 = false;
		if v5.icon ~= nil then
			v24 = u5.createElement("ImageLabel", {
				Size = UDim2.fromScale(0.15, 1), 
				ScaleType = "Fit", 
				Image = v5.icon, 
				BackgroundTransparency = 1
			}, { u5.createElement("UICorner", {
					CornerRadius = UDim.new(0.1, 0)
				}) });
		end;
		if v24 then
			v23[#v23 + 1] = v24;
		end;
		local v25 = { u5.createElement("UIListLayout", {
				VerticalAlignment = "Center", 
				HorizontalAlignment = "Left", 
				FillDirection = "Vertical", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0, 0)
			}), u5.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0.55), 
				TextXAlignment = "Left", 
				TextColor3 = l__ColorUtil__7.WHITE, 
				Text = "<b>" .. v5.name .. "</b>", 
				RichText = true, 
				TextScaled = true, 
				BackgroundTransparency = 1, 
				LayoutOrder = 1
			}, { u5.createElement("UITextSizeConstraint", {
					MaxTextSize = v6
				}) }) };
		local v26 = {
			Size = UDim2.fromScale(1, 0.45), 
			TextXAlignment = "Left", 
			TextColor3 = l__ColorUtil__7.WHITE
		};
		local v27 = v5.purchase;
		if v27 ~= nil then
			v27 = v27.teamUnlock;
		end;
		if v27 then
			local v28 = "TEAM";
		else
			v28 = "PERSONAL";
		end;
		v26.Text = "<b>" .. v28 .. "</b>";
		v26.RichText = true;
		v26.TextScaled = true;
		v26.TextTransparency = 0.5;
		v26.BackgroundTransparency = 1;
		v26.LayoutOrder = 2;
		v25[#v25 + 1] = u5.createElement("TextLabel", v26, { u5.createElement("UITextSizeConstraint", {
				MaxTextSize = v6 - 2
			}) });
		v23[#v23 + 1] = u5.createElement(l__Empty__8, {
			Size = UDim2.fromScale(0.78, 1)
		}, v25);
		v21[v22 + 1] = u5.createElement(l__Empty__8, {
			Size = UDim2.fromScale(0.57, 0.8), 
			AnchorPoint = Vector2.new(0, 0.5), 
			Position = UDim2.fromScale(0, 0.5)
		}, v23);
		local v29 = v13;
		if v29 then
			v29 = v5.purchase;
			if v29 then
				local v30 = {
					Size = UDim2.fromScale(0.38, 0.8), 
					Position = UDim2.fromScale(1, 0.5), 
					AnchorPoint = Vector2.new(1, 0.5), 
					Text = "<b>" .. tostring(v5.purchase.price) .. " " .. l__items__10[v5.purchase.currency].displayName .. "</b>", 
					CornerRadius = UDim.new(0, 3)
				};
				if v7 then
					local v31 = l__Theme__6.backgroundSuccess;
				else
					v31 = l__Theme__6.backgroundError;
				end;
				v30.BackgroundColor3 = v31;
				function v30.OnClick()
					if not v7 then
						return nil;
					end;
					l__KnitClient__11.Controllers.BedwarsShopController:purchaseShopCategory(p1.Category);
				end;
				v29 = u5.createElement(l__Button__9, v30);
			end;
		end;
		if v29 then
			v21[v22 + 2] = v29;
		end;
		v15[v18 + 1] = u5.createElement("Frame", v19, v21);
		local l__ShopItems__32 = p1.ShopItems;
		local function v33(p4, p5)
			local v34 = {
				ShopItem = p4, 
				LayoutOrder = p5, 
				Selected = p1.SelectedItem == p4
			};
			function v34.OnClick()
				p1.SetSelectedShopItem(p4);
			end;
			function v34.OnRightClick()
				l__shopPurchaseItem__13(p4):andThen(function(p6)
					if not p6 then
						p1.SetSelectedShopItem(p4);
						return;
					end;
					if p4.tiered then
						l__KnitClient__11.Controllers.BedwarsShopController.alreadyPurchasedMap[p4.itemType] = true;
					end;
					if p4.nextTier then
						local v35 = l__BedwarsShop__14.getShopItem(p4.nextTier, l__Players__4.LocalPlayer);
					else
						v35 = p4;
					end;
					p1.SetSelectedShopItem(v35);
				end);
			end;
			v34.Locked = v13;
			return u5.createElement(l__BedwarsShopItemCard__12, v34);
		end;
		local v36 = table.create(#l__ShopItems__32);
		local v37, v38, v39 = ipairs(l__ShopItems__32);
		while true do
			v37(v38, v39);
			if not v37 then
				break;
			end;
			v39 = v37;
			v36[v37] = v33(v38, v37 - 1, l__ShopItems__32);		
		end;
		local v40 = {
			Size = UDim2.new(1, 0, 0, 0), 
			AutomaticSize = "Y", 
			LayoutOrder = 2
		};
		local v41 = { u5.createElement("UIGridLayout", {
				CellSize = UDim2.fromOffset(v11, v11), 
				CellPadding = UDim2.fromOffset(v12, v12), 
				HorizontalAlignment = "Left", 
				VerticalAlignment = "Top", 
				SortOrder = "LayoutOrder", 
				FillDirectionMaxCells = 4
			}) };
		local v42 = #v41;
		local v43, v44, v45 = ipairs(v36);
		while true do
			v43(v44, v45);
			if not v43 then
				break;
			end;
			v45 = v43;
			v41[v42 + v43] = v44;		
		end;
		v15[v18 + 2] = u5.createElement(l__Empty__8, v40, v41);
		return u5.createElement(l__Empty__8, v14, v15);
	end)
};
