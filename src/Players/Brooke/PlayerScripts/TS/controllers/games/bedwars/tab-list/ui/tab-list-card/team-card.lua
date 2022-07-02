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
		local v10 = {};
		local v11 = 0;
		local v12, v13, v14 = ipairs(v6);
		while true do
			local v15, v16 = v12(v13, v14);
			if not v15 then
				break;
			end;
			local v17 = v16[1];
			local v18 = v16[2];
			if p1.store.Bedwars.finalDeaths[v18.userId] then
				local v19 = not p1.store.Bedwars.finalDeaths[v18.userId];
			else
				v19 = true;
			end;
			if v19 == true then
				v11 = v11 + 1;
				v10[v11] = v16;
			end;		
		end;
		local v20 = {};
		local v21 = #v20;
		for v22, v23 in pairs(p1.Team.members) do
			v21 = v21 + 1;
			v20[v21] = { v22, v23 };
		end;
		if l__Players__1.LocalPlayer then
			local v24 = l__Players__1.LocalPlayer.UserId;
		else
			v24 = l__OfflinePlayerUtil__2.Dummy.oiogy.userId;
		end;
		local u9 = l__CardDimensions__4[1];
		local u10 = p1.store.Bedwars.finalDeaths[v24] or p1.store.Game.matchState == l__MatchState__3.POST;
		local function u11(p3)
			table.sort(p3, function(p4, p5)
				local v25 = p4[1];
				local v26 = p5[1];
				local v27 = p1.store.Bedwars.kills[p4[2].userId];
				if v27 == nil then
					v27 = 0;
				end;
				local v28 = p1.store.Bedwars.kills[p5[2].userId];
				if v28 == nil then
					v28 = 0;
				end;
				return v28 < v27;
			end);
			local function v29(p6, p7)
				local v30 = p6[1];
				local v31 = {};
				local v32 = 0;
				for v33 in pairs(p1.Team.members) do
					v32 = v32 + 1;
				end;
				v31.LastRow = p7 == v32 - 1;
				v31.LayoutOrder = p7;
				v31.Player = p6[2];
				v31.Team = p1.Team;
				v31.RowWidth = u9;
				v31.RowHeight = l__tabListLayout__4.maxRowSizeY;
				v31.store = p1.store;
				return u5.createElement(l__PlayerRow__6, v31);
			end;
			local v34 = table.create(#p3);
			for v35, v36 in ipairs(p3) do
				v34[v35] = v29(v36, v35 - 1, p3);
			end;
			return v34;
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
				local v37 = {
					Size = UDim2.fromScale(1, 0), 
					AutomaticSize = "Y", 
					BorderSizePixel = 0, 
					BackgroundTransparency = 1, 
					BackgroundColor3 = l__Theme__7.backgroundPrimary
				};
				local v38 = { u5.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical, 
						VerticalAlignment = Enum.VerticalAlignment.Top, 
						HorizontalAlignment = Enum.HorizontalAlignment.Left, 
						SortOrder = Enum.SortOrder.LayoutOrder, 
						Padding = UDim.new(0, 0)
					}) };
				local v39 = #v38;
				if u10 then
					local v40 = u11(v20);
				else
					v40 = u11(v10);
				end;
				for v41, v42 in ipairs(v40) do
					v38[v39 + v41] = v42;
				end;
				return u5.createElement("Frame", v37, v38);
			end) });
	end)
};
