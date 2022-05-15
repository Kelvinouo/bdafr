
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ClanProfilePageLayout__2 = v1.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout;
local l__Empty__3 = v2.Empty;
local l__StringUtil__4 = v2.StringUtil;
local l__ColorUtil__5 = v2.ColorUtil;
local l__BedwarsImageId__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__ClanProfileKitShop__7 = v1.import(script, script.Parent, "clan-profile-kit-shop").ClanProfileKitShop;
return {
	ClanProfileKitShopTab = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		return u1.createElement(l__ClanProfilePageLayout__2, {
			Title = "KIT SHOP", 
			RightTitleElement = u1.createElement(l__Empty__3, {
				Size = UDim2.fromScale(1, 1), 
				LayoutOrder = 1
			}, { u1.createElement("UIListLayout", {
					FillDirection = "Horizontal", 
					Padding = UDim.new(0, 6), 
					VerticalAlignment = "Center", 
					HorizontalAlignment = "Right"
				}), u1.createElement("TextLabel", {
					Size = UDim2.fromScale(0.7, 0.7), 
					Text = "<b>Clan Coins:</b> " .. l__StringUtil__4.formatNumberWithCommas(math.floor(p1.Clan.coins)), 
					TextScaled = true, 
					RichText = true, 
					Font = "Roboto", 
					TextColor3 = l__ColorUtil__5.WHITE, 
					TextXAlignment = "Right", 
					TextYAlignment = "Center", 
					BackgroundTransparency = 1, 
					LayoutOrder = 1
				}), u1.createElement("ImageLabel", {
					Size = UDim2.fromScale(0.7, 0.7), 
					SizeConstraint = "RelativeYY", 
					Image = l__BedwarsImageId__6.COIN, 
					ScaleType = "Fit", 
					BackgroundTransparency = 1
				}) })
		}, { u1.createElement(l__Empty__3, {
				Size = UDim2.new(1, 0, 1, 0), 
				LayoutOrder = 2
			}, { u1.createElement(l__ClanProfileKitShop__7, {
					Clan = p1.Clan, 
					store = p1.store, 
					Size = UDim2.new(1, 0, 1, 0), 
					LayoutOrder = 2
				}) }) });
	end)
};

