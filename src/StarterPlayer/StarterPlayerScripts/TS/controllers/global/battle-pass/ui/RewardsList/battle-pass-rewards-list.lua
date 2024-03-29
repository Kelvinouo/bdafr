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
		local v6, v7, v8 = ipairs(l__BattlePassRewards__1[l__BattlePassUtils__2.BATTLE_PASS_SEASON]);
		while true do
			v6(v7, v8);
			if not v6 then
				break;
			end;
			v8 = v6;
			if v7.level == 1 == true then
				v5 = v7;
				break;
			end;		
		end;
		local v9, v10 = p2.useState(v5);
		local v11 = l__useMemo__4(function()
			local v12 = l__BattlePassRewards__1[l__BattlePassUtils__2.BATTLE_PASS_SEASON];
			local u8 = {};
			local function v13(p3)
				if u8[p3.level] == nil then
					u8[p3.level] = { p3 };
					return;
				end;
				local v14 = {};
				local v15 = #v14;
				local v16 = u8[p3.level];
				local v17 = #v16;
				table.move(v16, 1, v17, v15 + 1, v14);
				v14[v15 + v17 + 1] = p3;
				u8[p3.level] = v14;
			end;
			local v18 = {};
			local v19 = 0;
			local v20, v21, v22 = ipairs(v12);
			while true do
				v20(v21, v22);
				if not v20 then
					break;
				end;
				v22 = v20;
				local v23 = v13(v21, v20 - 1, v12);
				if v23 ~= nil then
					v19 = v19 + 1;
					v18[v19] = v23;
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
		for v27, v28 in pairs(v11) do
			v26 = v26 + 1;
			v25[v26] = { v27, v28 };
		end;
		local function v29(p4)
			return u3.createElement(u6, {
				BattlePass = p1.store.BattlePass, 
				Size = UDim2.new(0, 90, 0.95, 0), 
				SetReward = p1.SetReward, 
				LevelRewards = p4[2], 
				LayoutOrder = p4[1], 
				SetActive = v10, 
				Active = v9
			});
		end;
		local v30 = table.create(#v25);
		local v31, v32, v33 = ipairs(v25);
		while true do
			v31(v32, v33);
			if not v31 then
				break;
			end;
			v33 = v31;
			v30[v31] = v29(v32, v31 - 1, v25);		
		end;
		local v34 = {
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
		local v35 = { u3.createElement("UIListLayout", {
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
		local v36 = #v35;
		local v37, v38, v39 = ipairs(v30);
		while true do
			v37(v38, v39);
			if not v37 then
				break;
			end;
			v39 = v37;
			v35[v36 + v37] = v38;		
		end;
		v24.BattlePassRewardsList = u3.createElement(l__AutoCanvasScrollingFrame__7, v34, v35);
		return u3.createFragment({
			BattlePassRewardsListContainer = u3.createElement("Frame", {
				Size = p1.Size, 
				BackgroundTransparency = 1, 
				LayoutOrder = p1.LayoutOrder
			}, v24)
		});
	end)
};
