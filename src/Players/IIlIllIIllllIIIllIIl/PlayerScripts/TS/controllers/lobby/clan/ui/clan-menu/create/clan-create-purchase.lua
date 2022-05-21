-- Script Hash: b8311c58fea423e48577094b85d3b830b7697cf6a38d7087a2a37dcb67faaa6bfb19d9a9691192c7395fac6b12ae4b21
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__3 = v2.Empty;
local l__BedwarsImageId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__6 = v2.ColorUtil;
local l__ButtonComponent__7 = v2.ButtonComponent;
local l__ImageId__8 = v2.ImageId;
return {
	ClanCreatePurchase = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__3 = p2.useState;
		return u2.createElement(l__Empty__3, {
			Size = UDim2.fromScale(1, 0.9)
		}, { u2.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0, 20), 
				HorizontalAlignment = "Center", 
				VerticalAlignment = "Center"
			}), u2.createElement("ImageLabel", {
				Size = UDim2.fromScale(1, 0.3), 
				Image = l__BedwarsImageId__4.CLAN, 
				SizeConstraint = "RelativeYY", 
				ScaleType = "Fit", 
				BackgroundTransparency = 1
			}), u2.createElement(l__Empty__3, {
				Size = UDim2.fromScale(1, 0), 
				AutomaticSize = "Y"
			}, { u2.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					Padding = UDim.new(0, 6), 
					VerticalAlignment = "Center"
				}), u2.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0), 
					AutomaticSize = "Y", 
					SizeConstraint = "RelativeXX", 
					Text = "<b>CLAN PASS</b>", 
					TextScaled = true, 
					RichText = true, 
					Font = "Roboto", 
					TextColor3 = l__Theme__5.textPrimary, 
					BackgroundTransparency = 1, 
					TextXAlignment = "Center"
				}, { u2.createElement("UITextSizeConstraint", {
						MaxTextSize = 24
					}) }), u2.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0), 
					AutomaticSize = "Y", 
					SizeConstraint = "RelativeXX", 
					Text = "Purchase the Clan Pass to create a clan", 
					TextScaled = true, 
					RichText = true, 
					Font = "Roboto", 
					TextColor3 = l__ColorUtil__6.WHITE, 
					TextTransparency = 0.4, 
					BackgroundTransparency = 1, 
					TextXAlignment = "Center"
				}, { u2.createElement("UITextSizeConstraint", {
						MaxTextSize = 20
					}) }) }), u2.createElement(l__ButtonComponent__7, {
				Size = UDim2.new(0.8, 0, 0, 50), 
				BackgroundColor3 = l__Theme__5.backgroundSuccess, 
				Selectable = false, 
				OnClick = function()
					l__KnitClient__1.Controllers.ClanController:promptClanPassPurchase();
				end
			}, { u2.createElement("UIListLayout", {
					FillDirection = "Horizontal", 
					VerticalAlignment = "Center", 
					HorizontalAlignment = "Center", 
					Padding = UDim.new(0, 10)
				}), u2.createElement("ImageLabel", {
					Image = l__ImageId__8.ROBUX, 
					ImageColor3 = Color3.fromRGB(255, 255, 255), 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Size = UDim2.fromScale(0.65, 0.55), 
					ScaleType = "Fit", 
					SizeConstraint = "RelativeYY", 
					AnchorPoint = Vector2.new(1, 0.5)
				}), u2.createElement("TextLabel", {
					Text = "<b>399</b>", 
					Size = UDim2.fromScale(1, 0.5), 
					SizeConstraint = "RelativeYY", 
					Position = UDim2.fromScale(0.5, 0.5), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					TextColor3 = Color3.fromRGB(255, 255, 255), 
					TextScaled = true, 
					RichText = true, 
					Font = "Roboto", 
					TextXAlignment = "Left"
				}) }) });
	end)
};
