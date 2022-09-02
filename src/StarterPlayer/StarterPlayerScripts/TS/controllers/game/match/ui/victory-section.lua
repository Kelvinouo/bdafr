-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v5 = v3.Component:extend("VictorySection");
function v5.init(p1)
	p1.wrapperRef = v3.createRef();
end;
local l__SoundManager__1 = v2.SoundManager;
local l__GameSound__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__TweenService__3 = v4.TweenService;
function v5.didMount(p2)
	l__SoundManager__1:playSound(l__GameSound__2.END_GAME);
	l__TweenService__3:Create(p2.wrapperRef:getValue(), TweenInfo.new(0.18), {
		Position = UDim2.fromScale(0.5, 0.18)
	}):Play();
end;
local l__Flamework__4 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__GameType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local l__ClientStore__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__Players__7 = v4.Players;
local l__values__8 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils")).values;
local l__ConfettiGroup__9 = v2.ConfettiGroup;
local l__PlayerRender__10 = v2.PlayerRender;
local l__OfflinePlayerUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local l__Empty__12 = v2.Empty;
function v5.render(p3)
	local v6 = "Tie Game!";
	local l__queueType__7 = p3.props.store.Game.queueType;
	if l__queueType__7 and l__Flamework__4.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(l__queueType__7).game == l__GameType__5.SURVIVAL then
		v6 = "Penguins Win!";
	end;
	local v8 = {};
	local v9 = nil;
	for v10, v11 in ipairs(l__ClientStore__6:getState().Game.teams) do
		if v11.id == p3.props.WinningTeamId == true then
			v9 = v11;
			break;
		end;
	end;
	if v9 then
		v6 = "Team " .. v9.name .. " Wins!";
		local v12 = {};
		local v13 = 0;
		local v14, v15, v16 = ipairs((l__Players__7:GetPlayers()));
		while true do
			local v17, v18 = v14(v15, v16);
			if not v17 then
				break;
			end;
			if v9.members[v18.UserId] ~= nil == true then
				v13 = v13 + 1;
				v12[v13] = v18;
			end;		
		end;
		v8 = v12;
	end;
	if l__queueType__7 and l__Flamework__4.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(l__queueType__7).game == l__GameType__5.GUN_GAME then
		local v19 = v9;
		if v19 ~= nil then
			v19 = v19.members;
		end;
		if v19 then
			local v20 = l__values__8(v19)[1];
			if v20 then
				v6 = v20.name .. " Wins!";
			end;
		end;
	end;
	local l__CustomTitleMessage__21 = p3.props.CustomTitleMessage;
	if l__CustomTitleMessage__21 ~= "" and l__CustomTitleMessage__21 then
		v6 = p3.props.CustomTitleMessage;
	end;
	local v22 = true;
	local l__myTeam__23 = l__ClientStore__6:getState().Game.myTeam;
	if l__myTeam__23 and l__myTeam__23.id == p3.props.WinningTeamId then
		v22 = true;
	end;
	local v24 = { v22 and v3.createElement(l__ConfettiGroup__9, {
			Lifetime = 10
		}) };
	local v25 = {
		Size = UDim2.fromScale(0.65, 0.23), 
		Position = UDim2.fromScale(0.5, 0.1), 
		AnchorPoint = Vector2.new(0.5, 0), 
		[v3.Ref] = p3.wrapperRef
	};
	local v26 = {
		WinningTeamText = v3.createElement("TextLabel", {
			Text = v6, 
			Size = UDim2.fromScale(1, 0.4), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			RichText = true, 
			TextScaled = true, 
			Font = "LuckiestGuy", 
			TextColor3 = Color3.fromRGB(255, 255, 255)
		}),
		(v3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 4.012711864406779, 
			DominantAxis = "Height"
		}))
	};
	local function v27(p4, p5)
		return v3.createFragment({
			PlayerRender = v3.createElement(l__PlayerRender__10, {
				Size = UDim2.fromScale(1, 1), 
				SizeConstraint = "RelativeYY", 
				BorderSizePixel = 0, 
				BackgroundTransparency = 1, 
				Player = l__OfflinePlayerUtil__11.getOfflinePlayer(p4)
			}, { v3.createElement("UICorner", {
					CornerRadius = UDim.new(1, 0)
				}) })
		});
	end;
	local v28 = table.create(#v8);
	for v29, v30 in ipairs(v8) do
		v28[v29] = v27(v30, v29 - 1, v8);
	end;
	local v31 = {
		Size = UDim2.fromScale(1, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		AnchorPoint = Vector2.new(0.5, 0)
	};
	local v32 = { v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Center", 
			Padding = UDim.new(0.03, 0)
		}) };
	local v33 = #v32;
	for v34, v35 in ipairs(v28) do
		v32[v33 + v34] = v35;
	end;
	v26.PlayerRenderList = v3.createElement(l__Empty__12, v31, v32);
	v24.VictorySection = v3.createFragment({
		VictorySection = v3.createElement(l__Empty__12, v25, v26)
	});
	return v3.createFragment(v24);
end;
return {
	VictorySection = v5
};
