
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__Flamework__1 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__4 = v2.ColorUtil;
local l__Empty__5 = v2.Empty;
local l__SectionTitle__6 = v1.import(script, script.Parent, "section-title").SectionTitle;
return {
	QueueStats = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local v3 = p1.store.Leaderboard.queues[p1.QueueType];
		if v3 ~= nil then
			v3 = v3.wins;
		end;
		local v4 = p1.store.Leaderboard.queues[p1.QueueType];
		if v4 ~= nil then
			v4 = v4.bedBreaks;
		end;
		local v5 = p1.store.Leaderboard.queues[p1.QueueType];
		if v5 ~= nil then
			v5 = v5.finalKills;
		end;
		local v6 = p1.store.Leaderboard.queues[p1.QueueType];
		if v6 ~= nil then
			v6 = v6.highestWinStreak;
		end;
		local v7 = p1.store.Leaderboard.queues[p1.QueueType];
		if v7 ~= nil then
			v7 = v7.currentWinStreak;
		end;
		local function v8(p3, p4, p5, p6)
			return u2.createElement("TextLabel", {
				Text = p3 .. " <b>" .. p4 .. ":</b> <font color=\"" .. l__Theme__3.textPrimaryRichText .. "\">" .. tostring(p5) .. "</font>", 
				BackgroundTransparency = 1, 
				AutomaticSize = Enum.AutomaticSize.XY, 
				Font = Enum.Font.Roboto, 
				TextSize = 16, 
				RichText = true, 
				TextXAlignment = Enum.TextXAlignment.Left, 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				LayoutOrder = p6
			});
		end;
		local function v9(p7)
			local l__statElements__10 = p7.statElements;
			local function v11(p8)
				return p8;
			end;
			local v12 = table.create(#l__statElements__10);
			for v13, v14 in ipairs(l__statElements__10) do
				v12[v13] = v11(v14, v13 - 1, l__statElements__10);
			end;
			local v15 = {
				Size = UDim2.new(p7.xSize, 0, 0, 0), 
				AutomaticSize = Enum.AutomaticSize.XY, 
				BackgroundColor3 = l__ColorUtil__4.hexColor(7567033), 
				BackgroundTransparency = 0, 
				BorderSizePixel = 0
			};
			local v16 = { u2.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical, 
					VerticalAlignment = Enum.VerticalAlignment.Center, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 12)
				}), u2.createElement("UICorner", {
					CornerRadius = UDim.new(0, 3)
				}), u2.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 12), 
					PaddingBottom = UDim.new(0, 12), 
					PaddingLeft = UDim.new(0, 16), 
					PaddingRight = UDim.new(0, 16)
				}) };
			local v17 = #v16;
			for v18, v19 in ipairs(v12) do
				v16[v17 + v18] = v19;
			end;
			return u2.createElement("Frame", v15, v16);
		end;
		return u2.createElement(l__Empty__5, {
			Size = UDim2.new(1, 0, 0, 0), 
			AutomaticSize = Enum.AutomaticSize.Y, 
			LayoutOrder = p1.LayoutOrder
		}, { u2.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 8)
			}), u2.createElement(l__SectionTitle__6, {
				title = l__Flamework__1.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(p1.QueueType).title
			}), u2.createElement(l__Empty__5, {
				Size = UDim2.new(1, 0, 0, 0), 
				AutomaticSize = Enum.AutomaticSize.Y
			}, { u2.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical, 
					VerticalAlignment = Enum.VerticalAlignment.Center, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 8)
				}), u2.createElement(v9, {
					statElements = { v8("\240\159\143\134", "Wins", v3, 1) }, 
					xSize = 1
				}), u2.createElement(l__Empty__5, {
					Size = UDim2.new(1, 0, 0, 0), 
					AutomaticSize = Enum.AutomaticSize.Y
				}, { u2.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal, 
						VerticalAlignment = Enum.VerticalAlignment.Center, 
						HorizontalAlignment = Enum.HorizontalAlignment.Left, 
						SortOrder = Enum.SortOrder.LayoutOrder, 
						Padding = UDim.new(0, 8)
					}), u2.createElement(v9, {
						statElements = { v8("\240\159\155\143\239\184\143", "Bed Breaks", v4, 1), v8("\240\159\142\150\239\184\143", "Final Kills", v5, 2) }, 
						xSize = 0.491
					}), u2.createElement(v9, {
						statElements = { v8("\240\159\148\165", "Highest", v6, 1), v8("\240\159\148\165", "Current", v7, 2) }, 
						xSize = 0.491
					}) }) }) });
	end)
};

