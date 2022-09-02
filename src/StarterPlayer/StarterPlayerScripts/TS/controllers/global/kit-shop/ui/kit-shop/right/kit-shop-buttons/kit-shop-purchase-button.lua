-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Button__2 = v2.Button;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ImageId__4 = v2.ImageId;
return {
	KitShopPurchaseButton = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = {
			Size = p1.Size, 
			Position = UDim2.fromScale(0.5, 0.895), 
			AnchorPoint = Vector2.new(0.5, 1), 
			BackgroundColor3 = l__Theme__3.backgroundSuccess, 
			Selectable = true
		};
		function v4.OnClick()
			p1.Purchase();
		end;
		v4.LayoutOrder = p1.LayoutOrder;
		return u1.createElement(l__Button__2, v4, { u1.createElement("ImageLabel", {
				Image = l__ImageId__4.ROBUX, 
				ImageColor3 = Color3.fromRGB(255, 255, 255), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Size = UDim2.fromScale(0.65, 0.65), 
				SizeConstraint = "RelativeYY", 
				AnchorPoint = Vector2.new(0, 0.5), 
				Position = UDim2.fromScale(0.34, 0.5)
			}), u1.createElement("TextLabel", {
				Text = "<b>" .. tostring(p1.PriceRobux) .. "</b>", 
				Size = UDim2.fromScale(0.4, 0.45), 
				Position = UDim2.fromScale(0.505, 0.5), 
				AnchorPoint = Vector2.new(0, 0.5), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				TextXAlignment = "Left"
			}) });
	end)
};
