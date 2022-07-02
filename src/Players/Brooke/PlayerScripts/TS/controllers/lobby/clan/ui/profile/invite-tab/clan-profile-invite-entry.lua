-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__DeviceUtil__2 = v2.DeviceUtil;
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__6 = v2.Empty;
local l__Theme__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__SoundManager__8 = v2.SoundManager;
local l__LobbyClientConfig__9 = v1.import(script, v1.getModule(script, "@easy-games", "lobby").out).LobbyClientConfig;
local l__TweenService__10 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__PlayerRender__11 = v2.PlayerRender;
local l__ColorUtil__12 = v2.ColorUtil;
local l__ImageId__13 = v2.ImageId;
return {
	ClanProfileInviteEntry = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u5)(function(p1, p2)
		local v3, v4 = p2.useState(false);
		local v5 = {};
		local v6 = {
			Size = UDim2.new(0.9, 0, 1, 0), 
			BackgroundColor3 = l__Theme__7.backgroundPrimary, 
			BackgroundTransparency = 0, 
			BorderSizePixel = 0, 
			ZIndex = 10, 
			ImageTransparency = 1, 
			AutoButtonColor = false
		};
		v6[u5.Event.MouseButton1Click] = function()
			l__SoundManager__8:playSound(l__LobbyClientConfig__9.sounds.UI_CLICK);
			v4(true);
			if l__DeviceUtil__2.isHoarceKat() then
				return;
			end;
			l__KnitClient__3.Controllers.ClanController:invitePlayerToClan(p1.Player, l__ClientStore__4:getState().Clans.myClanId);
		end;
		local u14 = u1.new();
		v6[u5.Event.MouseEnter] = function(p3)
			if v3 then
				return nil;
			end;
			u14:DoCleaning();
			local v7 = l__TweenService__10:Create(p3, TweenInfo.new(0.12), {
				BackgroundTransparency = 0.3
			});
			v7:Play();
			u14:GiveTask(function()
				v7:Cancel();
			end);
		end;
		v6[u5.Event.MouseLeave] = function(p4)
			if v3 then
				return nil;
			end;
			u14:DoCleaning();
			local v8 = l__TweenService__10:Create(p4, TweenInfo.new(0.12), {
				BackgroundTransparency = 0
			});
			v8:Play();
			u14:GiveTask(function()
				v8:Cancel();
			end);
		end;
		local v9 = {};
		if v3 then
			local v10 = u5.createElement("TextLabel", {
				Size = UDim2.fromScale(0.3, 1), 
				Text = "(Invited)", 
				TextColor3 = l__ColorUtil__12.hexColor(16777215), 
				TextXAlignment = "Right", 
				BackgroundTransparency = 1, 
				TextTransparency = 0, 
				BorderSizePixel = 0, 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				ZIndex = 21, 
				LayoutOrder = 3
			}, { u5.createElement("UITextSizeConstraint", {
					MaxTextSize = 16
				}) });
		else
			v10 = u5.createElement(l__Empty__6, {
				Size = UDim2.fromScale(0.3, 1)
			}, { u5.createElement("ImageLabel", {
					Position = UDim2.fromScale(1, 0.5), 
					AnchorPoint = Vector2.new(1, 0.5), 
					Image = l__ImageId__13.PLUS, 
					Size = UDim2.fromScale(1, 0.5), 
					SizeConstraint = "RelativeYY", 
					ScaleType = "Fit", 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					ZIndex = 21, 
					LayoutOrder = 3
				}) });
		end;
		v9[1] = u5.createElement("UICorner", {
			CornerRadius = UDim.new(0.1, 0)
		});
		v9[2] = u5.createElement("UIPadding", {
			PaddingLeft = UDim.new(0.05, 0), 
			PaddingRight = UDim.new(0.05, 0)
		});
		v9[3] = u5.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			VerticalAlignment = "Center", 
			SortOrder = "LayoutOrder"
		});
		v9[4] = u5.createElement(l__Empty__6, {
			Size = UDim2.fromScale(0.7, 1)
		}, { u5.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				VerticalAlignment = "Center", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0.05, 0)
			}), u5.createElement(l__PlayerRender__11, {
				Player = p1.Player, 
				FallbackTransparency = 1, 
				Size = UDim2.fromScale(1, 0.7), 
				SizeConstraint = "RelativeYY", 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				ZIndex = 21, 
				LayoutOrder = 1
			}, { u5.createElement("UIAspectRatioConstraint", {
					AspectRatio = 1
				}), u5.createElement("UICorner", {
					CornerRadius = UDim.new(1, 0)
				}) }), u5.createElement("TextLabel", {
				Size = UDim2.fromScale(0, 1), 
				AutomaticSize = "X", 
				SizeConstraint = "RelativeXX", 
				Text = "<b>" .. p1.Player.displayName .. "</b>", 
				TextColor3 = l__ColorUtil__12.hexColor(16777215), 
				TextXAlignment = "Left", 
				BackgroundTransparency = 1, 
				TextTransparency = 0, 
				BorderSizePixel = 0, 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				ZIndex = 21, 
				LayoutOrder = 2, 
				AutoLocalize = false
			}, { u5.createElement("UITextSizeConstraint", {
					MaxTextSize = 16
				}) }) });
		v9[5] = v10;
		v5[1] = u5.createElement("ImageButton", v6, v9);
		return u5.createElement(l__Empty__6, {
			Size = UDim2.new(1, 0, 0, 40)
		}, v5);
	end)
};
