-- Script Hash: f235d26bbc1d6822ff4d9654040dd4d6377737203167ec2660105cf89701ddf6702de7eed91aacb4c36bcd85713c00c8
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__Theme__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__CornerFiller__3 = v2.CornerFiller;
local l__ColorUtil__4 = v2.ColorUtil;
local l__ImageId__5 = v2.ImageId;
local l__ButtonComponent__6 = v2.ButtonComponent;
return {
	SocialConnectionsConnectInfoCard = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = p1.Size;
		if v4 == nil then
			v4 = UDim2.new(1, 0, 0, 46);
		end;
		local v5 = { u2.createElement("UICorner", {
				CornerRadius = UDim.new(0, 5)
			}) };
		local v6 = p1.CornerFill and u2.createElement(l__CornerFiller__3, {
			BottomLeft = true, 
			BottomRight = true
		});
		if v6 then
			v5[#v5 + 1] = v6;
		end;
		local v7 = #v5;
		local v8 = { u2.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 10), 
				PaddingBottom = UDim.new(0, 10), 
				PaddingLeft = UDim.new(0, 10), 
				PaddingRight = UDim.new(0, 10)
			}), u2.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 12)
			}), u2.createElement("ImageLabel", {
				Size = UDim2.fromScale(0.75, 0.75), 
				ScaleType = "Fit", 
				SizeConstraint = "RelativeYY", 
				Image = p1.ImageId, 
				ImageColor3 = l__Theme__1.textPrimary, 
				BackgroundTransparency = 1
			}) };
		local v9 = { u2.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 0)
			}), u2.createElement("TextLabel", {
				AutomaticSize = Enum.AutomaticSize.XY, 
				Text = p1.Text, 
				TextColor3 = l__ColorUtil__4.WHITE, 
				TextXAlignment = Enum.TextXAlignment.Left, 
				RichText = true, 
				Font = Enum.Font.Roboto, 
				TextSize = 15, 
				BackgroundTransparency = 1
			}) };
		local v10 = p1.MiddleElementEmbed and u2.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.XY, 
			BackgroundTransparency = 1
		}, { u2.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 5)
			}), u2.createElement("Frame", {
				Size = UDim2.fromOffset(18, 12.5), 
				BackgroundTransparency = 1
			}, { u2.createElement("ImageLabel", {
					Size = UDim2.fromOffset(18, 12.5), 
					Rotation = 47, 
					ScaleType = "Fit", 
					SizeConstraint = "RelativeYY", 
					Image = l__ImageId__5.WIFI_SOLID, 
					ImageColor3 = l__ColorUtil__4.hexColor(16752398), 
					BackgroundTransparency = 1
				}) }), u2.createElement("TextLabel", {
				AutomaticSize = Enum.AutomaticSize.XY, 
				Text = p1.MiddleElementEmbed.rightText, 
				TextColor3 = l__ColorUtil__4.WHITE, 
				TextXAlignment = Enum.TextXAlignment.Left, 
				RichText = true, 
				Font = Enum.Font.Roboto, 
				TextSize = 15, 
				BackgroundTransparency = 1
			}) });
		if v10 then
			v9[#v9 + 1] = v10;
		end;
		v8[#v8 + 1] = u2.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0), 
			BackgroundTransparency = 1
		}, v9);
		v5[v7 + 1] = u2.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0), 
			BackgroundTransparency = 1
		}, v8);
		local v11 = p1[u2.Children];
		if v11 then
			local v12, v13, v14 = pairs(v11);
			while true do
				local v15 = nil;
				local v16 = nil;
				v16, v15 = v12(v13, v14);
				if not v16 then
					break;
				end;
				v14 = v16;
				if type(v16) == "number" then
					v5[v7 + 1 + v16] = v15;
				else
					v5[v16] = v15;
				end;			
			end;
		end;
		local v17 = p1.Button and (not p1.ButtonHidden and u2.createElement(l__ButtonComponent__6, {
			AnchorPoint = Vector2.new(1, 0.5), 
			Position = UDim2.new(1, -10, 0.5, 0), 
			Size = UDim2.new(0.25, -10, 0.5, 0), 
			Text = p1.Button.text, 
			OnClick = p1.Button.onClick
		}));
		if v17 then
			v5[#v5 + 1] = v17;
		end;
		return u2.createElement("Frame", {
			Size = v4, 
			BackgroundColor3 = l__Theme__1.backgroundTertiary, 
			BackgroundTransparency = 0, 
			BorderSizePixel = 1, 
			LayoutOrder = p1.LayoutOrder
		}, v5);
	end)
};
