
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BedwarsImageId__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__Players__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__tabListLayout__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config").tabListLayout;
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__TabListRank__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-ranks.dto").TabListRank;
local l__PlayerRankIcon__7 = v1.import(script, script.Parent, "player-rank-icon").PlayerRankIcon;
local l__ColorUtil__8 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
return {
	PlayerName = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local v2 = nil;
		local v3 = nil;
		if p1.store.TabList.ranks[tostring(p1.Player.userId)] then
			v2 = p1.store.TabList.ranks[tostring(p1.Player.userId)];
		end;
		if p1.store.Bedwars.kits[p1.Player.userId] then
			v3 = l__BedwarsImageId__1.BedwarsKitAvatars[p1.store.Bedwars.kits[p1.Player.userId]];
		end;
		local v4 = "";
		local v5 = l__Players__2:GetPlayerByUserId(p1.Player.userId);
		if v5 and v5:GetAttribute("TabPrefix") ~= nil then
			v4 = v5:GetAttribute("TabPrefix");
		end;
		return u3.createElement("Frame", {
			Size = UDim2.new(l__tabListLayout__4.columns.left.totalWidth, 0, 1, 0), 
			BorderSizePixel = 0, 
			BackgroundTransparency = 1
		}, { u3.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 0)
			}), u3.createElement(function()
				return u3.createElement("Frame", {
					Size = UDim2.new(0, l__tabListLayout__4.columns.left.avatar.width, 1, 0), 
					BorderSizePixel = 0, 
					BackgroundTransparency = l__tabListLayout__4.bgTransparency.playerRow, 
					BackgroundColor3 = l__Theme__5.backgroundPrimary
				}, { u3.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal, 
						VerticalAlignment = Enum.VerticalAlignment.Center, 
						HorizontalAlignment = Enum.HorizontalAlignment.Center, 
						SortOrder = Enum.SortOrder.LayoutOrder, 
						Padding = UDim.new(0, 0)
					}), u3.createElement("ImageLabel", {
						Image = v3, 
						ImageTransparency = p1.ContentTransparency, 
						BorderSizePixel = 0, 
						ScaleType = "Fit", 
						BackgroundTransparency = 1, 
						Size = UDim2.fromScale(1, 1)
					}) });
			end), u3.createElement(function()
				local v6 = { u3.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal, 
						VerticalAlignment = Enum.VerticalAlignment.Center, 
						HorizontalAlignment = Enum.HorizontalAlignment.Left, 
						SortOrder = Enum.SortOrder.LayoutOrder, 
						Padding = UDim.new(0, 0)
					}), u3.createElement("Frame", {
						Size = UDim2.new(l__tabListLayout__4.columns.left.players.leftPadding, 0, 1, 0), 
						BorderSizePixel = 0, 
						BackgroundTransparency = 1
					}) };
				local v7 = { u3.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal, 
						VerticalAlignment = Enum.VerticalAlignment.Center, 
						HorizontalAlignment = Enum.HorizontalAlignment.Left, 
						SortOrder = Enum.SortOrder.LayoutOrder, 
						Padding = UDim.new(0, 8)
					}) };
				local v8 = v2;
				if v8 then
					v8 = false;
					if v2 ~= l__TabListRank__6.Default then
						v8 = u3.createElement(l__PlayerRankIcon__7, {
							Player = p1.Player, 
							Rank = v2, 
							ContentTransparency = p1.ContentTransparency
						});
					end;
				end;
				if v8 then
					v7[#v7 + 1] = v8;
				end;
				v7[#v7 + 1] = u3.createElement("Frame", {
					Size = UDim2.new(1, 0, 1, 0), 
					BorderSizePixel = 0, 
					BackgroundTransparency = 1
				}, { u3.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal, 
						VerticalAlignment = Enum.VerticalAlignment.Center, 
						HorizontalAlignment = Enum.HorizontalAlignment.Left, 
						SortOrder = Enum.SortOrder.LayoutOrder, 
						Padding = UDim.new(0, 0)
					}), u3.createElement("TextLabel", {
						Size = UDim2.new(0, 0, 1, 0), 
						BackgroundTransparency = 1, 
						BorderSizePixel = 0, 
						TextTransparency = p1.ContentTransparency, 
						Text = v4, 
						TextXAlignment = Enum.TextXAlignment.Left, 
						TextYAlignment = Enum.TextYAlignment.Center, 
						TextSize = 16, 
						AutomaticSize = "X", 
						Font = "ArialBold", 
						TextColor3 = l__ColorUtil__8.WHITE, 
						RichText = true
					}), u3.createElement("TextLabel", {
						Size = UDim2.new(1, -16, 1, 0), 
						BackgroundTransparency = 1, 
						BorderSizePixel = 0, 
						TextTransparency = p1.ContentTransparency, 
						Text = p1.Player.name, 
						AutoLocalize = false, 
						TextXAlignment = Enum.TextXAlignment.Left, 
						TextYAlignment = Enum.TextYAlignment.Center, 
						TextTruncate = Enum.TextTruncate.AtEnd, 
						TextSize = 16, 
						Font = "ArialBold", 
						TextColor3 = l__ColorUtil__8.WHITE
					}) });
				v6[#v6 + 1] = u3.createElement("Frame", {
					Size = UDim2.new(1 - l__tabListLayout__4.columns.left.players.leftPadding, 0, 1, 0), 
					BorderSizePixel = 0, 
					BackgroundTransparency = 1
				}, v7);
				return u3.createElement("Frame", {
					Size = UDim2.new(1, -l__tabListLayout__4.columns.left.avatar.width, 1, 0), 
					BorderSizePixel = 0, 
					BackgroundTransparency = l__tabListLayout__4.bgTransparency.playerRow, 
					BackgroundColor3 = l__Theme__5.backgroundSecondary
				}, v6);
			end) });
	end)
};

