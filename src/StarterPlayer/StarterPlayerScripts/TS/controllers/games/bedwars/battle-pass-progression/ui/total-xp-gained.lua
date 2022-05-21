-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TweenService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__ColorUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
return {
	TotalXpGained = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local u4 = u1.createRef();
		p2.useEffect(function()
			local v3 = l__TweenService__2:Create(u4:getValue(), TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.In, 0, true), {
				TextSize = 38
			});
			if u4:getValue().Name ~= "TotalExpGained" then
				v3:Play();
				return;
			end;
			u4:getValue().Name = "TotalExpGainedRendered";
		end, { p1.TotalExpGained });
		return u1.createFragment({
			TotalExpGainedContainer = u1.createElement("Frame", {
				Size = UDim2.fromScale(1, 0.3), 
				BorderSizePixel = 0, 
				BackgroundTransparency = 1, 
				LayoutOrder = p1.LayoutOrder
			}, {
				TotalExpGained = u1.createElement("TextLabel", {
					Size = UDim2.new(0, 0, 0, 20), 
					AutomaticSize = Enum.AutomaticSize.X, 
					BackgroundTransparency = 1, 
					Text = "<b><font color=\"#FFF06B\">+" .. tostring(math.ceil(p1.TotalExpGained)) .. "</font> XP</b>", 
					TextColor3 = l__ColorUtil__3.WHITE, 
					RichText = true, 
					Font = Enum.Font.Roboto, 
					TextSize = 32, 
					LayoutOrder = 1, 
					[u1.Ref] = u4
				}), 
				Label = u1.createElement("TextLabel", {
					Size = UDim2.new(0, 0, 0, 20), 
					AutomaticSize = Enum.AutomaticSize.X, 
					BackgroundTransparency = 1, 
					Text = "<b>TOTAL XP</b>", 
					TextColor3 = l__ColorUtil__3.WHITE, 
					TextTransparency = 0.3, 
					RichText = true, 
					Font = Enum.Font.Roboto, 
					TextSize = 16, 
					LayoutOrder = 2
				}),
				(u1.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical, 
					HorizontalAlignment = Enum.HorizontalAlignment.Center, 
					VerticalAlignment = Enum.VerticalAlignment.Top, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 12)
				}))
			})
		});
	end)
};
