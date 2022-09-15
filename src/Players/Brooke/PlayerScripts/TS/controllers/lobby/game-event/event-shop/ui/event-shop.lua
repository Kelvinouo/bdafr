-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__EventShopItemMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item-meta").EventShopItemMeta;
local l__EventCurrencyMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-currency", "event-currency-metadata").EventCurrencyMeta;
local l__SoundManager__3 = v2.SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__Flamework__6 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__ColorUtil__8 = v2.ColorUtil;
local l__GameEventUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "game-event-utils").GameEventUtil;
local l__Theme__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__KnitClient__11 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__UILayers__12 = v2.UILayers;
local u13 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__EventShopItemTile__14 = v1.import(script, script.Parent, "event-shop-item-tile").EventShopItemTile;
local l__Padding__15 = v2.Padding;
local l__AutoCanvasScrollingFrame__16 = v2.AutoCanvasScrollingFrame;
local l__Empty__17 = v2.Empty;
return {
	EventShop = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u13)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v5 = {};
		local l__items__6 = p1.Shop.items;
		table.sort(l__items__6, function(p3, p4)
			return l__EventShopItemMeta__1[p4].name < l__EventShopItemMeta__1[p3].name;
		end);
		table.sort(l__items__6, function(p5, p6)
			return l__EventShopItemMeta__1[p6].price < l__EventShopItemMeta__1[p5].price;
		end);
		local function u18(p7)
			local v7 = l__EventShopItemMeta__1[p7];
			l__SoundManager__3:playSound(l__GameSound__4.UI_OPEN);
			local v8 = v7.price <= l__ClientStore__5:getState().Event.profileData.currencies[v7.currency].currAmount;
			local v9 = {
				Title = "Purchase " .. v7.name .. "?", 
				Body = "Are you sure you want to purchase the <font transparency=\"0\" color=\"" .. l__ColorUtil__8.richTextColor(l__GameEventUtil__9.getItemColorRarity(v7.price)) .. "\"><b>[" .. v7.name .. "]</b></font> for <font color=\"" .. l__ColorUtil__8.richTextColor(l__Theme__10.mcGold) .. "\"><b>" .. tostring(v7.price) .. " " .. l__EventCurrencyMeta__2[v7.currency].name .. "</b></font>?"
			};
			local v10 = {};
			if v8 then
				local v11 = "Purchase";
			else
				v11 = "Can't Afford";
			end;
			v10.Text = v11;
			if v8 then
				local v12 = l__Theme__10.backgroundSuccess;
			else
				v12 = l__Theme__10.backgroundError;
			end;
			v10.BackgroundColor3 = v12;
			v9.PrimaryBtnProps = v10;
			v9.SecondaryBtnProps = {
				Text = "Cancel"
			};
			function v9.OnPrimaryBtnClick(p8)
				if not v8 then
					return nil;
				end;
				if l__KnitClient__11.Controllers.EventShopContoller:purchaseItem(p7, p1.EventType) then
					l__SoundManager__3:playSound(l__GameSound__4.BEDWARS_UPGRADE_SUCCESS);
					return;
				end;
				l__SoundManager__3:playSound(l__GameSound__4.ERROR_NOTIFICATION);
			end;
			function v9.OnSecondaryBtnClick()
				l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(l__UILayers__12.OVERLAY);
			end;
			l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__7.CONFIRMATION_MODAL, v9);
		end;
		local function v13(p9, p10)
			local v14 = nil;
			local l__ItemsPurchased__15 = p1.ItemsPurchased;
			v14 = 0;
			for v16 = 1, #l__ItemsPurchased__15 do
				local v17 = v14;
				if l__ItemsPurchased__15[v16].item == p9 then
					v17 = v17 + 1;
				end;
				v14 = v17;
			end;
			local v18 = l__EventShopItemMeta__1[p9].maxPurchases;
			if v18 == nil then
				v18 = 1;
			end;
			return u13.createElement(l__EventShopItemTile__14, {
				Item = p9, 
				Disabled = v18 <= local v19, 
				PromptPurchase = u18, 
				LayoutOrder = p10
			});
		end;
		local v20 = table.create(#l__items__6);
		local v21, v22, v23 = ipairs(l__items__6);
		while true do
			v21(v22, v23);
			if not v21 then
				break;
			end;
			v23 = v21;
			v20[v21] = v13(v22, v21 - 1, l__items__6);		
		end;
		local v24 = {
			ScrollingFrameProps = {
				Size = UDim2.fromScale(1, 1), 
				LayoutOrder = 2, 
				Selectable = false
			}
		};
		local v25 = { u13.createElement(l__Padding__15, {
				Padding = {
					Vertical = 2, 
					Horizontal = 2
				}
			}), u13.createElement("UIGridLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Left", 
				CellSize = UDim2.new(0, 136, 0, 162), 
				CellPadding = UDim2.fromOffset(8, 8), 
				FillDirectionMaxCells = 4, 
				SortOrder = "LayoutOrder"
			}) };
		local v26 = #v25;
		local v27, v28, v29 = ipairs(v20);
		while true do
			v27(v28, v29);
			if not v27 then
				break;
			end;
			v29 = v27;
			v25[v26 + v27] = v28;		
		end;
		v5.ShopList = u13.createElement(l__AutoCanvasScrollingFrame__16, v24, v25);
		return u13.createFragment({
			EventShop = u13.createElement(l__Empty__17, v4, v5)
		});
	end)
};
