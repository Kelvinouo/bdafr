-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__RankDistribution__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-distribution").RankDistribution;
local l__RankMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__4 = v2.Empty;
local l__ProgressBar__5 = v2.ProgressBar;
local l__ColorUtil__6 = v2.ColorUtil;
local l__Theme__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__StringUtil__8 = v2.StringUtil;
local l__SectionTitle__9 = v1.import(script, script.Parent, "section-title").SectionTitle;
return {
	RankStats = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = p1.store.Leaderboard.rankStats;
		if v4 ~= nil then
			v4 = v4.rankPoints;
		end;
		local v5 = v4;
		if v5 == nil then
			v5 = 0;
		end;
		local v6 = p1.store.Leaderboard.rankStats;
		if v6 ~= nil then
			v6 = v6.leaderboardPosition;
		end;
		local v7 = v6;
		if v7 == nil then
			v7 = -1;
		end;
		local v8 = l__RankDistribution__1:getDisplayedRank(v5, v7);
		local v9 = p1.store.Leaderboard.leaderboards.RankPoints;
		if v9 ~= nil then
			v9 = v9.leaderboardPosition;
		end;
		local v10 = p1.store.Leaderboard.rankStats;
		if v10 ~= nil then
			v10 = v10.matchesPlayed;
		end;
		local v11 = v10;
		if v11 == nil then
			v11 = 0;
		end;
		local u10 = l__RankMeta__2[v8.division];
		local v12 = {};
		if v11 >= 5 then
			local v13 = u3.createElement(function(p3)
				local v14 = { u3.createElement("UIListLayout", {
						FillDirection = "Horizontal", 
						VerticalAlignment = "Center", 
						Padding = UDim.new(0.03, 0), 
						SortOrder = "LayoutOrder"
					}), u3.createElement("ImageLabel", {
						Size = UDim2.fromScale(1, 1), 
						SizeConstraint = "RelativeYY", 
						Image = u10.image, 
						ScaleType = "Fit", 
						BackgroundTransparency = 1, 
						LayoutOrder = 1
					}) };
				local v15 = {};
				local v16 = {
					RankName = u3.createElement("TextLabel", {
						Size = UDim2.fromScale(1, 0), 
						AutomaticSize = "Y", 
						BackgroundTransparency = 1, 
						Text = "<b>" .. u10.name .. "</b>", 
						TextColor3 = l__ColorUtil__6.WHITE, 
						TextSize = 12, 
						RichText = true, 
						TextXAlignment = "Left", 
						LayoutOrder = 1
					}),
					(u3.createElement("UIListLayout", {
						FillDirection = "Vertical", 
						HorizontalAlignment = "Left", 
						Padding = UDim.new(0, 6), 
						SortOrder = "LayoutOrder"
					}))
				};
				local v17 = {
					Size = UDim2.fromScale(1, 0), 
					AutomaticSize = "Y", 
					BackgroundTransparency = 1
				};
				if v9 ~= 0 and v9 == v9 and v9 then
					local v18 = l__StringUtil__8.formatNumberWithCommas(v9);
				else
					v18 = "Not on leaderboard";
				end;
				v17.Text = "Leaderboard Rank: <b><font color=\"" .. l__Theme__7.textPrimaryRichText .. "\">" .. v18 .. "</font></b>";
				v17.TextColor3 = Color3.fromRGB(207, 209, 231);
				v17.TextSize = 10;
				v17.RichText = true;
				v17.TextXAlignment = "Left";
				v17.LayoutOrder = 2;
				v16.LeaderboardRank = u3.createElement("TextLabel", v17);
				v15[1] = u3.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					HorizontalAlignment = "Left", 
					Padding = UDim.new(0, 12), 
					SortOrder = "LayoutOrder"
				});
				v15[2] = u3.createElement(l__Empty__4, {
					Size = UDim2.fromScale(1, 0.6)
				}, v16);
				if not u10.noRPLimit then
					local v19 = {};
					local v20 = {
						Size = UDim2.fromScale(0.85, 0.5)
					};
					local v21 = v8.rankPoints;
					if v21 == nil then
						v21 = 0;
					end;
					v20.Progress = v21 / 100;
					v20.AcceptZero = true;
					v20.LayoutOrder = 3;
					v20.BarColor = u10.color;
					v19[#v19 + 1] = u3.createElement(l__ProgressBar__5, v20);
					v19.CurrentRP = u3.createFragment({
						CurrentRP = u3.createElement("TextLabel", {
							Size = UDim2.fromScale(0.85, 0), 
							AutomaticSize = "Y", 
							BackgroundTransparency = 1, 
							Text = "<b><font color=\"#ffffff\">" .. tostring(v8.rankPoints) .. " RP</font></b> / " .. tostring(100), 
							RichText = true, 
							TextSize = 10, 
							TextColor3 = Color3.fromRGB(207, 209, 231), 
							TextXAlignment = "Right", 
							LayoutOrder = 4
						})
					});
					local v22 = u3.createFragment(v19);
				else
					v22 = u3.createFragment({
						CurrentRP = u3.createElement("TextLabel", {
							Size = UDim2.fromScale(0.85, 0), 
							AutomaticSize = "Y", 
							BackgroundTransparency = 1, 
							Text = "<b><font color=\"#ffffff\">" .. tostring(v8.rankPoints) .. " RP</font></b>", 
							RichText = true, 
							TextSize = 10, 
							TextColor3 = Color3.fromRGB(207, 209, 231), 
							TextXAlignment = "Left", 
							LayoutOrder = 4
						})
					});
				end;
				local v23 = { u3.createElement("UIListLayout", {
						FillDirection = "Vertical", 
						HorizontalAlignment = "Left", 
						Padding = UDim.new(0, 6), 
						SortOrder = "LayoutOrder"
					}) };
				v23[#v23 + 1] = v22;
				v15[#v15 + 1] = u3.createElement(l__Empty__4, {
					Size = UDim2.fromScale(1, 0.4)
				}, v23);
				v14[#v14 + 1] = u3.createElement(l__Empty__4, {
					Size = UDim2.fromScale(0.7, 0.9), 
					LayoutOrder = 2
				}, v15);
				return u3.createElement(l__Empty__4, {
					Size = p3.Size
				}, v14);
			end, {
				Size = UDim2.new(1, 0, 1, -32)
			});
		else
			v13 = u3.createElement(function(p4)
				return u3.createFragment({
					ProvisionalMatchesProgress = u3.createElement(l__Empty__4, {
						Size = p4.Size
					}, {
						ProvisionalInfo = u3.createElement("TextLabel", {
							Size = UDim2.new(1, 0, 0.4, 0), 
							BackgroundTransparency = 1, 
							Text = "<b>Complete 5 placement games to unlock your rank</b>", 
							RichText = true, 
							TextSize = 10, 
							TextColor3 = Color3.fromRGB(255, 255, 255), 
							TextXAlignment = "Center", 
							LayoutOrder = 4
						}),
						u3.createElement(l__Empty__4, {
							Position = UDim2.fromScale(0, 0.4), 
							Size = UDim2.new(1, 0, 0.6, 0)
						}, {
							ProvisionalMatchesPlayed = u3.createElement("TextLabel", {
								Size = UDim2.fromScale(0.85, 0), 
								AutomaticSize = "Y", 
								BackgroundTransparency = 1, 
								Text = "<b><font color=\"#ffffff\">" .. tostring(v11) .. " games</font></b> / " .. tostring(5), 
								RichText = true, 
								TextSize = 10, 
								TextColor3 = Color3.fromRGB(207, 209, 231), 
								TextXAlignment = "Right", 
								LayoutOrder = 2
							}),
							u3.createElement("UIListLayout", {
								FillDirection = "Vertical", 
								HorizontalAlignment = "Center", 
								VerticalAlignment = "Center", 
								Padding = UDim.new(0, 6), 
								SortOrder = "LayoutOrder"
							}), (u3.createElement(l__ProgressBar__5, {
								Size = UDim2.fromScale(0.85, 0.5), 
								Progress = v11 / 5, 
								AcceptZero = true, 
								LayoutOrder = 1
							}))
						})
					})
				});
			end, {
				Size = UDim2.new(1, 0, 1, -32)
			});
		end;
		v12[1] = u3.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical, 
			VerticalAlignment = Enum.VerticalAlignment.Top, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 12)
		});
		v12[2] = u3.createElement(l__SectionTitle__9, {
			title = "Ranked", 
			SectionDivider = true
		});
		v12[3] = v13;
		return u3.createElement(l__Empty__4, {
			Size = UDim2.new(1, 0, 0, 112)
		}, v12);
	end)
};
