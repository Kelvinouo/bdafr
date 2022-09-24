-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__UIUtil__2 = v2.UIUtil;
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-util").RELIC_VOTE_END_SECS_BEFORE_START;
local l__Empty__4 = v2.Empty;
local l__TimedProgressBar__5 = v2.TimedProgressBar;
local l__Countdown__6 = v2.Countdown;
local l__RelicVoteCard__7 = v1.import(script, script.Parent, "relic-vote-card").RelicVoteCard;
local l__ScaleComponent__8 = v2.ScaleComponent;
local l__DeviceUtil__9 = v2.DeviceUtil;
local l__DarkBackground__10 = v2.DarkBackground;
local l__Button__11 = v2.Button;
local l__SoundManager__12 = v2.SoundManager;
local l__GameSound__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
return {
	RelicVotingInterface = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p1, p2)
		local v3 = {};
		for v4, v5 in pairs(p2) do
			v3[v4] = v5;
		end;
		v3.voteState = p1.Bedwars.relic.voteState;
		v3.selectedRelic = p1.Bedwars.relic.selectedRelic;
		v3.winningRelic = p1.Bedwars.relic.winningRelic;
		return v3;
	end)((v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p3, p4)
		local v6, v7 = p4.useState(false);
		local u14 = u1.createRef();
		local u15 = u1.createRef();
		local u16 = u1.createRef();
		p4.useEffect(function()
			local v8 = nil;
			if not p3.winningRelic then
				return nil;
			end;
			v7(false);
			local v9 = u14:getValue();
			v8 = u15:getValue();
			if not v9 or not v8 then
				return nil;
			end;
			l__UIUtil__2:setContainerTransparency(v9, 1, {
				onSetTweenInfo = TweenInfo.new(0.3)
			});
			l__UIUtil__2:setContainerTransparency(v8, 1, {
				onSetTweenInfo = TweenInfo.new(0.3)
			});
			local u17 = u16:getValue();
			task.delay(u3 - 0.5, function()
				if u17 then
					l__UIUtil__2:setContainerTransparency(u17, 1, {
						onSetTweenInfo = TweenInfo.new(0.3)
					});
				end;
			end);
		end, { p3.winningRelic });
		local v10 = {};
		local v11 = #v10;
		local v12 = {};
		local v13 = {};
		local v14 = p3.voteState ~= nil;
		if v14 then
			local v15 = {};
			local v16 = {
				Size = UDim2.fromScale(1, 0.9), 
				Position = UDim2.fromScale(0.5, 0.5), 
				AnchorPoint = Vector2.new(0.5, 0.5)
			};
			local v17 = { u1.createElement("UIListLayout", {
					SortOrder = "LayoutOrder", 
					FillDirection = "Vertical", 
					HorizontalAlignment = "Center", 
					Padding = UDim.new(0.05, 0)
				}), u1.createElement(l__Empty__4, {
					Size = UDim2.fromScale(1, 0.125)
				}, { u1.createElement("UIListLayout", {
						SortOrder = "LayoutOrder", 
						FillDirection = "Vertical", 
						HorizontalAlignment = "Center", 
						Padding = UDim.new(0.05, 0)
					}), u1.createElement("TextLabel", {
						Text = "VOTE FOR RELIC", 
						Size = UDim2.fromScale(1, 0.7), 
						TextXAlignment = "Center", 
						TextYAlignment = "Center", 
						TextColor3 = Color3.fromRGB(240, 240, 240), 
						Font = "SourceSansBold", 
						TextScaled = true, 
						BackgroundTransparency = 1, 
						LayoutOrder = 0, 
						[u1.Ref] = u15
					}, { u1.createElement("UITextSizeConstraint", {
							MaxTextSize = 48
						}) }), u1.createElement(l__Empty__4, {
						Size = UDim2.fromScale(1, 0.25), 
						LayoutOrder = 1, 
						[u1.Ref] = u14
					}, { u1.createElement(l__TimedProgressBar__5, {
							Size = UDim2.fromScale(0.65, 0.7), 
							Position = UDim2.fromScale(0.5, 0.5), 
							AnchorPoint = Vector2.new(0.5, 0.5), 
							EndTime = p3.VoteEndTime, 
							Flip = true, 
							LayoutOrder = 1, 
							BarGradient = ColorSequence.new(Color3.fromHex("33B6FF"), Color3.fromHex("C8EBFF")), 
							GradientRotation = 180
						}), u1.createElement(l__Countdown__6, {
							EndTime = p3.VoteEndTime, 
							TextLabel = {
								Size = UDim2.fromScale(0.1, 1), 
								Position = UDim2.fromScale(0.8, 0.5), 
								AnchorPoint = Vector2.new(0, 0.5), 
								LayoutOrder = 2
							}, 
							CountdownConfig = {
								minutes = false, 
								hours = false, 
								days = false
							}
						}) }) }) };
			local l__voteState__18 = p3.voteState;
			local function v19(p5, p6)
				return u1.createElement(l__RelicVoteCard__7, {
					cardState = p5, 
					Active = p3.selectedRelic == p5.relic, 
					WinningRelic = p3.winningRelic, 
					Position = UDim2.fromScale(0.5, 0.33 * p6), 
					CardNumber = p6
				});
			end;
			local v20 = {};
			local v21 = 0;
			local v22, v23, v24 = ipairs(l__voteState__18);
			while true do
				v22(v23, v24);
				if not v22 then
					break;
				end;
				v24 = v22;
				local v25 = v19(v23, v22 - 1, l__voteState__18);
				if v25 ~= nil then
					v21 = v21 + 1;
					v20[v21] = v25;
				end;			
			end;
			local v26 = {
				LayoutOrder = 1, 
				Size = UDim2.fromScale(1, 0.825), 
				BackgroundTransparency = 1
			};
			local v27 = {};
			local v28 = #v27;
			local v29, v30, v31 = ipairs(v20);
			while true do
				v29(v30, v31);
				if not v29 then
					break;
				end;
				v31 = v29;
				v27[v28 + v29] = v30;			
			end;
			v17.RelicContainer = u1.createElement("Frame", v26, v27);
			v15[#v15 + 1] = u1.createElement(l__Empty__4, v16, v17);
			v14 = u1.createFragment(v15);
		end;
		local v32 = {};
		local v33 = {
			MaximumSize = Vector2.new(914, 915)
		};
		if l__DeviceUtil__9.isSmallScreen() then
			local v34 = 1;
		else
			v34 = 0.7;
		end;
		v33.PowerRelationshipPastMaximum = v34;
		if l__DeviceUtil__9.isSmallScreen() then
			local v35 = 50;
		else
			v35 = 168;
		end;
		v33.ScreenPadding = Vector2.new(403, v35);
		v32[1] = u1.createElement(l__ScaleComponent__8, v33);
		if v14 then
			v32[#v32 + 1] = v14;
		end;
		v13.RelicVotingInterface = u1.createElement("Frame", {
			Size = UDim2.fromOffset(914, 915), 
			Position = UDim2.fromScale(0.5, 0.47), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			BackgroundTransparency = 1
		}, v32);
		v12[#v12 + 1] = u1.createElement(l__DarkBackground__10, {
			AppId = "RelicVotingInterface", 
			BackgroundTransparency = 0.4, 
			OnClick = function()
				if p3.winningRelic then
					return false;
				end;
				v7(not v6);
				return false;
			end, 
			DisableCloseOnClick = true
		}, v13);
		v10[v11 + 1] = u1.createElement("ScreenGui", {
			ResetOnSpawn = false, 
			Enabled = not v6, 
			DisplayOrder = 900, 
			[u1.Ref] = u16
		}, v12);
		local v36 = {};
		local v37 = {
			Size = UDim2.fromScale(0.13, 0.05), 
			Position = UDim2.fromScale(0.5, 0.95), 
			AnchorPoint = Vector2.new(0.5, 1)
		};
		if v6 then
			local v38 = "Show";
		else
			v38 = "Hide";
		end;
		v37.Text = "<b>" .. v38 .. " Relic Voting</b>";
		function v37.OnClick()
			v7(not v6);
			l__SoundManager__12:playSound(l__GameSound__13.UI_CLICK_2);
		end;
		v37.LayoutOrder = 2;
		v36[1] = u1.createElement(l__Button__11, v37);
		v10[v11 + 2] = u1.createElement("ScreenGui", {
			ResetOnSpawn = false, 
			DisplayOrder = 901, 
			Enabled = not p3.winningRelic
		}, v36);
		return u1.createFragment(v10);
	end)))
};
