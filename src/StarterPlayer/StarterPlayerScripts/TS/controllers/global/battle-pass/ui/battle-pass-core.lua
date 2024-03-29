-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__BattlePassRewards__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-rewards").BattlePassRewards;
local l__BattlePassUtils__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local l__Flamework__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__BattlePassRewardsList__5 = v1.import(script, script.Parent, "RewardsList", "battle-pass-rewards-list").BattlePassRewardsList;
local l__ScaleComponent__6 = v2.ScaleComponent;
local l__DeviceUtil__7 = v2.DeviceUtil;
local l__Empty__8 = v2.Empty;
local l__BattlePassInfoCard__9 = v1.import(script, script.Parent, "SeasonInfo", "Card", "battle-pass-season-info-card").BattlePassInfoCard;
local u10 = v1.import(script, script.Parent, "SeasonInfo", "battle-pass-purchase-buttons").BattlePassPurchaseButtons;
local u11 = v1.import(script, script.Parent, "RewardShowcase", "battle-pass-reward-showcase-container").BattlePassRewardShowcaseContainer;
local l__WidgetComponent__12 = v2.WidgetComponent;
local l__SlideIn__13 = v2.SlideIn;
return {
	BattlePassCore = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local v3 = nil;
		local v4, v5, v6 = ipairs(l__BattlePassRewards__1[l__BattlePassUtils__2.BATTLE_PASS_SEASON]);
		while true do
			v4(v5, v6);
			if not v4 then
				break;
			end;
			v6 = v4;
			if v5.level == 1 == true then
				v3 = v5;
				break;
			end;		
		end;
		local v7, v8 = p2.useState(v3);
		local v9 = p2.useMemo(function()
			return u4.createElement(l__BattlePassRewardsList__5, {
				store = p1.store, 
				Size = UDim2.new(1, 0, 0.5, -10), 
				SetReward = v8, 
				LayoutOrder = 2
			});
		end, { p1.store.BattlePass });
		local v10 = {};
		local v11 = {};
		local v12 = {};
		if l__DeviceUtil__7.isSmallScreen() then
			local v13 = 528;
		else
			v13 = 1250;
		end;
		v12.MaximumSize = Vector2.new(v13, 720);
		v12.ScreenPadding = Vector2.new(24, 24);
		v11[1] = u4.createElement(l__ScaleComponent__6, v12);
		local v14 = { u4.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 20)
			}), u4.createElement(l__Empty__8, {
				Size = UDim2.new(0.68, -10, 1, 0)
			}, {
				TopFrameRow = u4.createElement("Frame", {
					Size = UDim2.new(1, 0, 0.3, -5), 
					BackgroundTransparency = 1, 
					LayoutOrder = 1
				}, { u4.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, 24)
					}), u4.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal, 
						HorizontalAlignment = Enum.HorizontalAlignment.Left, 
						VerticalAlignment = Enum.VerticalAlignment.Top, 
						SortOrder = Enum.SortOrder.LayoutOrder, 
						Padding = UDim.new(0, 8)
					}), u4.createElement(l__BattlePassInfoCard__9, {
						store = p1.store, 
						Size = UDim2.new(0.5, -4, 1, 0)
					}), u4.createElement(u10, {
						store = p1.store, 
						Size = UDim2.new(0.45, -4, 1, 0), 
						LayoutOrder = 2
					}) }),
				u4.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					VerticalAlignment = Enum.VerticalAlignment.Top, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 10)
				}), u4.createElement(l__BattlePassRewardsList__5, {
					store = p1.store, 
					Size = UDim2.new(1, 0, 0.7, -5), 
					SetReward = v8, 
					LayoutOrder = 2
				})
			}) };
		local v15 = v7 and u4.createElement(u11, {
			BattlePass = p1.store.BattlePass, 
			Reward = v7, 
			Size = UDim2.new(0.32, -10, 1, 0)
		});
		if v15 then
			v14[#v14 + 1] = v15;
		end;
		v11[#v11 + 1] = u4.createElement(l__WidgetComponent__12, {
			AppId = p1.AppId, 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromScale(1, 1), 
			Title = "Battle Pass", 
			OnClose = function()
				l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(p1.AppId);
			end
		}, v14);
		v10.BattlePassApp = u4.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromOffset(1000, 545), 
			BackgroundTransparency = 1
		}, v11);
		return u4.createElement(l__SlideIn__13, {}, v10);
	end)
};
