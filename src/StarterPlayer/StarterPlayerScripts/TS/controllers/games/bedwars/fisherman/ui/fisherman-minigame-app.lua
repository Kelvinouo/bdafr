-- Script Hash: e8d8fa2aa689a2a840463d0c28d4575e88f439c803da0993db8b2316cdee8ce0b381c52949618deaeb3135396199368a
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__SoundManager__1 = v2.SoundManager;
local l__GameSound__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ContextActionService__4 = v3.ContextActionService;
local l__FishermanUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "fisherman", "fisherman-util").FishermanUtil;
local l__RunService__6 = v3.RunService;
local u7 = v2.ExpireList.new(3);
local l__DeviceUtil__8 = v2.DeviceUtil;
local l__KnitClient__9 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__ClientSyncEvents__10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__TweenService__11 = v3.TweenService;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__UIUtil__13 = v2.UIUtil;
local l__Empty__14 = v2.Empty;
local l__ColorUtil__15 = v2.ColorUtil;
local u16 = v1.import(script, script.Parent, "fisherman-minigame-countdown").FishermanMinigameCountdown;
local l__BedwarsImageId__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
return {
	FishermanMinigameApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u12)(function(p1, p2)
		local l__useState__4 = p2.useState;
		local l__useEffect__5 = p2.useEffect;
		local v6, v7 = l__useState__4(false);
		local v8, v9 = l__useState__4(false);
		local v10, v11 = l__useState__4(25);
		local u18 = nil;
		local u19 = nil;
		local u20 = nil;
		local u21 = nil;
		local u22 = nil;
		local u23 = nil;
		l__useEffect__5(function()
			local v12 = l__SoundManager__1:playSound(l__GameSound__2.FISHERMAN_GAME_START);
			local u24 = u3.new();
			local u25 = false;
			l__ContextActionService__4:BindAction("fishing-click", function(p3, p4, p5)
				if p4 == Enum.UserInputState.Begin then
					u24:DoCleaning();
					u25 = true;
					u24:GiveTask(function()
						u25 = false;
					end);
					local v13 = 0;
					local v14 = l__SoundManager__1:playSound(l__GameSound__2.FISHERMAN_GAME_PULLING_LOOP);
					if v14 then
						v14.Looped = true;
						u24:GiveTask(v14);
					end;
					while u25 do
						u18(l__FishermanUtil__5.startingMarkerIncrementSpeed - v13);
						v13 = v13 + 0.01;
						v1.Promise.delay(0.05):await();					
					end;
				elseif p4 == Enum.UserInputState.End then
					u24:DoCleaning();
					u19();
				end;
			end, false, Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2, Enum.UserInputType.Touch);
			local u26 = 0;
			local u27 = nil;
			local v15 = l__SoundManager__1:playSound(l__GameSound__2.FISHERMAN_GAME_LOOP);
			if v15 then
				v15.Looped = true;
			end;
			local u28 = l__RunService__6.RenderStepped:Connect(function(p6)
				local v16 = math.round(u26 * 10) / 10;
				if v16 ~= 0 and v16 % l__FishermanUtil__5.fishZoneMoveCooldown == 0 and not u7:has("moveFishZone") then
					u20();
					u7:add("moveFishZone");
				end;
				if u21(p6) then
					if not u27 then
						u27 = l__SoundManager__1:playSound(l__GameSound__2.FISHERMAN_GAME_PROGRESS_INCREASE);
						if u27 then
							u27.Looped = true;
						end;
					end;
				else
					if u27 ~= nil then
						u27:Destroy();
					end;
					u27 = nil;
				end;
				if u22() then
					u23();
				end;
				u26 = u26 + p6;
			end);
			return function()
				if v12 ~= nil then
					v12:Destroy();
				end;
				if u27 ~= nil then
					u27:Destroy();
				end;
				if v15 ~= nil then
					v15:Destroy();
				end;
				u24:DoCleaning();
				l__ContextActionService__4:UnbindAction("fishing-click");
				if u28 then
					u28:Disconnect();
				end;
			end;
		end, {});
		l__useEffect__5(function()
			if not v6 then
				return nil;
			end;
			u23();
			if not l__DeviceUtil__8.isHoarceKat() then
				l__KnitClient__9.Controllers.FishermanController:closeFishingMinigameApp();
			end;
		end, { v6 });
		u23 = function()
			if not v6 then
				return nil;
			end;
			l__ClientSyncEvents__10.FishermanMinigameEnd:fire(v6, v8, v10);
		end;
		local u29 = nil;
		u18 = function(p7)
			local v17 = nil;
			v17 = u29:getValue();
			if v6 or not v17 then
				return nil;
			end;
			l__TweenService__11:Create(v17, TweenInfo.new(math.max(p7, l__FishermanUtil__5.holdMinimumMarkerIncrementSpeed), Enum.EasingStyle.Linear), {
				Position = UDim2.new(math.min(v17.Position.X.Scale + l__FishermanUtil__5.markerIncrementAmount, 1 - v17.Size.X.Scale), 0, 0.5, 0)
			}):Play();
		end;
		u19 = function()
			local v18 = nil;
			v18 = u29:getValue();
			if v6 or not v18 then
				return nil;
			end;
			l__TweenService__11:Create(v18, TweenInfo.new(l__FishermanUtil__5.totalDecaySpeedSec * (v18.Position.X.Scale + v18.Size.X.Scale), Enum.EasingStyle.Linear), {
				Position = UDim2.new(0, 2, 0.5, 0)
			}):Play();
		end;
		local u30 = nil;
		u20 = function()
			local v19 = nil;
			v19 = u30:getValue();
			if v6 or not v19 then
				return nil;
			end;
			l__SoundManager__1:playSound(l__GameSound__2.FISHERMAN_GAME_FISH_MOVE);
			local v20 = math.random() * (1 - v19.Size.X.Scale);
			l__TweenService__11:Create(v19, TweenInfo.new(l__FishermanUtil__5.fishZoneSpeedMultiplier * math.abs(v19.Position.X.Scale - v20), Enum.EasingStyle.Linear), {
				Position = UDim2.new(v20, 0, 0.5, 0)
			}):Play();
		end;
		local u31 = nil;
		u21 = function(p8)
			local v21 = nil;
			v21 = u29:getValue();
			if v6 or not v21 then
				return nil;
			end;
			local v22 = u30:getValue();
			if v22.AbsolutePosition.X <= v21.AbsolutePosition.X and v21.AbsolutePosition.X + v21.AbsoluteSize.X <= v22.AbsolutePosition.X + v22.AbsoluteSize.X then
				u31(true, p8);
				return true;
			end;
			u31(false, p8);
			return false;
		end;
		local u32 = nil;
		u31 = function(p9, p10)
			local v23 = u32:getValue();
			local v24 = 60 * p10;
			if p9 then
				v23.Size = UDim2.new(math.min(v23.Size.X.Scale + l__FishermanUtil__5.fillAmount * v24, 1), 0, 1, 0);
				return;
			end;
			local v25 = p1.decaySpeedMultiplier;
			if v25 == nil then
				v25 = 1;
			end;
			v23.Size = UDim2.new(math.max(v23.Size.X.Scale - l__FishermanUtil__5.drainAmount * v25 * v24, 0), 0, 1, 0);
		end;
		u22 = function()
			local v26 = nil;
			v26 = u32:getValue();
			if v6 or not v26 then
				return nil;
			end;
			if v26.Size.X.Scale ~= 1 then
				return false;
			end;
			v9(true);
			v7(true);
			return true;
		end;
		u29 = u12.createRef();
		u30 = u12.createRef();
		u32 = u12.createRef();
		local v27 = Color3.fromRGB(0, 255, 56);
		local l__fishType__28 = p1.fishType;
		if l__fishType__28 == "fish_diamond" then
			v27 = Color3.fromRGB(2, 247, 247);
		elseif l__fishType__28 == "fish_gold" then
			v27 = Color3.fromRGB(247, 181, 44);
		elseif l__fishType__28 == "fish_iron" then
			v27 = Color3.fromRGB(145, 140, 146);
		elseif l__fishType__28 == "fish_special" then
			v27 = Color3.fromRGB(220, 111, 127);
		end;
		local v29 = {};
		if l__DeviceUtil__8.isHoarceKat() then
			local v30 = UDim2.fromScale(0.3, 0.3);
		else
			v30 = UDim2.fromScale(1, 1);
		end;
		v29.Size = v30;
		v29.SizeConstraint = "RelativeXX";
		if l__DeviceUtil__8.isHoarceKat() then
			local v31 = l__UIUtil__13:getActionBarPosition();
		else
			v31 = nil;
		end;
		v29.Position = v31;
		v29.AnchorPoint = Vector2.new(0.5, 0.5);
		local v32 = { u12.createElement("UIAspectRatioConstraint", {
				AspectRatio = 5.830188679245283
			}) };
		local v33 = not v6 and u12.createFragment({ u12.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				HorizontalAlignment = "Center", 
				VerticalAlignment = "Center", 
				Padding = UDim.new(0, 8), 
				SortOrder = "LayoutOrder"
			}), u12.createElement(l__Empty__14, {
				Size = UDim2.fromScale(1, 0.2)
			}, { u12.createElement(l__Empty__14, {
					Size = UDim2.fromScale(0.6, 1)
				}, {
					Instructions = u12.createElement("TextLabel", {
						Size = UDim2.fromScale(0, 1), 
						AutomaticSize = "X", 
						BackgroundColor3 = l__ColorUtil__15.BLACK, 
						BackgroundTransparency = 0.6, 
						BorderSizePixel = 0, 
						TextColor3 = l__ColorUtil__15.WHITE, 
						Font = Enum.Font.Roboto, 
						TextScaled = true, 
						Text = "Hold down to keep the red box within the fish zone", 
						LayoutOrder = 1
					}, { u12.createElement("UICorner", {
							CornerRadius = UDim.new(0, 5)
						}), u12.createElement("UIPadding", {
							PaddingTop = UDim.new(0.05, 0), 
							PaddingBottom = UDim.new(0.05, 0), 
							PaddingLeft = UDim.new(0, 6), 
							PaddingRight = UDim.new(0, 6)
						}) })
				}), u12.createElement(l__Empty__14, {
					Size = UDim2.fromScale(0.4, 1), 
					AnchorPoint = Vector2.new(1, 0), 
					Position = UDim2.fromScale(1, 0)
				}, { u12.createElement(u16, {
						HandleRanOutOfTime = function(p11)
							if v6 then
								return nil;
							end;
							v11(p11);
							v9(false);
							v7(true);
						end, 
						GameOver = v6
					}) }) }), u12.createElement(l__Empty__14, {
				Size = UDim2.fromScale(1, 0.8), 
				LayoutOrder = 2
			}, {
				Minigame = u12.createElement("Frame", {
					Size = UDim2.fromScale(1, 0.8), 
					BorderSizePixel = 0
				}, {
					Marker = u12.createElement("Frame", {
						Size = UDim2.new(l__FishermanUtil__5.markerSize.X.Scale, -4, l__FishermanUtil__5.markerSize.Y.Scale, -4), 
						Position = UDim2.new(0, 2, 0.5, 0), 
						AnchorPoint = Vector2.new(0, 0.5), 
						BackgroundColor3 = Color3.fromRGB(255, 105, 105), 
						[u12.Ref] = u29, 
						ZIndex = 3
					}, { u12.createElement("UIStroke", {
							Thickness = 2, 
							Color = Color3.fromRGB(181, 72, 75)
						}), u12.createElement("UICorner", {
							CornerRadius = UDim.new(0, 5)
						}) }), 
					FishZone = u12.createElement("Frame", {
						Size = UDim2.new(l__FishermanUtil__5.fishZoneSize.X.Scale, -4, l__FishermanUtil__5.fishZoneSize.Y.Scale, -4), 
						Position = UDim2.fromScale(0.5, 0.5), 
						AnchorPoint = Vector2.new(0, 0.5), 
						BackgroundColor3 = v27, 
						BackgroundTransparency = 0.5, 
						BorderSizePixel = 0, 
						[u12.Ref] = u30
					}, { u12.createElement("UICorner", {
							CornerRadius = UDim.new(0, 5)
						}), u12.createElement("UIStroke", {
							Thickness = 2, 
							Color = l__ColorUtil__15.darken(v27, 0.6)
						}), u12.createElement("ImageLabel", {
							Position = UDim2.fromScale(0.5, 0.5), 
							AnchorPoint = Vector2.new(0.5, 0.5), 
							Size = UDim2.fromScale(0.3, 0.7), 
							Rotation = -20, 
							ScaleType = "Fit", 
							Image = l__BedwarsImageId__17.FISH_SOLID, 
							BackgroundTransparency = 1
						}) }),
					u12.createElement("UIGradient", {
						Rotation = 90, 
						Color = ColorSequence.new(Color3.fromRGB(87, 154, 253)), 
						Transparency = NumberSequence.new(0.5)
					}), u12.createElement("UICorner", {
						CornerRadius = UDim.new(0, 5)
					}), (u12.createElement("UIStroke", {
						Color = l__ColorUtil__15.WHITE, 
						Thickness = 2
					}))
				}), 
				ProgressBar = u12.createElement("Frame", {
					Size = UDim2.fromScale(0.9, 0.2), 
					BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
					BackgroundTransparency = 0.3, 
					BorderSizePixel = 0
				}, { u12.createElement("UICorner", {
						CornerRadius = UDim.new(0, 5)
					}), u12.createElement("Frame", {
						Size = UDim2.fromScale(0, 0), 
						[u12.Ref] = u32, 
						BackgroundColor3 = Color3.fromRGB(255, 221, 40), 
						BorderSizePixel = 0
					}, { u12.createElement("UICorner", {
							CornerRadius = UDim.new(0, 5)
						}) }) }),
				(u12.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					HorizontalAlignment = "Center", 
					VerticalAlignment = "Center", 
					Padding = UDim.new(0, 0)
				}))
			}) });
		if v33 then
			v32[#v32 + 1] = v33;
		end;
		return u12.createElement(l__Empty__14, v29, v32);
	end)
};
