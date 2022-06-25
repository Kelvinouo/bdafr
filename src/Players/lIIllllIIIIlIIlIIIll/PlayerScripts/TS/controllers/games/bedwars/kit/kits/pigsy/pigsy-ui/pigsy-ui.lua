-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return {
	PigsyUi = function(p1)
		return u1.createElement("Frame", {
			Size = UDim2.fromScale(0.7, 0.1), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0
		}, { u1.createElement("ImageLabel", {
				Size = UDim2.fromScale(1, 1), 
				Position = UDim2.fromScale(0, 0), 
				Image = "rbxassetid://10013673573", 
				ScaleType = "Fit", 
				BackgroundTransparency = 1, 
				BorderColor3 = Color3.fromRGB(255, 255, 255)
			}), u1.createElement("TextLabel", {
				Position = UDim2.fromScale(0.6, 0.35), 
				BackgroundTransparency = 1, 
				Size = UDim2.fromScale(0.15, 0.75), 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				TextStrokeTransparency = 0, 
				RichText = true, 
				Font = Enum.Font.ArialBold, 
				Text = tostring(p1.store.Kit.pigsyResources.coin), 
				TextScaled = true
			}) });
	end
};
