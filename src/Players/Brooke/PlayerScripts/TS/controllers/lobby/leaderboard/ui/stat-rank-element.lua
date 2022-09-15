-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
return {
	StatRankElement = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local v3 = { u1.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				HorizontalAlignment = Enum.HorizontalAlignment.Right, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 6)
			}) };
		local v4 = false;
		if p1.StatRank.image ~= nil then
			v4 = u1.createElement("ImageLabel", {
				Size = UDim2.new(0, 24, 0, 24), 
				Image = p1.StatRank.image, 
				ScaleType = "Fit", 
				BackgroundTransparency = 1
			});
		end;
		if v4 then
			v3[#v3 + 1] = v4;
		end;
		v3[#v3 + 1] = u1.createElement("TextLabel", {
			Text = "<b>" .. p1.StatRank.rankName .. "</b>", 
			AutomaticSize = Enum.AutomaticSize.XY, 
			BackgroundTransparency = 1, 
			Font = Enum.Font.Roboto, 
			TextSize = 14, 
			RichText = true, 
			TextXAlignment = Enum.TextXAlignment.Right, 
			TextColor3 = Color3.fromRGB(255, 255, 255), 
			LayoutOrder = 1
		});
		return u1.createElement(l__Empty__2, {
			Size = UDim2.fromScale(0, 1), 
			AutomaticSize = Enum.AutomaticSize.X, 
			LayoutOrder = p1.LayoutOrder
		}, v3);
	end)
};
