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
			v12(v13, v14);
			if not v12 then
				break;
			end;
			local v15 = v13[1];
			local v16 = v13[2];
			if p1.store.Bedwars.finalDeaths[v16.userId] then
				local v17 = not p1.store.Bedwars.finalDeaths[v16.userId];
			else
				v17 = true;
			end;
			if v17 == true then
				v11 = v11 + 1;
				v10[v11] = v13;
			end;		
		end;
		local v18 = {};
		local v19 = #v18;
		for v20, v21 in pairs(p1.Team.members) do
			v19 = v19 + 1;
			v18[v19] = { v20, v21 };
		end;
		if l__Players__1.LocalPlayer then
			local v22 = l__Players__1.LocalPlayer.UserId;
		else
			v22 = l__OfflinePlayerUtil__2.Dummy.oiogy.userId;
		end;
		local u9 = l__CardDimensions__4[1];
		local u10 = p1.store.Bedwars.finalDeaths[v22] or p1.store.Game.matchState == l__MatchState__3.POST;
		local function u11(p3)
			table.sort(p3, function(p4, p5)
				local v23 = p4[1];
				local v24 = p5[1];
				local v25 = p1.store.Bedwars.kills[p4[2].userId];
				if v25 == nil then
					v25 = 0;
				end;
				local v26 = p1.store.Bedwars.kills[p5[2].userId];
				if v26 == nil then
					v26 = 0;
				end;
				return v26 < v25;
			end);
			local function v27(p6, p7)
				local v28 = p6[1];
				local v29 = {};
				local v30 = 0;
				for v31 in pairs(p1.Team.members) do
					v30 = v30 + 1;
				end;
				v29.LastRow = p7 == v30 - 1;
				v29.LayoutOrder = p7;
				v29.Player = p6[2];
				v29.Team = p1.Team;
				v29.RowWidth = u9;
				v29.RowHeight = l__tabListLayout__4.maxRowSizeY;
				v29.store = p1.store;
				return u5.createElement(l__PlayerRow__6, v29);
			end;
			local v32 = table.create(#p3);
			local v33, v34, v35 = ipairs(p3);
			while true do
				v33(v34, v35);
				if not v33 then
					break;
				end;
				v35 = v33;
				v32[v33] = v27(v34, v33 - 1, p3);			
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
				local v36 = {
					Size = UDim2.fromScale(1, 0), 
					AutomaticSize = "Y", 
					BorderSizePixel = 0, 
					BackgroundTransparency = 1, 
					BackgroundColor3 = l__Theme__7.backgroundPrimary
				};
				local v37 = { u5.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical, 
						VerticalAlignment = Enum.VerticalAlignment.Top, 
						HorizontalAlignment = Enum.HorizontalAlignment.Left, 
						SortOrder = Enum.SortOrder.LayoutOrder, 
						Padding = UDim.new(0, 0)
					}) };
				local v38 = #v37;
				if u10 then
					local v39 = u11(v18);
				else
					v39 = u11(v10);
				end;
				local v40, v41, v42 = ipairs(v39);
				while true do
					v40(v41, v42);
					if not v40 then
						break;
					end;
					v42 = v40;
					v37[v38 + v40] = v41;				
				end;
				return u5.createElement("Frame", v36, v37);
			end) });
	end)
};
