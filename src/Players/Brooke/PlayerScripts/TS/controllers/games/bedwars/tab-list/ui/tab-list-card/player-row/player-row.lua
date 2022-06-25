-- Script Hash: 6ecddfdb4c628d12b6e68a528fa55033a5af2562753148ef4d2c5eec6040edd665c0c8d5308e37291cbbef51e11e294d
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Players__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__OfflinePlayerUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__tabListLayout__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config").tabListLayout;
local l__PlayerName__6 = v1.import(script, script.Parent, "player-name").PlayerName;
local l__PlayerStats__7 = v1.import(script, script.Parent, "player-stats").PlayerStats;
return {
	PlayerRow = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local l__useEffect__3 = p2.useEffect;
		if l__Players__1.LocalPlayer then
			local v4 = p1.Player.userId == l__Players__1.LocalPlayer.UserId;
		else
			v4 = p1.Player.userId == l__OfflinePlayerUtil__2.Dummy.oiogy.userId;
		end;
		local v5, v6 = l__useState__2(false);
		local v7, v8 = l__useState__2(0);
		l__useEffect__3(function()
			if p1.store.Bedwars.finalDeaths[p1.Player.userId] then
				v8(0.5);
				v6(true);
			end;
		end, { p1.store.Bedwars.finalDeaths });
		l__useEffect__3(function()
			if p1.store.Game.earlyLeaves[tostring(p1.Player.userId)] then
				v8(0.5);
				v6(true);
			end;
		end, { p1.store.Game.earlyLeaves });
		local v9 = {
			Size = UDim2.new(1, 0, 0, 0), 
			AutomaticSize = "Y", 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			LayoutOrder = p1.LayoutOrder
		};
		local v10 = {};
		if not v5 then
			local v11 = v4 and u3.createElement(function()
				local v12 = {
					Size = UDim2.fromScale(1, 1), 
					BorderSizePixel = 0, 
					BackgroundTransparency = 0.7
				};
				if v4 then
					local v13 = l__ColorUtil__4.WHITE;
				else
					v13 = l__ColorUtil__4.BLACK;
				end;
				v12.BackgroundColor3 = v13;
				return u3.createElement("Frame", v12);
			end);
		else
			v11 = u3.createElement(function()
				v12 = {
					Size = UDim2.fromScale(1, 1), 
					BorderSizePixel = 0, 
					BackgroundTransparency = 0.7
				};
				if v4 then
					v13 = l__ColorUtil__4.WHITE;
				else
					v13 = l__ColorUtil__4.BLACK;
				end;
				v12.BackgroundColor3 = v13;
				return u3.createElement("Frame", v12);
			end);
		end;
		if v11 then
			v10[#v10 + 1] = v11;
		end;
		local v14 = #v10;
		local v15 = {};
		if p1.LastRow then
			local v16 = 0;
		else
			v16 = -1;
		end;
		v15.Size = UDim2.new(1, 0, 1, v16);
		v15.BorderSizePixel = 0;
		v15.BackgroundTransparency = 1;
		v15.Position = UDim2.fromScale(0, 0);
		v15.AnchorPoint = Vector2.new(0, 0);
		v10[v14 + 1] = u3.createElement("Frame", v15, { u3.createElement("UISizeConstraint", {
				MaxSize = l__tabListLayout__5.maxRowSize, 
				MinSize = Vector2.new(0, 0)
			}), u3.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 0)
			}), u3.createElement(l__PlayerName__6, {
				store = p1.store, 
				Player = p1.Player, 
				ContentTransparency = v7
			}), u3.createElement(l__PlayerStats__7, {
				store = p1.store, 
				Player = p1.Player, 
				Team = p1.Team, 
				ContentTransparency = v7
			}) });
		local v17 = not p1.LastRow and u3.createElement(function()
			return u3.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, l__tabListLayout__5.rows.cards.card.playerRow.bottomBorderHeight), 
				Position = UDim2.new(0, 0, 1, -1), 
				AnchorPoint = Vector2.new(0, 0), 
				BorderSizePixel = 0, 
				BackgroundTransparency = l__tabListLayout__5.bgTransparency.playerRow, 
				BackgroundColor3 = l__ColorUtil__4.hexColor(8159178)
			});
		end);
		if v17 then
			v10[v14 + 2] = v17;
		end;
		return u3.createElement("Frame", v9, v10);
	end)
};
