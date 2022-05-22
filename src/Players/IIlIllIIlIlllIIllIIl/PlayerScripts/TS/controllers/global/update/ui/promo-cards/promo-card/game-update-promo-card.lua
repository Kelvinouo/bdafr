-- Script Hash: e930605628ea368e3f8d4f7a6598b361836bc3fd5371fd43098ead3c3e9af5145597e81f23ee6cd0c5b357bf4fee2f12
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Theme__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__GameUpdateKitCardTop__3 = v1.import(script, script.Parent, "promo-card-top-section").GameUpdateKitCardTop;
local l__GameUpdateKitCardBottom__4 = v1.import(script, script.Parent, "promo-card-bottom-section").GameUpdateKitCardBottom;
return {
	GameUpdatePromoCard = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local l__useEffect__3 = p2.useEffect;
		local v4 = UDim.new(0.06787330316742081, 0);
		local v5 = UDim.new(0.1188118811881188, 0);
		local v6 = {
			Size = p1.Size or UDim2.fromScale(0.95, 0), 
			AutomaticSize = "Y", 
			BackgroundColor3 = l__Theme__1.backgroundTertiary, 
			BorderSizePixel = 0, 
			LayoutOrder = p1.LayoutOrder
		};
		local v7 = { u2.createElement("UICorner", {
				CornerRadius = UDim.new(0, 6)
			}), u2.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 0)
			}) };
		local v8 = false;
		if p1.PromoCard.Description ~= nil then
			v8 = u2.createElement("UIAspectRatioConstraint", {
				AspectRatio = 0.9866071428571429, 
				AspectType = "ScaleWithParentSize"
			});
		end;
		if v8 then
			v7[#v7 + 1] = v8;
		end;
		local v9 = #v7;
		v7[v9 + 1] = u2.createElement(l__GameUpdateKitCardTop__3, {
			store = p1.store, 
			PromoCard = p1.PromoCard, 
			PaddingHorizontal = v4, 
			PaddingVertical = v5
		});
		local v10 = false;
		if p1.PromoCard.Description ~= nil then
			v10 = u2.createElement(l__GameUpdateKitCardBottom__4, {
				Description = p1.PromoCard.Description, 
				PaddingHorizontal = v4, 
				PaddingVertical = v5
			});
		end;
		if v10 then
			v7[v9 + 2] = v10;
		end;
		return u2.createFragment({
			ActionButtonKitPurchase = u2.createElement("ImageLabel", v6, v7)
		});
	end)
};
