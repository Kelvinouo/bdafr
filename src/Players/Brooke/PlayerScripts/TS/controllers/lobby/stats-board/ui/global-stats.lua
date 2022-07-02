-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local function u1(p1)
	local u2 = 0;
	local u3 = 0;
	local v2 = table.create(#p1);
	for v3, v4 in ipairs(p1) do
		u2 = u2 + v4[2].bedBreaks;
		u3 = u3 + v4[2].finalKills;
		v2[v3] = 0;
	end;
	return {
		globalBedBreaks = u2, 
		globalFinalKills = u3
	};
end;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__SectionTitle__7 = v1.import(script, script.Parent, "section-title").SectionTitle;
local l__Empty__8 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
return {
	GlobalStats = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u5)(function(p2, p3)
		local v5 = u1(u4.entries(p2.store.Leaderboard.queues));
		local v6 = p2.store.Leaderboard.globalStats;
		if v6 ~= nil then
			v6 = v6.wins;
		end;
		local v7 = {
			Size = UDim2.new(1, 0, 0, 0), 
			AutomaticSize = Enum.AutomaticSize.Y
		};
		local v8 = { u5.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 12)
			}), u5.createElement(l__SectionTitle__7, {
				title = "Global Totals", 
				SectionDivider = true
			}) };
		local v9 = {
			Size = UDim2.new(1, 0, 0, 0), 
			AutomaticSize = Enum.AutomaticSize.Y
		};
		local v10 = { u5.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 8)
			}) };
		local v11 = u4.entries({
			Wins = {
				layoutOrder = 1, 
				value = v6
			}, 
			["Bed Breaks"] = {
				layoutOrder = 2, 
				value = v5.globalBedBreaks
			}, 
			["Final Kills"] = {
				layoutOrder = 3, 
				value = v5.globalFinalKills
			}
		});
		local function u9(p4, p5, p6)
			return u5.createElement("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Size = UDim2.new(0.32, 0, 0, 0), 
				AutomaticSize = Enum.AutomaticSize.Y, 
				BackgroundColor3 = l__Theme__6.backgroundSecondary, 
				LayoutOrder = p6
			}, { u5.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical, 
					VerticalAlignment = Enum.VerticalAlignment.Center, 
					HorizontalAlignment = Enum.HorizontalAlignment.Center, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 4)
				}), u5.createElement("UICorner", {
					CornerRadius = UDim.new(0, 3)
				}), u5.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 8), 
					PaddingBottom = UDim.new(0, 8), 
					PaddingLeft = UDim.new(0.075, 0), 
					PaddingRight = UDim.new(0.075, 0)
				}), u5.createElement("TextLabel", {
					Text = "<b>" .. p4 .. "</b>", 
					AutomaticSize = Enum.AutomaticSize.XY, 
					Position = UDim2.new(0, 10, 0.5, 0), 
					AnchorPoint = Vector2.new(0, 0.5), 
					BackgroundTransparency = 1, 
					Font = Enum.Font.Roboto, 
					TextSize = 15, 
					RichText = true, 
					TextXAlignment = Enum.TextXAlignment.Center, 
					TextTransparency = 0.4, 
					TextColor3 = l__Theme__6.textPrimary
				}), u5.createElement("TextLabel", {
					Text = "<b>" .. tostring(p5) .. "</b>", 
					AutomaticSize = Enum.AutomaticSize.XY, 
					Position = UDim2.new(0, 10, 0.5, 0), 
					AnchorPoint = Vector2.new(0, 0.5), 
					BackgroundTransparency = 1, 
					Font = Enum.Font.Roboto, 
					TextSize = 19, 
					RichText = true, 
					TextXAlignment = Enum.TextXAlignment.Left, 
					TextColor3 = Color3.fromRGB(255, 255, 255)
				}) });
		end;
		local v12 = table.create(#v11);
		for v13, v14 in ipairs(v11) do
			local v15 = v14[2];
			local v16 = v15.value;
			if v16 == nil then
				v16 = 0;
			end;
			v12[v13] = u9(v14[1], v16, v15.layoutOrder);
		end;
		local v17 = {
			Size = UDim2.new(1, 0, 0, 0), 
			AutomaticSize = Enum.AutomaticSize.Y
		};
		local v18 = { u5.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 8)
			}) };
		local v19 = #v18;
		for v20, v21 in ipairs(v12) do
			v18[v19 + v20] = v21;
		end;
		v10[#v10 + 1] = u5.createElement(l__Empty__8, v17, v18);
		v8[#v8 + 1] = u5.createElement(l__Empty__8, v9, v10);
		return u5.createElement(l__Empty__8, v7, v8);
	end)
};
