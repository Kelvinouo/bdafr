-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__2 = v2.ColorUtil;
local l__BedwarsShopItemCard__3 = v1.import(script, script.Parent, "shop-item-card").BedwarsShopItemCard;
local l__shopPurchaseItem__4 = v1.import(script, script.Parent.Parent, "api", "purchase-item").shopPurchaseItem;
local l__BedwarsShop__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local l__Players__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__Empty__7 = v2.Empty;
return {
	ShopItemDefaultCategories = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local l__ShopCategories__4 = p1.ShopCategories;
		local function v5(p3, p4)
			local v6 = p3[2];
			local v7 = {
				Size = UDim2.fromScale(1, 0), 
				AutomaticSize = "Y", 
				LayoutOrder = p4
			};
			local v8 = {
				TitleLayout = u1.createElement("UIListLayout", {
					VerticalAlignment = "Top", 
					HorizontalAlignment = "Left", 
					FillDirection = "Vertical", 
					SortOrder = "LayoutOrder", 
					Padding = UDim.new(0, p1.TitlePadding)
				}), 
				CategoryTitle = u1.createElement("TextLabel", {
					Size = UDim2.new(1, 0, 0, p1.CategoryTitleTextSize), 
					TextXAlignment = "Left", 
					TextColor3 = l__ColorUtil__2.WHITE, 
					Text = "<b>" .. p3[1] .. "</b>", 
					RichText = true, 
					TextSize = p1.CategoryTitleTextSize - 2, 
					BackgroundTransparency = 1, 
					LayoutOrder = 1
				})
			};
			local function v9(p5, p6)
				local v10 = {
					ShopItem = p5, 
					LayoutOrder = p6, 
					Selected = p1.SelectedItem == p5
				};
				function v10.OnClick()
					p1.SetSelectedShopItem(p5);
				end;
				function v10.OnRightClick()
					l__shopPurchaseItem__4(p5):andThen(function(p7)
						if not p7 then
							p1.SetSelectedShopItem(p5);
							return;
						end;
						if p5.nextTier then
							local v11 = l__BedwarsShop__5.getShopItem(p5.nextTier, l__Players__6.LocalPlayer);
						else
							v11 = p5;
						end;
						p1.SetSelectedShopItem(v11);
					end);
				end;
				return u1.createElement(l__BedwarsShopItemCard__3, v10);
			end;
			local v12 = table.create(#v6);
			local v13, v14, v15 = ipairs(v6);
			while true do
				v13(v14, v15);
				if not v13 then
					break;
				end;
				v15 = v13;
				v12[v13] = v9(v14, v13 - 1, v6);			
			end;
			local v16 = {
				Size = UDim2.fromScale(1, 0), 
				AutomaticSize = "Y", 
				LayoutOrder = 2
			};
			local v17 = { u1.createElement("UIGridLayout", {
					CellSize = UDim2.fromOffset(p1.CellWidth, p1.CellWidth), 
					CellPadding = UDim2.fromOffset(p1.CellPadding, p1.CellPadding), 
					HorizontalAlignment = "Left", 
					VerticalAlignment = "Top", 
					SortOrder = "LayoutOrder", 
					FillDirectionMaxCells = 8
				}) };
			local v18 = #v17;
			local v19, v20, v21 = ipairs(v12);
			while true do
				v19(v20, v21);
				if not v19 then
					break;
				end;
				v21 = v19;
				v17[v18 + v19] = v20;			
			end;
			v8[#v8 + 1] = u1.createElement(l__Empty__7, v16, v17);
			return u1.createElement(l__Empty__7, v7, v8);
		end;
		local v22 = table.create(#l__ShopCategories__4);
		local v23, v24, v25 = ipairs(l__ShopCategories__4);
		while true do
			v23(v24, v25);
			if not v23 then
				break;
			end;
			v25 = v23;
			v22[v23] = v5(v24, v23 - 1, l__ShopCategories__4);		
		end;
		local v26 = {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = "Y", 
			LayoutOrder = p1.LayoutOrder
		};
		local v27 = {
			CategorySectionListLayout = u1.createElement("UIListLayout", {
				VerticalAlignment = "Top", 
				HorizontalAlignment = "Left", 
				FillDirection = "Vertical", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0, p1.CategoryTitleTextSize)
			})
		};
		local v28 = #v27;
		local v29, v30, v31 = ipairs(v22);
		while true do
			v29(v30, v31);
			if not v29 then
				break;
			end;
			v31 = v29;
			v27[v28 + v29] = v30;		
		end;
		return u1.createElement(l__Empty__7, v26, v27);
	end)
};
