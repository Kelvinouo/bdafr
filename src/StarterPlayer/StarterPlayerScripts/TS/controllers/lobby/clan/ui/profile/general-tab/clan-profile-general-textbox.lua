-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__2 = v2.Empty;
local l__ColorUtil__3 = v2.ColorUtil;
return {
	ClanProfileGeneralTextBox = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = {};
		for v5, v6 in pairs(p1) do
			v4[v5] = v6;
		end;
		v4.Title = nil;
		v4.Text = nil;
		v4.BorderBottom = nil;
		v4[u1.Children] = nil;
		local v7 = {};
		for v8, v9 in pairs(v4) do
			v7[v8] = v9;
		end;
		local v10 = { u1.createElement(l__Empty__2, {
				Size = UDim2.fromScale(1, 1)
			}, { u1.createElement("UIPadding", {
					PaddingLeft = UDim.new(0.05, 0), 
					PaddingRight = UDim.new(0.05, 0), 
					PaddingBottom = UDim.new(0.1, 0), 
					PaddingTop = UDim.new(0.1, 0)
				}), u1.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					Padding = UDim.new(0.05, 0), 
					SortOrder = "LayoutOrder"
				}), u1.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0), 
					AutomaticSize = "Y", 
					SizeConstraint = "RelativeXX", 
					TextColor3 = l__ColorUtil__3.WHITE, 
					Font = "Roboto", 
					Text = "<b>" .. p1.Title .. "</b>", 
					TextXAlignment = "Left", 
					TextYAlignment = "Top", 
					TextScaled = true, 
					RichText = true, 
					BackgroundTransparency = 1, 
					LayoutOrder = 2
				}, { u1.createElement("UITextSizeConstraint", {
						MaxTextSize = 18
					}) }), u1.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0.9), 
					TextColor3 = l__ColorUtil__3.WHITE, 
					Font = "Roboto", 
					Text = p1.Text, 
					TextXAlignment = "Left", 
					TextYAlignment = "Top", 
					TextScaled = true, 
					RichText = true, 
					TextTransparency = 0.3, 
					BackgroundTransparency = 1, 
					LayoutOrder = 3
				}, { u1.createElement("UITextSizeConstraint", {
						MaxTextSize = 18
					}) }) }) };
		local v11 = p1.BorderBottom and u1.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 1), 
			Position = UDim2.fromScale(0, 1), 
			AnchorPoint = Vector2.new(0, 1), 
			BackgroundColor3 = l__ColorUtil__3.WHITE, 
			BackgroundTransparency = 0.8, 
			BorderSizePixel = 0
		});
		if v11 then
			v10[#v10 + 1] = v11;
		end;
		return u1.createElement("Frame", v7, v10);
	end)
};
