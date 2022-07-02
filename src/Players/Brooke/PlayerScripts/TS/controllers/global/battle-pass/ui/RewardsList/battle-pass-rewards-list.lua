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
		local v5 = nil;
		for v6, v7 in ipairs(l__BattlePassRewards__1[l__BattlePassUtils__2.BATTLE_PASS_SEASON]) do
			if v7.level == 1 == true then
				v5 = v7;
				break;
			end;
		end;
		local v8, v9 = p2.useState(v5);
		local v10 = l__useMemo__4(function()
			local v11 = l__BattlePassRewards__1[l__BattlePassUtils__2.BATTLE_PASS_SEASON];
			local u8 = {};
			local function v12(p3)
				if u8[p3.level] == nil then
					u8[p3.level] = { p3 };
					return;
				end;
				local v13 = {};
				local v14 = #v13;
				local v15 = u8[p3.level];
				local v16 = #v15;
				table.move(v15, 1, v16, v14 + 1, v13);
				v13[v14 + v16 + 1] = p3;
				u8[p3.level] = v13;
			end;
			local v17 = {};
			local v18 = 0;
			for v19, v20 in ipairs(v11) do
				local v21 = v12(v20, v19 - 1, v11);
				if v21 ~= nil then
					v18 = v18 + 1;
					v17[v18] = v21;
				end;
			end;
			return u8;
		end, {});
		local v22 = { u3.createElement(l__Empty__5, {
				Size = UDim2.new(1, 0, 0.95, 0)
			}, { (l__useMemo__4(function()
					return u3.createElement(u4, {
						Size = UDim2.fromScale(1, 1), 
						LayoutOrder = 1
					});
				end, {})) }) };
		local v23 = {};
		local v24 = #v23;
		for v25, v26 in pairs(v10) do
			v24 = v24 + 1;
			v23[v24] = { v25, v26 };
		end;
		local function v27(p4)
			return u3.createElement(u6, {
				BattlePass = p1.store.BattlePass, 
				Size = UDim2.new(0, 90, 0.95, 0), 
				SetReward = p1.SetReward, 
				LevelRewards = p4[2], 
				LayoutOrder = p4[1], 
				SetActive = v9, 
				Active = v8
			});
		end;
		local v28 = table.create(#v23);
		for v29, v30 in ipairs(v23) do
			v28[v29] = v27(v30, v29 - 1, v23);
		end;
		local v31 = {
			AdditionalSpace = 50, 
			ScrollingFrameProps = {
				Position = UDim2.new(0, 24, 0, 0), 
				Size = UDim2.new(1, -24, 1, 0), 
				ScrollingDirection = Enum.ScrollingDirection.X, 
				ScrollBarThickness = 8, 
				BorderSizePixel = 0, 
				LayoutOrder = 1
			}
		};
		local v32 = { u3.createElement("UIListLayout", {
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
		local v33 = #v32;
		for v34, v35 in ipairs(v28) do
			v32[v33 + v34] = v35;
		end;
		v22.BattlePassRewardsList = u3.createElement(l__AutoCanvasScrollingFrame__7, v31, v32);
		return u3.createFragment({
			BattlePassRewardsListContainer = u3.createElement("Frame", {
				Size = p1.Size, 
				BackgroundTransparency = 1, 
				LayoutOrder = p1.LayoutOrder
			}, v22)
		});
	end)
};
