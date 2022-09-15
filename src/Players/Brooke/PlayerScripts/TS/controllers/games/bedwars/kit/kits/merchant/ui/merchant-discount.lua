-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "merchant", "merchant-types");
local v4 = v2.Component:extend("MerchantDiscount");
function v4.init(p1)

end;
local l__Theme__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__discountColor__2 = v3.discountColor;
local l__discountImage__3 = v3.discountImage;
function v4.render(p2)
	return v2.createFragment({
		DiscountElement = v2.createElement("Frame", {
			Size = UDim2.fromOffset(225, 40), 
			Position = UDim2.fromScale(0.025, 0), 
			ZIndex = 100, 
			BackgroundColor3 = l__Theme__1.backgroundPrimary, 
			BorderSizePixel = 3, 
			BorderColor3 = l__discountColor__2[p2.props.item.tier]
		}, { v2.createElement("ImageLabel", {
				Image = l__discountImage__3[p2.props.item.tier], 
				Size = UDim2.fromOffset(32, 32), 
				Position = UDim2.fromScale(0.075, 0.5), 
				BackgroundTransparency = 1, 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				ZIndex = 102
			}), v2.createElement("TextLabel", {
				Font = Enum.Font.Roboto, 
				Text = tostring(p2.props.refund) .. " " .. p2.props.item.item.currency .. " refunded", 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				TextSize = 22, 
				Position = UDim2.fromScale(0.5, 0.5), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				BackgroundTransparency = 1, 
				ZIndex = 101
			}) })
	});
end;
return {
	MerchantDiscount = v4
};
