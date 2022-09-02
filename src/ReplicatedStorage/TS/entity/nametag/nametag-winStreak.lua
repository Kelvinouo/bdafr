-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return {
	NameTagWinStreak = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local v3 = {};
		for v4, v5 in pairs(p1) do
			v3[v4] = v5;
		end;
		v3.WinStreak = nil;
		local v6 = {
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Visible = true, 
			LayoutOrder = 3
		};
		for v7, v8 in pairs(v3) do
			v6[v7] = v8;
		end;
		return u1.createFragment({
			WinStreakCounter = u1.createElement("Frame", v6, {
				WinStreakFire = u1.createElement("ImageLabel", {
					Image = "rbxassetid://7101948108", 
					Size = UDim2.fromScale(1, 1), 
					SizeConstraint = Enum.SizeConstraint.RelativeYY, 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					ScaleType = Enum.ScaleType.Fit, 
					LayoutOrder = 1
				}), 
				WinStreakValue = u1.createElement("TextLabel", {
					Text = tostring(p1.WinStreak), 
					Size = UDim2.fromScale(2, 0.9), 
					TextColor3 = Color3.fromRGB(255, 255, 255), 
					Font = Enum.Font.Roboto, 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					TextScaled = true, 
					RichText = true, 
					TextXAlignment = Enum.TextXAlignment.Left, 
					LayoutOrder = 2, 
					AutoLocalize = false
				}, { u1.createElement("UIPadding", {
						PaddingLeft = UDim.new(0.05, 0)
					}) }),
				(u1.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					VerticalAlignment = Enum.VerticalAlignment.Center, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 0)
				}))
			})
		});
	end)
};
