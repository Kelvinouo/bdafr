-- Script Hash: 6cd15bebd97ce7b9765fb5b12ad54f74152ad22d98301209964f6285ca821277d0efba1df58335c1607b999713bbca3b
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
		local v43 = nil;
		if l__KnitClient__12.Controllers.PermissionController:playerHasAnyPermissions(l__Players__11.LocalPlayer, { 2, 0, 4, 6 }) then
			v5(true);
		else
			v43 = l__Players__11.LocalPlayer:GetAttributeChangedSignal("Cohost"):Connect(function()
				v5(l__Players__11.LocalPlayer:GetAttribute("Cohost") == true);
			end);
		end;
		return function()
			v43:Disconnect();
		end;
	end, {});
	local v44 = {
		Size = UDim2.fromScale(1, 1)
	};
	local v45 = {
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
	local v46 = {
		Size = UDim2.fromScale(0.1, 0.035), 
		AnchorPoint = Vector2.new(1, 0), 
		AutomaticSize = Enum.AutomaticSize.X, 
		Position = UDim2.new(1, -l__Theme__14.topBarHorizontalOffset * 1, 0, l__Theme__14.topBarTopOffset), 
		BorderSizePixel = 0, 
		BackgroundTransparency = 1
	};
	local v47 = { u5.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, 
			VerticalAlignment = Enum.VerticalAlignment.Top, 
			HorizontalAlignment = Enum.HorizontalAlignment.Right, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, l__Theme__14.topBarGuiSpacing)
		}) };
	local v48 = false;
	if v7.winConInfoHud ~= nil then
		v48 = u5.createElement(l__HudCard__15, {
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
	if v48 then
		v47[#v47 + 1] = v48;
	end;
	v47[#v47 + 1] = v8;
	v47[#v47 + 1] = v15;
	local v49 = false;
	if v42 == "beds" then
		v49 = v32;
	end;
	if v49 then
		v47[#v47 + 1] = v49;
	end;
	local v50 = false;
	if v42 == "players-alive" then
		v50 = v39;
	end;
	if v50 then
		v47[#v47 + 1] = v50;
	end;
	local v51 = #v47;
	local v52 = v42 == "score";
	if v52 then
		local l__teamScores__53 = p1.store.Game.teamScores;
		local function v54(p7, p8)
			return u5.createElement(l__HudScore__16, {
				teamId = p7.teamId, 
				score = p7.score, 
				LayoutOrder = 3, 
				store = p1.store
			});
		end;
		local v55 = table.create(#l__teamScores__53);
		for v56, v57 in ipairs(l__teamScores__53) do
			v55[v56] = v54(v57, v56 - 1, l__teamScores__53);
		end;
		v52 = v55;
	end;
	if v52 then
		for v58, v59 in ipairs(v52) do
			v47[v51 + v58] = v59;
		end;
	end;
	local v60 = v6 == l__QueueType__2.SURVIVAL;
	if v60 then
		local v61 = {};
		local l__backgroundMusicVolume__62 = p1.store.Settings.backgroundMusicVolume;
		if l__backgroundMusicVolume__62 ~= 0 and l__backgroundMusicVolume__62 == l__backgroundMusicVolume__62 and l__backgroundMusicVolume__62 then
			local v63 = l__ImageId__17.VOLUME_UP_SOLID;
		else
			v63 = l__ImageId__17.VOLUME_MUTE_SOLID;
		end;
		v61.Image = v63;
		function v61.OnClick()
			local l__backgroundMusicVolume__64 = p1.store.Settings.backgroundMusicVolume;
			if l__backgroundMusicVolume__64 ~= 0 and l__backgroundMusicVolume__64 == l__backgroundMusicVolume__64 and l__backgroundMusicVolume__64 then
				l__KnitClient__12.Controllers.BackgroundMusicController:mute();
				return;
			end;
			l__KnitClient__12.Controllers.BackgroundMusicController:unmute();
		end;
		v61.LayoutOrder = 7;
		v60 = u5.createElement(l__TopBarButton__18, v61);
	end;
	if v60 then
		v47[#v47 + 1] = v60;
	end;
	local v65 = #v47;
	v47[v65 + 1] = u5.createElement(l__TopBarButton__18, {
		Image = "rbxassetid://8531706273", 
		LayoutOrder = 4, 
		OnClick = function()
			l__KnitClient__12.Controllers.EmoteController:emote();
		end
	});
	local v66 = l__DeviceUtil__1.isMobileControls() and u5.createElement(l__TopBarButton__18, {
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
	if v66 then
		v47[v65 + 2] = v66;
	end;
	local v67 = v7.rankCategory and u5.createElement(l__TopBarButton__18, {
		Text = "Report", 
		LayoutOrder = 6, 
		OnClick = function()
			l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
				message = "Report a user with video proof at: <font color=\"" .. l__ColorUtil__13.richTextColor(l__Theme__14.mcAqua) .. "\">easy.gg/report</font>"
			});
		end
	});
	if v67 then
		v47[#v47 + 1] = v67;
	end;
	if not v41 then
		local v68 = v4 and u5.createElement(l__TopBarButton__18, {
			Text = "Host Panel", 
			LayoutOrder = 6, 
			OnClick = function()
				l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__20.CUSTOM_MATCH_HOST_PANEL, {});
			end
		});
	else
		v68 = u5.createElement(l__TopBarButton__18, {
			Text = "Host Panel", 
			LayoutOrder = 6, 
			OnClick = function()
				l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__20.CUSTOM_MATCH_HOST_PANEL, {});
			end
		});
	end;
	if v68 then
		v47[#v47 + 1] = v68;
	end;
	v45.TopBarHud = u5.createElement("Frame", v46, v47);
	return u5.createElement(l__Empty__21, v44, v45);
end);
return {
	HudAppWrapper = function(p9)
		return u5.createElement("ScreenGui", {
			DisplayOrder = 20, 
			IgnoreGuiInset = true, 
			ResetOnSpawn = false
		}, { u5.createElement(u22, {
				localPlayerId = l__Players__11.LocalPlayer.UserId, 
				ToggleTabList = p9.ToggleTabList, 
				store = p9.store
			}) });
	end, 
	HudApp = u22
};
