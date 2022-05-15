
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__NumberSpinner__2 = v2.NumberSpinner;
local l__TweenService__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__SoundManager__4 = v2.SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__KnitClient__6 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__SlideIn__7 = v2.SlideIn;
local l__Empty__8 = v2.Empty;
local l__ColorUtil__9 = v2.ColorUtil;
return {
	ProvisionalProgressBarCore = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local v3, v4 = p2.useState(p1.RankedMatchesPlayed - 1);
		local u10 = u1.createRef();
		local u11 = u1.createRef();
		p2.useEffect(function()
			local v5 = l__NumberSpinner__2.fromGuiObject((u10:getValue()));
			v5.Duration = 0;
			v5.Decimals = 0;
			v5.Prefix = "";
			v5.Value = v3;
			local u12 = u11:getValue();
			local u13 = nil;
			u13 = function()
				l__KnitClient__6.Controllers.MatchEndController:unmountPostGameRankedProgressApp();
			end;
			local function u14()
				local v6 = v3 + 1;
				v4(v6);
				v5.Duration = 0.5;
				v5.Value = v6;
				local v7 = l__TweenService__3:Create(u12, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
					Size = UDim2.fromScale(math.min(v6 / 5, 1), 1)
				});
				v7:Play();
				l__SoundManager__4:playSound(l__GameSound__5.BATTLE_PASS_PROGRESS_EXP_GAIN);
				v7.Completed:Connect(function()
					wait(p1.AliveSecsAfterEnd);
					u13();
				end);
			end;
			v1.Promise.defer(function()
				wait(1);
				u14();
			end);
		end, {});
		return u1.createElement(l__SlideIn__7, {}, { u1.createElement(l__Empty__8, {
				AnchorPoint = p1.AnchorPoint or Vector2.new(0.5, 0.5), 
				Position = p1.Position or UDim2.fromScale(0.5, 0.4), 
				Size = UDim2.fromScale(0.6, 0.6), 
				BackgroundTransparency = 1
			}, {
				ProgressContainer = u1.createElement(l__Empty__8, {
					Size = UDim2.new(1, 0, 0.22, 0), 
					LayoutOrder = 2
				}, {
					ProgressBarBackground = u1.createElement("Frame", {
						Size = UDim2.new(1, 0, 0.4, 0), 
						BackgroundColor3 = l__ColorUtil__9.BLACK, 
						BackgroundTransparency = 0.3, 
						BorderSizePixel = 0, 
						LayoutOrder = 2
					}, {
						ProgressBar = u1.createElement("Frame", {
							Size = UDim2.new((p1.RankedMatchesPlayed - 1) / 5, 0, 1, 0), 
							BackgroundColor3 = l__ColorUtil__9.WHITE, 
							BorderSizePixel = 0, 
							[u1.Ref] = u11
						})
					}),
					u1.createElement("UIListLayout", {
						FillDirection = "Vertical", 
						HorizontalAlignment = "Right", 
						VerticalAlignment = "Center", 
						Padding = UDim.new(0, 8), 
						SortOrder = "LayoutOrder"
					}), (u1.createElement(l__Empty__8, {
						Size = UDim2.new(1, 0, 0.3, 0), 
						LayoutOrder = 1
					}, { u1.createElement("TextLabel", {
							Size = UDim2.new(0.5, 0, 1, 0), 
							Text = "<b>" .. tostring(0) .. "</b>", 
							TextColor3 = l__ColorUtil__9.WHITE, 
							Font = "Roboto", 
							TextXAlignment = "Left", 
							TextScaled = true, 
							RichText = true, 
							BackgroundTransparency = 1
						}), u1.createElement("TextLabel", {
							Size = UDim2.new(0.5, 0, 1, 0), 
							AnchorPoint = Vector2.new(1, 0), 
							Position = UDim2.fromScale(1, 0), 
							Text = "<b>" .. tostring(5) .. "</b>", 
							TextColor3 = l__ColorUtil__9.WHITE, 
							Font = "Roboto", 
							TextXAlignment = "Right", 
							TextScaled = true, 
							RichText = true, 
							TextTransparency = 0.4, 
							BackgroundTransparency = 1
						}) }))
				}),
				u1.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					HorizontalAlignment = "Center", 
					VerticalAlignment = "Bottom", 
					Padding = UDim.new(0.03, 0), 
					SortOrder = "LayoutOrder"
				}), u1.createElement(l__Empty__8, {
					Size = UDim2.new(0.4, 0, 0.15, 0), 
					LayoutOrder = 1
				}, {
					ProgressNumber = u1.createElement("TextLabel", {
						Size = UDim2.new(0, 0, 1, 0), 
						AutomaticSize = "X", 
						Text = "<b>" .. tostring(v3) .. "</b>", 
						TextColor3 = l__ColorUtil__9.hexColor(16773227), 
						Font = "Roboto", 
						TextScaled = true, 
						RichText = true, 
						BackgroundTransparency = 1, 
						LayoutOrder = 1, 
						[u1.Ref] = u10
					}, { u1.createElement("UITextSizeConstraint", {
							MaxTextSize = 24
						}) }),
					u1.createElement("UIListLayout", {
						FillDirection = "Horizontal", 
						HorizontalAlignment = "Center", 
						VerticalAlignment = "Center", 
						Padding = UDim.new(0.05, 0), 
						SortOrder = "LayoutOrder"
					}), u1.createElement("TextLabel", {
						Size = UDim2.new(0, 0, 1, 0), 
						AutomaticSize = "X", 
						Text = "<b>PLACEMENT MATCHES PLAYED</b>", 
						TextColor3 = l__ColorUtil__9.WHITE, 
						Font = "Roboto", 
						TextScaled = true, 
						RichText = true, 
						BackgroundTransparency = 1, 
						LayoutOrder = 2
					}, { u1.createElement("UITextSizeConstraint", {
							MaxTextSize = 24
						}) })
				}), u1.createElement(l__Empty__8, {
					Size = UDim2.new(1, 0, 0.15, 0), 
					LayoutOrder = 3
				}, {
					MetricDescription = u1.createElement("TextLabel", {
						Size = UDim2.new(1, 0, 0.4, 0), 
						Text = "<b>Complete " .. tostring(5) .. " placement matches to unlock your rank</b>", 
						TextColor3 = l__ColorUtil__9.WHITE, 
						Font = "Roboto", 
						TextTransparency = 0.35, 
						TextScaled = true, 
						RichText = true, 
						BackgroundTransparency = 1, 
						LayoutOrder = 2
					}),
					(u1.createElement("UIListLayout", {
						FillDirection = "Vertical", 
						HorizontalAlignment = "Center", 
						VerticalAlignment = "Center", 
						Padding = UDim.new(0, 8), 
						SortOrder = "LayoutOrder"
					}))
				})
			}) });
	end)
};

