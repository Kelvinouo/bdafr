-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__BattlePassRewards__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-rewards").BattlePassRewards;
local l__BattlePassUtils__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u4 = v1.import(script, script.Parent, "battle-pass-rewards-list-pass-titles").BattlePassRewardsListPassTitles;
local l__Empty__5 = v2.Empty;
local u6 = v1.import(script, script.Parent, "battle-pass-level-rewards-list-level-card").BattlePassLevelRewardsListLevelCard;
local l__AutoCanvasScrollingFrame__7 = v2.AutoCanvasScrollingFrame;
return {
	BattlePassRewardsList = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local l__useEffect__3 = p2.useEffect;
		local l__useMemo__4 = p2.useMemo;
		local v5 = l__BattlePassRewards__1[l__BattlePassUtils__2.BATTLE_PASS_SEASON];
		local function v6(p3)
			return p3.level == 1;
		end;
		local v7 = nil;
		for v8, v9 in ipairs(v5) do
			if v6(v9, v8 - 1, v5) == true then
				v7 = v9;
				break;
			end;
		end;
		local v10, v11 = p2.useState(v7);
		local v12 = l__useMemo__4(function()
			local v13 = l__BattlePassRewards__1[l__BattlePassUtils__2.BATTLE_PASS_SEASON];
			local u8 = {};
			local function v14(p4)
				if u8[p4.level] == nil then
					u8[p4.level] = { p4 };
					return;
				end;
				local v15 = {};
				local v16 = #v15;
				local v17 = u8[p4.level];
				local v18 = #v17;
				table.move(v17, 1, v18, v16 + 1, v15);
				v15[v16 + v18 + 1] = p4;
				u8[p4.level] = v15;
			end;
			local v19 = {};
			local v20 = 0;
			for v21, v22 in ipairs(v13) do
				local v23 = v14(v22, v21 - 1, v13);
				if v23 ~= nil then
					v20 = v20 + 1;
					v19[v20] = v23;
				end;
			end;
			return u8;
		end, {});
		local v24 = { u3.createElement(l__Empty__5, {
				Size = UDim2.new(1, 0, 0.95, 0)
			}, { (l__useMemo__4(function()
					return u3.createElement(u4, {
						Size = UDim2.fromScale(1, 1), 
						LayoutOrder = 1
					});
				end, {})) }) };
		local v25 = {};
		local v26 = #v25;
		for v27, v28 in pairs(v12) do
			v26 = v26 + 1;
			v25[v26] = { v27, v28 };
		end;
		local function v29(p5)
			return u3.createElement(u6, {
				BattlePass = p1.store.BattlePass, 
				Size = UDim2.new(0, 90, 0.95, 0), 
				SetReward = p1.SetReward, 
				LevelRewards = p5[2], 
				LayoutOrder = p5[1], 
				SetActive = v11, 
				Active = v10
			});
		end;
		local v30 = table.create(#v25);
		for v31, v32 in ipairs(v25) do
			v30[v31] = v29(v32, v31 - 1, v25);
		end;
		local v33 = {
			Position = UDim2.new(0, 24, 0, 0), 
			Size = UDim2.new(1, -24, 1, 0), 
			ScrollingDirection = Enum.ScrollingDirection.X, 
			ScrollBarThickness = 8, 
			BorderSizePixel = 0, 
			BackgroundTransparency = 1, 
			AdditionalSpace = 50, 
			LayoutOrder = 2
		};
		local v34 = { u3.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 4)
			}), u3.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 2), 
				PaddingBottom = UDim.new(0, 2), 
				PaddingLeft = UDim.new(0, 2), 
				PaddingRight = UDim.new(0, 2)
			}) };
		local v35 = #v34;
		for v36, v37 in ipairs(v30) do
			v34[v35 + v36] = v37;
		end;
		v24.BattlePassRewardsList = u3.createElement(l__AutoCanvasScrollingFrame__7, v33, v34);
		return u3.createFragment({
			BattlePassRewardsListContainer = u3.createElement("Frame", {
				Size = p1.Size, 
				BackgroundTransparency = 1, 
				LayoutOrder = p1.LayoutOrder
			}, v24)
		});
	end)
};
