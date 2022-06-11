-- Script Hash: nil
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
				return false;
			end;
			local v7 = p1.store.Bedwars.teamUpgrades[v6];
			if v7 == nil then
				v7 = -1;
			end;
			if v7 >= 0 then
				return false;
			end;
			return true;
		end;
		local function u17(p4)
			local v8 = u1[p4];
			if not v8 then
				return true;
			end;
			local v9 = p1.store.Bedwars.teamUpgrades[v8];
			if v9 == nil then
				v9 = -1;
			end;
			l__default__2.Client:Get("RemoteName"):CallServerAsync({
				upgradeId = v8, 
				tier = v9 + 1
			}):andThen(function()
				l__SoundManager__3:playSound(l__GameSound__4.BEDWARS_UPGRADE_SUCCESS);
			end);
		end;
		local function v10(p5, p6)
			local v11 = p5[1];
			local v12 = p5[2];
			local l__TeamUpgrades__13 = l__BedwarsShop__5.TeamUpgrades;
			local u18 = u1[v11];
			local function v14(p7)
				return p7.id == u18;
			end;
			local v15 = nil;
			for v16, v17 in ipairs(l__TeamUpgrades__13) do
				if v14(v17, v16 - 1, l__TeamUpgrades__13) == true then
					v15 = v17;
					break;
				end;
			end;
			local v18 = v15;
			if v18 ~= nil then
				v18 = v18.tiers[1];
			end;
			if v18 then
				local v19 = v15;
				if v19 ~= nil then
					v19 = v19.tiers[1].price;
				end;
				local v20 = "<b>" .. tostring(v19) .. " " .. l__ItemUtil__6.getDisplayName(v18.currency) .. "</b>";
			else
				v20 = "";
			end;
			local v21 = l__BedwarsShopCategoryIcons__7[v11];
			if v21 == nil then
				local v22 = v15;
				if v22 ~= nil then
					v22 = v22.image;
				end;
				v21 = v22;
			end;
			local l__items__23 = p1.store.Inventory.observedInventory.inventory.items;
			local function v24(p8)
				local v25 = v18;
				if v25 ~= nil then
					v25 = v25.currency;
				end;
				return p8.itemType == v25 and v18.price <= p8.amount;
			end;
			local v26 = nil;
			for v27, v28 in ipairs(l__items__23) do
				if v24(v28, v27 - 1, l__items__23) == true then
					v26 = v28;
					break;
				end;
			end;
			local v29 = v26 ~= nil;
			if u16(v11) then
				local v30 = "Locked";
			else
				v30 = "Unlocked";
			end;
			local v31 = {
				Size = UDim2.new(0.5, -p1.CategoriesPadding / 2, 0, 0), 
				AutomaticSize = "Y", 
				LayoutOrder = p6
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
						Image = v21, 
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
							Text = "<b>" .. string.gsub(v11, "_", " ") .. "</b>", 
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
			local v35 = u16(v11);
			if v35 then
				local v36 = {
					Position = UDim2.fromScale(1, 0.5), 
					AnchorPoint = Vector2.new(1, 0.5), 
					Size = UDim2.fromScale(0.4, 0.8), 
					Text = v20, 
					CornerRadius = UDim.new(0, 3)
				};
				if v29 then
					local v37 = l__Theme__9.backgroundSuccess;
				else
					v37 = l__Theme__9.backgroundError;
				end;
				v36.BackgroundColor3 = v37;
				function v36.OnClick()
					if not v29 then
						return nil;
					end;
					u17(v11);
				end;
				v35 = u8.createElement(l__Button__12, v36);
			end;
			if v35 then
				v34[#v34 + 1] = v35;
			end;
			v32[v33 + 1] = u8.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, p1.CategoryTitleTextSize * 3), 
				BackgroundColor3 = l__Theme__9.backgroundSecondary, 
				BorderSizePixel = 0
			}, v34);
			local function v38(p9, p10)
				local v39 = {
					ShopItem = p9, 
					LayoutOrder = p10, 
					Selected = p1.SelectedItem == p9
				};
				function v39.OnClick()
					p1.SetSelectedShopItem(p9);
				end;
				function v39.OnRightClick()
					l__shopPurchaseItem__14(p9):andThen(function(p11)
						if not p11 then
							p1.SetSelectedShopItem(p9);
							return;
						end;
						if p9.nextTier then
							local v40 = l__BedwarsShop__5.getShopItem(p9.nextTier, l__Players__15.LocalPlayer);
						else
							v40 = p9;
						end;
						p1.SetSelectedShopItem(v40);
					end);
				end;
				v39.Locked = u16(v11);
				return u8.createElement(l__BedwarsShopItemCard__13, v39);
			end;
			local v41 = table.create(#v12);
			for v42, v43 in ipairs(v12) do
				v41[v42] = v38(v43, v42 - 1, v12);
			end;
			local v44 = {
				Size = UDim2.new(1, 0, 0, p1.CellWidth), 
				AutomaticSize = "Y", 
				LayoutOrder = 2
			};
			local v45 = { u8.createElement("UIGridLayout", {
					CellSize = UDim2.fromOffset(p1.CellWidth, p1.CellWidth), 
					CellPadding = UDim2.fromOffset(p1.CellPadding, p1.CellPadding), 
					HorizontalAlignment = "Left", 
					VerticalAlignment = "Top", 
					SortOrder = "LayoutOrder", 
					FillDirectionMaxCells = 4
				}) };
			local v46 = #v45;
			for v47, v48 in ipairs(v41) do
				v45[v46 + v47] = v48;
			end;
			v32[v33 + 2] = u8.createElement(l__Empty__10, v44, v45);
			return u8.createElement(l__Empty__10, v31, v32);
		end;
		local v49 = table.create(#l__ShopCategories__5);
		for v50, v51 in ipairs(l__ShopCategories__5) do
			v49[v50] = v10(v51, v50 - 1, l__ShopCategories__5);
		end;
		local v52 = {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = "Y", 
			LayoutOrder = p1.LayoutOrder
		};
		local v53 = { u8.createElement("UIListLayout", {
				VerticalAlignment = "Top", 
				HorizontalAlignment = "Left", 
				FillDirection = "Horizontal", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0, p1.CategoriesPadding)
			}) };
		local v54 = #v53;
		for v55, v56 in ipairs(v49) do
			v53[v54 + v55] = v56;
		end;
		return u8.createElement(l__Empty__10, v52, v53);
	end)
};
