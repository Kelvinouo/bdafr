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
local l__HudCard__13 = v1.import(script, script.Parent, "hud-card").HudCard;
local l__ColorUtil__14 = v2.ColorUtil;
local l__HudScore__15 = v1.import(script, script.Parent, "hud-score").HudScore;
local l__TopBarButton__16 = v2.TopBarButton;
local l__Theme__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__BedwarsAppIds__18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
return {
	TopBarGameApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u5)(function(p1, p2)
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
		end, { p1.LocalPlayerId });
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
				LocalPlayerId = p1.LocalPlayerId, 
				store = p1.store
			});
		end, v9);
		local l__teams__19 = v7.teams;
		local l__myTeam__20 = p1.store.Game.myTeam;
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
				teams = l__teams__19, 
				MyTeam = l__myTeam__20, 
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
		local v40 = {};
		local v41 = false;
		if v7.winConInfoHud ~= nil then
			v41 = u5.createElement(l__HudCard__13, {
				BackgroundColor3 = l__ColorUtil__14.hexColor(16755200), 
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
					TextColor3 = l__ColorUtil__14.WHITE
				}) });
		end;
		if v41 then
			v40[#v40 + 1] = v41;
		end;
		v40[#v40 + 1] = v8;
		v40[#v40 + 1] = v14;
		local v42 = false;
		if v38 == "beds" then
			v42 = v29;
		end;
		if v42 then
			v40[#v40 + 1] = v42;
		end;
		local v43 = false;
		if v38 == "players-alive" then
			v43 = v35;
		end;
		if v43 then
			v40[#v40 + 1] = v43;
		end;
		local v44 = #v40;
		local v45 = v38 == "score";
		if v45 then
			local l__teamScores__46 = p1.store.Game.teamScores;
			local v47 = table.create(#l__teamScores__46);
			for v48, v49 in ipairs(l__teamScores__46) do
				v47[v48] = u5.createElement(l__HudScore__15, {
					teamId = v49.teamId, 
					score = v49.score, 
					LayoutOrder = 3, 
					store = p1.store
				});
			end;
			v45 = v47;
		end;
		if v45 then
			for v50, v51 in ipairs(v45) do
				v40[v44 + v50] = v51;
			end;
		end;
		local v52 = v7.rankCategory and u5.createElement(l__TopBarButton__16, {
			Text = "Report", 
			LayoutOrder = 6, 
			OnClick = function()
				l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
					message = "Report a user with video proof at: <font color=\"" .. l__ColorUtil__14.richTextColor(l__Theme__17.mcAqua) .. "\">easy.gg/report</font>"
				});
			end
		});
		if v52 then
			v40[#v40 + 1] = v52;
		end;
		if not v37 then
			local v53 = v4 and u5.createElement(l__TopBarButton__16, {
				Text = "Host Panel", 
				LayoutOrder = 6, 
				OnClick = function()
					l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__18.CUSTOM_MATCH_HOST_PANEL, {});
				end
			});
		else
			v53 = u5.createElement(l__TopBarButton__16, {
				Text = "Host Panel", 
				LayoutOrder = 6, 
				OnClick = function()
					l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__18.CUSTOM_MATCH_HOST_PANEL, {});
				end
			});
		end;
		if v53 then
			v40[#v40 + 1] = v53;
		end;
		return u5.createFragment(v40);
	end)
};
