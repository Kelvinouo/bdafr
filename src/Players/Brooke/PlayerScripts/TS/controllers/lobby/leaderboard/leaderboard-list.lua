-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__SectionDivider__2 = v1.import(script, script.Parent.Parent, "stats-board", "ui", "section-divider").SectionDivider;
local l__ColorUtil__3 = v2.ColorUtil;
local u4 = v2.GetTarmacAsset("CrownIcon");
local l__Empty__5 = v2.Empty;
local l__Theme__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__StatRankElement__7 = v1.import(script, script.Parent, "ui", "stat-rank-element").StatRankElement;
local l__AutoCanvasScrollingFrame__8 = v2.AutoCanvasScrollingFrame;
return {
	LeaderboardList = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = {};
		local v5 = {
			ScrollingDirection = Enum.ScrollingDirection.Y
		};
		for v6, v7 in pairs(p1.FrameProps) do
			v5[v6] = v7;
		end;
		v4.ScrollingFrameProps = v5;
		local l__users__8 = p1.LeaderboardData.users;
		local function u9()
			return u1.createFragment({
				TopThreeDivider = u1.createElement("Frame", {
					Position = UDim2.fromOffset(0, 48), 
					Size = UDim2.new(1, 0, 0, 4), 
					BackgroundTransparency = 1
				}, { u1.createElement(l__SectionDivider__2) })
			});
		end;
		local function v9(p3, p4)
			local v10 = {};
			local v11 = { u1.createElement("UICorner", {
					CornerRadius = UDim.new(0, 5)
				}) };
			if p4 < 3 then
				local v12 = {};
				local v13 = {
					Position = UDim2.fromOffset(-10, -12), 
					Size = UDim2.fromOffset(26, 20.8), 
					BackgroundTransparency = 1, 
					Rotation = -25, 
					Image = u4.Image, 
					ImageRectOffset = u4.ImageRectOffset, 
					ImageRectSize = u4.ImageRectSize
				};
				if p4 == 0 then
					local v14 = Color3.fromRGB(255, 192, 79);
				elseif p4 == 1 then
					v14 = Color3.fromRGB(229, 206, 172);
				else
					v14 = Color3.fromRGB(255, 142, 80);
				end;
				v13.ImageColor3 = v14;
				v12.CrownIcon = u1.createElement("ImageLabel", v13);
				local v15 = u1.createFragment(v12);
			else
				v15 = nil;
			end;
			if v15 then
				v11[#v11 + 1] = v15;
			end;
			local v16 = {
				PlayerContainer = u1.createElement(l__Empty__5, {
					Size = UDim2.new(0.6, 0, 1, 0)
				}, {
					LeaderboardRank = u1.createElement("TextLabel", {
						Text = "<b>" .. tostring(p4 + 1) .. "</b>", 
						AutomaticSize = "XY", 
						BackgroundTransparency = 1, 
						Font = Enum.Font.RobotoMono, 
						TextSize = 18, 
						RichText = true, 
						TextXAlignment = Enum.TextXAlignment.Left, 
						TextColor3 = l__Theme__6.textPrimary, 
						LayoutOrder = 1
					}), 
					PlayerAvatar = u1.createElement("ImageLabel", {
						Size = UDim2.fromOffset(24, 24), 
						BackgroundColor3 = Color3.new(0.95, 0.95, 0.95), 
						Image = p3.avatarImage, 
						LayoutOrder = 2
					}, { u1.createElement("UICorner", {
							CornerRadius = UDim.new(1, 0)
						}) }), 
					PlayerUsername = u1.createElement("TextLabel", {
						Text = "<b><font color=\"rgb(185, 188, 255)\">@</font></b>" .. p3.username, 
						RichText = true, 
						BackgroundTransparency = 1, 
						Font = Enum.Font.RobotoMono, 
						TextScaled = true, 
						Size = UDim2.new(1, -60, 0, 18), 
						TextXAlignment = Enum.TextXAlignment.Left, 
						TextColor3 = Color3.fromRGB(255, 255, 255), 
						AutoLocalize = false, 
						LayoutOrder = 3
					}),
					(u1.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal, 
						VerticalAlignment = Enum.VerticalAlignment.Center, 
						HorizontalAlignment = Enum.HorizontalAlignment.Left, 
						SortOrder = Enum.SortOrder.LayoutOrder, 
						Padding = UDim.new(0, 10)
					}))
				}),
				u1.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal, 
					VerticalAlignment = Enum.VerticalAlignment.Center, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 10)
				}), (u1.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 10), 
					PaddingRight = UDim.new(0, 10)
				}))
			};
			local v17 = { u1.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal, 
					VerticalAlignment = Enum.VerticalAlignment.Center, 
					HorizontalAlignment = Enum.HorizontalAlignment.Right, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 10)
				}) };
			local v18 = p3.statRank and u1.createElement(l__StatRankElement__7, {
				StatRank = p3.statRank, 
				LayoutOrder = 1
			});
			if v18 then
				v17[#v17 + 1] = v18;
			end;
			local v19 = {};
			if p3.statRank then
				local v20 = p3.statRank.rankStatValue;
			else
				v20 = p3.statValue;
			end;
			v19.Text = "<b>" .. string.gsub(string.reverse((string.gsub(string.reverse((tostring(v20))), "%d%d%d", "%1,"))), "^,", "") .. " " .. p1.LeaderboardData.metric .. "</b>";
			v19.AutomaticSize = Enum.AutomaticSize.XY;
			v19.BackgroundTransparency = 1;
			v19.Font = Enum.Font.Roboto;
			v19.TextSize = 14;
			v19.RichText = true;
			v19.TextXAlignment = Enum.TextXAlignment.Right;
			v19.TextColor3 = l__Theme__6.textPrimary;
			v19.LayoutOrder = 2;
			v17.StatValue = u1.createElement("TextLabel", v19);
			v16.StatValuesContainer = u1.createElement(l__Empty__5, {
				Size = UDim2.new(0.4, -10, 1, 0)
			}, v17);
			v11.UserLeaderBoardDataContainer = u1.createElement(l__Empty__5, {
				Size = UDim2.fromScale(1, 1)
			}, v16);
			v10.LeaderboardElementBody = u1.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 0), 
				BorderSizePixel = 0, 
				BackgroundColor3 = l__ColorUtil__3.hexColor(7567033)
			}, v11);
			if p4 + 1 == 3 then
				local v21 = u1.createElement(u9);
			else
				v21 = nil;
			end;
			if v21 then
				v10[#v10 + 1] = v21;
			end;
			return u1.createFragment({
				LeaderboardElementContainer = u1.createElement(l__Empty__5, {
					Size = UDim2.new(0.98, 0, 0, 38), 
					LayoutOrder = p4
				}, v10)
			});
		end;
		local v22 = table.create(#l__users__8);
		for v23, v24 in ipairs(l__users__8) do
			v22[v23] = v9(v24, v23 - 1, l__users__8);
		end;
		local v25 = { u1.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 10)
			}) };
		local v26 = #v25;
		for v27, v28 in ipairs(v22) do
			v25[v26 + v27] = v28;
		end;
		return u1.createElement(l__AutoCanvasScrollingFrame__8, v4, v25);
	end)
};
