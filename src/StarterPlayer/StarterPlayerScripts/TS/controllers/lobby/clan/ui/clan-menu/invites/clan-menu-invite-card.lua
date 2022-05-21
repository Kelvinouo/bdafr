-- Script Hash: 218e51d933e702484088d599e9380b772fc2f1b1759446eb5eb3d39d96a3407ac245a52a0c1bf21840735917940ada03
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__Maid__1 = v3.Maid;
local l__Flamework__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__KnitClient__4 = v3.KnitClient;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__SoundManager__7 = v2.SoundManager;
local l__LobbyClientConfig__8 = v1.import(script, v1.getModule(script, "@easy-games", "lobby").out).LobbyClientConfig;
local l__TweenService__9 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__Empty__10 = v2.Empty;
local l__ColorUtil__11 = v2.ColorUtil;
local l__IconButton__12 = v2.IconButton;
local l__BedwarsImageId__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
return {
	ClanMenuInviteCard = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u5)(function(p1, p2)
		local l__useState__4 = p2.useState;
		local v5 = {
			Size = UDim2.new(1, 0, 0, 80), 
			BackgroundColor3 = l__Theme__6.backgroundPrimary, 
			BackgroundTransparency = 0, 
			BorderSizePixel = 0, 
			ImageTransparency = 1, 
			AutoButtonColor = false
		};
		local function u14()
			l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__3.CLAN_PROFILE, {
				ClanId = p1.ClanId
			});
		end;
		v5[u5.Event.Activated] = function()
			l__SoundManager__7:playSound(l__LobbyClientConfig__8.sounds.UI_CLICK);
			u14();
		end;
		local u15 = l__Maid__1.new();
		v5[u5.Event.MouseEnter] = function(p3)
			u15:DoCleaning();
			local v6 = l__TweenService__9:Create(p3, TweenInfo.new(0.12), {
				BackgroundTransparency = 0.3
			});
			v6:Play();
			u15:GiveTask(function()
				v6:Cancel();
			end);
		end;
		v5[u5.Event.MouseLeave] = function(p4)
			u15:DoCleaning();
			local v7 = l__TweenService__9:Create(p4, TweenInfo.new(0.12), {
				BackgroundTransparency = 0
			});
			v7:Play();
			u15:GiveTask(function()
				v7:Cancel();
			end);
		end;
		local v8 = {};
		local v9 = { (u5.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Right", 
				VerticalAlignment = "Center", 
				Padding = UDim.new(0.1, 0), 
				SortOrder = "LayoutOrder"
			})) };
		local v10 = {
			Size = UDim2.fromScale(0.5, 0.5), 
			SizeConstraint = "RelativeYY", 
			Image = l__BedwarsImageId__13.CHECK_SOLID, 
			IconProps = {
				ImageColor3 = l__Theme__6.backgroundSuccess, 
				ScaleType = "Fit"
			}
		};
		local function u16(p5)
			l__KnitClient__4.Controllers.ClanController:clanInviteDecision(p1.ClanId, p5);
		end;
		function v10.OnClick()
			u16(true);
		end;
		v9.Accept = u5.createElement(l__IconButton__12, v10);
		v9.Decline = u5.createElement(l__IconButton__12, {
			Size = UDim2.fromScale(0.5, 0.5), 
			SizeConstraint = "RelativeYY", 
			Image = l__BedwarsImageId__13.X, 
			IconProps = {
				ImageColor3 = l__Theme__6.backgroundError, 
				ScaleType = "Fit"
			}, 
			OnClick = function()
				u16(false);
			end
		});
		v8[1] = u5.createElement("UICorner", {
			CornerRadius = UDim.new(0.1, 0)
		});
		v8[2] = u5.createElement("UIPadding", {
			PaddingLeft = UDim.new(0.05, 0), 
			PaddingRight = UDim.new(0.05, 0), 
			PaddingTop = UDim.new(0.05, 0), 
			PaddingBottom = UDim.new(0.05, 0)
		});
		v8[3] = u5.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			Padding = UDim.new(0, 10), 
			SortOrder = "LayoutOrder"
		});
		v8[4] = u5.createElement(l__Empty__10, {
			Size = UDim2.fromScale(0.7, 1)
		}, {
			ClanName = u5.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0), 
				AutomaticSize = "Y", 
				Text = "<b>" .. p1.ClanProfile.name .. " <font color=\"#FFFFFF\" transparency=\".3\" >[" .. p1.ClanProfile.tag .. "]</font></b>", 
				TextColor3 = l__Theme__6.textPrimary, 
				TextXAlignment = "Left", 
				BackgroundTransparency = 1, 
				TextTransparency = 0, 
				BorderSizePixel = 0, 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				LayoutOrder = 1, 
				AutoLocalize = false
			}, { u5.createElement("UITextSizeConstraint", {
					MaxTextSize = 20
				}) }), 
			ClanLevel = u5.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0), 
				AutomaticSize = "Y", 
				Text = "<b>Lv. " .. tostring(p1.ClanProfile.level) .. "</b>", 
				TextColor3 = l__Theme__6.mcYellow, 
				TextXAlignment = "Left", 
				BackgroundTransparency = 1, 
				TextTransparency = 0, 
				BorderSizePixel = 0, 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				LayoutOrder = 2, 
				AutoLocalize = false
			}, { u5.createElement("UITextSizeConstraint", {
					MaxTextSize = 18
				}) }), 
			ClanTag = u5.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0), 
				AutomaticSize = "Y", 
				Text = "Click to view clan", 
				TextColor3 = l__ColorUtil__11.WHITE, 
				TextXAlignment = "Left", 
				BackgroundTransparency = 1, 
				TextTransparency = 0.5, 
				BorderSizePixel = 0, 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				LayoutOrder = 2, 
				AutoLocalize = false
			}, { u5.createElement("UITextSizeConstraint", {
					MaxTextSize = 16
				}) }),
			(u5.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				VerticalAlignment = "Center", 
				SortOrder = "LayoutOrder"
			}))
		});
		v8[5] = u5.createElement(l__Empty__10, {
			Size = UDim2.fromScale(0.3, 1)
		}, v9);
		return u5.createElement("ImageButton", v5, v8);
	end)
};
