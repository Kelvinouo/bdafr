
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__SectionDivider__3 = v1.import(script, script.Parent, "section-divider").SectionDivider;
local l__Empty__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
return {
	SectionTitle = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local v2 = {
			Size = UDim2.new(1, 0, 0, 0), 
			AutomaticSize = "Y"
		};
		local v3 = { u1.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 4)
			}), u1.createElement("TextLabel", {
				Text = "<b>" .. p1.title .. "</b>", 
				TextColor3 = l__Theme__2.textPrimary, 
				TextXAlignment = Enum.TextXAlignment.Left, 
				AutomaticSize = Enum.AutomaticSize.Y, 
				Font = Enum.Font.Roboto, 
				TextSize = 18, 
				RichText = true, 
				BorderSizePixel = 0
			}) };
		local v4 = p1.SectionDivider and u1.createElement(l__SectionDivider__3);
		if v4 then
			v3[#v3 + 1] = v4;
		end;
		return u1.createElement(l__Empty__4, v2, v3);
	end)
};

