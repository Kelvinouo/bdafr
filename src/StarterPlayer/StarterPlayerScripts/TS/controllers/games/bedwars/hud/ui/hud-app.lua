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
local l__KnitClient__12 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__ColorUtil__13 = v2.ColorUtil;
local l__Theme__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__HudCard__15 = v1.import(script, script.Parent, "hud-card").HudCard;
local l__HudScore__16 = v1.import(script, script.Parent, "hud-score").HudScore;
local l__ImageId__17 = v2.ImageId;
local l__TopBarButton__18 = v2.TopBarButton;
local l__BedwarsImageId__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsAppIds__20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__Empty__21 = v2.Empty;
local u22 = nil;
u22 = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u5)(function(p1, p2)
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
	local function v11(p3)
		return p3;
	end;
	local v12 = table.create(#v10);
	for v13, v14 in ipairs(v10) do
		v12[v13] = v11(v14, v13 - 1, v10);
	end;
	table.move(v12, 1, #v12, #v9 + 1, v9);
	local v15 = l__useMemo__3(function()
		return u5.createElement(l__HudKills__7, {
			LayoutOrder = 2, 
			LocalPlayerId = p1.localPlayerId, 
			store = p1.store
		});
	end, v9);
	local l__teams__23 = v7.teams;
	local l__myTeam__24 = p1.store.Game.myTeam;
	local v16 = {};
	local v17 = #v16;
	local v18 = u8.values(p1.store.Bedwars.teamBedAlive);
	local function v19(p4)
		return p4;
	end;
	local v20 = table.create(#v18);
	for v21, v22 in ipairs(v18) do
		v20[v21] = v19(v22, v21 - 1, v18);
	end;
	local v23 = #v20;
	table.move(v20, 1, v23, v17 + 1, v16);
	local v24 = v17 + v23;
	local v25 = u8.values(p1.store.Bedwars.finalDeaths);
	local function v26(p5)
		return p5;
	end;
	local v27 = table.create(#v25);
	for v28, v29 in ipairs(v25) do
		v27[v28] = v26(v29, v28 - 1, v25);
	end;
	local v30 = #v27;
	table.move(v27, 1, v30, v24 + 1, v16);
	local v31 = v24 + v30;
	v16[v31 + 1] = p1.store.Game.myTeam;
	v16[v31 + 2] = p1.store.TabList.teams;
	local v32 = l__useMemo__3(function()
		return u5.createElement(l__HudBeds__9, {
			LayoutOrder = 3, 
			teams = l__teams__23, 
			MyTeam = l__myTeam__24, 
			store = p1.store
		});
	end, v16);
	local v33 = {};
	local v34 = u8.values(p1.store.Bedwars.finalDeaths);
	local function v35(p6)
		return p6;
	end;
	local v36 = table.create(#v34);
	for v37, v38 in ipairs(v34) do
		v36[v37] = v35(v38, v37 - 1, v34);
	end;
	table.move(v36, 1, #v36, #v33 + 1, v33);
	local v39 = l__useMemo__3(function()
		return u5.createElement(l__HudAlivePlayersCount__10, {
			LayoutOrder = 3, 
			store = p1.store
		});
	end, v33);
	local v40 = p1.store.Game.customMatch;
	if v40 ~= nil then
		v40 = v40.hostUserId;
	end;
	local v41 = l__Players__11.LocalPlayer.UserId == v40 or l__Players__11.LocalPlayer:GetAttribute("Cohost") == true;
	local v42 = "beds";
	if v7.alivePlayersCountHud then
		v42 = "players-alive";
	elseif v7.scoresHud then
		v42 = "score";
	elseif v7.noTopHud then
		v42 = "no-hud";
	end;
	p2.useEffect(function()
		if l__DeviceUtil__1.isHoarceKat() then
			return nil;
		end;
		local u25 = nil;
		l__KnitClient__12.Controllers.PermissionController:playerHasAnyPermissions(l__Players__11.LocalPlayer, { 2, 0, 4, 6 }):andThen(function(p7)
			if p7 then
				v5(true);
				return;
			end;
			u25 = l__Players__11.LocalPlayer:GetAttributeChangedSignal("Cohost"):Connect(function()
				v5(l__Players__11.LocalPlayer:GetAttribute("Cohost") == true);
			end);
		end);
		return function()
			u25:Disconnect();
		end;
	end, {});
	local v43 = {
		Size = UDim2.fromScale(1, 1)
	};
	local v44 = {
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
	local v45 = {
		Size = UDim2.fromScale(0.1, 0.035), 
		AnchorPoint = Vector2.new(1, 0), 
		AutomaticSize = Enum.AutomaticSize.X, 
		Position = UDim2.new(1, -l__Theme__14.topBarHorizontalOffset * 1, 0, l__Theme__14.topBarTopOffset), 
		BorderSizePixel = 0, 
		BackgroundTransparency = 1
	};
	local v46 = { u5.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, 
			VerticalAlignment = Enum.VerticalAlignment.Top, 
			HorizontalAlignment = Enum.HorizontalAlignment.Right, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, l__Theme__14.topBarGuiSpacing)
		}) };
	local v47 = false;
	if v7.winConInfoHud ~= nil then
		v47 = u5.createElement(l__HudCard__15, {
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
	if v47 then
		v46[#v46 + 1] = v47;
	end;
	v46[#v46 + 1] = v8;
	v46[#v46 + 1] = v15;
	local v48 = false;
	if v42 == "beds" then
		v48 = v32;
	end;
	if v48 then
		v46[#v46 + 1] = v48;
	end;
	local v49 = false;
	if v42 == "players-alive" then
		v49 = v39;
	end;
	if v49 then
		v46[#v46 + 1] = v49;
	end;
	local v50 = #v46;
	local v51 = v42 == "score";
	if v51 then
		local l__teamScores__52 = p1.store.Game.teamScores;
		local function v53(p8, p9)
			return u5.createElement(l__HudScore__16, {
				teamId = p8.teamId, 
				score = p8.score, 
				LayoutOrder = 3, 
				store = p1.store
			});
		end;
		local v54 = table.create(#l__teamScores__52);
		for v55, v56 in ipairs(l__teamScores__52) do
			v54[v55] = v53(v56, v55 - 1, l__teamScores__52);
		end;
		v51 = v54;
	end;
	if v51 then
		for v57, v58 in ipairs(v51) do
			v46[v50 + v57] = v58;
		end;
	end;
	local v59 = v6 == l__QueueType__2.SURVIVAL;
	if v59 then
		local v60 = {};
		local l__backgroundMusicVolume__61 = p1.store.Settings.backgroundMusicVolume;
		if l__backgroundMusicVolume__61 ~= 0 and l__backgroundMusicVolume__61 == l__backgroundMusicVolume__61 and l__backgroundMusicVolume__61 then
			local v62 = l__ImageId__17.VOLUME_UP_SOLID;
		else
			v62 = l__ImageId__17.VOLUME_MUTE_SOLID;
		end;
		v60.Image = v62;
		function v60.OnClick()
			local l__backgroundMusicVolume__63 = p1.store.Settings.backgroundMusicVolume;
			if l__backgroundMusicVolume__63 ~= 0 and l__backgroundMusicVolume__63 == l__backgroundMusicVolume__63 and l__backgroundMusicVolume__63 then
				l__KnitClient__12.Controllers.BackgroundMusicController:mute();
				return;
			end;
			l__KnitClient__12.Controllers.BackgroundMusicController:unmute();
		end;
		v60.LayoutOrder = 7;
		v59 = u5.createElement(l__TopBarButton__18, v60);
	end;
	if v59 then
		v46[#v46 + 1] = v59;
	end;
	local v64 = #v46;
	v46[v64 + 1] = u5.createElement(l__TopBarButton__18, {
		Image = "rbxassetid://8531706273", 
		LayoutOrder = 4, 
		OnClick = function()
			l__KnitClient__12.Controllers.EmoteController:emote();
		end
	});
	local v65 = l__DeviceUtil__1.isMobileControls() and u5.createElement(l__TopBarButton__18, {
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
	if v65 then
		v46[v64 + 2] = v65;
	end;
	local v66 = v7.rankCategory and u5.createElement(l__TopBarButton__18, {
		Text = "Report", 
		LayoutOrder = 6, 
		OnClick = function()
			l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
				message = "Report a user with video proof at: <font color=\"" .. l__ColorUtil__13.richTextColor(l__Theme__14.mcAqua) .. "\">easy.gg/report</font>"
			});
		end
	});
	if v66 then
		v46[#v46 + 1] = v66;
	end;
	if not v41 then
		local v67 = v4 and u5.createElement(l__TopBarButton__18, {
			Text = "Host Panel", 
			LayoutOrder = 6, 
			OnClick = function()
				l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__20.CUSTOM_MATCH_HOST_PANEL, {});
			end
		});
	else
		v67 = u5.createElement(l__TopBarButton__18, {
			Text = "Host Panel", 
			LayoutOrder = 6, 
			OnClick = function()
				l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__20.CUSTOM_MATCH_HOST_PANEL, {});
			end
		});
	end;
	if v67 then
		v46[#v46 + 1] = v67;
	end;
	v44.TopBarHud = u5.createElement("Frame", v45, v46);
	return u5.createElement(l__Empty__21, v43, v44);
end);
return {
	HudAppWrapper = function(p10)
		return u5.createElement("ScreenGui", {
			DisplayOrder = 20, 
			IgnoreGuiInset = true, 
			ResetOnSpawn = false
		}, { u5.createElement(u22, {
				localPlayerId = l__Players__11.LocalPlayer.UserId, 
				ToggleTabList = p10.ToggleTabList, 
				store = p10.store
			}) });
	end, 
	HudApp = u22
};
