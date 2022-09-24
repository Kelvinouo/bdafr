-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-meta");
local l__getRelicMeta__1 = v4.getRelicMeta;
local l__getRelicCategoryMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-category-meta").getRelicCategoryMeta;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DeviceUtil__4 = v2.DeviceUtil;
local l__UIUtil__5 = v2.UIUtil;
local l__SoundManager__6 = v2.SoundManager;
local l__TweenService__7 = v3.TweenService;
local l__Theme__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ClientStore__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__KnitClient__10 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__RelicIcon__11 = v1.import(script, script.Parent, "relic-icon").RelicIcon;
local l__ColorUtil__12 = v2.ColorUtil;
local l__getRelicDescription__13 = v4.getRelicDescription;
local l__Empty__14 = v2.Empty;
local l__Players__15 = v3.Players;
return {
	RelicVoteCard = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local l__useEffect__5 = p2.useEffect;
		local v6 = l__getRelicMeta__1(p1.cardState.relic);
		local v7 = l__getRelicCategoryMeta__2(v6.relicCategory);
		local v8, v9 = p2.useState(false);
		local v10 = string.upper(v6.displayName);
		local l__title__11 = v7.title;
		local v12 = u3.createRef();
		local v13 = u3.createRef();
		local u16 = u3.createRef();
		l__useEffect__5(function()
			local v14 = u16:getValue();
			if v14 then
				if l__DeviceUtil__4.isGamepadControls() then
					l__UIUtil__5:selectGui(v14);
				end;
				local u17 = l__UIUtil__5:setContainerTransparency(v14, 1, {
					onCleanUpTweenInfo = TweenInfo.new(0.3)
				});
				task.delay(p1.CardNumber * 0.4, function()
					l__SoundManager__6:playSound("rbxassetid://10969529817", {
						playbackSpeedMultiplier = 1 + p1.CardNumber * 0.3
					});
					u17:DoCleaning();
				end);
			end;
		end, {});
		l__useEffect__5(function()
			local v15 = nil;
			local v16 = v12:getValue();
			v15 = v13:getValue();
			if not v16 or not v15 then
				return nil;
			end;
			if p1.Active or p1.WinningRelic then
				return nil;
			end;
			if v8 then
				l__TweenService__7:Create(v15, TweenInfo.new(0.3), {
					Transparency = 0
				}):Play();
				l__TweenService__7:Create(v16, TweenInfo.new(0.3), {
					Offset = Vector2.new(0, 0)
				}):Play();
				return;
			end;
			l__TweenService__7:Create(v15, TweenInfo.new(0.3), {
				Transparency = 1
			}):Play();
			l__TweenService__7:Create(v16, TweenInfo.new(0.3), {
				Offset = Vector2.new(-0.1, 0)
			}):Play();
		end, { v8 });
		l__useEffect__5(function()
			local v17 = nil;
			if not p1.WinningRelic then
				return nil;
			end;
			if p1.WinningRelic ~= p1.cardState.relic then
				local v18 = u16:getValue();
				if not v18 then
					return nil;
				else
					l__UIUtil__5:setContainerTransparency(v18, 1, {
						onSetTweenInfo = TweenInfo.new(0.3)
					});
					return;
				end;
			end;
			local v19 = v12:getValue();
			v17 = u16:getValue();
			if not v19 or not v17 then
				return nil;
			end;
			l__TweenService__7:Create(v19, TweenInfo.new(0.3), {
				Rotation = -90
			}):Play();
			l__TweenService__7:Create(v17, TweenInfo.new(0.6), {
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 0.5), 
				Size = UDim2.fromScale(1, 0.5291005291005291)
			}):Play();
		end, { p1.WinningRelic });
		local v20 = {
			AnchorPoint = Vector2.new(0.5, 0), 
			Position = p1.Position, 
			Size = UDim2.fromScale(1, 0.30158730158730157), 
			BackgroundColor3 = l__Theme__8.Gray, 
			BackgroundTransparency = 1, 
			Active = true, 
			[u3.Event.MouseButton1Click] = function()
				if p1.WinningRelic then
					return nil;
				end;
				if l__DeviceUtil__4.isHoarceKat() then
					l__ClientStore__9:dispatch({
						type = "BedwarsSetRelicVote", 
						relic = p1.cardState.relic
					});
					return;
				end;
				l__KnitClient__10.Controllers.RelicVotingController:voteForRelic(p1.cardState.relic);
			end, 
			[u3.Ref] = u16
		};
		local v21 = { u3.createElement("UIAspectRatioConstraint", {
				AspectRatio = 3.939655172413793
			}), u3.createElement(l__RelicIcon__11, {
				Relic = p1.cardState.relic, 
				FrameProps = {
					Size = UDim2.fromScale(0.2844638949671772, 1)
				}
			}) };
		local v22 = #v21;
		local v23 = {
			Size = UDim2.fromScale(0.8743169398907104, 0.8836206896551724), 
			AnchorPoint = Vector2.new(1, 0.5), 
			Position = UDim2.fromScale(1, 0.5), 
			BackgroundColor3 = l__ColorUtil__12.WHITE, 
			BorderSizePixel = 0
		};
		v23[u3.Event.MouseEnter] = function()
			v9(true);
		end;
		v23[u3.Event.MouseLeave] = function()
			v9(false);
		end;
		local v24 = {};
		local v25 = {};
		if p1.Active then
			local v26 = 0;
		else
			v26 = 1;
		end;
		v25.Transparency = v26;
		v25.Thickness = 2;
		v25.Color = l__ColorUtil__12.WHITE;
		v25[u3.Ref] = v13;
		local v27 = {
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v7.hexagonOutlineGradient.Keypoints[2].Value), ColorSequenceKeypoint.new(0.25, l__ColorUtil__12.hexColor(0)), ColorSequenceKeypoint.new(1, l__ColorUtil__12.hexColor(0)) }), 
			Transparency = NumberSequence.new(0.2, 0.4), 
			Rotation = -20
		};
		if p1.Active then
			local v28 = Vector2.new(0, 0);
		else
			v28 = Vector2.new(-0.1, 0);
		end;
		v27.Offset = v28;
		v27[u3.Ref] = v12;
		v24[1] = u3.createElement("UIStroke", v25);
		v24[2] = u3.createElement("UIGradient", v27);
		local v29 = l__title__11 ~= nil;
		if v29 then
			local v30 = {
				Size = UDim2.fromScale(0.27, 0.18), 
				TextXAlignment = "Right", 
				TextYAlignment = "Center", 
				Position = UDim2.fromScale(0.9744, 0.03902439024390244), 
				AnchorPoint = Vector2.new(1, 0)
			};
			local v31 = l__title__11;
			if v31 ~= nil then
				v31 = string.upper(v31.displayName);
			end;
			v30.Text = "<b>" .. v31 .. "</b>";
			v30.RichText = true;
			v30.TextSize = 28;
			v30.Font = "SourceSansItalic";
			local v32 = l__title__11;
			if v32 ~= nil then
				v32 = v32.color;
			end;
			local v33 = v32;
			if v33 == nil then
				v33 = l__ColorUtil__12.WHITE;
			end;
			v30.TextColor3 = v33;
			v30.BackgroundTransparency = 1;
			v29 = u3.createElement("TextLabel", v30);
		end;
		local v34 = { u3.createElement("TextLabel", {
				Size = UDim2.fromScale(0.7, 0.25), 
				TextXAlignment = "Left", 
				TextYAlignment = "Center", 
				Position = UDim2.fromScale(0, 0.05), 
				Text = "<b>" .. v10 .. "</b>", 
				RichText = true, 
				TextScaled = true, 
				Font = "SourceSansBold", 
				TextColor3 = l__ColorUtil__12.WHITE, 
				BackgroundTransparency = 1, 
				TextTransparency = 0.1
			}) };
		if v29 then
			v34[#v34 + 1] = v29;
		end;
		v34[#v34 + 1] = u3.createElement("TextLabel", {
			Size = UDim2.fromScale(0.9, 0.5), 
			Position = UDim2.fromScale(0.0448, 0.4), 
			TextSize = 28, 
			TextWrapped = true, 
			TextXAlignment = "Left", 
			TextYAlignment = "Top", 
			RichText = true, 
			Text = l__getRelicDescription__13(p1.cardState.relic), 
			TextTransparency = 0.1, 
			Font = "SourceSans", 
			LineHeight = 0.85, 
			BackgroundTransparency = 1, 
			TextColor3 = Color3.fromRGB(232, 232, 232)
		});
		v34.VerticalDivider = u3.createElement("Frame", {
			Size = UDim2.fromScale(0.008, 0.5), 
			Position = UDim2.fromScale(0, 0.4), 
			BackgroundColor3 = l__ColorUtil__12.BLACK, 
			BackgroundTransparency = 0.6, 
			BorderSizePixel = 0
		});
		v24.InfoFrame = u3.createElement(l__Empty__14, {
			Size = UDim2.fromScale(0.78125, 1), 
			Position = UDim2.fromScale(0.20625, 0.5), 
			AnchorPoint = Vector2.new(0, 0.5), 
			BackgroundTransparency = 1
		}, v34);
		v21[v22 + 1] = u3.createElement("Frame", v23, v24);
		local l__voterUserIds__35 = p1.cardState.voterUserIds;
		local function v36(p3, p4, p5)
			local v37 = #p5 > 8;
			local v38 = v37 and p4 == 7;
			if v37 and p4 >= 8 then
				return nil;
			end;
			local v39 = false;
			if not l__DeviceUtil__4.isHoarceKat() then
				v39 = p3 == l__Players__15.LocalPlayer.UserId;
			end;
			local v40 = { u3.createElement("UIAspectRatioConstraint", {
					AspectRatio = 1
				}) };
			local v41 = {
				Size = UDim2.fromScale(1, 1), 
				BackgroundTransparency = 0.1, 
				BackgroundColor3 = l__ColorUtil__12.BLACK
			};
			if v38 then
				local v42 = nil;
			else
				v42 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(p3) .. "&w=48&h=48";
			end;
			v41.Image = v42;
			local v43 = {};
			local v44 = {
				Thickness = 2
			};
			if v39 then
				local v45 = l__Theme__8.mcGreen;
			else
				v45 = l__ColorUtil__12.WHITE;
			end;
			v44.Color = v45;
			if v39 then
				local v46 = 0;
			else
				v46 = 0.3;
			end;
			v44.Transparency = v46;
			v43[1] = u3.createElement("UICorner", {
				CornerRadius = UDim.new(1, 0)
			});
			v43[2] = u3.createElement("UIStroke", v44);
			local v47 = v38 and u3.createElement("TextLabel", {
				Size = UDim2.fromScale(0.8, 0.8), 
				Position = UDim2.fromScale(0.5, 0.5), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				TextColor3 = l__ColorUtil__12.WHITE, 
				Text = "+" .. tostring(#p5 - 8 + 1), 
				TextScaled = true, 
				BackgroundTransparency = 1, 
				Font = "SourceSansBold"
			});
			if v47 then
				v43[#v43 + 1] = v47;
			end;
			v40[#v40 + 1] = u3.createElement("ImageLabel", v41, v43);
			return u3.createElement("Frame", {
				Size = UDim2.fromScale(0.10964912280701754, 1), 
				BackgroundTransparency = 1
			}, v40);
		end;
		local v48 = {};
		local v49 = 0;
		local v50, v51, v52 = ipairs(l__voterUserIds__35);
		while true do
			v50(v51, v52);
			if not v50 then
				break;
			end;
			v52 = v50;
			local v53 = v36(v51, v50 - 1, l__voterUserIds__35);
			if v53 ~= nil then
				v49 = v49 + 1;
				v48[v49] = v53;
			end;		
		end;
		local v54 = {
			Size = UDim2.fromScale(0.4989059080962801, 0.21551724137931033), 
			Position = UDim2.fromScale(0.9835886214442013, 0.99), 
			AnchorPoint = Vector2.new(1, 0.5), 
			BackgroundTransparency = 1
		};
		local v55 = { u3.createElement("UIListLayout", {
				SortOrder = "LayoutOrder", 
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Right", 
				VerticalAlignment = "Center", 
				Padding = UDim.new(0.03070175438596491)
			}) };
		local v56 = #v55;
		local v57, v58, v59 = ipairs(v48);
		while true do
			v57(v58, v59);
			if not v57 then
				break;
			end;
			v59 = v57;
			v55[v56 + v57] = v58;		
		end;
		v21[v22 + 2] = u3.createElement("Frame", v54, v55);
		return u3.createFragment({
			CardFrame = u3.createElement("ImageButton", v20, v21)
		});
	end)
};
