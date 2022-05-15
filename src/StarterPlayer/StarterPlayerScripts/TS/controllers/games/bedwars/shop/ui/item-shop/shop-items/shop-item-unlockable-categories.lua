
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopUnlockableCategories;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__3 = v2.SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__BedwarsShop__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local l__ItemUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Empty__9 = v2.Empty;
local l__ColorUtil__10 = v2.ColorUtil;
local l__Button__11 = v2.Button;
local l__BedwarsShopItemCard__12 = v1.import(script, script.Parent, "shop-item-card").BedwarsShopItemCard;
local l__shopPurchaseItem__13 = v1.import(script, script.Parent.Parent, "api", "purchase-item").shopPurchaseItem;
local l__Players__14 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
return {
	ShopItemUnlockableCategories = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u7)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local l__ShopCategories__4 = p1.ShopCategories;
		local function u15(p3)
			local v5 = u1[p3];
			if not v5 then
				return true;
			end;
			local v6 = p1.store.Bedwars.teamUpgrades[v5];
			if v6 == nil then
				v6 = -1;
			end;
			if v6 >= 0 then
				return false;
			end;
			return true;
		end;
		local function u16(p4)
			local v7 = u1[p4];
			if not v7 then
				return true;
			end;
			local v8 = p1.store.Bedwars.teamUpgrades[v7];
			if v8 == nil then
				v8 = -1;
			end;
			l__default__2.Client:Get("BedwarsPurchaseTeamUpgrade"):CallServerAsync({
				upgradeId = v7, 
				tier = v8 + 1
			}):andThen(function()
				l__SoundManager__3:playSound(l__GameSound__4.BEDWARS_UPGRADE_SUCCESS);
			end);
		end;
		local function v9(p5, p6)
			local v10 = p5[1];
			local v11 = p5[2];
			local l__TeamUpgrades__12 = l__BedwarsShop__5.TeamUpgrades;
			local u17 = u1[v10];
			local function v13(p7)
				return p7.id == u17;
			end;
			local v14 = nil;
			for v15, v16 in ipairs(l__TeamUpgrades__12) do
				if v13(v16, v15 - 1, l__TeamUpgrades__12) == true then
					v14 = v16;
					break;
				end;
			end;
			local v17 = v14;
			if v17 ~= nil then
				v17 = v17.tiers[1];
			end;
			local v18 = v14;
			if v18 ~= nil then
				v18 = v18.tiers[1].price;
			end;
			local v19 = "<b>" .. tostring(v18) .. " " .. l__ItemUtil__6.getDisplayName(v17.currency) .. "</b>";
			local v20 = v14;
			if v20 ~= nil then
				v20 = v20.image;
			end;
			local l__items__21 = p1.store.Inventory.observedInventory.inventory.items;
			local function v22(p8)
				local v23 = v17;
				if v23 ~= nil then
					v23 = v23.currency;
				end;
				return p8.itemType == v23 and v17.price <= p8.amount;
			end;
			local v24 = nil;
			for v25, v26 in ipairs(l__items__21) do
				if v22(v26, v25 - 1, l__items__21) == true then
					v24 = v26;
					break;
				end;
			end;
			local v27 = v24 ~= nil;
			local v28 = {
				Size = UDim2.new(0.5, -p1.CategoriesPadding / 2, 0, 0), 
				AutomaticSize = "Y", 
				LayoutOrder = p6
			};
			local v29 = {
				TitleLayout = u7.createElement("UIListLayout", {
					VerticalAlignment = "Top", 
					HorizontalAlignment = "Left", 
					FillDirection = "Vertical", 
					SortOrder = "LayoutOrder", 
					Padding = UDim.new(0, p1.TitlePadding)
				})
			};
			local v30 = #v29;
			local v31 = {};
			local v32 = {};
			local v33 = {};
			local v34 = {
				Size = UDim2.fromScale(1, 0.4), 
				TextXAlignment = "Left", 
				TextColor3 = l__ColorUtil__10.WHITE
			};
			if u15(v10) then
				local v35 = "Locked";
			else
				v35 = "Unlocked";
			end;
			v34.Text = v35;
			v34.RichText = true;
			v34.TextScaled = true;
			v34.TextTransparency = 0.5;
			v34.BackgroundTransparency = 1;
			v34.LayoutOrder = 2;
			v33[1] = u7.createElement("UIListLayout", {
				VerticalAlignment = "Center", 
				HorizontalAlignment = "Left", 
				FillDirection = "Vertical", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0, 0)
			});
			v33[2] = u7.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0.6), 
				TextXAlignment = "Left", 
				TextColor3 = l__ColorUtil__10.WHITE, 
				Text = "<b>" .. string.gsub(v10, "_", " ") .. "</b>", 
				RichText = true, 
				TextScaled = true, 
				BackgroundTransparency = 1, 
				LayoutOrder = 1
			}, { u7.createElement("UITextSizeConstraint", {
					MaxTextSize = p1.CategoryTitleTextSize - 2
				}) });
			v33[3] = u7.createElement("TextLabel", v34, { u7.createElement("UITextSizeConstraint", {
					MaxTextSize = p1.CategoryTitleTextSize - 2
				}) });
			v32[1] = u7.createElement("UIListLayout", {
				VerticalAlignment = "Center", 
				HorizontalAlignment = "Left", 
				FillDirection = "Horizontal", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0.07, 0)
			});
			v32[2] = u7.createElement("ImageLabel", {
				Size = UDim2.fromScale(0.15, 1), 
				ScaleType = "Fit", 
				Image = v20, 
				BackgroundTransparency = 1
			});
			v32[3] = u7.createElement(l__Empty__9, {
				Size = UDim2.fromScale(0.78, 1)
			}, v33);
			v31[1] = u7.createElement("UICorner", {
				CornerRadius = UDim.new(0, 5)
			});
			v31[2] = u7.createElement("UIPadding", {
				PaddingLeft = UDim.new(0.03, 0), 
				PaddingRight = UDim.new(0.03, 0)
			});
			v31[3] = u7.createElement(l__Empty__9, {
				Size = UDim2.fromScale(0.55, 0.8), 
				AnchorPoint = Vector2.new(0, 0.5), 
				Position = UDim2.fromScale(0, 0.5)
			}, v32);
			local v36 = u15(v10);
			if v36 then
				local v37 = {
					Position = UDim2.fromScale(1, 0.5), 
					AnchorPoint = Vector2.new(1, 0.5), 
					Size = UDim2.fromScale(0.4, 0.8), 
					Text = v19, 
					CornerRadius = UDim.new(0, 3)
				};
				if v27 then
					local v38 = l__Theme__8.backgroundSuccess;
				else
					v38 = l__Theme__8.backgroundError;
				end;
				v37.BackgroundColor3 = v38;
				function v37.OnClick()
					if not v27 then
						return nil;
					end;
					u16(v10);
				end;
				v36 = u7.createElement(l__Button__11, v37);
			end;
			if v36 then
				v31[#v31 + 1] = v36;
			end;
			v29[v30 + 1] = u7.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, p1.CategoryTitleTextSize * 3), 
				BackgroundColor3 = l__Theme__8.backgroundSecondary, 
				BorderSizePixel = 0
			}, v31);
			local function v39(p9, p10)
				local v40 = {
					ShopItem = p9, 
					LayoutOrder = p10, 
					Selected = p1.SelectedItem == p9
				};
				function v40.OnClick()
					p1.SetSelectedShopItem(p9);
				end;
				function v40.OnRightClick()
					l__shopPurchaseItem__13(p9):andThen(function(p11)
						if not p11 then
							p1.SetSelectedShopItem(p9);
							return;
						end;
						if p9.nextTier then
							local v41 = l__BedwarsShop__5.getShopItem(p9.nextTier, l__Players__14.LocalPlayer);
						else
							v41 = p9;
						end;
						p1.SetSelectedShopItem(v41);
					end);
				end;
				v40.Locked = u15(v10);
				return u7.createElement(l__BedwarsShopItemCard__12, v40);
			end;
			local v42 = table.create(#v11);
			for v43, v44 in ipairs(v11) do
				v42[v43] = v39(v44, v43 - 1, v11);
			end;
			local v45 = {
				Size = UDim2.new(1, 0, 0, p1.CellWidth), 
				AutomaticSize = "Y", 
				LayoutOrder = 2
			};
			local v46 = { u7.createElement("UIGridLayout", {
					CellSize = UDim2.fromOffset(p1.CellWidth, p1.CellWidth), 
					CellPadding = UDim2.fromOffset(p1.CellPadding, p1.CellPadding), 
					HorizontalAlignment = "Left", 
					VerticalAlignment = "Top", 
					SortOrder = "LayoutOrder", 
					FillDirectionMaxCells = 4
				}) };
			local v47 = #v46;
			for v48, v49 in ipairs(v42) do
				v46[v47 + v48] = v49;
			end;
			v29[v30 + 2] = u7.createElement(l__Empty__9, v45, v46);
			return u7.createElement(l__Empty__9, v28, v29);
		end;
		local v50 = table.create(#l__ShopCategories__4);
		for v51, v52 in ipairs(l__ShopCategories__4) do
			v50[v51] = v9(v52, v51 - 1, l__ShopCategories__4);
		end;
		local v53 = {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = "Y", 
			LayoutOrder = p1.LayoutOrder
		};
		local v54 = { u7.createElement("UIListLayout", {
				VerticalAlignment = "Top", 
				HorizontalAlignment = "Left", 
				FillDirection = "Horizontal", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0, p1.CategoriesPadding)
			}) };
		local v55 = #v54;
		for v56, v57 in ipairs(v50) do
			v54[v55 + v56] = v57;
		end;
		return u7.createElement(l__Empty__9, v53, v54);
	end)
};

