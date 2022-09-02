-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("TNTWarsLogo");
function v3.init(p1)

end;
local l__TNT_WARS_IMAGE_ID__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "tnt-wars-constants").TNT_WARS_IMAGE_ID;
function v3.render(p2)
	return v2.createFragment({ v2.createElement("ImageLabel", {
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Image = l__TNT_WARS_IMAGE_ID__1.LOGO, 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, -0.27), 
			SizeConstraint = Enum.SizeConstraint.RelativeXX, 
			Size = UDim2.fromScale(0.1, 0.1)
		}), v2.createElement("TextLabel", {
			Text = "WARS!", 
			TextScaled = true, 
			RichText = true, 
			Position = UDim2.fromScale(0.535, -0.205), 
			Size = UDim2.fromScale(0.1, 0.1), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			BackgroundTransparency = 1, 
			Font = Enum.Font.Arcade, 
			Rotation = -21, 
			TextColor3 = Color3.fromRGB(255, 255, 255), 
			TextStrokeColor3 = Color3.fromRGB(0, 0, 0), 
			TextStrokeTransparency = 0, 
			ZIndex = 4
		}) });
end;
return {
	TNTWarsLogo = v3
};
