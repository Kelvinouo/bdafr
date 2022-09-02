-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__Flamework__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__DeviceUtil__3 = v2.DeviceUtil;
local l__KnitClient__4 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u6 = v1.import(script, script.Parent, "rewards", "social-connections-reward-section").SocialConnectionsRewardSection;
local u7 = v1.import(script, script.Parent, "social-connections-section-title").SocialConnectionsSectionTitle;
local l__SocialConnectionsDiscord__8 = v1.import(script, script.Parent, "verify-discord", "social-connections-discord").SocialConnectionsDiscord;
local l__DarkBackground__9 = v2.DarkBackground;
local l__SlideIn__10 = v2.SlideIn;
local l__ScaleComponent__11 = v2.ScaleComponent;
local l__WidgetComponent__12 = v2.WidgetComponent;
local l__ImageId__13 = v2.ImageId;
local u14 = v1.import(script, script.Parent, "social-connections-connect-info-card").SocialConnectionsConnectInfoCard;
local l__ColorUtil__15 = v2.ColorUtil;
local l__SocialConnectionsGroup__16 = v1.import(script, script.Parent, "verify-group", "social-connections-group").SocialConnectionsGroup;
local l__DividerComponent__17 = v2.DividerComponent;
return {
	SocialConnectionsCore = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u5)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local l__useMemo__4 = p2.useMemo;
		local l__useEffect__5 = p2.useEffect;
		local v6 = true;
		local v7, v8, v9 = ipairs((u1.values(p1.store.SocialConnections.supportTasks)));
		while true do
			v7(v8, v9);
			if not v7 then
				break;
			end;
			v9 = v7;
			if v8 ~= true then
				v6 = false;
				break;
			end;		
		end;
		local v10, v11 = l__useState__3(v6);
		local v12 = true;
		local v13, v14, v15 = ipairs((u1.values(p1.store.SocialConnections.connections)));
		while true do
			v13(v14, v15);
			if not v13 then
				break;
			end;
			v15 = v13;
			if v14.validated ~= true then
				v12 = false;
				break;
			end;		
		end;
		local v16, v17 = l__useState__3(v12);
		local v18 = {};
		local v19 = {};
		local v20 = {};
		local v21 = {
			AppId = p1.AppId, 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromScale(1, 1), 
			ClipsDescendents = false, 
			TitleIcon = l__ImageId__13.SATELITE, 
			Title = "Connections"
		};
		if not l__DeviceUtil__3.isHoarceKat() then
			if l__KnitClient__4.Controllers.SocialConnectionsController.policyDiscordAllowed then
				local v22 = "Complete support & verify discord for a reward";
			else
				v22 = "Complete support section for a reward";
			end;
		else
			v22 = "Complete support & verify discord for a reward";
		end;
		v21.SubTitle = v22;
		function v21.OnClose()
			l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(p1.AppId);
		end;
		v20[1] = u5.createElement(l__ScaleComponent__11, {
			MaximumSize = Vector2.new(550, 630), 
			ScreenPadding = Vector2.new(24, 24)
		});
		v20[2] = u5.createElement(l__WidgetComponent__12, v21, {
			SupportConnections = u5.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, 0), 
				AutomaticSize = "Y", 
				BackgroundTransparency = 1, 
				LayoutOrder = 1
			}, { u5.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					VerticalAlignment = Enum.VerticalAlignment.Center, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 8)
				}), u5.createElement(u7, {
					Title = "<b>1. Support The Game</b>", 
					Completed = v10, 
					LayoutOrder = 1
				}), u5.createElement(u14, {
					Size = UDim2.new(1, 0, 0, 46), 
					ImageId = l__ImageId__13.THUMBS_UP_SOLID, 
					Text = "<b>Like</b>, \226\173\144 <b>favorite</b>, and ", 
					store = p1.store, 
					MiddleElementEmbed = {
						element = u5.createElement("Frame", {
							Size = UDim2.fromOffset(18, 12.65625), 
							BackgroundTransparency = 1
						}, { u5.createElement("ImageLabel", {
								Size = UDim2.fromOffset(18, 12.65625), 
								Rotation = 47, 
								ScaleType = "Fit", 
								SizeConstraint = "RelativeYY", 
								Image = l__ImageId__13.WIFI_SOLID, 
								ImageColor3 = l__ColorUtil__15.hexColor(16752398), 
								BackgroundTransparency = 1
							}) }), 
						rightText = "<b>follow</b> the game"
					}, 
					LayoutOrder = 2
				}), u5.createElement(l__SocialConnectionsGroup__16, {
					store = p1.store
				}), u5.createElement(u14, {
					Size = UDim2.new(1, 0, 0, 46), 
					ImageId = l__ImageId__13.TWITTER_SOLID, 
					Text = "<b>Follow</b> us on Twitter <font color=\"#1EA1F2\">@RobloxBedWars</font>", 
					LayoutOrder = 4
				}) }),
			u5.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 10)
			}), l__useMemo__4(function()
				local v23 = {};
				if not l__DeviceUtil__3.isHoarceKat() then
					local v24 = l__KnitClient__4.Controllers.SocialConnectionsController.policyDiscordAllowed;
				else
					v24 = true;
				end;
				if v24 then
					v24 = u5.createFragment({
						ExternalConnections = u5.createElement("Frame", {
							Size = UDim2.new(1, 0, 0, 0), 
							AutomaticSize = "Y", 
							BackgroundTransparency = 1, 
							LayoutOrder = 2
						}, { u5.createElement("UIListLayout", {
								FillDirection = Enum.FillDirection.Vertical, 
								HorizontalAlignment = Enum.HorizontalAlignment.Left, 
								VerticalAlignment = Enum.VerticalAlignment.Center, 
								SortOrder = Enum.SortOrder.LayoutOrder, 
								Padding = UDim.new(0, 10)
							}), u5.createElement(u7, {
								Title = "<b>2. Verify Discord</b>", 
								Completed = v16, 
								LayoutOrder = 1
							}), u5.createElement(l__SocialConnectionsDiscord__8, {
								LayoutOrder = 2, 
								store = p1.store
							}) })
					});
				end;
				if v24 then
					v23[#v23 + 1] = v24;
				end;
				return u5.createFragment(v23);
			end, { p1.store.SocialConnections.connections.discord.verificationCode, p1.store.SocialConnections.connections.discord.validated }), u5.createElement(l__DividerComponent__17, {
				Margin = 2, 
				LayoutOrder = 3
			}), (l__useMemo__4(function()
				local v25 = {};
				if not l__DeviceUtil__3.isHoarceKat() and not l__KnitClient__4.Controllers.SocialConnectionsController.policyDiscordAllowed then
					if v10 then
						local v26 = 1;
					else
						v26 = 0;
					end;
				else
					if v10 then
						local v27 = 1;
					else
						v27 = 0;
					end;
					if v16 then
						local v28 = 1;
					else
						v28 = 0;
					end;
					v26 = v27 + v28;
				end;
				v25.CompletedCount = v26;
				v25.LayoutOrder = 4;
				return u5.createElement(u6, v25);
			end, { v10, v16 }))
		});
		v19[1] = u5.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromOffset(440, 510), 
			BackgroundTransparency = 1
		}, v20);
		v18[1] = u5.createElement(l__DarkBackground__9, {
			AppId = p1.AppId
		});
		v18[2] = u5.createElement(l__SlideIn__10, {}, v19);
		return u5.createFragment(v18);
	end)
};
