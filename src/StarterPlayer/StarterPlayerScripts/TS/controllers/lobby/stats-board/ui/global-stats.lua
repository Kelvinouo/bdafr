-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local function u1(p1)
	local u2 = 0;
	local u3 = 0;
	local function v2(p2)
		u2 = u2 + p2[2].bedBreaks;
		u3 = u3 + p2[2].finalKills;
		return 0;
	end;
	local v3 = table.create(#p1);
	for v4, v5 in ipairs(p1) do
		v3[v4] = v2(v5, v4 - 1, p1);
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
	GlobalStats = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u5)(function(p3, p4)
		local v6 = u1(u4.entries(p3.store.Leaderboard.queues));
		local v7 = p3.store.Leaderboard.globalStats;
		if v7 ~= nil then
			v7 = v7.wins;
		end;
		local v8 = {
			Size = UDim2.new(1, 0, 0, 0), 
			AutomaticSize = Enum.AutomaticSize.Y
		};
		local v9 = { u5.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 12)
			}), u5.createElement(l__SectionTitle__7, {
				title = "Global Totals", 
				SectionDivider = true
			}) };
		local v10 = {
			Size = UDim2.new(1, 0, 0, 0), 
			AutomaticSize = Enum.AutomaticSize.Y
		};
		local v11 = { u5.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 8)
			}) };
		local v12 = u4.entries({
			Wins = {
				layoutOrder = 1, 
				value = v7
			}, 
			["Bed Breaks"] = {
				layoutOrder = 2, 
				value = v6.globalBedBreaks
			}, 
			["Final Kills"] = {
				layoutOrder = 3, 
				value = v6.globalFinalKills
			}
		});
		local function u9(p5, p6, p7)
			return u5.createElement("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Size = UDim2.new(0.32, 0, 0, 0), 
				AutomaticSize = Enum.AutomaticSize.Y, 
				BackgroundColor3 = l__Theme__6.backgroundSecondary, 
				LayoutOrder = p7
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
					Text = "<b>" .. p5 .. "</b>", 
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
					Text = "<b>" .. tostring(p6) .. "</b>", 
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
		local function v13(p8)
			local v14 = p8[2];
			local v15 = v14.value;
			if v15 == nil then
				v15 = 0;
			end;
			return u9(p8[1], v15, v14.layoutOrder);
		end;
		local v16 = table.create(#v12);
		for v17, v18 in ipairs(v12) do
			v16[v17] = v13(v18, v17 - 1, v12);
		end;
		local v19 = {
			Size = UDim2.new(1, 0, 0, 0), 
			AutomaticSize = Enum.AutomaticSize.Y
		};
		local v20 = { u5.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 8)
			}) };
		local v21 = #v20;
		for v22, v23 in ipairs(v16) do
			v20[v21 + v22] = v23;
		end;
		v11[#v11 + 1] = u5.createElement(l__Empty__8, v19, v20);
		v9[#v9 + 1] = u5.createElement(l__Empty__8, v10, v11);
		return u5.createElement(l__Empty__8, v8, v9);
	end)
};
