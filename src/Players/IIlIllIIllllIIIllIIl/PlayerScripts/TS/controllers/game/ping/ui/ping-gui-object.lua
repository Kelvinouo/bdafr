-- Script Hash: 530971213269f9c9348070f2b63c548bcbc74f3c7f704cd07c40f3d02385d327879413aa76008ba3b58e59bd7f50ddd5
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ColorUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
return {
	PingGuiObject = v3("Frame", {
		Name = "Container", 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		Size = UDim2.fromScale(1, 1), 
		BackgroundTransparency = 1, 
		Children = { v3("ImageLabel", {
				Name = "PingIcon", 
				AnchorPoint = Vector2.new(0.5, 1), 
				Position = UDim2.fromScale(0.5, 0.85), 
				Size = UDim2.fromScale(0.6, 0.6), 
				BackgroundTransparency = 1, 
				Image = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId.INDICATOR_ICON
			}), v3("TextLabel", {
				Name = "DistanceTracker", 
				Text = "", 
				Size = UDim2.fromScale(0.6, 0.35), 
				AnchorPoint = Vector2.new(0, 0.5), 
				Position = UDim2.fromScale(0.9, 0.9), 
				TextScaled = true, 
				RichText = true, 
				Font = Enum.Font.Roboto, 
				TextColor3 = l__ColorUtil__2.WHITE, 
				BackgroundTransparency = 1, 
				Children = { v3("UIStroke", {
						Color = l__ColorUtil__2.BLACK
					}) }
			}), v3("ImageLabel", {
				Name = "PingCreatorAvatar", 
				AnchorPoint = Vector2.new(0, 0.5), 
				Position = UDim2.fromScale(0.9, 0.4), 
				Size = UDim2.fromScale(0.5, 0.5), 
				BackgroundTransparency = 1, 
				Image = "", 
				Children = { v3("UICorner", {
						CornerRadius = UDim.new(1, 0)
					}), v3("UIAspectRatioConstraint", {
						AspectRatio = 1
					}) }
			}) }
	})
};
