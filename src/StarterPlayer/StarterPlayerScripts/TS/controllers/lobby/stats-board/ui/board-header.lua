
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Players__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
return {
	StatsBoardHeader = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local v2 = l__Players__1.LocalPlayer;
		if v2 ~= nil then
			v2 = v2.DisplayName;
		end;
		local v3 = v2;
		if v3 == nil then
			v3 = "ology";
		end;
		return u2.createElement("ImageLabel", {
			Image = "rbxassetid://7106394844", 
			Size = UDim2.fromScale(1, 0.1), 
			BorderSizePixel = 0
		}, { u2.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 2)
			}), u2.createElement("UIPadding", {
				PaddingTop = UDim.new(0.1, 0), 
				PaddingBottom = UDim.new(0.1, 0), 
				PaddingLeft = UDim.new(0.075, 0), 
				PaddingRight = UDim.new(0.075, 0)
			}), u2.createElement("TextLabel", {
				Text = "<b>" .. v3 .. "'s Stats</b>", 
				Size = UDim2.fromScale(1, 0.5), 
				BackgroundTransparency = 1, 
				Font = Enum.Font.Roboto, 
				TextScaled = true, 
				RichText = true, 
				TextXAlignment = Enum.TextXAlignment.Left, 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				AutoLocalize = false
			}), u2.createElement("TextLabel", {
				Text = "<b>All-Time</b>", 
				Size = UDim2.fromScale(1, 0.35), 
				BackgroundTransparency = 1, 
				Font = Enum.Font.Roboto, 
				TextScaled = true, 
				RichText = true, 
				TextXAlignment = Enum.TextXAlignment.Left, 
				TextColor3 = l__Theme__3.textPrimary
			}) });
	end)
};

