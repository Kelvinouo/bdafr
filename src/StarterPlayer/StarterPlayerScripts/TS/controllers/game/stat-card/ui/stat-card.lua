-- Script Hash: 02347d56c7b74563d415a0516c034370f7a8120f2c1dc493518e30987ad14e7f91b1b6235dbb691683be3f5de8434f3c
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ClientStore__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__useSpring__3 = v1.import(script, v1.getModule(script, "@rbxts", "roact-flipper").src).useSpring;
local l__Players__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__UIUtil__5 = v2.UIUtil;
local l__SoundManager__6 = v2.SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "flipper").src);
local l__Theme__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Padding__10 = v2.Padding;
local l__Empty__11 = v2.Empty;
local l__StringUtil__12 = v2.StringUtil;
local l__ColorUtil__13 = v2.ColorUtil;
local l__STAT_TO_DESCRIPTION__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking").STAT_TO_DESCRIPTION;
return {
	StatCardComponent = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local v3 = u1.createRef();
		local v4 = u1.createRef();
		local v5 = nil;
		for v6, v7 in ipairs(l__ClientStore__2:getState().Game.teams) do
			if v7.members[tostring(p1.card.player.userId)] ~= nil then
				v5 = v7;
				break;
			end;
		end;
		local v8 = p2.useValue(4);
		local v9, v10 = l__useSpring__3(p2, 0.8);
		local v11, v12 = p2.useState(0.8);
		p2.useEffect(function()
			local v13 = v4:getValue();
			if v13 then
				v13.Image = l__Players__4:GetUserThumbnailAsync(p1.card.player.userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size352x352);
			end;
			local u15 = nil;
			u15 = v10:onStep(function(p3)
				if p3 == v11 then
					u15:disconnect();
				end;
				v12(p3);
			end);
			local v14 = v3:getValue();
			if v14 then
				local u16 = l__UIUtil__5:setContainerTransparency(v14, 1, {
					onCleanUpTweenInfo = TweenInfo.new(0.2)
				});
				task.delay(p1.index * 0.5, function()
					l__SoundManager__6:playSound(l__GameSound__7.EMOTE_OPEN);
					u16:DoCleaning();
					v10:setGoal(u8.Spring.new(1, {
						frequency = v8.value, 
						dampingRatio = 0.7
					}));
				end);
			end;
			local u17 = v10:onComplete(function()
				u15:disconnect();
			end);
			return function()
				u15:disconnect();
				u17:disconnect();
			end;
		end, {});
		local v15 = {};
		local v16 = { u1.createElement("UIAspectRatioConstraint", {
				AspectRatio = 0.7824897400820794
			}), u1.createElement("UICorner"), u1.createElement("UIListLayout", {
				Padding = UDim.new(0), 
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = "LayoutOrder"
			}) };
		local v17 = {
			AvatarWrapper = u1.createElement(l__Empty__11, {
				Size = UDim2.fromScale(1, 0.6), 
				LayoutOrder = 1
			}, { u1.createElement("ImageLabel", {
					[u1.Ref] = v4, 
					Size = UDim2.fromScale(1, 1), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Position = UDim2.fromScale(0.5, 0.5), 
					BackgroundColor3 = Color3.fromRGB(50, 50, 50), 
					BackgroundTransparency = 0.7, 
					ScaleType = Enum.ScaleType.Crop
				}, { u1.createElement("UIAspectRatioConstraint", {
						AspectRatio = 1
					}), u1.createElement("UICorner", {
						CornerRadius = UDim.new(1, 0)
					}) }) }),
			u1.createElement("UICorner"), u1.createElement(l__Padding__10, {
				Padding = UDim.new(0.1, 0)
			}), (u1.createElement("UIListLayout", {
				Padding = UDim.new(0.05), 
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = "LayoutOrder"
			}))
		};
		local v18 = {
			DisplayName = u1.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0.45), 
				Text = "<b>" .. p1.card.player.displayName .. "</b>", 
				RichText = true, 
				TextScaled = true, 
				Font = Enum.Font.Roboto, 
				TextColor3 = Color3.new(1, 1, 1), 
				TextYAlignment = "Bottom", 
				BackgroundTransparency = 1, 
				LayoutOrder = 1
			}),
			(u1.createElement("UIListLayout", {
				Padding = UDim.new(0.05), 
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = "LayoutOrder"
			}))
		};
		local v19 = false;
		if v5 ~= nil then
			v19 = u1.createFragment({
				TeamName = u1.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0.45), 
					Text = "<b>" .. string.upper(v5.name) .. "</b>", 
					TextScaled = true, 
					RichText = true, 
					Font = Enum.Font.Roboto, 
					TextColor3 = v5.color, 
					TextYAlignment = "Bottom", 
					BackgroundTransparency = 1, 
					LayoutOrder = 2
				})
			});
		end;
		if v19 then
			v18[#v18 + 1] = v19;
		end;
		v17.PlayerInfoContainer = u1.createElement(l__Empty__11, {
			Size = UDim2.fromScale(1, 0.35), 
			LayoutOrder = 2
		}, v18);
		v16.TopSection = u1.createElement(l__Empty__11, {
			Size = UDim2.fromScale(1, 0.55), 
			LayoutOrder = 1
		}, v17);
		v16.BottomSection = u1.createElement("Frame", {
			Size = UDim2.fromScale(1, 0.45), 
			BackgroundColor3 = l__Theme__9.backgroundPrimary, 
			BorderSizePixel = 0, 
			LayoutOrder = 2
		}, { u1.createElement("UICorner"), u1.createElement(l__Padding__10, {
				Padding = UDim.new(0.1, 0)
			}), u1.createElement("UIListLayout", {
				Padding = UDim.new(0.075), 
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				VerticalAlignment = Enum.VerticalAlignment.Center
			}), u1.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0.5), 
				Text = "<b>" .. l__StringUtil__12.roundNumber(p1.card.amount, 0) .. "</b>", 
				TextScaled = true, 
				RichText = true, 
				Font = Enum.Font.Roboto, 
				BackgroundTransparency = 1, 
				TextColor3 = l__ColorUtil__13.WHITE
			}), u1.createElement("TextLabel", {
				Size = UDim2.fromScale(0.8, 0.25), 
				Text = "<b>" .. string.upper(l__STAT_TO_DESCRIPTION__14[p1.card.trackType]) .. "</b>", 
				TextScaled = true, 
				RichText = true, 
				Font = Enum.Font.Roboto, 
				TextColor3 = l__Theme__9.textPrimary, 
				BackgroundTransparency = 1
			}) });
		v15.StatCard = u1.createElement("Frame", {
			Size = UDim2.fromScale(v11, v11), 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			[u1.Ref] = v3, 
			BackgroundColor3 = l__Theme__9.backgroundSecondary, 
			BackgroundTransparency = 0.15, 
			LayoutOrder = p1.index
		}, v16);
		return u1.createFragment({
			StatCardWrapper = u1.createElement(l__Empty__11, {
				Size = UDim2.fromScale(0.2, 0.5)
			}, v15)
		});
	end)
};
