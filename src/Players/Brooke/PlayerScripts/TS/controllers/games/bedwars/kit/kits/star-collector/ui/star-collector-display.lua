-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DeviceUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
return {
	StarCollectorDisplay = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local v3 = {};
		if l__DeviceUtil__2.isSmallScreen() then
			local v4 = 0.13;
		else
			v4 = 0.08;
		end;
		v3.Size = UDim2.fromScale(0.6, v4);
		v3.BackgroundTransparency = 1;
		v3.BorderSizePixel = 0;
		v3.AnchorPoint = Vector2.new(0.5, 1);
		if l__DeviceUtil__2.isSmallScreen() then
			local v5 = 0.95;
		else
			v5 = 0.99;
		end;
		v3.Position = UDim2.fromScale(0.5, v5);
		return u1.createElement("Frame", v3, { u1.createElement("UIAspectRatioConstraint", {
				AspectRatio = 9
			}), u1.createElement("Frame", {
				AnchorPoint = Vector2.new(0.5, 1), 
				Position = UDim2.fromScale(0.12, -0.45), 
				Size = UDim2.fromScale(0.2, 0.2), 
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
					BackgroundTransparency = 1
				}, { u1.createElement("UIAspectRatioConstraint", {
						AspectRatio = 1.3
					}) }) }) });
	end)
};
