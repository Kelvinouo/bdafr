
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Players__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__OfflinePlayerUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local l__MatchState__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local l__tabListLayout__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config").tabListLayout;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__PlayerRow__6 = v1.import(script, script.Parent, "player-row", "player-row").PlayerRow;
local l__Theme__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__CardHeader__8 = v1.import(script, script.Parent, "card-header").CardHeader;
return {
	TeamCard = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u5)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local l__useEffect__3 = p2.useEffect;
		local l__CardDimensions__4 = p1.CardDimensions;
		local v5 = l__CardDimensions__4[2];
		local v6 = {};
		local v7 = #v6;
		for v8, v9 in pairs(p1.Team.members) do
			v7 = v7 + 1;
			v6[v7] = { v8, v9 };
		end;
		local function v10(p3)
			local v11 = p3[1];
			local v12 = p3[2];
			if not p1.store.Bedwars.finalDeaths[v12.userId] then
				return true;
			end;
			return not p1.store.Bedwars.finalDeaths[v12.userId];
		end;
		local v13 = {};
		local v14 = 0;
		for v15, v16 in ipairs(v6) do
			if v10(v16, v15 - 1, v6) == true then
				v14 = v14 + 1;
				v13[v14] = v16;
			end;
		end;
		local v17 = {};
		local v18 = #v17;
		for v19, v20 in pairs(p1.Team.members) do
			v18 = v18 + 1;
			v17[v18] = { v19, v20 };
		end;
		if l__Players__1.LocalPlayer then
			local v21 = l__Players__1.LocalPlayer.UserId;
		else
			v21 = l__OfflinePlayerUtil__2.Dummy.oiogy.userId;
		end;
		local u9 = l__CardDimensions__4[1];
		local u10 = p1.store.Bedwars.finalDeaths[v21] or p1.store.Game.matchState == l__MatchState__3.POST;
		local function u11(p4)
			table.sort(p4, function(p5, p6)
				local v22 = p5[1];
				local v23 = p6[1];
				local v24 = p1.store.Bedwars.kills[p5[2].userId];
				if v24 == nil then
					v24 = 0;
				end;
				local v25 = p1.store.Bedwars.kills[p6[2].userId];
				if v25 == nil then
					v25 = 0;
				end;
				return v25 < v24;
			end);
			local function v26(p7, p8)
				local v27 = p7[1];
				local v28 = {};
				local v29 = 0;
				for v30, v31 in pairs(p1.Team.members) do
					v29 = v29 + 1;
				end;
				v28.LastRow = p8 == v29 - 1;
				v28.LayoutOrder = p8;
				v28.Player = p7[2];
				v28.Team = p1.Team;
				v28.RowWidth = u9;
				v28.RowHeight = l__tabListLayout__4.maxRowSizeY;
				v28.store = p1.store;
				return u5.createElement(l__PlayerRow__6, v28);
			end;
			local v32 = table.create(#p4);
			for v33, v34 in ipairs(p4) do
				v32[v33] = v26(v34, v33 - 1, p4);
			end;
			return v32;
		end;
		return u5.createElement("Frame", {
			Size = UDim2.new(1, 0, l__tabListLayout__4.rows.cards.card.height, 0), 
			AutomaticSize = "Y", 
			BorderSizePixel = 0, 
			BackgroundTransparency = 1, 
			LayoutOrder = p1.LayoutOrder
		}, { u5.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 0)
			}), u5.createElement(l__CardHeader__8, {
				Team = p1.Team, 
				RowWidth = u9, 
				store = p1.store
			}), u5.createElement(function()
				local v35 = {
					Size = UDim2.fromScale(1, 0), 
					AutomaticSize = "Y", 
					BorderSizePixel = 0, 
					BackgroundTransparency = 1, 
					BackgroundColor3 = l__Theme__7.backgroundPrimary
				};
				local v36 = { u5.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical, 
						VerticalAlignment = Enum.VerticalAlignment.Top, 
						HorizontalAlignment = Enum.HorizontalAlignment.Left, 
						SortOrder = Enum.SortOrder.LayoutOrder, 
						Padding = UDim.new(0, 0)
					}) };
				local v37 = #v36;
				if u10 then
					local v38 = u11(v17);
				else
					v38 = u11(v13);
				end;
				for v39, v40 in ipairs(v38) do
					v36[v37 + v39] = v40;
				end;
				return u5.createElement("Frame", v35, v36);
			end) });
	end)
};

