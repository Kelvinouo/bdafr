-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types");
local u1 = v3.BedwarsShopUnlockableCategories;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__3 = v2.SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__BedwarsShop__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local l__ItemUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local l__BedwarsShopCategoryIcons__7 = v3.BedwarsShopCategoryIcons;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Empty__10 = v2.Empty;
local l__ColorUtil__11 = v2.ColorUtil;
local l__Button__12 = v2.Button;
local l__BedwarsShopItemCard__13 = v1.import(script, script.Parent, "shop-item-card").BedwarsShopItemCard;
local l__shopPurchaseItem__14 = v1.import(script, script.Parent.Parent, "api", "purchase-item").shopPurchaseItem;
local l__Players__15 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
return {
	ShopItemUnlockableCategories = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u8)(function(p1, p2)
		local l__useState__4 = p2.useState;
		local l__ShopCategories__5 = p1.ShopCategories;
		local function u16(p3)
			local v6 = u1[p3];
			if not v6 then
				return true;
			end;
			local v7 = p1.store.Bedwars.teamUpgrades[v6];
			if v7 == nil then
				v7 = -1;
			end;
			l__default__2.Client:Get("RemoteName"):CallServerAsync({
				upgradeId = v6, 
				tier = v7 + 1
			}):andThen(function()
				l__SoundManager__3:playSound(l__GameSound__4.BEDWARS_UPGRADE_SUCCESS);
			end);
		end;
		local function v8(p4, p5)
			local v9 = p4[1];
			local v10 = p4[2];
			local u17 = u1[v9];
			local v11 = nil;
			for v12, v13 in ipairs(l__BedwarsShop__5.TeamUpgrades) do
				if v13.id == u17 == true then
					v11 = v13;
					break;
				end;
			end;
			local v14 = v11;
			if v14 ~= nil then
				v14 = v14.tiers[1];
			end;
			if v14 then
				local v15 = v11;
				if v15 ~= nil then
					v15 = v15.tiers[1].price;
				end;
				local v16 = "<b>" .. tostring(v15) .. " " .. l__ItemUtil__6.getDisplayName(v14.currency) .. "</b>";
			else
				v16 = "";
			end;
			local v17 = l__BedwarsShopCategoryIcons__7[v9];
			if v17 == nil then
				local v18 = v11;
				if v18 ~= nil then
					v18 = v18.image;
				end;
				v17 = v18;
			end;
			local v19 = nil;
			local v20, v21, v22 = ipairs(p1.store.Inventory.observedInventory.inventory.items);
			while true do
				local v23, v24 = v20(v21, v22);
				if not v23 then
					break;
				end;
				local v25 = v14;
				if v25 ~= nil then
					v25 = v25.currency;
				end;
				if (v24.itemType == v25 and v14.price <= v24.amount) == true then
					v19 = v24;
					break;
				end;			
			end;
			local v26 = v19 ~= nil;
			local v27 = u1[v9];
			if not v27 then
				local v28 = false;
			else
				local v29 = p1.store.Bedwars.teamUpgrades[v27];
				if v29 == nil then
					v29 = -1;
				end;
				v28 = not (v29 >= 0);
			end;
			if v28 then
				local v30 = "Locked";
			else
				v30 = "Unlocked";
			end;
			local v31 = {
				Size = UDim2.new(0.5, -p1.CategoriesPadding / 2, 0, 0), 
				AutomaticSize = "Y", 
				LayoutOrder = p5
			};
			local v32 = {
				TitleLayout = u8.createElement("UIListLayout", {
					VerticalAlignment = "Top", 
					HorizontalAlignment = "Left", 
					FillDirection = "Vertical", 
					SortOrder = "LayoutOrder", 
					Padding = UDim.new(0, p1.TitlePadding)
				})
			};
			local v33 = #v32;
			local v34 = { u8.createElement("UICorner", {
					CornerRadius = UDim.new(0, 5)
				}), u8.createElement("UIPadding", {
					PaddingLeft = UDim.new(0.03, 0), 
					PaddingRight = UDim.new(0.03, 0)
				}), u8.createElement(l__Empty__10, {
					Size = UDim2.fromScale(0.55, 0.8), 
					AnchorPoint = Vector2.new(0, 0.5), 
					Position = UDim2.fromScale(0, 0.5)
				}, { u8.createElement("UIListLayout", {
						VerticalAlignment = "Center", 
						HorizontalAlignment = "Left", 
						FillDirection = "Horizontal", 
						SortOrder = "LayoutOrder", 
						Padding = UDim.new(0.07, 0)
					}), u8.createElement("ImageLabel", {
						Size = UDim2.fromScale(0.15, 1), 
						ScaleType = "Fit", 
						Image = v17, 
						BackgroundTransparency = 1
					}), u8.createElement(l__Empty__10, {
						Size = UDim2.fromScale(0.78, 1)
					}, { u8.createElement("UIListLayout", {
							VerticalAlignment = "Center", 
							HorizontalAlignment = "Left", 
							FillDirection = "Vertical", 
							SortOrder = "LayoutOrder", 
							Padding = UDim.new(0, 0)
						}), u8.createElement("TextLabel", {
							Size = UDim2.fromScale(1, 0.6), 
							TextXAlignment = "Left", 
							TextColor3 = l__ColorUtil__11.WHITE, 
							Text = "<b>" .. string.gsub(v9, "_", " ") .. "</b>", 
							RichText = true, 
							TextScaled = true, 
							BackgroundTransparency = 1, 
							LayoutOrder = 1
						}, { u8.createElement("UITextSizeConstraint", {
								MaxTextSize = p1.CategoryTitleTextSize - 2
							}) }), u8.createElement("TextLabel", {
							Size = UDim2.fromScale(1, 0.4), 
							TextXAlignment = "Left", 
							TextColor3 = l__ColorUtil__11.WHITE, 
							Text = v30, 
							RichText = true, 
							TextScaled = true, 
							TextTransparency = 0.5, 
							BackgroundTransparency = 1, 
							LayoutOrder = 2
						}, { u8.createElement("UITextSizeConstraint", {
								MaxTextSize = p1.CategoryTitleTextSize - 2
							}) }) }) }) };
			local v35 = u1[v9];
			if not v35 then
				local v36 = false;
			else
				local v37 = p1.store.Bedwars.teamUpgrades[v35];
				if v37 == nil then
					v37 = -1;
				end;
				v36 = not (v37 >= 0);
			end;
			if v36 then
				local v38 = {
					Position = UDim2.fromScale(1, 0.5), 
					AnchorPoint = Vector2.new(1, 0.5), 
					Size = UDim2.fromScale(0.4, 0.8), 
					Text = v16, 
					CornerRadius = UDim.new(0, 3)
				};
				if v26 then
					local v39 = l__Theme__9.backgroundSuccess;
				else
					v39 = l__Theme__9.backgroundError;
				end;
				v38.BackgroundColor3 = v39;
				function v38.OnClick()
					if not v26 then
						return nil;
					end;
					u16(v9);
				end;
				v36 = u8.createElement(l__Button__12, v38);
			end;
			if v36 then
				v34[#v34 + 1] = v36;
			end;
			v32[v33 + 1] = u8.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, p1.CategoryTitleTextSize * 3), 
				BackgroundColor3 = l__Theme__9.backgroundSecondary, 
				BorderSizePixel = 0
			}, v34);
			local function v40(p6, p7)
				local v41 = {
					ShopItem = p6, 
					LayoutOrder = p7, 
					Selected = p1.SelectedItem == p6
				};
				function v41.OnClick()
					p1.SetSelectedShopItem(p6);
				end;
				function v41.OnRightClick()
					l__shopPurchaseItem__14(p6):andThen(function(p8)
						if not p8 then
							p1.SetSelectedShopItem(p6);
							return;
						end;
						if p6.nextTier then
							local v42 = l__BedwarsShop__5.getShopItem(p6.nextTier, l__Players__15.LocalPlayer);
						else
							v42 = p6;
						end;
						p1.SetSelectedShopItem(v42);
					end);
				end;
				local v43 = u1[v9];
				if not v43 then
					local v44 = false;
				else
					local v45 = p1.store.Bedwars.teamUpgrades[v43];
					if v45 == nil then
						v45 = -1;
					end;
					v44 = not (v45 >= 0);
				end;
				v41.Locked = v44;
				return u8.createElement(l__BedwarsShopItemCard__13, v41);
			end;
			local v46 = table.create(#v10);
			for v47, v48 in ipairs(v10) do
				v46[v47] = v40(v48, v47 - 1, v10);
			end;
			local v49 = {
				Size = UDim2.new(1, 0, 0, p1.CellWidth), 
				AutomaticSize = "Y", 
				LayoutOrder = 2
			};
			local v50 = { u8.createElement("UIGridLayout", {
					CellSize = UDim2.fromOffset(p1.CellWidth, p1.CellWidth), 
					CellPadding = UDim2.fromOffset(p1.CellPadding, p1.CellPadding), 
					HorizontalAlignment = "Left", 
					VerticalAlignment = "Top", 
					SortOrder = "LayoutOrder", 
					FillDirectionMaxCells = 4
				}) };
			local v51 = #v50;
			for v52, v53 in ipairs(v46) do
				v50[v51 + v52] = v53;
			end;
			v32[v33 + 2] = u8.createElement(l__Empty__10, v49, v50);
			return u8.createElement(l__Empty__10, v31, v32);
		end;
		local v54 = table.create(#l__ShopCategories__5);
		for v55, v56 in ipairs(l__ShopCategories__5) do
			v54[v55] = v8(v56, v55 - 1, l__ShopCategories__5);
		end;
		local v57 = {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = "Y", 
			LayoutOrder = p1.LayoutOrder
		};
		local v58 = { u8.createElement("UIListLayout", {
				VerticalAlignment = "Top", 
				HorizontalAlignment = "Left", 
				FillDirection = "Horizontal", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0, p1.CategoriesPadding)
			}) };
		local v59 = #v58;
		for v60, v61 in ipairs(v54) do
			v58[v59 + v60] = v61;
		end;
		return u8.createElement(l__Empty__10, v57, v58);
	end)
};
