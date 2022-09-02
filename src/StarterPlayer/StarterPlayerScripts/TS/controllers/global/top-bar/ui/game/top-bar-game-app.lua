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
		local v12, v13, v14 = ipairs(v10);
		while true do
			v12(v13, v14);
			if not v12 then
				break;
			end;
			v14 = v12;
			v11[v12] = v13;		
		end;
		table.move(v11, 1, #v11, #v9 + 1, v9);
		local v15 = l__useMemo__3(function()
			return u5.createElement(l__HudKills__7, {
				LayoutOrder = 2, 
				LocalPlayerId = p1.LocalPlayerId, 
				store = p1.store
			});
		end, v9);
		local l__teams__19 = v7.teams;
		local l__myTeam__20 = p1.store.Game.myTeam;
		local v16 = {};
		local v17 = #v16;
		local v18 = u8.values(p1.store.Bedwars.teamBedAlive);
		local v19 = table.create(#v18);
		local v20, v21, v22 = ipairs(v18);
		while true do
			v20(v21, v22);
			if not v20 then
				break;
			end;
			v22 = v20;
			v19[v20] = v21;		
		end;
		local v23 = #v19;
		table.move(v19, 1, v23, v17 + 1, v16);
		local v24 = v17 + v23;
		local v25 = u8.values(p1.store.Bedwars.finalDeaths);
		local v26 = table.create(#v25);
		local v27, v28, v29 = ipairs(v25);
		while true do
			v27(v28, v29);
			if not v27 then
				break;
			end;
			v29 = v27;
			v26[v27] = v28;		
		end;
		local v30 = #v26;
		table.move(v26, 1, v30, v24 + 1, v16);
		local v31 = v24 + v30;
		v16[v31 + 1] = p1.store.Game.myTeam;
		v16[v31 + 2] = p1.store.TabList.teams;
		local v32 = l__useMemo__3(function()
			return u5.createElement(l__HudBeds__9, {
				LayoutOrder = 3, 
				teams = l__teams__19, 
				MyTeam = l__myTeam__20, 
				store = p1.store
			});
		end, v16);
		local v33 = {};
		local v34 = u8.values(p1.store.Bedwars.finalDeaths);
		local v35 = table.create(#v34);
		local v36, v37, v38 = ipairs(v34);
		while true do
			v36(v37, v38);
			if not v36 then
				break;
			end;
			v38 = v36;
			v35[v36] = v37;		
		end;
		table.move(v35, 1, #v35, #v33 + 1, v33);
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
		local v44 = {};
		local v45 = false;
		if v7.winConInfoHud ~= nil then
			v45 = u5.createElement(l__HudCard__13, {
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
		if v45 then
			v44[#v44 + 1] = v45;
		end;
		v44[#v44 + 1] = v8;
		v44[#v44 + 1] = v15;
		local v46 = false;
		if v42 == "beds" then
			v46 = v32;
		end;
		if v46 then
			v44[#v44 + 1] = v46;
		end;
		local v47 = false;
		if v42 == "players-alive" then
			v47 = v39;
		end;
		if v47 then
			v44[#v44 + 1] = v47;
		end;
		local v48 = #v44;
		local v49 = v42 == "score";
		if v49 then
			local l__teamScores__50 = p1.store.Game.teamScores;
			local v51 = table.create(#l__teamScores__50);
			local v52, v53, v54 = ipairs(l__teamScores__50);
			while true do
				v52(v53, v54);
				if not v52 then
					break;
				end;
				v54 = v52;
				v51[v52] = u5.createElement(l__HudScore__15, {
					teamId = v53.teamId, 
					score = v53.score, 
					LayoutOrder = 3, 
					store = p1.store
				});			
			end;
			v49 = v51;
		end;
		if v49 then
			local v55, v56, v57 = ipairs(v49);
			while true do
				v55(v56, v57);
				if not v55 then
					break;
				end;
				v57 = v55;
				v44[v48 + v55] = v56;			
			end;
		end;
		local v58 = v7.rankCategory and u5.createElement(l__TopBarButton__16, {
			Text = "Report", 
			LayoutOrder = 6, 
			OnClick = function()
				l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
					message = "Report a user with video proof at: <font color=\"" .. l__ColorUtil__14.richTextColor(l__Theme__17.mcAqua) .. "\">easy.gg/report</font>"
				});
			end
		});
		if v58 then
			v44[#v44 + 1] = v58;
		end;
		if not v41 then
			local v59 = v4 and u5.createElement(l__TopBarButton__16, {
				Text = "Host Panel", 
				LayoutOrder = 6, 
				OnClick = function()
					l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__18.CUSTOM_MATCH_HOST_PANEL, {});
				end
			});
		else
			v59 = u5.createElement(l__TopBarButton__16, {
				Text = "Host Panel", 
				LayoutOrder = 6, 
				OnClick = function()
					l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__18.CUSTOM_MATCH_HOST_PANEL, {});
				end
			});
		end;
		if v59 then
			v44[#v44 + 1] = v59;
		end;
		return u5.createFragment(v44);
	end)
};
