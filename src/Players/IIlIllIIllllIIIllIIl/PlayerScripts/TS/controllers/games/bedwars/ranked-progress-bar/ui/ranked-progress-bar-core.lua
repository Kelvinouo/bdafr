-- Script Hash: f3ce37484f45e72e6aa9026580e7ee9590ec1b2d7d7228bda5be006b249edca9b704db341e771750c7304c703a232b67
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__RankMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta;
local l__NumberSpinner__2 = v2.NumberSpinner;
local l__TweenService__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__SoundManager__4 = v2.SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "inspect").inspect);
local l__Promise__7 = v3.Promise;
local l__ClientSyncEvents__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__KnitClient__9 = v3.KnitClient;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__11 = v2.Empty;
local l__ColorUtil__12 = v2.ColorUtil;
local l__BedwarsImageId__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__SlideIn__14 = v2.SlideIn;
return {
	RankedProgressBarCore = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u10)(function(p1, p2)
		local l__RankChangeData__4 = p1.RankChangeData;
		local v5, v6 = p2.useState(l__RankMeta__1[l__RankChangeData__4.oldDivision.division]);
		local u15 = nil;
		local u16 = nil;
		local u17 = nil;
		local u18 = nil;
		local u19 = nil;
		local u20 = nil;
		local u21 = nil;
		local u22 = p1.RankChangeData.matchesPlayed == 5;
		p2.useEffect(function()
			local l__rankPoints__7 = l__RankChangeData__4.oldDivision.rankPoints;
			local l__rpDelta__8 = l__RankChangeData__4.rpDelta;
			local v9 = l__NumberSpinner__2.fromGuiObject((u16:getValue()));
			v9.Decimals = 0;
			v9.Prefix = "";
			v9.Suffix = "/ " .. tostring(100);
			v9.Value = l__rankPoints__7;
			local u23 = u17:getValue();
			local u24 = l__rpDelta__8 > 0;
			local u25 = l__rankPoints__7;
			local function u26(p3, p4, p5)
				v9.Duration = p3;
				v9.Value = p4;
				l__TweenService__3:Create(u23, TweenInfo.new(p3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
					Size = UDim2.fromScale(math.min(p4 / 100, 1), 1)
				}):Play();
				if p5 ~= false then
					l__SoundManager__4:playSound(l__GameSound__5.BATTLE_PASS_PROGRESS_EXP_GAIN);
				end;
			end;
			local u27 = v5;
			local u28 = l__rpDelta__8 < 0;
			local u29 = u18:getValue();
			local u30 = u19:getValue();
			local u31 = u20:getValue();
			local u32 = true;
			local u33 = l__rpDelta__8;
			local u34 = u21:getValue();
			local function u35(p6)
				local v10 = p1.RankChangeData.oldDivision.division;
				if u24 then
					u25 = 0;
					u26(0.03, u25, false);
					l__SoundManager__4:playSound(l__GameSound__5.PROMOTION_INDICATION);
					v10 = u27.nextRank;
				elseif u28 then
					u25 = 100;
					u26(0.03, u25, false);
					v10 = u27.prevRank;
				end;
				local v11 = l__TweenService__3:Create(u29, TweenInfo.new(0.25), {
					ImageTransparency = 1
				});
				local v12 = l__TweenService__3:Create(u30, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
					ImageTransparency = 0.3, 
					Size = UDim2.fromScale(1.4, 1.4)
				});
				local v13 = l__TweenService__3:Create(u30, TweenInfo.new(50, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
					Rotation = 360
				});
				local v14 = l__TweenService__3:Create(u30, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
					ImageTransparency = 1, 
					Size = UDim2.fromScale(1, 1)
				});
				local v15 = l__TweenService__3:Create(u31, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
					Visible = true, 
					Position = UDim2.fromScale(0.5, 0)
				});
				local v16 = u31:FindFirstChild("PromotionCongratulationsMessage");
				if p6 ~= "" and p6 then
					v16.Text = p6;
				else
					if u24 then
						local v17 = "<b>YOU HAVE BEEN PROMOTED</b>";
					else
						v17 = "<b>YOU HAVE BEEN DEMOTED</b>";
					end;
					v16.Text = v17;
				end;
				local l__PromotionRankMessage__18 = u31:FindFirstChild("PromotionRankMessage");
				local v19 = l__TweenService__3:Create(v16, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
					TextTransparency = 1
				});
				local v20 = l__TweenService__3:Create(l__PromotionRankMessage__18, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
					TextTransparency = 1
				});
				local v21 = l__TweenService__3:Create(u29, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
					Size = UDim2.fromScale(1, 1)
				});
				local v22 = l__TweenService__3:Create(u29, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
					ImageTransparency = 0
				});
				v11:Play();
				local u36 = false;
				local u37 = nil;
				local u38 = v11.Completed:Connect(function()
					print("SETTING NEW RANK:", u6(v10));
					v6(l__RankMeta__1[v10]);
					u27 = l__RankMeta__1[v10];
					v15:Play();
					l__SoundManager__4:playSound(l__GameSound__5.PROMOTION_RANKUP);
					u29.Size = UDim2.fromScale(1.7, 1.7);
					v21:Play();
					v22:Play();
				end);
				local u39 = v22.Completed:Connect(function()
					u36 = true;
					if u28 then
						return nil;
					end;
					v12:Play();
					v12.Completed:Connect(function()
						v13:Play();
						u37 = l__SoundManager__4:playSound(l__GameSound__5.PROMOTION_SHINE_LOOP);
						u37.Looped = true;
					end);
				end);
				while not u36 and { wait() } do
				
				end;
				if u22 then
					return nil;
				end;
				wait(3);
				v20:Play();
				v19:Play();
				if u37 then
					u37:Stop();
					u37:Destroy();
				end;
				v14:Play();
				v13:Destroy();
				local function u40()
					u38:Disconnect();
					u39:Disconnect();
					v16.TextTransparency = 0;
					l__PromotionRankMessage__18.TextTransparency = 0;
					u31.Visible = false;
					u31.Position = UDim2.fromScale(0.5, 0.5);
				end;
				v20.Completed:Connect(function()
					u40();
				end);
			end;
			local u41 = nil;
			local u42 = nil;
			local function u43(p7)
				if not u32 or p7 == 0 then
					return nil;
				end;
				u25 = u25 + p7;
				u33 = u33 - p7;
				u26(0.5, u25);
				wait(0.5);
			end;
			local function u44()
				local v23 = l__NumberSpinner__2.fromGuiObject(u34);
				v23.Duration = 0;
				v23.Decimals = 0;
				v23.Prefix = "";
				if u24 then
					local v24 = "+";
				else
					v24 = "";
				end;
				v23.Suffix = "  " .. v24 .. " " .. tostring(u33) .. " RP";
				v23.Value = u25;
				l__Promise__7.defer(function()
					wait(1);
					v23.Duration = 2;
					while true do
						local v25 = u33;
						if v25 ~= 0 and v25 == v25 and v25 then
							v25 = u32;
						end;
						if v25 == 0 then
							break;
						end;
						if v25 ~= v25 then
							break;
						end;
						if not v25 then
							break;
						end;
						if u25 + u33 < 0 and not u27.noInstantDemote then
							v23.Value = 0;
							u33 = u33 - u25;
							u35();
							u41();
							return nil;
						end;
						v23.Value = u25 + u33;
						u25 = u25 + u33;
						u33 = 0;					
					end;
					local v26 = p1.AliveSecsAfterEnd;
					if v26 == nil then
						v26 = 4;
					end;
					wait(v26);
					u42();
				end);
			end;
			u41 = function()
				l__Promise__7.defer(function()
					wait(1);
					while true do
						local v27 = u33;
						if v27 ~= 0 and v27 == v27 and v27 then
							v27 = u32 and not u27.noRPLimit;
						end;
						if v27 == 0 then
							break;
						end;
						if v27 ~= v27 then
							break;
						end;
						if not v27 then
							break;
						end;
						if u24 then
							local v28 = 100 - u25;
							local v29 = math.min(u33, v28);
						else
							v28 = -u25;
							v29 = math.max(u33, v28);
						end;
						u43(v29);
						if u24 and (u25 == 100 or v28 <= u33) then
							u35();
						elseif not u24 and u33 < v28 then
							u35();
						end;					
					end;
					local v30 = u33;
					if v30 ~= 0 and v30 == v30 and v30 then
						v30 = u27.noRPLimit;
					end;
					if v30 ~= 0 and v30 == v30 and v30 then
						u25 = 0;
						u44();
						return nil;
					end;
					local v31 = p1.AliveSecsAfterEnd;
					if v31 == nil then
						v31 = 4;
					end;
					wait(v31);
					u42();
				end);
			end;
			if u22 then
				l__Promise__7.defer(function()
					u35("YOU HAVE PLACED INTO");
				end);
			elseif u27.noRPLimit then
				u44();
			elseif not u27.noRPLimit then
				u41();
			end;
			local u45 = u15:getValue();
			u42 = function()
				l__TweenService__3:Create(u45, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
					Position = UDim2.fromScale(0.5, 2), 
					Transparency = 1
				}):Play();
				l__ClientSyncEvents__8.MatchEndScreenEnd:fire(2);
				l__KnitClient__9.Controllers.MatchEndController:unmountPostGameRankedProgressApp();
			end;
			return function()
				u32 = false;
			end;
		end, {});
		u15 = u10.createRef();
		u18 = u10.createRef();
		u19 = u10.createRef();
		u20 = u10.createRef();
		u16 = u10.createRef();
		u17 = u10.createRef();
		u21 = u10.createRef();
		local v32 = {};
		local v33 = { (u10.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				HorizontalAlignment = "Center", 
				VerticalAlignment = "Center", 
				Padding = UDim.new(0.03, 0), 
				SortOrder = "LayoutOrder"
			})) };
		local v34 = {};
		local v35 = {};
		local v36 = {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = v5.imageSize, 
			Image = v5.image, 
			BackgroundTransparency = 1
		};
		if u22 then
			local v37 = 1;
		else
			v37 = 0;
		end;
		v36.ImageTransparency = v37;
		v36.ScaleType = "Fit";
		v36[u10.Ref] = u18;
		v36.ZIndex = 2;
		v35.RankIcon = u10.createElement("ImageLabel", v36);
		v35[1] = u10.createElement("ImageLabel", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.new(1, 0, 1, 0), 
			Image = l__BedwarsImageId__13.SHINING_SPINNER, 
			BackgroundTransparency = 1, 
			ImageTransparency = 1, 
			ImageColor3 = v5.color, 
			ScaleType = "Fit", 
			[u10.Ref] = u19, 
			ZIndex = 1
		});
		v34[1] = u10.createElement(l__Empty__11, {
			AnchorPoint = Vector2.new(0.5, 0), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.new(0.6, 0, 0.25, 0), 
			[u10.Ref] = u20, 
			Visible = false
		}, {
			PromotionCongratulationsMessage = u10.createElement("TextLabel", {
				Size = UDim2.new(1, 0, 0.375, 0), 
				TextScaled = true, 
				RichText = true, 
				BackgroundTransparency = 1, 
				Text = "<b>YOU HAVE BEEN PROMOTED</b>", 
				TextColor3 = l__ColorUtil__12.WHITE, 
				LayoutOrder = 1
			}), 
			PromotionRankMessage = u10.createElement("TextLabel", {
				Size = UDim2.new(1, 0, 0.575, 0), 
				TextScaled = true, 
				RichText = true, 
				BackgroundTransparency = 1, 
				Font = "GothamBold", 
				Text = "<b>" .. string.upper(v5.name) .. "</b>", 
				TextColor3 = v5.color, 
				LayoutOrder = 2
			}),
			(u10.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				HorizontalAlignment = "Center", 
				VerticalAlignment = "Center", 
				Padding = UDim.new(0, 0.05), 
				SortOrder = "LayoutOrder"
			}))
		});
		v34[2] = u10.createElement(l__Empty__11, {
			AnchorPoint = Vector2.new(0.5, 1), 
			Position = UDim2.fromScale(0.5, 1), 
			Size = UDim2.new(1, 0, 0.75, 0)
		}, v35);
		v33.TextAndRankImage = u10.createElement(l__Empty__11, {
			Size = UDim2.new(1, 0, 0.57, 0), 
			LayoutOrder = 1
		}, v34);
		local v38 = { u10.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				HorizontalAlignment = "Right", 
				VerticalAlignment = "Center", 
				Padding = UDim.new(0, 8)
			}) };
		local v39 = {
			CurrentRank = u10.createElement("TextLabel", {
				Size = UDim2.new(0.5, 0, 1, 0), 
				Text = "<b>" .. v5.name .. "</b>", 
				TextColor3 = l__ColorUtil__12.WHITE, 
				Font = "Roboto", 
				TextXAlignment = "Left", 
				TextScaled = true, 
				RichText = true, 
				BackgroundTransparency = 1
			})
		};
		local v40 = false;
		if v5.nextRank ~= nil then
			v40 = u10.createFragment({
				NextRank = u10.createElement("TextLabel", {
					Size = UDim2.new(0.5, 0, 1, 0), 
					AnchorPoint = Vector2.new(1, 0), 
					Position = UDim2.fromScale(1, 0), 
					Text = "<b>" .. l__RankMeta__1[v5.nextRank].name .. "</b>", 
					TextColor3 = l__ColorUtil__12.WHITE, 
					Font = "Roboto", 
					TextXAlignment = "Right", 
					TextScaled = true, 
					RichText = true, 
					TextTransparency = 0.4, 
					BackgroundTransparency = 1
				})
			});
		end;
		if v40 then
			v39[#v39 + 1] = v40;
		end;
		v38[#v38 + 1] = u10.createElement(l__Empty__11, {
			Size = UDim2.new(1, 0, 0.3, 0)
		}, v39);
		v38.ProgressBarBackground = u10.createElement("Frame", {
			Size = UDim2.new(1, 0, 0.4, 0), 
			BackgroundColor3 = l__ColorUtil__12.BLACK, 
			BackgroundTransparency = 0.3, 
			BorderSizePixel = 0
		}, {
			ProgressBar = u10.createElement("Frame", {
				Size = UDim2.new(l__RankChangeData__4.oldDivision.rankPoints / 100, 0, 1, 0), 
				BackgroundColor3 = l__ColorUtil__12.WHITE, 
				BorderSizePixel = 0, 
				[u10.Ref] = u17
			}, { u10.createElement("UIGradient", {
					Rotation = -90, 
					Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v5.color), ColorSequenceKeypoint.new(1, l__ColorUtil__12.brighten(v5.color, 0.5)) })
				}) })
		});
		v38.ProgressNumber = u10.createElement("TextLabel", {
			Size = UDim2.new(1, 0, 0.3, 0), 
			Text = "<b>" .. tostring(l__RankChangeData__4.oldDivision.rankPoints) .. " / 100</b>", 
			TextColor3 = l__ColorUtil__12.WHITE, 
			Font = "Roboto", 
			TextXAlignment = "Right", 
			TextScaled = false, 
			RichText = true, 
			BackgroundTransparency = 1, 
			[u10.Ref] = u16
		});
		v33.ProgressContainer = u10.createElement(l__Empty__11, {
			Size = UDim2.new(1, 0, 0.22, 0), 
			LayoutOrder = 2, 
			Visible = not v5.noRPLimit and u22
		}, v38);
		local v41 = { (u10.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				HorizontalAlignment = "Center", 
				VerticalAlignment = "Center", 
				Padding = UDim.new(0, 8), 
				SortOrder = "LayoutOrder"
			})) };
		local v42 = {
			Size = UDim2.new(1, 0, 0.6, 0)
		};
		if l__RankChangeData__4.rpDelta > 0 then
			local v43 = "+";
		else
			v43 = "";
		end;
		v42.Text = "<b>" .. v43 .. " " .. tostring(l__RankChangeData__4.rpDelta) .. " <font color=\"#ffffff\">RP</font></b>";
		v42.TextColor3 = l__ColorUtil__12.hexColor(16773227);
		v42.Font = "Roboto";
		v42.TextScaled = true;
		v42.TextSize = 24;
		v42.RichText = true;
		v42.BackgroundTransparency = 1;
		v42.LayoutOrder = 1;
		v42.ZIndex = 2;
		v42[u10.Ref] = u21;
		v41.EloGainedCount = u10.createElement("TextLabel", v42);
		v41.MetricDescription = u10.createElement("TextLabel", {
			Size = UDim2.new(1, 0, 0.4, 0), 
			Text = "<b>RANK POINTS</b>", 
			TextColor3 = l__ColorUtil__12.WHITE, 
			Font = "Roboto", 
			TextTransparency = 0.4, 
			TextScaled = true, 
			RichText = true, 
			BackgroundTransparency = 1, 
			LayoutOrder = 2, 
			ZIndex = 2
		});
		v33[#v33 + 1] = u10.createElement(l__Empty__11, {
			Size = UDim2.new(1, 0, 0.15, 0), 
			LayoutOrder = 3, 
			Visible = not u22
		}, v41);
		v32[#v32 + 1] = u10.createElement(l__Empty__11, {
			AnchorPoint = p1.AnchorPoint or Vector2.new(0.5, 0.5), 
			Position = p1.Position or UDim2.fromScale(0.5, 0.45), 
			Size = UDim2.fromScale(0.6, 0.6), 
			BackgroundTransparency = 1, 
			[u10.Ref] = u15
		}, v33);
		return u10.createElement(l__SlideIn__14, {}, v32);
	end)
};
