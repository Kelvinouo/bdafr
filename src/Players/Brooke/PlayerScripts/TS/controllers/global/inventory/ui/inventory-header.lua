-- Script Hash: df0bbdc4eaefae2c7608a24b786c16ac5f582689f1a318890511e88c74c62921d6522966b2efcf7dfd0deef06672066f
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Workspace__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return {
	InventoryHeader = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__2 = p2.useState;
		return u2.createElement("TextLabel", {
			Text = "<b>" .. p1.Title .. "</b>", 
			Size = UDim2.new(1, 0, 0, 0.03 * l__Workspace__1.CurrentCamera.ViewportSize.Y), 
			TextScaled = true, 
			Font = "Roboto", 
			RichText = true, 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			TextXAlignment = "Left", 
			TextColor3 = Color3.fromRGB(255, 255, 255)
		});
	end)
};
