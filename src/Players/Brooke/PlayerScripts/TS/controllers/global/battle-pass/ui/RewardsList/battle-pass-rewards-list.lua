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
			local v12 = {};
			local v13 = 1;
			local v14 = false;
			while true do
				if v14 then
					v13 = v13 + 1;
				else
					v14 = true;
				end;
				if not (v13 <= l__BattlePassUtils__2.MAX_LEVEL) then
					break;
				end;
				v12[v13] = {};			
			end;
			local v15 = l__BattlePassRewards__1[l__BattlePassUtils__2.BATTLE_PASS_SEASON];
			local function v16(p3)
				if v12[p3.level] == nil then
					v12[p3.level] = { p3 };
					return;
				end;
				local v17 = {};
				local v18 = #v17;
				local v19 = v12[p3.level];
				local v20 = #v19;
				table.move(v19, 1, v20, v18 + 1, v17);
				v17[v18 + v20 + 1] = p3;
				v12[p3.level] = v17;
			end;
			local v21, v22, v23 = ipairs(v15);
			while true do
				v21(v22, v23);
				if not v21 then
					break;
				end;
				v23 = v21;
				v16(v22, v21 - 1, v15);			
			end;
			return v12;
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
			local v30 = p4[1];
			return u3.createElement(u6, {
				Level = v30, 
				BattlePass = p1.store.BattlePass, 
				Size = UDim2.new(0, 90, 0.95, 0), 
				SetReward = p1.SetReward, 
				LevelRewards = p4[2], 
				LayoutOrder = v30, 
				SetActive = v10, 
				Active = v9
			});
		end;
		local v31 = table.create(#v25);
		local v32, v33, v34 = ipairs(v25);
		while true do
			v32(v33, v34);
			if not v32 then
				break;
			end;
			v34 = v32;
			v31[v32] = v29(v33, v32 - 1, v25);		
		end;
		local v35 = {
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
		local v36 = { u3.createElement("UIListLayout", {
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
		local v37 = #v36;
		local v38, v39, v40 = ipairs(v31);
		while true do
			v38(v39, v40);
			if not v38 then
				break;
			end;
			v40 = v38;
			v36[v37 + v38] = v39;		
		end;
		v24.BattlePassRewardsList = u3.createElement(l__AutoCanvasScrollingFrame__7, v35, v36);
		return u3.createFragment({
			BattlePassRewardsListContainer = u3.createElement("Frame", {
				Size = p1.Size, 
				BackgroundTransparency = 1, 
				LayoutOrder = p1.LayoutOrder
			}, v24)
		});
	end)
};
