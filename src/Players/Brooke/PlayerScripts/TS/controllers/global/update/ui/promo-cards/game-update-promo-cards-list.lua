-- Script Hash: ed801537559461e3375f2571eba132780356e77f48aba53c6a718041b3e3fa722e7460e2f9324da4370e05af9ea714f2
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__getBedwarsKitMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local l__MarketplaceService__2 = v2.MarketplaceService;
local l__Players__3 = v2.Players;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__AutoCanvasScrollingFrame__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).AutoCanvasScrollingFrame;
local l__GameUpdatePromoCard__6 = v1.import(script, script.Parent, "promo-card", "game-update-promo-card").GameUpdatePromoCard;
local l__BattlePassUtils__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local l__KnitClient__8 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
return {
	GameUpdatePromoCardsList = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local v3, v4 = p2.useState(nil);
		p2.useEffect(function()
			if p1.store.GameUpdates.newestKit then
				v4(l__getBedwarsKitMeta__1(p1.store.GameUpdates.newestKit));
			end;
		end, {});
		return u4.createFragment({
			UpdateActionButtons = u4.createElement(l__AutoCanvasScrollingFrame__5, {
				ScrollingFrameProps = {
					Size = p1.Size, 
					LayoutOrder = p1.LayoutOrder
				}
			}, { u4.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical, 
					VerticalAlignment = Enum.VerticalAlignment.Top, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 6)
				}), u4.createElement(l__GameUpdatePromoCard__6, {
					store = p1.store, 
					PromoCard = {
						BannerImage = "rbxassetid://9135987193", 
						PromoItemImage = l__BattlePassUtils__7.BATTLE_PASS_ICON, 
						ItemType = "BattlePass", 
						Name = "Season 4", 
						Price = 799, 
						Description = "Unlock the full Battle Pass for Season 4. This gives you access to tons of limited edition content! Owning the Battle Pass also gives a 20% experience bonus.", 
						OnClick = function()
							l__KnitClient__8.Controllers.BattlePassController:promptBattlePassPurchase();
						end, 
						isOwned = p1.store.BattlePass.paid
					}, 
					LayoutOrder = 1
				}) })
		});
	end)
};
