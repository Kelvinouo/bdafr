-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__BattlePassUtils__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local l__SoundManager__3 = v2.SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__TweenService__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__ColorUtil__6 = v2.ColorUtil;
return {
	XPProgressBar = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = u1.createRef();
		local v5 = u1.createRef();
		local v6 = u1.createRef();
		local v7, v8 = l__useState__3(l__BattlePassUtils__2.getLevelFromExperience(p1.MatchExperienceEarned.startingExperience + p1.MatchExperienceEarned.totalExperienceEarned));
		local v9, v10 = l__useState__3(p1.TotalProgressExp);
		local v11, v12 = l__useState__3(0);
		p2.useEffect(function()
			local function u7()
				local v13 = 0;
				local v14 = v7 + 1;
				local v15 = v11 + 1;
				local v16 = v14;
				local v17 = false;
				while true do
					if v17 then
						v16 = v16 - 1;
					else
						v17 = true;
					end;
					if not (v14 - v15 < v16) then
						break;
					end;
					v13 = v13 + l__BattlePassUtils__2.getExperienceForLevel(v16);				
				end;
				return p1.TotalProgressExp - v13;
			end;
			local function u8(p3)
				v8(v7 + 1);
				v12(v11 + 1);
				v10(p3);
				l__SoundManager__3:playSound(l__GameSound__4.BATTLE_PASS_PROGRESS_LEVEL_UP);
			end;
			local function u9()
				local v18 = 0;
				local v19 = v7 - v11;
				local v20 = false;
				while true do
					if v20 then
						v19 = v19 + 1;
					else
						v20 = true;
					end;
					if not (v19 < v7) then
						break;
					end;
					v18 = v18 + l__BattlePassUtils__2.getExperienceForLevel(v19);				
				end;
				return p1.TotalProgressExp - v18;
			end;
			local v21 = (function()
				return l__BattlePassUtils__2.getTotalExperienceForLevel(v7 + 1) - l__BattlePassUtils__2.getTotalExperienceForLevel(v7 - v11);
			end)();
			if v21 < p1.TotalProgressExp and p1.PastTotalProgressExp < v21 then
				(function()
					local v22 = u7();
					local v23 = l__TweenService__5:Create(v4:getValue(), TweenInfo.new(0.125, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
						Size = UDim2.fromScale(1, 1)
					});
					u8(v22);
					local v24 = l__TweenService__5:Create(v4:getValue(), TweenInfo.new(0.001), {
						Size = UDim2.fromScale(0, 1)
					});
					local v25 = l__TweenService__5:Create(v4:getValue(), TweenInfo.new(0.125, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
						Size = UDim2.fromScale(v22 / l__BattlePassUtils__2.getExperienceForLevel(v7 + 1), 1)
					});
					v23:Play();
					v1.Promise.fromEvent(v23.Completed):andThen(function()
						v24:Play();
					end);
					v1.Promise.fromEvent(v24.Completed):andThen(function()
						v25:Play();
						l__SoundManager__3:playSound(l__GameSound__4.BATTLE_PASS_PROGRESS_EXP_GAIN);
					end);
				end)();
				return;
			end;
			(function()
				local v26 = u9();
				local v27 = l__TweenService__5:Create(v4:getValue(), TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
					Size = UDim2.fromScale(math.min(v26 / l__BattlePassUtils__2.getExperienceForLevel(v7 + 1), 1), 1)
				});
				v10(v26);
				v27:Play();
				l__SoundManager__3:playSound(l__GameSound__4.BATTLE_PASS_PROGRESS_EXP_GAIN);
			end)();
		end, { p1.TotalProgressExp });
		return u1.createFragment({
			ProgressBarContainer = u1.createElement("Frame", {
				Size = UDim2.new(1, 0, 0.2, 0), 
				BorderSizePixel = 0, 
				BackgroundTransparency = 1, 
				LayoutOrder = p1.LayoutOrder
			}, {
				LevelContainer = u1.createElement("Frame", {
					Size = UDim2.fromScale(1, 0.3), 
					BackgroundColor3 = l__ColorUtil__6.BLACK, 
					BackgroundTransparency = 1, 
					LayoutOrder = 1
				}, { u1.createElement("TextLabel", {
						Size = UDim2.new(1, 0, 0, 20), 
						Position = UDim2.fromScale(0, 0), 
						AnchorPoint = Vector2.new(0, 0), 
						BackgroundTransparency = 1, 
						Text = "<b>Level <font size=\"24\">" .. tostring(v7) .. "</font></b>", 
						TextXAlignment = Enum.TextXAlignment.Left, 
						TextColor3 = l__ColorUtil__6.WHITE, 
						RichText = true, 
						Font = Enum.Font.Roboto, 
						TextSize = 24
					}), u1.createElement("TextLabel", {
						Size = UDim2.new(1, 0, 0, 20), 
						Position = UDim2.fromScale(1, 0), 
						AnchorPoint = Vector2.new(1, 0), 
						BackgroundTransparency = 1, 
						Text = "<b>Level <font size=\"24\">" .. tostring(v7 + 1) .. "</font></b>", 
						TextXAlignment = Enum.TextXAlignment.Right, 
						TextTransparency = 0.3, 
						TextColor3 = l__ColorUtil__6.WHITE, 
						RichText = true, 
						Font = Enum.Font.Roboto, 
						TextSize = 24, 
						[u1.Ref] = v6
					}) }), 
				ProgressBar = u1.createElement("Frame", {
					Size = UDim2.fromScale(1, 0.3), 
					BackgroundColor3 = l__ColorUtil__6.BLACK, 
					BorderSizePixel = 0, 
					BackgroundTransparency = 0.7, 
					LayoutOrder = 2
				}, {
					CurrProgress = u1.createElement("Frame", {
						Size = UDim2.fromScale((function()
							return math.min(p1.MatchExperienceEarned.startingExperience / l__BattlePassUtils__2.getExperienceForLevel(l__BattlePassUtils__2.getLevelFromExperience(p1.MatchExperienceEarned.startingExperience + p1.MatchExperienceEarned.totalExperienceEarned) + 1), 1);
						end)(), 1), 
						BackgroundColor3 = l__ColorUtil__6.hexColor(16773227), 
						BorderSizePixel = 0, 
						BackgroundTransparency = 0, 
						ZIndex = 2, 
						[u1.Ref] = v4
					}), 
					TotalProgress = u1.createElement("Frame", {
						Size = UDim2.fromScale(1, 1), 
						BackgroundColor3 = l__ColorUtil__6.BLACK, 
						BorderSizePixel = 0, 
						BackgroundTransparency = 0.7, 
						ZIndex = 1
					})
				}), 
				ExpProgress = u1.createElement("TextLabel", {
					Size = UDim2.new(1, 0, 0, 20), 
					AnchorPoint = Vector2.new(1, 0), 
					Position = UDim2.fromScale(1, 0), 
					BackgroundTransparency = 1, 
					Text = "<b>" .. tostring(math.floor(v9)) .. " / " .. tostring(l__BattlePassUtils__2.getExperienceForLevel(v7 + 1)) .. "</b>", 
					TextColor3 = l__ColorUtil__6.WHITE, 
					TextXAlignment = Enum.TextXAlignment.Right, 
					RichText = true, 
					Font = Enum.Font.Roboto, 
					TextSize = 20, 
					LayoutOrder = 3, 
					[u1.Ref] = v5
				}),
				(u1.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					VerticalAlignment = Enum.VerticalAlignment.Top, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 6)
				}))
			})
		});
	end)
};
