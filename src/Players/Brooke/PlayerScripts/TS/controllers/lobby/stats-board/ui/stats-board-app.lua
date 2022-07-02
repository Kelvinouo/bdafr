-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__QueueType__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local l__Theme__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__StatsBoardHeader__4 = v1.import(script, script.Parent, "board-header").StatsBoardHeader;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__QueueStats__6 = v1.import(script, script.Parent, "queue-stats").QueueStats;
local l__RankStats__7 = v1.import(script, script.Parent, "rank-stats").RankStats;
local l__GlobalStats__8 = v1.import(script, script.Parent, "global-stats").GlobalStats;
local l__AutoCanvasScrollingFrame__9 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).AutoCanvasScrollingFrame;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
	local v2 = {};
	local v3 = {
		layoutOrder = 0
	};
	local v4 = p1.store.Leaderboard.rankStats;
	if v4 ~= nil then
		v4 = v4.matchesPlayed;
	end;
	local v5 = v4;
	if v5 == nil then
		v5 = 0;
	end;
	v3.visible = v5 >= 5;
	v2[l__QueueType__1.BEDWARS_RANKED_S5] = v3;
	v2[l__QueueType__1.BEDWARS_TO1] = {
		layoutOrder = 1, 
		visible = true
	};
	v2[l__QueueType__1.BEDWARS_TO2] = {
		layoutOrder = 2, 
		visible = true
	};
	v2[l__QueueType__1.BEDWARS_TO4] = {
		layoutOrder = 3, 
		visible = true
	};
	v2[l__QueueType__1.BEDWARS_20v20] = {
		layoutOrder = 4, 
		visible = true
	};
	v2[l__QueueType__1.BEDWARS_MEGA] = {
		layoutOrder = 5, 
		visible = true
	};
	v2[l__QueueType__1.BEDWARS_DUELS] = {
		layoutOrder = 6, 
		visible = true
	};
	v2[l__QueueType__1.BEDWARS_LUCKY_BLOCK] = {
		layoutOrder = 7, 
		visible = true
	};
	v2[l__QueueType__1.BEDWARS_LUCKY_BLOCK_TO2] = {
		layoutOrder = 7, 
		visible = true
	};
	v2[l__QueueType__1.INFECTED] = {
		layoutOrder = 8, 
		visible = true
	};
	v2[l__QueueType__1.SKYWARS_TO2] = {
		layoutOrder = 9, 
		visible = true
	};
	local v6 = {
		Size = UDim2.fromScale(1, 1), 
		BorderSizePixel = 0, 
		BackgroundColor3 = l__Theme__2.backgroundPrimary
	};
	local v7 = { u3.createElement(l__StatsBoardHeader__4) };
	local v8 = {};
	local v9 = 0;
	for v10, v11 in ipairs((u5.entries(v2))) do
		local v12 = v11[1];
		if v11[2].visible == true then
			v9 = v9 + 1;
			v8[v9] = v11;
		end;
	end;
	local v13 = table.create(#v8);
	for v14, v15 in ipairs(v8) do
		v13[v14] = u3.createElement(l__QueueStats__6, {
			store = p1.store, 
			QueueType = v15[1], 
			LayoutOrder = v15[2].layoutOrder
		});
	end;
	local v16 = {
		ScrollingFrameProps = {
			Size = UDim2.fromScale(1, 0.9), 
			Position = UDim2.fromScale(0, 0.1)
		}
	};
	local v17 = { u3.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical, 
			VerticalAlignment = Enum.VerticalAlignment.Top, 
			HorizontalAlignment = Enum.HorizontalAlignment.Center, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 20)
		}), u3.createElement("UIPadding", {
			PaddingTop = UDim.new(0.02, 0), 
			PaddingBottom = UDim.new(0.03, 0), 
			PaddingLeft = UDim.new(0.075, 0), 
			PaddingRight = UDim.new(0.075, 0)
		}), u3.createElement(l__RankStats__7, {
			store = p1.store
		}), u3.createElement(l__GlobalStats__8, {
			store = p1.store
		}) };
	local v18 = #v17;
	for v19, v20 in ipairs(v13) do
		v17[v18 + v19] = v20;
	end;
	v7[#v7 + 1] = u3.createElement(l__AutoCanvasScrollingFrame__9, v16, v17);
	return u3.createElement("Frame", v6, v7);
end);
return {
	StatsBoardUIWrapper = function(p3)
		local v21 = {};
		local v22 = {};
		local v23 = {};
		for v24, v25 in pairs(p3) do
			v23[v24] = v25;
		end;
		v22[#v22 + 1] = u3.createElement(u10, v23);
		v21[#v21 + 1] = u3.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.new(1, -30, 1, -30), 
			BackgroundTransparency = 1
		}, v22);
		return u3.createElement("SurfaceGui", {
			Face = Enum.NormalId.Back, 
			LightInfluence = 0.25, 
			SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
		}, v21);
	end, 
	StatsBoard = u10
};
