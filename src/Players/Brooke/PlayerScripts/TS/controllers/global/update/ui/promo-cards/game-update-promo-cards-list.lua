-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__getBedwarsKitMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local l__MarketplaceService__2 = v2.MarketplaceService;
local l__Players__3 = v2.Players;
local l__GameUpdateButtons__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "update", "game-update-meta").GameUpdateButtons;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__KitViewport__6 = v1.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "misc", "kit-viewport").KitViewport;
local l__GameUpdatePromoCard__7 = v1.import(script, script.Parent, "promo-card", "game-update-promo-card").GameUpdatePromoCard;
local l__BattlePassUtils__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local l__KnitClient__9 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__AutoCanvasScrollingFrame__10 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).AutoCanvasScrollingFrame;
return {
	GameUpdatePromoCardsList = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u5)(function(p1, p2)
		local v3, v4 = p2.useState(nil);
		p2.useEffect(function()
			if p1.store.GameUpdates.newestKit then
				v4(l__getBedwarsKitMeta__1(p1.store.GameUpdates.newestKit));
			end;
		end, {});
		local v5 = false;
		if p1.store.GameUpdates.newestKit ~= nil then
			v5 = v3;
		end;
		if v5 then
			local v6 = {
				store = p1.store
			};
			local v7 = {
				BannerImage = l__GameUpdateButtons__4.newestKitBG, 
				PromoItemImageElement = u5.createElement(l__KitViewport__6, {
					Kit = p1.store.GameUpdates.newestKit, 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Position = UDim2.fromScale(0.5, 0.5), 
					ZIndex = 4
				}), 
				ItemType = "NEWEST KIT", 
				Name = v3.name, 
				Price = v3.priceRobux, 
				Description = v3.description
			};
			local function u11()
				if table.find(p1.store.Bedwars.ownedKits, p1.store.GameUpdates.newestKit) ~= nil then
					return nil;
				end;
				local v8 = v3;
				if v8 ~= nil then
					v8 = v8.gamepassId;
				end;
				if v8 ~= nil then
					local v9 = v3;
					if v9 ~= nil then
						v9 = v9.gamepassId;
					end;
					l__MarketplaceService__2:PromptGamePassPurchase(l__Players__3.LocalPlayer, v9);
					return;
				end;
				local v10 = v3;
				if v10 ~= nil then
					v10 = v10.devProductId;
				end;
				if v10 ~= nil then
					local v11 = v3;
					if v11 ~= nil then
						v11 = v11.devProductId;
					end;
					l__MarketplaceService__2:PromptProductPurchase(l__Players__3.LocalPlayer, v11);
				end;
			end;
			function v7.OnClick()
				u11();
			end;
			v7.isOwned = table.find(p1.store.Bedwars.ownedKits, p1.store.GameUpdates.newestKit) ~= nil;
			v6.PromoCard = v7;
			v6.LayoutOrder = 2;
			v5 = u5.createElement(l__GameUpdatePromoCard__7, v6);
		end;
		local v12 = { u5.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 6)
			}), u5.createElement(l__GameUpdatePromoCard__7, {
				store = p1.store, 
				PromoCard = {
					BannerImage = "rbxassetid://10983634478", 
					PromoItemImage = l__BattlePassUtils__8.BATTLE_PASS_ICON, 
					ItemType = "BattlePass", 
					Name = "Season " .. tostring(l__BattlePassUtils__8.BATTLE_PASS_SEASON_NUMBER), 
					Price = 799, 
					Description = "Unlock the full Battle Pass for Season " .. tostring(l__BattlePassUtils__8.BATTLE_PASS_SEASON_NUMBER) .. ". This gives you access to tons of limited edition content! Owning the Battle Pass also gives a 20% experience bonus.", 
					OnClick = function()
						l__KnitClient__9.Controllers.BattlePassController:promptBattlePassPurchase();
					end, 
					isOwned = p1.store.BattlePass.paid
				}, 
				LayoutOrder = 1
			}) };
		if v5 then
			v12[#v12 + 1] = v5;
		end;
		return u5.createFragment({
			UpdateActionButtons = u5.createElement(l__AutoCanvasScrollingFrame__10, {
				ScrollingFrameProps = {
					Size = p1.Size, 
					LayoutOrder = p1.LayoutOrder
				}
			}, v12)
		});
	end)
};
