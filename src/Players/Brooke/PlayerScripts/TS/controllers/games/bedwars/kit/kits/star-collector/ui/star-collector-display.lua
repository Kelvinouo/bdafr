-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return {
	StarCollectorDisplay = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		return u1.createElement("Frame", {
			Size = UDim2.fromScale(0.2, 1), 
			BackgroundTransparency = 1
		}, { u1.createElement("UIAspectRatioConstraint", {
				AspectRatio = 3.667
			}), u1.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				VerticalAlignment = "Center", 
				Padding = UDim.new(0, 2)
			}), u1.createElement("ImageLabel", {
				Size = UDim2.fromScale(1, 1), 
				Image = "rbxassetid://9871799391", 
				BackgroundTransparency = 1
			}, { u1.createElement("UIAspectRatioConstraint", {
					AspectRatio = 1
				}) }), u1.createElement("TextLabel", {
				Size = UDim2.fromScale(0.8, 0.8), 
				Text = tostring(p1.greenStars), 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				Font = "LuckiestGuy", 
				TextScaled = true, 
				TextXAlignment = "Left", 
				TextYAlignment = "Center", 
				BackgroundTransparency = 1
			}, { u1.createElement("UIAspectRatioConstraint", {
					AspectRatio = 1.3
				}) }), u1.createElement("ImageLabel", {
				Size = UDim2.fromScale(1, 1), 
				Image = "rbxassetid://9871798596", 
				BackgroundTransparency = 1
			}, { u1.createElement("UIAspectRatioConstraint", {
					AspectRatio = 1
				}) }), u1.createElement("TextLabel", {
				Size = UDim2.fromScale(0.8, 0.8), 
				Text = tostring(p1.yellowStars), 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				Font = "LuckiestGuy", 
				TextScaled = true, 
				TextXAlignment = "Left", 
				TextYAlignment = "Center", 
				BackgroundTransparency = 1
			}, { u1.createElement("UIAspectRatioConstraint", {
					AspectRatio = 1.3
				}) }) });
	end)
};
