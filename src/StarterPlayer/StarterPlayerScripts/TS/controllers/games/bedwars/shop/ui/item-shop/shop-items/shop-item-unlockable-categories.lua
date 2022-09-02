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
			local v12, v13, v14 = ipairs(l__BedwarsShop__5.TeamUpgrades);
			while true do
				v12(v13, v14);
				if not v12 then
					break;
				end;
				v14 = v12;
				if v13.id == u17 == true then
					v11 = v13;
					break;
				end;			
			end;
			local v15 = v11;
			if v15 ~= nil then
				v15 = v15.tiers[1];
			end;
			if v15 then
				local v16 = v11;
				if v16 ~= nil then
					v16 = v16.tiers[1].price;
				end;
				local v17 = "<b>" .. tostring(v16) .. " " .. l__ItemUtil__6.getDisplayName(v15.currency) .. "</b>";
			else
				v17 = "";
			end;
			local v18 = l__BedwarsShopCategoryIcons__7[v9];
			if v18 == nil then
				local v19 = v11;
				if v19 ~= nil then
					v19 = v19.image;
				end;
				v18 = v19;
			end;
			local v20 = nil;
			local v21, v22, v23 = ipairs(p1.store.Inventory.observedInventory.inventory.items);
			while true do
				v21(v22, v23);
				if not v21 then
					break;
				end;
				local v24 = v15;
				if v24 ~= nil then
					v24 = v24.currency;
				end;
				if (v22.itemType == v24 and v15.price <= v22.amount) == true then
					v20 = v22;
					break;
				end;			
			end;
			local v25 = v20 ~= nil;
			local v26 = u1[v9];
			if not v26 then
				local v27 = false;
			else
				local v28 = p1.store.Bedwars.teamUpgrades[v26];
				if v28 == nil then
					v28 = -1;
				end;
				v27 = not (v28 >= 0);
			end;
			if v27 then
				local v29 = "Locked";
			else
				v29 = "Unlocked";
			end;
			local v30 = {
				Size = UDim2.new(0.5, -p1.CategoriesPadding / 2, 0, 0), 
				AutomaticSize = "Y", 
				LayoutOrder = p5
			};
			local v31 = {
				TitleLayout = u8.createElement("UIListLayout", {
					VerticalAlignment = "Top", 
					HorizontalAlignment = "Left", 
					FillDirection = "Vertical", 
					SortOrder = "LayoutOrder", 
					Padding = UDim.new(0, p1.TitlePadding)
				})
			};
			local v32 = #v31;
			local v33 = { u8.createElement("UICorner", {
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
						Image = v18, 
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
							Text = v29, 
							RichText = true, 
							TextScaled = true, 
							TextTransparency = 0.5, 
							BackgroundTransparency = 1, 
							LayoutOrder = 2
						}, { u8.createElement("UITextSizeConstraint", {
								MaxTextSize = p1.CategoryTitleTextSize - 2
							}) }) }) }) };
			local v34 = u1[v9];
			if not v34 then
				local v35 = false;
			else
				local v36 = p1.store.Bedwars.teamUpgrades[v34];
				if v36 == nil then
					v36 = -1;
				end;
				v35 = not (v36 >= 0);
			end;
			if v35 then
				local v37 = {
					Position = UDim2.fromScale(1, 0.5), 
					AnchorPoint = Vector2.new(1, 0.5), 
					Size = UDim2.fromScale(0.4, 0.8), 
					Text = v17, 
					CornerRadius = UDim.new(0, 3)
				};
				if v25 then
					local v38 = l__Theme__9.backgroundSuccess;
				else
					v38 = l__Theme__9.backgroundError;
				end;
				v37.BackgroundColor3 = v38;
				function v37.OnClick()
					if not v25 then
						return nil;
					end;
					u16(v9);
				end;
				v35 = u8.createElement(l__Button__12, v37);
			end;
			if v35 then
				v33[#v33 + 1] = v35;
			end;
			v31[v32 + 1] = u8.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, p1.CategoryTitleTextSize * 3), 
				BackgroundColor3 = l__Theme__9.backgroundSecondary, 
				BorderSizePixel = 0
			}, v33);
			local function v39(p6, p7)
				local v40 = {
					ShopItem = p6, 
					LayoutOrder = p7, 
					Selected = p1.SelectedItem == p6
				};
				function v40.OnClick()
					p1.SetSelectedShopItem(p6);
				end;
				function v40.OnRightClick()
					l__shopPurchaseItem__14(p6):andThen(function(p8)
						if not p8 then
							p1.SetSelectedShopItem(p6);
							return;
						end;
						if p6.nextTier then
							local v41 = l__BedwarsShop__5.getShopItem(p6.nextTier, l__Players__15.LocalPlayer);
						else
							v41 = p6;
						end;
						p1.SetSelectedShopItem(v41);
					end);
				end;
				local v42 = u1[v9];
				if not v42 then
					local v43 = false;
				else
					local v44 = p1.store.Bedwars.teamUpgrades[v42];
					if v44 == nil then
						v44 = -1;
					end;
					v43 = not (v44 >= 0);
				end;
				v40.Locked = v43;
				return u8.createElement(l__BedwarsShopItemCard__13, v40);
			end;
			local v45 = table.create(#v10);
			local v46, v47, v48 = ipairs(v10);
			while true do
				v46(v47, v48);
				if not v46 then
					break;
				end;
				v48 = v46;
				v45[v46] = v39(v47, v46 - 1, v10);			
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
			local v52, v53, v54 = ipairs(v45);
			while true do
				v52(v53, v54);
				if not v52 then
					break;
				end;
				v54 = v52;
				v50[v51 + v52] = v53;			
			end;
			v31[v32 + 2] = u8.createElement(l__Empty__10, v49, v50);
			return u8.createElement(l__Empty__10, v30, v31);
		end;
		local v55 = table.create(#l__ShopCategories__5);
		local v56, v57, v58 = ipairs(l__ShopCategories__5);
		while true do
			v56(v57, v58);
			if not v56 then
				break;
			end;
			v58 = v56;
			v55[v56] = v8(v57, v56 - 1, l__ShopCategories__5);		
		end;
		local v59 = {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = "Y", 
			LayoutOrder = p1.LayoutOrder
		};
		local v60 = { u8.createElement("UIListLayout", {
				VerticalAlignment = "Top", 
				HorizontalAlignment = "Left", 
				FillDirection = "Horizontal", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0, p1.CategoriesPadding)
			}) };
		local v61 = #v60;
		local v62, v63, v64 = ipairs(v55);
		while true do
			v62(v63, v64);
			if not v62 then
				break;
			end;
			v64 = v62;
			v60[v61 + v62] = v63;		
		end;
		return u8.createElement(l__Empty__10, v59, v60);
	end)
};
