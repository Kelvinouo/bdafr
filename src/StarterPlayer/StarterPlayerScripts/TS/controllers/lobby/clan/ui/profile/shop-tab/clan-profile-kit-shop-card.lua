
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__BedwarsKitMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__3 = v2.ColorUtil;
local l__BedwarsImageId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ButtonComponent__6 = v2.ButtonComponent;
local l__StringUtil__7 = v2.StringUtil;
local l__KitViewport__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "kit-shop", "ui", "misc", "kit-viewport").KitViewport;
local l__Empty__9 = v2.Empty;
return {
	ClanProfileKitShopCard = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__3 = p2.useState;
		return u2.createFragment({
			ClanKitCard = u2.createElement("Frame", {
				Size = UDim2.fromScale(0.3, 1), 
				BackgroundColor3 = l__Theme__5.backgroundTertiary, 
				BorderSizePixel = 0
			}, { u2.createElement("UIListLayout", {
					Padding = UDim.new(0.1, 0), 
					FillDirection = "Vertical", 
					HorizontalAlignment = "Center"
				}), u2.createElement("UIPadding", {
					PaddingTop = UDim.new(0.05, 0), 
					PaddingBottom = UDim.new(0.05, 0), 
					PaddingLeft = UDim.new(0.1, 0), 
					PaddingRight = UDim.new(0.1, 0)
				}), u2.createElement("UICorner", {
					CornerRadius = UDim.new(0, 6)
				}), u2.createElement(l__KitViewport__8, {
					Size = UDim2.fromScale(1, 0.6), 
					Kit = p1.Kit
				}), u2.createElement(l__Empty__9, {
					Size = UDim2.fromScale(1, 0.3)
				}, { u2.createElement("TextLabel", {
						Size = UDim2.fromScale(1, 0), 
						AutomaticSize = "Y", 
						SizeConstraint = "RelativeXX", 
						Text = "<b>" .. l__BedwarsKitMeta__1[p1.Kit].name .. "</b>", 
						TextScaled = true, 
						RichText = true, 
						Font = "Roboto", 
						TextColor3 = l__ColorUtil__3.WHITE, 
						TextXAlignment = "Center", 
						TextYAlignment = "Center", 
						BackgroundTransparency = 1, 
						LayoutOrder = 1
					}, { u2.createElement("UITextSizeConstraint", {
							MaxTextSize = 18
						}) }), (function()
						if not p1.Locked then
							if not p1.Purchased then
								local v4 = {
									Position = UDim2.fromScale(0.5, 1), 
									AnchorPoint = Vector2.new(0.5, 1), 
									Size = UDim2.fromScale(0.9, 0.4)
								};
								if p1.CantBuy then
									local v5 = l__Theme__5.backgroundError;
								else
									v5 = l__Theme__5.backgroundSuccess;
								end;
								v4.BackgroundColor3 = v5;
								v4.Text = l__StringUtil__7.formatNumberWithCommas(p1.Price) .. " Coins";
								function v4.OnClick()
									if p1.CantBuy or p1.Disabled then
										return nil;
									end;
									p1.OnPurchase(p1.Kit);
								end;
								v4.Disabled = p1.Disabled;
								v4.Loading = p1.Loading;
								return u2.createElement(l__ButtonComponent__6, v4);
							else
								return u2.createElement(l__ButtonComponent__6, {
									Position = UDim2.fromScale(0.5, 1), 
									AnchorPoint = Vector2.new(0.5, 1), 
									Size = UDim2.fromScale(0.9, 0.4), 
									BackgroundColor3 = l__Theme__5.backgroundPrimary, 
									Text = "Purchased", 
									Disabled = true, 
									OnClick = function()

									end
								});
							end;
						end;
						return u2.createFragment({
							ShopLockedOverlay = u2.createElement("Frame", {
								Size = UDim2.fromScale(1, 0.7), 
								AnchorPoint = Vector2.new(0.5, 1), 
								Position = UDim2.fromScale(0.5, 1), 
								BackgroundColor3 = l__ColorUtil__3.BLACK, 
								BorderSizePixel = 0, 
								BackgroundTransparency = 0.4, 
								LayoutOrder = 3
							}, { u2.createElement("UICorner", {
									CornerRadius = UDim.new(0, 6)
								}), u2.createElement("UIPadding", {
									PaddingTop = UDim.new(0.15, 0), 
									PaddingBottom = UDim.new(0.15, 0), 
									PaddingLeft = UDim.new(0.05, 0), 
									PaddingRight = UDim.new(0.05, 0)
								}), u2.createElement("UIListLayout", {
									Padding = UDim.new(0.1, 0), 
									FillDirection = "Vertical", 
									HorizontalAlignment = "Center", 
									VerticalAlignment = "Center"
								}), u2.createElement("ImageLabel", {
									Size = UDim2.fromScale(1, 0.3), 
									SizeConstraint = "RelativeYY", 
									Image = l__BedwarsImageId__4.LOCK_SOLID, 
									ScaleType = "Fit", 
									BackgroundTransparency = 1, 
									LayoutOrder = 1
								}), u2.createElement("TextLabel", {
									Size = UDim2.fromScale(1, 0.6), 
									Text = "<b>Unlocked when <font color=\"" .. l__ColorUtil__3.richTextColor(l__Theme__5.mcYellow) .. "\">(Kit Shop Lv." .. tostring(p1.Index - 1) .. ")</font> reached</b>", 
									TextScaled = true, 
									RichText = true, 
									Font = "Roboto", 
									TextColor3 = l__ColorUtil__3.WHITE, 
									TextXAlignment = "Center", 
									TextYAlignment = "Center", 
									BackgroundTransparency = 1, 
									LayoutOrder = 1
								}, { u2.createElement("UITextSizeConstraint", {
										MaxTextSize = 14
									}) }) })
						});
					end)() }) })
		});
	end)
};

