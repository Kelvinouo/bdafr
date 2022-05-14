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
local l__ColorUtil__11 = v2.ColorUtil;
local l__Theme__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__BattlePassRewardShowcase__13 = v1.import(script, script.Parent, "RewardShowcase", "battle-pass-reward-showcase").BattlePassRewardShowcase;
local l__BattlePassRewardInfoCard__14 = v1.import(script, script.Parent, "RewardShowcase", "battle-pass-reward-info-card").BattlePassRewardInfoCard;
local l__WidgetComponent__15 = v2.WidgetComponent;
local l__SlideIn__16 = v2.SlideIn;
return {
	BattlePassCore = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local v3 = l__BattlePassRewards__1[l__BattlePassUtils__2.BATTLE_PASS_SEASON];
		local function v4(p3)
			return p3.level == 1;
		end;
		local v5 = nil;
		for v6, v7 in ipairs(v3) do
			if v4(v7, v6 - 1, v3) == true then
				v5 = v7;
				break;
			end;
		end;
		local v8, v9 = p2.useState(v5);
		local v10 = p2.useMemo(function()
			return u4.createElement(l__BattlePassRewardsList__5, {
				store = p1.store, 
				Size = UDim2.new(1, 0, 0.5, -10), 
				SetReward = v9, 
				LayoutOrder = 2
			});
		end, { p1.store.BattlePass });
		local v11 = {};
		local v12 = {};
		local v13 = {};
		if l__DeviceUtil__7.isSmallScreen() then
			local v14 = 528;
		else
			v14 = 1250;
		end;
		v13.MaximumSize = Vector2.new(v14, 720);
		v13.ScreenPadding = Vector2.new(24, 24);
		v12[1] = u4.createElement(l__ScaleComponent__6, v13);
		local v15 = { u4.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 20)
			}), u4.createElement(l__Empty__8, {
				Size = UDim2.new(0.68, -10, 1, 0)
			}, {
				TopFrameRow = u4.createElement("Frame", {
					Size = UDim2.new(1, 0, 0.3, -10), 
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
					Padding = UDim.new(0, 20)
				}), u4.createElement(l__BattlePassRewardsList__5, {
					store = p1.store, 
					Size = UDim2.new(1, 0, 0.7, -10), 
					SetReward = v9, 
					LayoutOrder = 2
				})
			}) };
		local v16 = v8 and u4.createElement("Frame", {
			Size = UDim2.new(0.32, -10, 1, 0), 
			BackgroundColor3 = l__ColorUtil__11.WHITE, 
			BorderSizePixel = 0
		}, { u4.createElement("UICorner", {
				CornerRadius = UDim.new(0, 10)
			}), u4.createElement("UIGradient", {
				Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, l__ColorUtil__11.darken(l__Theme__12.backgroundPrimary, 0.6)), ColorSequenceKeypoint.new(1, l__ColorUtil__11.brighten(l__Theme__12.backgroundPrimary, 0.1)) }), 
				Rotation = 45
			}), u4.createElement(l__BattlePassRewardShowcase__13, {
				Reward = v8, 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 0.4), 
				Size = UDim2.new(0.8, 0, 0.8, 0), 
				LayoutOrder = 2
			}), u4.createElement(l__BattlePassRewardInfoCard__14, {
				Reward = v8, 
				BattlePass = p1.store.BattlePass, 
				AnchorPoint = Vector2.new(0, 1), 
				Position = UDim2.fromScale(0, 1), 
				Size = UDim2.new(1, 0, 0.3, 0), 
				LayoutOrder = 3
			}) });
		if v16 then
			v15[#v15 + 1] = v16;
		end;
		v12[#v12 + 1] = u4.createElement(l__WidgetComponent__15, {
			AppId = p1.AppId, 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromScale(1, 1), 
			Title = "Battle Pass", 
			OnClose = function()
				l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(p1.AppId);
			end
		}, v15);
		v11.BattlePassApp = u4.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromOffset(1000, 545), 
			BackgroundTransparency = 1
		}, v12);
		return u4.createElement(l__SlideIn__16, {}, v11);
	end)
};
