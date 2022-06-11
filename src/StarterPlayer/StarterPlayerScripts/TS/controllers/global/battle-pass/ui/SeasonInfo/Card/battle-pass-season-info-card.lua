-- Script Hash: de5d10a0f95d0bd3e1284247544bbb9167ca322cecbc7a1b6ce6d6cdf28a5f2d562408086a5cd9aadb027934f8c35ec7
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__BattlePassUtils__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__3 = v2.ColorUtil;
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DeviceUtil__5 = v2.DeviceUtil;
local l__Empty__6 = v2.Empty;
local l__StringUtil__7 = v2.StringUtil;
local l__CornerFiller__8 = v2.CornerFiller;
return {
	BattlePassInfoCard = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local l__BATTLE_PASS_END_TIME__4 = l__BattlePassUtils__1.BATTLE_PASS_END_TIME;
		local v5 = l__BATTLE_PASS_END_TIME__4 - os.time() <= 86400;
		local v6 = {};
		local v7 = { u2.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 4)
			}), (u2.createElement("UICorner", {
				CornerRadius = UDim.new(0, 5)
			})) };
		local v8 = {};
		local v9 = {};
		if l__DeviceUtil__5.isSmallScreen() then
			local v10 = 16;
		else
			v10 = 10;
		end;
		v9.PaddingTop = UDim.new(0, v10);
		if l__DeviceUtil__5.isSmallScreen() then
			local v11 = 16;
		else
			v11 = 10;
		end;
		v9.PaddingBottom = UDim.new(0, v11);
		v9.PaddingLeft = UDim.new(0, 16);
		v9.PaddingRight = UDim.new(0, 16);
		v8[1] = u2.createElement("UIPadding", v9);
		v8[2] = u2.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			VerticalAlignment = Enum.VerticalAlignment.Center, 
			Padding = UDim.new(0.05, 0), 
			SortOrder = "LayoutOrder"
		});
		v8.BattlePassIcon = u2.createElement("ImageLabel", {
			Size = UDim2.fromScale(1, 1), 
			SizeConstraint = "RelativeYY", 
			Image = l__BattlePassUtils__1.BATTLE_PASS_ICON, 
			BackgroundTransparency = 1, 
			ScaleType = "Fit", 
			LayoutOrder = 1
		});
		local v12 = {};
		local v13 = {
			FillDirection = Enum.FillDirection.Vertical, 
			HorizontalAlignment = Enum.HorizontalAlignment.Center, 
			VerticalAlignment = Enum.VerticalAlignment.Center
		};
		if l__DeviceUtil__5.isSmallScreen() then
			local v14 = 10;
		else
			v14 = 4;
		end;
		v13.Padding = UDim.new(0, v14);
		local v15 = {
			Size = UDim2.fromScale(1, 0.4), 
			BackgroundTransparency = 1
		};
		local v16 = {};
		if v5 then
			local v17 = true;
		else
			v17 = false;
		end;
		v16.seconds = v17;
		if v5 then
			local v18 = true;
		else
			v18 = false;
		end;
		v16.minutes = v18;
		v16.hideIfZero = true;
		v16.long = true;
		v15.Text = l__StringUtil__7.fromNow(l__BATTLE_PASS_END_TIME__4, v16) .. "remaining";
		v15.TextXAlignment = Enum.TextXAlignment.Left;
		v15.TextTransparency = 0.3;
		v15.TextColor3 = l__ColorUtil__3.WHITE;
		v15.TextScaled = true;
		v15.RichText = true;
		v15.Font = Enum.Font.Roboto;
		v12[1] = u2.createElement("UIListLayout", v13);
		v12[2] = u2.createElement("TextLabel", {
			Size = UDim2.fromScale(1, 0.5), 
			BackgroundTransparency = 1, 
			Text = "<b>Season " .. tostring(l__BattlePassUtils__1.BATTLE_PASS_SEASON_NUMBER) .. "</b>", 
			TextXAlignment = Enum.TextXAlignment.Left, 
			TextColor3 = l__ColorUtil__3.WHITE, 
			TextScaled = true, 
			RichText = true, 
			Font = Enum.Font.Roboto
		});
		v12[3] = u2.createElement("TextLabel", v15);
		v8[3] = u2.createElement(l__Empty__6, {
			Size = UDim2.fromScale(0.65, 1), 
			LayoutOrder = 2
		}, v12);
		v7.CardHeader = u2.createElement("Frame", {
			Size = UDim2.new(1, 0, 0.45, -2), 
			BackgroundTransparency = 1, 
			LayoutOrder = 1
		}, v8);
		v7.CardContentWrapper = u2.createElement("Frame", {
			Size = UDim2.new(1, 0, 0.55, -2), 
			BackgroundColor3 = l__Theme__4.backgroundPrimary, 
			BorderSizePixel = 0, 
			BackgroundTransparency = 0, 
			LayoutOrder = 2
		}, {
			CardContent = u2.createElement(l__Empty__6, {
				Size = UDim2.fromScale(1, 1)
			}, { u2.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 12), 
					PaddingBottom = UDim.new(0, 12), 
					PaddingLeft = UDim.new(0, 16), 
					PaddingRight = UDim.new(0, 16)
				}), u2.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical, 
					HorizontalAlignment = Enum.HorizontalAlignment.Center, 
					VerticalAlignment = Enum.VerticalAlignment.Center, 
					Padding = UDim.new(0.05, 0), 
					SortOrder = "LayoutOrder"
				}), u2.createElement(l__Empty__6, {
					Size = UDim2.new(1, 0, 0.4, 0), 
					LayoutOrder = 1
				}, { u2.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal, 
						HorizontalAlignment = Enum.HorizontalAlignment.Center, 
						VerticalAlignment = Enum.VerticalAlignment.Center
					}), u2.createElement("TextLabel", {
						Size = UDim2.new(0.5, 0, 1, 0), 
						BackgroundTransparency = 1, 
						Text = "<b>Lv. " .. tostring(p1.store.BattlePass.level) .. "</b>", 
						TextXAlignment = Enum.TextXAlignment.Left, 
						TextYAlignment = Enum.TextYAlignment.Bottom, 
						TextScaled = true, 
						RichText = true, 
						TextColor3 = Color3.new(1, 1, 1), 
						Font = Enum.Font.Roboto
					}), u2.createElement("TextLabel", {
						Size = UDim2.new(0.5, 0, 1, 0), 
						BackgroundTransparency = 1, 
						Text = "<b>Lv. " .. tostring(p1.store.BattlePass.level + 1) .. "</b>", 
						TextXAlignment = Enum.TextXAlignment.Right, 
						TextYAlignment = Enum.TextYAlignment.Bottom, 
						TextTransparency = 0.3, 
						TextScaled = true, 
						RichText = true, 
						TextColor3 = Color3.new(1, 1, 1), 
						Font = Enum.Font.Roboto
					}) }), u2.createElement(function(p3)
					return u2.createFragment({
						ProgressBarWrapper = u2.createElement("Frame", {
							AnchorPoint = p3.AnchorPoint, 
							Position = p3.Position, 
							Size = p3.Size or UDim2.new(1, 0, 0.1, 0), 
							BackgroundColor3 = l__ColorUtil__3.hexColor(5921943), 
							BorderSizePixel = 0, 
							BackgroundTransparency = 0, 
							LayoutOrder = 2
						}, {
							ProgressBar = u2.createElement("Frame", {
								Size = UDim2.new(math.min(l__BattlePassUtils__1.getCurrExperienceProgression(p1.store.BattlePass.experience, p1.store.BattlePass.level) / l__BattlePassUtils__1.getExperienceForLevel(p1.store.BattlePass.level + 1), 1), 0, 1, 0), 
								BackgroundColor3 = l__Theme__4.textPrimary, 
								BorderSizePixel = 0, 
								BackgroundTransparency = 0
							}, { u2.createElement("UICorner", {
									CornerRadius = UDim.new(1, 0)
								}) }),
							(u2.createElement("UICorner", {
								CornerRadius = UDim.new(1, 0)
							}))
						})
					});
				end, {
					Size = UDim2.new(1, 0, 0.2, 0)
				}), u2.createElement("TextLabel", {
					Size = UDim2.new(1, 0, 0.3, 0), 
					BackgroundTransparency = 1, 
					Text = tostring(math.floor(l__BattlePassUtils__1.getCurrExperienceProgression(p1.store.BattlePass.experience, p1.store.BattlePass.level))) .. " / " .. tostring(l__BattlePassUtils__1.getExperienceForLevel(p1.store.BattlePass.level + 1)), 
					TextXAlignment = Enum.TextXAlignment.Right, 
					TextYAlignment = Enum.TextYAlignment.Bottom, 
					TextTransparency = 0.3, 
					TextScaled = true, 
					RichText = true, 
					TextColor3 = Color3.new(1, 1, 1), 
					Font = Enum.Font.Roboto, 
					LayoutOrder = 3
				}) }),
			u2.createElement("UICorner", {
				CornerRadius = UDim.new(0, 5)
			}), (u2.createElement(l__CornerFiller__8, {
				TopRight = true, 
				TopLeft = true, 
				ZIndex = 2
			}))
		});
		v6.BattlePassInfoCard = u2.createElement("Frame", {
			AnchorPoint = p1.AnchorPoint, 
			Position = p1.Position, 
			Size = p1.Size, 
			BackgroundColor3 = l__Theme__4.backgroundTertiary, 
			BorderSizePixel = 0, 
			BackgroundTransparency = 0
		}, v7);
		return u2.createFragment(v6);
	end)
};
