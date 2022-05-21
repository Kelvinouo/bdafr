-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__Flamework__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__DeviceUtil__3 = v2.DeviceUtil;
local l__KnitClient__4 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
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
		local v6 = u1.values(p1.store.SocialConnections.supportTasks);
		local function v7(p3)
			return p3 == true;
		end;
		local v8 = true;
		for v9, v10 in ipairs(v6) do
			if not v7(v10, v9 - 1, v6) then
				v8 = false;
				break;
			end;
		end;
		local v11, v12 = l__useState__3(v8);
		local v13 = u1.values(p1.store.SocialConnections.connections);
		local function v14(p4)
			return p4.validated == true;
		end;
		local v15 = true;
		for v16, v17 in ipairs(v13) do
			if not v14(v17, v16 - 1, v13) then
				v15 = false;
				break;
			end;
		end;
		local v18, v19 = l__useState__3(v15);
		local function u18()
			if not l__DeviceUtil__3.isHoarceKat() and not l__KnitClient__4.Controllers.SocialConnectionsController.policyDiscordAllowed then
				if v11 then
					return 1;
				else
					return 0;
				end;
			end;
			if v11 then
				local v20 = 1;
			else
				v20 = 0;
			end;
			if v18 then
				local v21 = 1;
			else
				v21 = 0;
			end;
			return v20 + v21;
		end;
		local function u19()
			if l__DeviceUtil__3.isHoarceKat() then
				return true;
			end;
			return l__KnitClient__4.Controllers.SocialConnectionsController.policyDiscordAllowed;
		end;
		return u5.createFragment({ u5.createElement(l__DarkBackground__9, {
				AppId = p1.AppId
			}), u5.createElement(l__SlideIn__10, {}, { u5.createElement("Frame", {
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Position = UDim2.fromScale(0.5, 0.5), 
					Size = UDim2.fromOffset(440, 510), 
					BackgroundTransparency = 1
				}, { u5.createElement(l__ScaleComponent__11, {
						MaximumSize = Vector2.new(550, 630), 
						ScreenPadding = Vector2.new(24, 24)
					}), u5.createElement(l__WidgetComponent__12, {
						AppId = p1.AppId, 
						AnchorPoint = Vector2.new(0.5, 0.5), 
						Position = UDim2.fromScale(0.5, 0.5), 
						Size = UDim2.fromScale(1, 1), 
						ClipsDescendents = false, 
						TitleIcon = l__ImageId__13.SATELITE, 
						Title = "Connections", 
						SubTitle = (function()
							if l__DeviceUtil__3.isHoarceKat() then
								return "Complete support & verify discord for a reward";
							end;
							if l__KnitClient__4.Controllers.SocialConnectionsController.policyDiscordAllowed then
								return "Complete support & verify discord for a reward";
							end;
							return "Complete support section for a reward";
						end)(), 
						OnClose = function()
							l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(p1.AppId);
						end
					}, {
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
								Completed = v11, 
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
							local v22 = {};
							local v23 = u19() and u5.createFragment({
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
										Completed = v18, 
										LayoutOrder = 1
									}), u5.createElement(l__SocialConnectionsDiscord__8, {
										LayoutOrder = 2, 
										store = p1.store
									}) })
							});
							if v23 then
								v22[#v22 + 1] = v23;
							end;
							return u5.createFragment(v22);
						end, { p1.store.SocialConnections.connections.discord.verificationCode, p1.store.SocialConnections.connections.discord.validated }), u5.createElement(l__DividerComponent__17, {
							Margin = 2, 
							LayoutOrder = 3
						}), (l__useMemo__4(function()
							return u5.createElement(u6, {
								CompletedCount = u18(), 
								LayoutOrder = 4
							});
						end, { v11, v18 }))
					}) }) }) });
	end)
};
