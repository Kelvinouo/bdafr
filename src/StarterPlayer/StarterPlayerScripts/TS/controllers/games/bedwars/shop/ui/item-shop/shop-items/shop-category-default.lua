-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__BedwarsShopCategoryMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-meta").BedwarsShopCategoryMeta;
local l__DeviceUtil__2 = v2.DeviceUtil;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__4 = v2.ColorUtil;
local l__BedwarsShopItemCard__5 = v1.import(script, script.Parent, "shop-item-card").BedwarsShopItemCard;
local l__shopPurchaseItem__6 = v1.import(script, script.Parent.Parent, "api", "purchase-item").shopPurchaseItem;
local l__BedwarsShop__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local l__Players__8 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__Empty__9 = v2.Empty;
return {
	ShopCategoryDefault = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local l__useEffect__3 = p2.useEffect;
		local v4, v5 = p2.useState(Vector2.new(694, 523));
		if l__DeviceUtil__2.isSmallScreen() then
			local v6 = 8;
		else
			v6 = 14;
		end;
		local v7 = v6 + 2;
		if l__DeviceUtil__2.isSmallScreen() then
			local v8 = 79;
		else
			v8 = 69;
		end;
		local v9 = math.floor(v4.X * (v8 / 694));
		local v10 = math.floor(v4.X * 0.01488095238095238);
		local v11 = {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = "Y"
		};
		v11[u3.Change.AbsoluteSize] = function(p3)
			v5(p3.AbsoluteSize);
		end;
		local v12 = {};
		local v13 = {
			VerticalAlignment = "Top", 
			HorizontalAlignment = "Left", 
			FillDirection = "Vertical", 
			SortOrder = "LayoutOrder"
		};
		if l__DeviceUtil__2.isSmallScreen() then
			local v14 = 4;
		else
			v14 = 8;
		end;
		v13.Padding = UDim.new(0, v14);
		v12.TitleLayout = u3.createElement("UIListLayout", v13);
		v12.CategoryTitle = u3.createElement("TextLabel", {
			Size = UDim2.new(1, 0, 0, v7), 
			TextXAlignment = "Left", 
			TextColor3 = l__ColorUtil__4.WHITE, 
			Text = "<b>" .. l__BedwarsShopCategoryMeta__1[p1.Category].name .. "</b>", 
			RichText = true, 
			TextSize = v7 - 2, 
			BackgroundTransparency = 1, 
			LayoutOrder = 1
		});
		local l__ShopItems__15 = p1.ShopItems;
		local function v16(p4, p5)
			local v17 = {
				ShopItem = p4, 
				LayoutOrder = p5, 
				Selected = p1.SelectedItem == p4
			};
			function v17.OnClick()
				p1.SetSelectedShopItem(p4);
			end;
			function v17.OnRightClick()
				l__shopPurchaseItem__6(p4):andThen(function(p6)
					if not p6 then
						p1.SetSelectedShopItem(p4);
						return;
					end;
					if p4.nextTier then
						local v18 = l__BedwarsShop__7.getShopItem(p4.nextTier, l__Players__8.LocalPlayer);
					else
						v18 = p4;
					end;
					p1.SetSelectedShopItem(v18);
				end);
			end;
			return u3.createElement(l__BedwarsShopItemCard__5, v17);
		end;
		local v19 = table.create(#l__ShopItems__15);
		local v20, v21, v22 = ipairs(l__ShopItems__15);
		while true do
			v20(v21, v22);
			if not v20 then
				break;
			end;
			v22 = v20;
			v19[v20] = v16(v21, v20 - 1, l__ShopItems__15);		
		end;
		local v23 = {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = "Y", 
			LayoutOrder = 2
		};
		local v24 = { u3.createElement("UIGridLayout", {
				CellSize = UDim2.new(0, v9, 0, v9), 
				CellPadding = UDim2.fromOffset(v10, v10), 
				HorizontalAlignment = "Left", 
				VerticalAlignment = "Top", 
				SortOrder = "LayoutOrder", 
				FillDirectionMaxCells = 8
			}) };
		local v25 = #v24;
		local v26, v27, v28 = ipairs(v19);
		while true do
			v26(v27, v28);
			if not v26 then
				break;
			end;
			v28 = v26;
			v24[v25 + v26] = v27;		
		end;
		v12[#v12 + 1] = u3.createElement(l__Empty__9, v23, v24);
		return u3.createElement(l__Empty__9, v11, v12);
	end)
};
