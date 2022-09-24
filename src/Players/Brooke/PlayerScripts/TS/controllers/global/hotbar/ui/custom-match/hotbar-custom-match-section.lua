-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__2 = v2.Empty;
local l__Flamework__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__Players__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__Button__5 = v2.Button;
local l__Theme__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__SoundManager__7 = v2.SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__KnitClient__9 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__CustomMatchStartButton__10 = v1.import(script, script.Parent, "custom-match-start-button").CustomMatchStartButton;
local l__default__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__CustomMatchTeam__12 = v1.import(script, script.Parent, "custom-match-team").CustomMatchTeam;
return {
	HotbarCustomMatchSection = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		if p1.store.Game.queueType == nil then
			return u1.createElement(l__Empty__2);
		end;
		local v4 = l__Flamework__3.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(p1.store.Game.queueType);
		local v5 = true;
		if l__Players__4.LocalPlayer then
			local v6 = p1.store.Game.customMatch;
			if v6 ~= nil then
				v6 = v6.hostUserId;
			end;
			v5 = l__Players__4.LocalPlayer.UserId == v6;
		end;
		local v7 = p1.store.Bedwars.relic;
		if v7 ~= nil then
			v7 = v7.voteState;
		end;
		local v8 = {};
		local v9 = {
			Size = UDim2.fromScale(1, 0.5), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Position = UDim2.fromScale(0.5, -0.2), 
			AnchorPoint = Vector2.new(0.5, 1)
		};
		local v10 = {};
		local v11 = #v10;
		local v12 = v5;
		if v12 then
			local v13 = {};
			local v14 = not v7 and u1.createElement(l__Empty__2, {
				Size = UDim2.fromScale(1, 1), 
				LayoutOrder = 0
			}, { u1.createElement("UIAspectRatioConstraint", {
					AspectRatio = 4, 
					DominantAxis = "Height"
				}), u1.createElement(l__Button__5, {
					Text = "<b>START RELIC VOTING</b>", 
					Size = UDim2.fromScale(1, 1), 
					BackgroundColor3 = l__Theme__6.backgroundSecondary, 
					OnClick = function()
						l__SoundManager__7:playSound(l__GameSound__8.UI_CLICK);
						l__KnitClient__9.Controllers.RelicVotingController:customMatchStartRelicVoting();
					end
				}) });
			if v14 then
				v13[#v13 + 1] = v14;
			end;
			local v15 = #v13;
			v13[v15 + 1] = u1.createElement(l__CustomMatchStartButton__10);
			local v16 = {};
			local v17 = p1.store.Game.customMatch;
			if v17 ~= nil then
				v17 = string.upper(v17.joinCode);
			end;
			v16.Text = "Join Code: " .. tostring(v17);
			v16.Size = UDim2.fromScale(1, 1);
			function v16.OnClick()

			end;
			v16.BackgroundColor3 = l__Theme__6.backgroundTertiary;
			v13[v15 + 2] = u1.createElement(l__Button__5, v16, { u1.createElement("UIAspectRatioConstraint", {
					AspectRatio = 4
				}) });
			v12 = u1.createFragment(v13);
		end;
		local v18 = { u1.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Center", 
				VerticalAlignment = "Center", 
				Padding = UDim.new(0.02, 0), 
				SortOrder = "LayoutOrder"
			}) };
		if v12 then
			v18[#v18 + 1] = v12;
		end;
		v18[#v18 + 1] = u1.createElement(l__Button__5, {
			Text = "<b>BACK TO LOBBY</b>", 
			BackgroundColor3 = l__Theme__6.backgroundSecondary, 
			Size = UDim2.fromScale(0.4, 1), 
			OnClick = function()
				l__default__11.Client:Get("RemoteName"):SendToServer();
			end
		}, { u1.createElement("UIAspectRatioConstraint", {
				AspectRatio = 3.795918367346939, 
				DominantAxis = "Height"
			}) });
		v10[v11 + 1] = u1.createElement(l__Empty__2, {
			Size = UDim2.fromScale(1, 1), 
			Position = UDim2.fromScale(0, -1.2)
		}, v18);
		local l__teams__19 = p1.store.Game.teams;
		local v20 = table.create(#l__teams__19);
		local v21, v22, v23 = ipairs(l__teams__19);
		while true do
			v21(v22, v23);
			if not v21 then
				break;
			end;
			v23 = v21;
			v20[v21] = u1.createElement(l__CustomMatchTeam__12, {
				Team = v22, 
				QueueMeta = v4, 
				LayoutOrder = v21 - 1, 
				store = p1.store
			});		
		end;
		local v24 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v25 = { u1.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Center", 
				VerticalAlignment = "Center", 
				Padding = UDim.new(0.02, 0), 
				SortOrder = "LayoutOrder"
			}), u1.createElement(l__CustomMatchTeam__12, {
				Team = nil, 
				QueueMeta = v4, 
				LayoutOrder = -1, 
				store = p1.store
			}) };
		local v26 = #v25;
		local v27, v28, v29 = ipairs(v20);
		while true do
			v27(v28, v29);
			if not v27 then
				break;
			end;
			v29 = v27;
			v25[v26 + v27] = v28;		
		end;
		v10[v11 + 2] = u1.createElement(l__Empty__2, v24, v25);
		v8[#v8 + 1] = u1.createElement("Frame", v9, v10);
		return u1.createFragment(v8);
	end)
};
