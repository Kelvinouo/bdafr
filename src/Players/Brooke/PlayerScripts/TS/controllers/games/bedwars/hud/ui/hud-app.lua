-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__DeviceUtil__1 = v2.DeviceUtil;
local l__QueueType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local l__QueueMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local l__Flamework__4 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__HudTimer__6 = v1.import(script, script.Parent, "hud-timer").HudTimer;
local l__HudKills__7 = v1.import(script, script.Parent, "hud-kills").HudKills;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__HudBeds__9 = v1.import(script, script.Parent, "hud-beds").HudBeds;
local l__HudAlivePlayersCount__10 = v1.import(script, script.Parent, "hud-player-count").HudAlivePlayersCount;
local l__Players__11 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__KnitClient__12 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__ColorUtil__13 = v2.ColorUtil;
local l__Theme__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__HudCard__15 = v1.import(script, script.Parent, "hud-card").HudCard;
local l__HudScore__16 = v1.import(script, script.Parent, "hud-score").HudScore;
local l__ImageId__17 = v2.ImageId;
local l__TopBarButton__18 = v2.TopBarButton;
local l__BedwarsImageId__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__SettingsApp__20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "settings", "ui", "settings-app").SettingsApp;
local l__BedwarsAppIds__21 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__Empty__22 = v2.Empty;
local u23 = nil;
u23 = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u5)(function(p1, p2)
	local l__useMemo__3 = p2.useMemo;
	local v4, v5 = p2.useState(false);
	if l__DeviceUtil__1.isHoarceKat() then
		local v6 = l__QueueType__2.SKYWARS_TO2;
	else
		v6 = p1.store.Game.queueType or l__QueueType__2.BEDWARS_TEST;
	end;
	if l__DeviceUtil__1.isHoarceKat() then
		local v7 = l__QueueMeta__3[v6];
	else
		v7 = l__Flamework__4.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(v6);
	end;
	local v8 = l__useMemo__3(function()
		return u5.createElement(l__HudTimer__6, {
			LayoutOrder = 1
		});
	end, { p1.localPlayerId });
	local v9 = {};
	local v10 = u8.values(p1.store.Bedwars.kills);
	local v11 = table.create(#v10);
	for v12, v13 in ipairs(v10) do
		v11[v12] = v13;
	end;
	table.move(v11, 1, #v11, #v9 + 1, v9);
	local v14 = l__useMemo__3(function()
		return u5.createElement(l__HudKills__7, {
			LayoutOrder = 2, 
			LocalPlayerId = p1.localPlayerId, 
			store = p1.store
		});
	end, v9);
	local l__teams__24 = v7.teams;
	local l__myTeam__25 = p1.store.Game.myTeam;
	local v15 = {};
	local v16 = #v15;
	local v17 = u8.values(p1.store.Bedwars.teamBedAlive);
	local v18 = table.create(#v17);
	for v19, v20 in ipairs(v17) do
		v18[v19] = v20;
	end;
	local v21 = #v18;
	table.move(v18, 1, v21, v16 + 1, v15);
	local v22 = v16 + v21;
	local v23 = u8.values(p1.store.Bedwars.finalDeaths);
	local v24 = table.create(#v23);
	for v25, v26 in ipairs(v23) do
		v24[v25] = v26;
	end;
	local v27 = #v24;
	table.move(v24, 1, v27, v22 + 1, v15);
	local v28 = v22 + v27;
	v15[v28 + 1] = p1.store.Game.myTeam;
	v15[v28 + 2] = p1.store.TabList.teams;
	local v29 = l__useMemo__3(function()
		return u5.createElement(l__HudBeds__9, {
			LayoutOrder = 3, 
			teams = l__teams__24, 
			MyTeam = l__myTeam__25, 
			store = p1.store
		});
	end, v15);
	local v30 = {};
	local v31 = u8.values(p1.store.Bedwars.finalDeaths);
	local v32 = table.create(#v31);
	for v33, v34 in ipairs(v31) do
		v32[v33] = v34;
	end;
	table.move(v32, 1, #v32, #v30 + 1, v30);
	local v35 = l__useMemo__3(function()
		return u5.createElement(l__HudAlivePlayersCount__10, {
			LayoutOrder = 3, 
			store = p1.store
		});
	end, v30);
	local v36 = p1.store.Game.customMatch;
	if v36 ~= nil then
		v36 = v36.hostUserId;
	end;
	local v37 = l__Players__11.LocalPlayer.UserId == v36 or l__Players__11.LocalPlayer:GetAttribute("Cohost") == true;
	local v38 = "beds";
	if v7.alivePlayersCountHud then
		v38 = "players-alive";
	elseif v7.scoresHud then
		v38 = "score";
	elseif v7.noTopHud then
		v38 = "no-hud";
	end;
	p2.useEffect(function()
		if l__DeviceUtil__1.isHoarceKat() then
			return nil;
		end;
		local v39 = nil;
		if l__KnitClient__12.Controllers.PermissionController:playerHasAnyPermissions(l__Players__11.LocalPlayer, { 2, 0, 4, 6 }) then
			v5(true);
		else
			v39 = l__Players__11.LocalPlayer:GetAttributeChangedSignal("Cohost"):Connect(function()
				v5(l__Players__11.LocalPlayer:GetAttribute("Cohost") == true);
			end);
		end;
		return function()
			v39:Disconnect();
		end;
	end, {});
	local v40 = {
		Size = UDim2.fromScale(1, 1)
	};
	local v41 = {
		ServerRegionDisplay = u5.createElement("TextLabel", {
			AnchorPoint = Vector2.new(0, 1), 
			Position = UDim2.fromScale(0, 1), 
			Size = UDim2.fromScale(0.2, 0.05), 
			Text = "<b>REGION: " .. p1.store.Game.serverRegion .. "</b>", 
			TextScaled = true, 
			RichText = true, 
			Font = "Roboto", 
			TextColor3 = l__ColorUtil__13.WHITE, 
			TextXAlignment = "Left", 
			TextYAlignment = "Center", 
			BackgroundTransparency = 1, 
			TextTransparency = 0.4
		}, { u5.createElement("UITextSizeConstraint", {
				MaxTextSize = 16
			}) }),
		(u5.createElement("UIPadding", {
			PaddingBottom = UDim.new(0.01, 0), 
			PaddingLeft = UDim.new(0.01, 0)
		}))
	};
	local v42 = {
		Size = UDim2.fromScale(0.1, 0.035), 
		AnchorPoint = Vector2.new(1, 0), 
		AutomaticSize = Enum.AutomaticSize.X, 
		Position = UDim2.new(1, -l__Theme__14.topBarHorizontalOffset * 1, 0, l__Theme__14.topBarTopOffset), 
		BorderSizePixel = 0, 
		BackgroundTransparency = 1
	};
	local v43 = { u5.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, 
			VerticalAlignment = Enum.VerticalAlignment.Top, 
			HorizontalAlignment = Enum.HorizontalAlignment.Right, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, l__Theme__14.topBarGuiSpacing)
		}) };
	local v44 = false;
	if v7.winConInfoHud ~= nil then
		v44 = u5.createElement(l__HudCard__15, {
			BackgroundColor3 = l__ColorUtil__13.hexColor(16755200), 
			LayoutOrder = 0
		}, { u5.createElement("TextLabel", {
				Text = "<b>" .. v7.winConInfoHud .. "</b>", 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				AutomaticSize = Enum.AutomaticSize.X, 
				Font = Enum.Font.Roboto, 
				TextSize = 16, 
				RichText = true, 
				TextXAlignment = Enum.TextXAlignment.Left, 
				TextColor3 = l__ColorUtil__13.WHITE
			}) });
	end;
	if v44 then
		v43[#v43 + 1] = v44;
	end;
	v43[#v43 + 1] = v8;
	v43[#v43 + 1] = v14;
	local v45 = false;
	if v38 == "beds" then
		v45 = v29;
	end;
	if v45 then
		v43[#v43 + 1] = v45;
	end;
	local v46 = false;
	if v38 == "players-alive" then
		v46 = v35;
	end;
	if v46 then
		v43[#v43 + 1] = v46;
	end;
	local v47 = #v43;
	local v48 = v38 == "score";
	if v48 then
		local l__teamScores__49 = p1.store.Game.teamScores;
		local v50 = table.create(#l__teamScores__49);
		for v51, v52 in ipairs(l__teamScores__49) do
			v50[v51] = u5.createElement(l__HudScore__16, {
				teamId = v52.teamId, 
				score = v52.score, 
				LayoutOrder = 3, 
				store = p1.store
			});
		end;
		v48 = v50;
	end;
	if v48 then
		for v53, v54 in ipairs(v48) do
			v43[v47 + v53] = v54;
		end;
	end;
	local v55 = v6 == l__QueueType__2.SURVIVAL;
	if v55 then
		local v56 = {};
		local l__backgroundMusicVolume__57 = p1.store.Settings.backgroundMusicVolume;
		if l__backgroundMusicVolume__57 ~= 0 and l__backgroundMusicVolume__57 == l__backgroundMusicVolume__57 and l__backgroundMusicVolume__57 then
			local v58 = l__ImageId__17.VOLUME_UP_SOLID;
		else
			v58 = l__ImageId__17.VOLUME_MUTE_SOLID;
		end;
		v56.Image = v58;
		function v56.OnClick()
			local l__backgroundMusicVolume__59 = p1.store.Settings.backgroundMusicVolume;
			if l__backgroundMusicVolume__59 ~= 0 and l__backgroundMusicVolume__59 == l__backgroundMusicVolume__59 and l__backgroundMusicVolume__59 then
				l__KnitClient__12.Controllers.BackgroundMusicController:mute();
				return;
			end;
			l__KnitClient__12.Controllers.BackgroundMusicController:unmute();
		end;
		v56.LayoutOrder = 7;
		v55 = u5.createElement(l__TopBarButton__18, v56);
	end;
	if v55 then
		v43[#v43 + 1] = v55;
	end;
	local v60 = #v43;
	v43[v60 + 1] = u5.createElement(l__TopBarButton__18, {
		Image = "rbxassetid://8531706273", 
		LayoutOrder = 4, 
		OnClick = function()
			l__KnitClient__12.Controllers.EmoteController:emote();
		end
	});
	local v61 = l__DeviceUtil__1.isMobileControls() and u5.createElement(l__TopBarButton__18, {
		Image = l__BedwarsImageId__19.HUD_MOBILE_SHIFT_LOCK, 
		LayoutOrder = 5, 
		Selected = l__KnitClient__12.Controllers.MobileShiftLockController:isEnabled(), 
		OnClick = function()
			if not l__KnitClient__12.Controllers.MobileShiftLockController:isEnabled() then
				l__KnitClient__12.Controllers.MobileShiftLockController:enable();
				return;
			end;
			l__KnitClient__12.Controllers.MobileShiftLockController:disable();
		end
	});
	if v61 then
		v43[v60 + 2] = v61;
	end;
	local v62 = #v43;
	v43[v62 + 1] = u5.createElement(l__TopBarButton__18, {
		Image = l__BedwarsImageId__19.SETTING_ICON, 
		OnClick = function()
			l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
				app = l__SettingsApp__20, 
				appId = "SettingsApp"
			}, {});
		end, 
		LayoutOrder = 5
	});
	local v63 = v7.rankCategory and u5.createElement(l__TopBarButton__18, {
		Text = "Report", 
		LayoutOrder = 6, 
		OnClick = function()
			l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
				message = "Report a user with video proof at: <font color=\"" .. l__ColorUtil__13.richTextColor(l__Theme__14.mcAqua) .. "\">easy.gg/report</font>"
			});
		end
	});
	if v63 then
		v43[v62 + 2] = v63;
	end;
	if not v37 then
		local v64 = v4 and u5.createElement(l__TopBarButton__18, {
			Text = "Host Panel", 
			LayoutOrder = 6, 
			OnClick = function()
				l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__21.CUSTOM_MATCH_HOST_PANEL, {});
			end
		});
	else
		v64 = u5.createElement(l__TopBarButton__18, {
			Text = "Host Panel", 
			LayoutOrder = 6, 
			OnClick = function()
				l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__21.CUSTOM_MATCH_HOST_PANEL, {});
			end
		});
	end;
	if v64 then
		v43[#v43 + 1] = v64;
	end;
	v41.TopBarHud = u5.createElement("Frame", v42, v43);
	return u5.createElement(l__Empty__22, v40, v41);
end);
return {
	HudAppWrapper = function(p3)
		return u5.createElement("ScreenGui", {
			DisplayOrder = 20, 
			IgnoreGuiInset = true, 
			ResetOnSpawn = false
		}, { u5.createElement(u23, {
				localPlayerId = l__Players__11.LocalPlayer.UserId, 
				ToggleTabList = p3.ToggleTabList, 
				store = p3.store
			}) });
	end, 
	HudApp = u23
};
