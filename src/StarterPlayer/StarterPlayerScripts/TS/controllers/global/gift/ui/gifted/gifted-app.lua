-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.PureComponent:extend("GiftedAppBase");
function v4.init(p1)

end;
local l__Flamework__1 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
function v4.onClose(p2)
	l__Flamework__1.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(p2.props.AppId);
end;
local l__SoundManager__2 = v2.SoundManager;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.didMount(p3)
	l__SoundManager__2:playSound(l__GameSound__3.END_GAME);
end;
local l__DeviceUtil__4 = v2.DeviceUtil;
local l__DarkBackground__5 = v2.DarkBackground;
local l__ConfettiGroup__6 = v2.ConfettiGroup;
local l__ScaleComponent__7 = v2.ScaleComponent;
local l__ImageId__8 = v2.ImageId;
local l__PlayerRender__9 = v2.PlayerRender;
local l__ColorUtil__10 = v2.ColorUtil;
local l__Theme__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ShineEffect__12 = v2.ShineEffect;
local l__ShineEffectVariation__13 = v2.ShineEffectVariation;
local l__DividerComponent__14 = v2.DividerComponent;
local l__ButtonComponent__15 = v2.ButtonComponent;
local l__WidgetComponent__16 = v2.WidgetComponent;
local l__SlideIn__17 = v2.SlideIn;
function v4.render(p4)
	local v5 = {
		DisplayOrder = 20, 
		IgnoreGuiInset = l__DeviceUtil__4.isSmallScreen()
	};
	local v6 = { v3.createElement(l__DarkBackground__5, {
			AppId = p4.props.AppId
		}), v3.createElement(l__ConfettiGroup__6, {
			Lifetime = 10
		}) };
	local v7 = {};
	local v8 = {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		Size = UDim2.fromOffset(372, 440), 
		BackgroundTransparency = 1
	};
	local v9 = { v3.createElement(l__ScaleComponent__7, {
			MaximumSize = Vector2.new(465, 545), 
			ScreenPadding = Vector2.new(24, 24)
		}) };
	local v10 = {
		AppId = p4.props.AppId, 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		Size = UDim2.fromScale(1, 1), 
		ClipsDescendents = true, 
		TitleIcon = l__ImageId__8.GIFTS_SOLID, 
		Title = "Congratulations!"
	};
	function v10.OnClose()
		return p4:onClose();
	end;
	local v11 = { v3.createElement("ImageLabel", {
			Image = l__ImageId__8.GIFTS_SOLID, 
			AnchorPoint = Vector2.new(0, 1), 
			Position = UDim2.fromScale(-0.03, 1.05), 
			Size = UDim2.fromScale(0.25, 0.25), 
			SizeConstraint = "RelativeYY", 
			ImageTransparency = 0.9, 
			BackgroundTransparency = 1
		}) };
	local v12 = {
		Size = UDim2.fromScale(1, 1), 
		BackgroundTransparency = 1
	};
	local v13 = {
		GiftSentIntro = v3.createElement("Frame", {
			Size = UDim2.new(1, 0, 0.15, -10), 
			BackgroundTransparency = 1, 
			LayoutOrder = 1
		}, {
			IntroText = v3.createElement("TextLabel", {
				Text = "<b>" .. p4.props.fromPlayer.name .. "</b> has sent you a \240\159\142\129 gift!", 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 0.5), 
				Size = UDim2.new(0.84, 0, 1, 0), 
				TextScaled = true, 
				TextColor3 = l__ColorUtil__10.WHITE, 
				TextXAlignment = Enum.TextXAlignment.Left, 
				RichText = true, 
				Font = Enum.Font.Roboto, 
				BackgroundTransparency = 1, 
				AutoLocalize = false, 
				LayoutOrder = 2
			}, { v3.createElement("UITextSizeConstraint", {
					MaxTextSize = 24
				}) }),
			v3.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 10)
			}), (v3.createElement(l__PlayerRender__9, {
				Size = UDim2.new(1, 0, 1, 0), 
				SizeConstraint = "RelativeYY", 
				Player = p4.props.fromPlayer, 
				LayoutOrder = 1, 
				BackgroundTransparency = 1
			}, { v3.createElement("UICorner", {
					CornerRadius = UDim.new(0, 5)
				}) }))
		}),
		(v3.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			VerticalAlignment = Enum.VerticalAlignment.Top, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 10)
		}))
	};
	local v14 = #v13;
	local v15 = { v3.createElement("UICorner", {
			CornerRadius = UDim.new(0, 5)
		}), v3.createElement("UIStroke", {
			Color = l__Theme__11.textPrimary, 
			Thickness = 2
		}), v3.createElement(l__ShineEffect__12, {
			DelayTime = 6, 
			Variation = l__ShineEffectVariation__13.solid
		}) };
	local v16 = false;
	if p4.props.giftImageId ~= nil then
		v16 = v3.createFragment({
			BackgroundImage = v3.createElement("ImageLabel", {
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.75, 0.5), 
				Size = UDim2.new(1.3, 0, 1.3, 0), 
				SizeConstraint = "RelativeYY", 
				Image = p4.props.giftImageId, 
				ImageTransparency = 0.6, 
				BackgroundTransparency = 1
			})
		});
	end;
	if v16 then
		v15[#v15 + 1] = v16;
	end;
	v15.GiftRibbon = v3.createElement("ImageLabel", {
		AnchorPoint = Vector2.new(1, 0), 
		Position = UDim2.fromScale(1, 0), 
		Size = UDim2.new(0.5, 0, 0.5, 0), 
		SizeConstraint = "RelativeYY", 
		Image = l__ImageId__8.GIFT_RIBBON_DIAGONAL, 
		BackgroundTransparency = 1, 
		ZIndex = 4
	});
	local v17 = {
		LockImage = v3.createElement("ImageLabel", {
			AnchorPoint = Vector2.new(1, 0.5), 
			Position = UDim2.fromScale(1, 0.5), 
			Size = UDim2.new(0.4, 0, 1, 0), 
			Image = l__ImageId__8.UNLOCK_SOLID, 
			ImageTransparency = 0.6, 
			SizeConstraint = "RelativeYY", 
			ScaleType = "Fit", 
			BackgroundTransparency = 1, 
			LayoutOrder = 1, 
			ZIndex = 3
		}),
		v3.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			VerticalAlignment = Enum.VerticalAlignment.Center, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 8)
		}), (v3.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 4), 
			PaddingBottom = UDim.new(0, 4), 
			PaddingLeft = UDim.new(0, 12), 
			PaddingRight = UDim.new(0, 12)
		}))
	};
	local v18 = false;
	if p4.props.giftImageId ~= nil then
		v18 = v3.createFragment({
			GiftImage = v3.createElement("ImageLabel", {
				AnchorPoint = Vector2.new(1, 0.5), 
				Position = UDim2.fromScale(1, 0.5), 
				Size = UDim2.new(0.7, 0, 1, 0), 
				Image = p4.props.giftImageId, 
				SizeConstraint = "RelativeYY", 
				ScaleType = "Fit", 
				BackgroundTransparency = 1, 
				LayoutOrder = 2, 
				ZIndex = 3
			})
		});
	end;
	if v18 then
		v17[#v17 + 1] = v18;
	end;
	local v19 = p4.props.giftCustomImage and v3.createFragment({
		GiftImageCustom = v3.createElement("Frame", {
			Size = UDim2.fromScale(0.2, 1), 
			BackgroundTransparency = 1, 
			LayoutOrder = 2
		}, { p4.props.giftCustomImage })
	});
	if v19 then
		v17[#v17 + 1] = v19;
	end;
	v17.GiftName = v3.createElement("TextLabel", {
		Size = UDim2.new(0.6, 0, 1, 0), 
		Text = "<b>" .. p4.props.giftName .. "</b>", 
		TextScaled = true, 
		TextColor3 = l__Theme__11.textPrimary, 
		TextXAlignment = Enum.TextXAlignment.Left, 
		Font = Enum.Font.Roboto, 
		RichText = true, 
		BackgroundTransparency = 1, 
		LayoutOrder = 3, 
		ZIndex = 3
	}, { v3.createElement("UITextSizeConstraint", {
			MinTextSize = 20, 
			MaxTextSize = 28
		}) });
	v15.ButtonContent = v3.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0), 
		BackgroundTransparency = 1, 
		ZIndex = 3
	}, v17);
	v13.GiftButtonWrapper = v3.createElement("ImageButton", {
		Size = UDim2.new(1, 0, 0.225, -10), 
		BackgroundColor3 = l__Theme__11.backgroundTertiary, 
		LayoutOrder = 2, 
		ClipsDescendants = true, 
		[v3.Event.Activated] = function()
			if p4.props.onGiftClick then
				p4.props.onGiftClick();
			end;
		end
	}, v15);
	v13[v14 + 1] = v3.createElement(l__DividerComponent__14, {
		Margin = 0, 
		LayoutOrder = 3
	});
	v13.GiftMessageBox = v3.createElement("Frame", {
		Size = UDim2.new(1, 0, 0.525, -10), 
		LayoutOrder = 4, 
		BackgroundColor3 = l__Theme__11.backgroundTertiary, 
		BackgroundTransparency = 0.6, 
		BorderSizePixel = 0
	}, {
		MessageTitle = v3.createElement("TextLabel", {
			Size = UDim2.new(1, 0, 0.2, -4), 
			Text = "<b>Message</b>", 
			TextColor3 = l__ColorUtil__10.WHITE, 
			TextScaled = true, 
			TextXAlignment = Enum.TextXAlignment.Left, 
			TextYAlignment = Enum.TextYAlignment.Center, 
			RichText = true, 
			BackgroundTransparency = 1, 
			LayoutOrder = 1
		}, { v3.createElement("UITextSizeConstraint", {
				MaxTextSize = 16
			}), v3.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 8), 
				PaddingLeft = UDim.new(0, 12), 
				PaddingRight = UDim.new(0, 12)
			}) }), 
		Message = v3.createElement("TextLabel", {
			Size = UDim2.new(1, 0, 0.8, -4), 
			Text = "\"" .. p4.props.message .. "\" \n\n<font color=\"" .. l__ColorUtil__10.richTextColor(l__Theme__11.textPrimary) .. "\">-" .. p4.props.fromPlayer.name .. "</font>", 
			TextColor3 = l__ColorUtil__10.WHITE, 
			TextScaled = true, 
			TextXAlignment = Enum.TextXAlignment.Left, 
			TextYAlignment = Enum.TextYAlignment.Top, 
			BackgroundTransparency = 1, 
			RichText = true, 
			LayoutOrder = 2, 
			AutoLocalize = false
		}, { v3.createElement("UITextSizeConstraint", {
				MaxTextSize = 16
			}), v3.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, 8), 
				PaddingLeft = UDim.new(0, 12), 
				PaddingRight = UDim.new(0, 12)
			}) }),
		v3.createElement("UICorner", {
			CornerRadius = UDim.new(0, 5)
		}), (v3.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			VerticalAlignment = Enum.VerticalAlignment.Center, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 8)
		}))
	});
	local v20 = p4.props.onGiftClick and v3.createFragment({
		GiftConfirmButton = v3.createElement("Frame", {
			Size = UDim2.new(1, 0, 0.1, -10), 
			BackgroundTransparency = 1, 
			LayoutOrder = 5
		}, { v3.createElement(l__ButtonComponent__15, {
				Text = "Awesome!", 
				AnchorPoint = Vector2.new(1, 0.5), 
				Position = UDim2.fromScale(1, 0.5), 
				Size = UDim2.fromOffset(160, 28), 
				OnClick = function()
					return p4.props.onGiftClick();
				end
			}) })
	});
	if v20 then
		v13[v14 + 2] = v20;
	end;
	v11[#v11 + 1] = v3.createElement("Frame", v12, v13);
	v9[#v9 + 1] = v3.createElement(l__WidgetComponent__16, v10, v11);
	v7[#v7 + 1] = v3.createElement("Frame", v8, v9);
	v6[#v6 + 1] = v3.createElement(l__SlideIn__17, {}, v7);
	return v3.createElement("ScreenGui", v5, v6);
end;
return {
	GiftedApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p5, p6)
		return p6;
	end)(v4)
};
