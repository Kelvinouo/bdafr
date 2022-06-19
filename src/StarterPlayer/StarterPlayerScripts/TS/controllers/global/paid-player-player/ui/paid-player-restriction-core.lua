-- Script Hash: 6879ffeb32c725227a4b247af6ec80544a128e22a992215421a75e06b93bae8b402991fcf2d5ca8a9b523c67c20d71a4
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__DeviceUtil__1 = v2.DeviceUtil;
local l__Players__2 = v3.Players;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__QueueMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local l__QueueType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local l__MarketplaceService__6 = v3.MarketplaceService;
local l__DevProduct__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "devproduct").DevProduct;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DarkBackground__9 = v2.DarkBackground;
local l__SlideIn__10 = v2.SlideIn;
local l__WidgetComponent__11 = v2.WidgetComponent;
local l__Empty__12 = v2.Empty;
local l__DividerComponent__13 = v2.DividerComponent;
local l__ButtonComponent__14 = v2.ButtonComponent;
return {
	PaidPlayerRestrictionCore = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u8)(function(p1, p2)
		local l__useState__4 = p2.useState;
		if not l__DeviceUtil__1.isHoarceKat() then
			local l__DisplayName__5 = l__Players__2.LocalPlayer.DisplayName;
		end;
		return u8.createFragment({ u8.createElement(l__DarkBackground__9, {
				AppId = p1.AppId
			}), u8.createElement(l__SlideIn__10, {}, { u8.createElement(l__WidgetComponent__11, {
					AppId = p1.AppId, 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Position = UDim2.fromScale(0.5, 0.5), 
					Size = UDim2.fromScale(0.45, 0.6), 
					ClipsDescendents = true, 
					Title = "Ranked Queue Restricted"
				}, { u8.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical, 
						HorizontalAlignment = Enum.HorizontalAlignment.Left, 
						VerticalAlignment = Enum.VerticalAlignment.Top, 
						SortOrder = Enum.SortOrder.LayoutOrder, 
						Padding = UDim.new(0.03, 0)
					}), u8.createElement(l__Empty__12, {
						Size = UDim2.fromScale(1, 0.35), 
						LayoutOrder = 1
					}, {
						Image = u8.createElement("ImageLabel", {
							Size = UDim2.fromScale(0.2, 1), 
							AutomaticSize = "X", 
							Image = "rbxassetid://7804178661", 
							ScaleType = "Fit", 
							BackgroundTransparency = 1, 
							LayoutOrder = 1
						}), 
						Description = u8.createElement("TextLabel", {
							Size = UDim2.fromScale(0.7, 1), 
							Text = "<b><font color=\"#FFFFFF\">Hello, ranked queue is currently restricted for you.</font></b>\n\n" .. ("You must either have <b><font color=\"" .. l__Theme__3.textPrimaryRichText .. "\">" .. tostring(l__QueueMeta__4[l__QueueType__5.BEDWARS_RANKED_S5].minWinReq) .. " WINS</font></b> OR a <b><font color=\"" .. l__Theme__3.textPrimaryRichText .. "\">verified payment on Roblox</font></b>.\n") .. "We do this to reduce the amount of hackers in competitive matches and deem this necessary in order to provide a fair experience for ranked players.\n", 
							TextColor3 = Color3.fromRGB(218, 219, 238), 
							RichText = true, 
							TextScaled = true, 
							TextXAlignment = "Left", 
							TextYAlignment = "Center", 
							BackgroundTransparency = 1, 
							LayoutOrder = 2
						}, { u8.createElement("UITextSizeConstraint", {
								MaxTextSize = 18
							}) }),
						(u8.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal, 
							HorizontalAlignment = Enum.HorizontalAlignment.Center, 
							VerticalAlignment = Enum.VerticalAlignment.Center, 
							SortOrder = Enum.SortOrder.LayoutOrder, 
							Padding = UDim.new(0.03, 0)
						}))
					}), u8.createElement(l__DividerComponent__13, {
						LayoutOrder = 2, 
						BarColor = {
							Color = Color3.fromRGB(0, 0, 0), 
							Transparency = 0.7
						}
					}), u8.createElement(l__Empty__12, {
						Size = UDim2.fromScale(1, 0.35), 
						LayoutOrder = 3
					}, {
						OptionDescription = u8.createElement("TextLabel", {
							Size = UDim2.fromScale(1, 0.22), 
							Text = "Verified payments are <b><font color=\"" .. l__Theme__3.textPrimaryRichText .. "\">ANY</font></b> of the following:", 
							TextColor3 = Color3.fromRGB(255, 255, 255), 
							RichText = true, 
							TextScaled = true, 
							TextXAlignment = "Left", 
							TextYAlignment = "Top", 
							BackgroundTransparency = 1, 
							LayoutOrder = 1
						}, { u8.createElement("UITextSizeConstraint", {
								MaxTextSize = 18
							}) }), 
						Options = u8.createElement("TextLabel", {
							Size = UDim2.fromScale(1, 0.75), 
							Text = "- Own Roblox Premium\n- Spend robux on any Bedwars product (gamepass or dev product)\n- Purchase the Ranked Queue Pass (button below)\n", 
							TextColor3 = Color3.fromRGB(255, 255, 255), 
							TextTransparency = 0.3, 
							RichText = true, 
							TextScaled = true, 
							TextXAlignment = "Left", 
							TextYAlignment = "Top", 
							BackgroundTransparency = 1, 
							LayoutOrder = 2
						}, { u8.createElement("UITextSizeConstraint", {
								MaxTextSize = 16
							}) }),
						(u8.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical, 
							HorizontalAlignment = Enum.HorizontalAlignment.Left, 
							VerticalAlignment = Enum.VerticalAlignment.Top, 
							SortOrder = Enum.SortOrder.LayoutOrder, 
							Padding = UDim.new(0.03, 0)
						}))
					}), u8.createElement(l__ButtonComponent__14, {
						Size = UDim2.fromScale(0.4, 0.1), 
						Text = "200 Robux", 
						TextScaled = true, 
						TextPadding = {
							XScale = 0.2, 
							YScale = 0.2
						}, 
						OnClick = function()
							l__MarketplaceService__6:PromptProductPurchase(l__Players__2.LocalPlayer, l__DevProduct__7.RANKED_PASS);
						end, 
						LayoutOrder = 4
					}) }) }) });
	end)
};
