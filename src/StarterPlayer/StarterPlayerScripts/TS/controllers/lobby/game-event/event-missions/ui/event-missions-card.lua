-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__StringUtil__2 = v2.StringUtil;
local l__DeviceUtil__3 = v2.DeviceUtil;
local l__KnitClient__4 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__SoundManager__5 = v2.SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__CollectAnimPlayer__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "collect-anim-player").CollectAnimPlayer;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__EventCurrencyMeta__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-currency", "event-currency-metadata").EventCurrencyMeta;
local l__ClientStore__10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__GameEventUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "game-event-utils").GameEventUtil;
local l__EventCurrencyType__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventCurrencyType;
local l__UserInputService__13 = v1.import(script, v1.getModule(script, "@rbxts", "services")).UserInputService;
local l__UIUtil__14 = v2.UIUtil;
local l__ColorUtil__15 = v2.ColorUtil;
local l__Padding__16 = v2.Padding;
local l__Empty__17 = v2.Empty;
local l__AutoSizedText__18 = v2.AutoSizedText;
local l__Theme__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ButtonComponent__20 = v2.ButtonComponent;
return {
	EventMissionsCard = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local u21 = p1.Stage.progress == p1.Progress;
		local u22 = u1.createRef();
		local u23 = u1.createRef();
		p2.useEffect(function()
			if l__UserInputService__13.GamepadEnabled then
				l__UIUtil__14:selectGui(u22:getValue());
			end;
		end, {});
		local v4 = { (u1.createElement("UICorner", {
				CornerRadius = UDim.new(0, 10)
			})) };
		local v5 = {};
		local v6 = {};
		local v7 = {};
		if u21 or p1.Claimed then
			local v8 = Color3.fromHex("#FFDF38");
		else
			v8 = Color3.fromHex("#3894FF");
		end;
		v7[1] = ColorSequenceKeypoint.new(0, l__ColorUtil__15.BLACK);
		v7[2] = ColorSequenceKeypoint.new(1, v8);
		v6.Color = ColorSequence.new(v7);
		v6.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.4) });
		v6.Rotation = 180;
		v5[1] = u1.createElement("UIGradient", v6);
		v4.GradientGlow = u1.createElement("Frame", {
			Size = UDim2.fromScale(1, 1), 
			BorderSizePixel = 0, 
			ZIndex = 1
		}, v5);
		local v9 = { (u1.createElement(l__Padding__16, {
				Padding = {
					Top = 10, 
					Bottom = 20, 
					Left = 14, 
					Right = 14
				}
			})) };
		local v10 = {
			MissionTask = u1.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0.5), 
				Text = "<b>" .. p1.Mission.name .. "</b>", 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				TextXAlignment = "Left", 
				TextScaled = true, 
				RichText = true, 
				BackgroundTransparency = 1, 
				LayoutOrder = 1, 
				ZIndex = 2
			}, { u1.createElement("UITextSizeConstraint", {
					MaxTextSize = 18
				}) }),
			(u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				HorizontalAlignment = "Left", 
				VerticalAlignment = "Center", 
				Padding = UDim.new(0.15, 0), 
				SortOrder = "LayoutOrder"
			}))
		};
		local v11 = {
			Size = UDim2.fromScale(1, 0.3)
		};
		if u21 or p1.Claimed then
			local v12 = "<b><font transparency=\".3\">Completed</font></b>";
		else
			v12 = "<b><font transparency=\".3\">Progress:</font> (" .. l__StringUtil__2.roundNumber(p1.Progress, 1) .. " / <font transparency=\".3\">" .. tostring(p1.Mission.stages[1].progress) .. "</font>)</b>";
		end;
		v11.Text = v12;
		v11.TextColor3 = Color3.fromRGB(255, 255, 255);
		v11.TextXAlignment = "Left";
		v11.TextScaled = true;
		v11.RichText = true;
		v11.Font = "Roboto";
		v11.BackgroundTransparency = 1;
		v11.LayoutOrder = 2;
		v11.ZIndex = 2;
		v10.Progress = u1.createElement("TextLabel", v11);
		v9.MissionInfoContainer = u1.createElement(l__Empty__17, {
			Size = UDim2.fromScale(0.5, 1), 
			LayoutOrder = 1, 
			ZIndex = 2
		}, v10);
		v9.RewardContainer = u1.createElement(l__Empty__17, {
			Size = UDim2.fromScale(0.2, 0.8), 
			AnchorPoint = Vector2.new(1, 0.5), 
			Position = UDim2.fromScale(0.7749999999999999, 0.5), 
			LayoutOrder = 2
		}, {
			CurrencyIcon = u1.createElement("ImageLabel", {
				Size = UDim2.new(1, 0, 0.8, 0), 
				SizeConstraint = "RelativeYY", 
				Image = l__EventCurrencyMeta__9[p1.Mission.reward].icon, 
				ScaleType = "Fit", 
				BackgroundTransparency = 1, 
				LayoutOrder = -1, 
				ZIndex = 2
			}),
			u1.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				Padding = UDim.new(0, 6), 
				HorizontalAlignment = "Right", 
				VerticalAlignment = "Center", 
				SortOrder = "LayoutOrder"
			}), u1.createElement(l__AutoSizedText__18, {
				Text = l__StringUtil__2.formatNumberWithCommas(tonumber(l__StringUtil__2.roundNumber(p1.Mission.rewardAmount, 0))), 
				Font = Enum.Font.SourceSansBold, 
				TextColor3 = l__ColorUtil__15.WHITE, 
				Limits = Vector2.new(200, 30), 
				TextYAlignment = Enum.TextYAlignment.Top, 
				TextXAlignment = Enum.TextXAlignment.Left, 
				ZIndex = 2, 
				LayoutOrder = 2
			})
		});
		local v13 = {
			Size = UDim2.fromScale(0.175, 0.8), 
			AnchorPoint = Vector2.new(1, 0.5), 
			Position = UDim2.fromScale(1, 0.5)
		};
		if u21 and not p1.Claimed then
			local v14 = "CLAIM REWARD";
		elseif p1.Claimed then
			v14 = "CLAIMED";
		else
			v14 = l__StringUtil__2.formatPercentage(p1.Progress, p1.Stage.progress, 1) .. " COMPLETE";
		end;
		v13.Text = v14;
		if u21 and not p1.Claimed then
			local v15 = l__Theme__19.backgroundSuccess;
		else
			v15 = Color3.fromHex("#525585");
		end;
		v13.BackgroundColor3 = v15;
		local function u24(p3, p4, p5)
			if not l__DeviceUtil__3.isHoarceKat() then
				if not l__KnitClient__4.Controllers.EventMissionsController:claimMission(p1.MissionId, p1.EventType) then
					return nil;
				end;
				l__SoundManager__5:playSound(l__GameSound__6.UI_REWARD);
			end;
			local v16 = u23:getValue();
			if u22:getValue() and v16 then
				local v17 = {
					amount = 10
				};
				if l__DeviceUtil__3.isHoarceKat() then
					local v18 = v16.Parent;
					if v18 ~= nil then
						v18 = v18.Parent;
					end;
					local v19 = v18;
				else
					v19 = nil;
				end;
				v17.parent = v19;
				l__CollectAnimPlayer__7:create(u8("ImageLabel", {
					Size = UDim2.fromOffset(30, 30), 
					Image = l__EventCurrencyMeta__9[p1.Mission.reward].icon, 
					BackgroundTransparency = 1
				}), Vector2.new(p3.AbsolutePosition.X + p3.AbsoluteSize.X / 2, p3.AbsolutePosition.Y + p3.AbsoluteSize.Y / 2), Vector2.new(p5.endPos.X, p5.endPos.Y), v17).play();
				if l__DeviceUtil__3.isHoarceKat() then
					local v20 = {
						type = "SetEventPartial"
					};
					local v21 = {};
					local v22 = {};
					for v23, v24 in pairs(l__GameEventUtil__11.makeStarterEventData()) do
						v22[v23] = v24;
					end;
					local v25 = {};
					local v26 = {};
					local v27 = l__ClientStore__10:getState().Event.eventData.currencies[l__EventCurrencyType__12.DOUBLOONS];
					v27.currAmount = v27.currAmount + 300;
					v26.currAmount = v27.currAmount;
					v26.amountEarned = 0;
					v26.amountSpent = 0;
					v25[l__EventCurrencyType__12.DOUBLOONS] = v26;
					v22.currencies = v25;
					v21.eventData = v22;
					v20.data = v21;
					l__ClientStore__10:dispatch(v20);
				end;
			end;
		end;
		function v13.OnClick(p6, p7)
			local v28 = {};
			local v29 = l__ClientStore__10:getState().Event.currencyGuiLocations[p1.Mission.reward];
			if v29 == nil then
				v29 = Vector2.new(0, 0);
			end;
			v28.endPos = v29;
			u24(p6, p7, v28);
		end;
		if p1.Claimed then
			local v30 = Color3.fromHex("#FFDF38");
		else
			v30 = l__ColorUtil__15.WHITE;
		end;
		v13.TextColor3 = v30;
		if p1.Claimed then
			local v31 = 1;
		else
			v31 = 0;
		end;
		v13.BackgroundTransparency = v31;
		v13.Disabled = not u21 or p1.Claimed;
		v13.LayoutOrder = 3;
		v13.Selectable = true;
		v13[u1.Ref] = u22;
		local v32 = {};
		local v33 = u21 and (not p1.Claimed and u1.createFragment({
			CompletedButtonStroke = u1.createElement("Frame", {
				Size = UDim2.fromScale(1, 1), 
				BackgroundTransparency = 1
			}, { u1.createElement("UICorner"), u1.createElement("UIStroke", {
					Color = l__ColorUtil__15.WHITE, 
					Thickness = 2
				}, { u1.createElement("UIGradient", {
						Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#5DFF4F")), ColorSequenceKeypoint.new(1, Color3.fromHex("#5DFF4F")) }), 
						Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) }), 
						Rotation = 90
					}) }) })
		}));
		if v33 then
			v32[#v32 + 1] = v33;
		end;
		v9.ClaimRewardButton = u1.createElement(l__ButtonComponent__20, v13, v32);
		v4.Content = u1.createElement(l__Empty__17, {
			Size = UDim2.fromScale(1, 1), 
			ZIndex = 2
		}, v9);
		local v34 = { (u1.createElement("UICorner", {
				CornerRadius = UDim.new(0, 10)
			})) };
		local v35 = {
			Size = UDim2.fromScale(math.clamp(p1.Progress / p1.Stage.progress, 0, 1), 1)
		};
		if u21 then
			local v36 = Color3.fromHex("#FFDF38");
		else
			v36 = l__Theme__19.textPrimary;
		end;
		v35.BackgroundColor3 = v36;
		v35.BorderSizePixel = 0;
		v35.ZIndex = 2;
		v34.ProgressBar = u1.createElement("Frame", v35, { u1.createElement("UICorner", {
				CornerRadius = UDim.new(0, 10)
			}) });
		v4.ProgressBarContainer = u1.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 10), 
			Position = UDim2.fromScale(0, 1), 
			AnchorPoint = Vector2.new(0, 1), 
			BackgroundColor3 = Color3.fromHex("#787EC8"), 
			BorderSizePixel = 0, 
			ZIndex = 2
		}, v34);
		return u1.createElement("Frame", {
			Size = UDim2.new(0.98, 0, 0, 80), 
			BackgroundColor3 = Color3.fromHex("#6B6EB5"), 
			BorderSizePixel = 0, 
			LayoutOrder = p1.LayoutOrder, 
			[u1.Ref] = u23
		}, v4);
	end)
};
