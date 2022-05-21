-- Script Hash: 1e0a0421973b8d08f925a346aa378a7d09b350eb1d75a900be0e1730611628d11d68447197d7d102ba9f1d3bb78dc13c
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__2 = v2.Empty;
local l__Flamework__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__Players__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__CustomMatchStartButton__5 = v1.import(script, script.Parent, "custom-match-start-button").CustomMatchStartButton;
local l__Button__6 = v2.Button;
local l__default__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__CustomMatchTeam__8 = v1.import(script, script.Parent, "custom-match-team").CustomMatchTeam;
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
		local v7 = {};
		local v8 = {
			Size = UDim2.fromScale(1, 0.5), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Position = UDim2.fromScale(0.5, -0.2), 
			AnchorPoint = Vector2.new(0.5, 1)
		};
		local v9 = {};
		local v10 = #v9;
		local v11 = v5;
		if v11 then
			local v12 = { u1.createElement(l__CustomMatchStartButton__5) };
			local v13 = {};
			local v14 = p1.store.Game.customMatch;
			if v14 ~= nil then
				v14 = string.upper(v14.joinCode);
			end;
			v13.Text = "Join Code: " .. tostring(v14);
			v13.Size = UDim2.fromScale(1, 1);
			function v13.OnClick()

			end;
			v12[#v12 + 1] = u1.createElement(l__Button__6, v13, { u1.createElement("UIAspectRatioConstraint", {
					AspectRatio = 4
				}) });
			v11 = u1.createFragment(v12);
		end;
		local v15 = { u1.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Center", 
				VerticalAlignment = "Center", 
				Padding = UDim.new(0.02, 0), 
				SortOrder = "LayoutOrder"
			}) };
		if v11 then
			v15[#v15 + 1] = v11;
		end;
		v15[#v15 + 1] = u1.createElement(l__Button__6, {
			Text = "<b>BACK TO LOBBY</b>", 
			Size = UDim2.fromScale(0.4, 1), 
			OnClick = function()
				l__default__7.Client:Get("RemoteName"):SendToServer();
			end
		}, { u1.createElement("UIAspectRatioConstraint", {
				AspectRatio = 3.795918367346939, 
				DominantAxis = "Height"
			}) });
		v9[v10 + 1] = u1.createElement(l__Empty__2, {
			Size = UDim2.fromScale(1, 1), 
			Position = UDim2.fromScale(0, -1.2)
		}, v15);
		local l__teams__16 = p1.store.Game.teams;
		local function v17(p3, p4)
			return u1.createElement(l__CustomMatchTeam__8, {
				Team = p3, 
				QueueMeta = v4, 
				LayoutOrder = p4, 
				store = p1.store
			});
		end;
		local v18 = table.create(#l__teams__16);
		for v19, v20 in ipairs(l__teams__16) do
			v18[v19] = v17(v20, v19 - 1, l__teams__16);
		end;
		local v21 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v22 = { u1.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Center", 
				VerticalAlignment = "Center", 
				Padding = UDim.new(0.02, 0), 
				SortOrder = "LayoutOrder"
			}), u1.createElement(l__CustomMatchTeam__8, {
				Team = nil, 
				QueueMeta = v4, 
				LayoutOrder = -1, 
				store = p1.store
			}) };
		local v23 = #v22;
		for v24, v25 in ipairs(v18) do
			v22[v23 + v24] = v25;
		end;
		v9[v10 + 2] = u1.createElement(l__Empty__2, v21, v22);
		v7[#v7 + 1] = u1.createElement("Frame", v8, v9);
		return u1.createFragment(v7);
	end)
};
