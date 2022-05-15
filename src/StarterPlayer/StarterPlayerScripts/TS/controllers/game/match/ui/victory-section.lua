
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
	local l__teams__9 = l__ClientStore__6:getState().Game.teams;
	local function v10(p4)
		return p4.id == p3.props.WinningTeamId;
	end;
	local v11 = nil;
	for v12, v13 in ipairs(l__teams__9) do
		if v10(v13, v12 - 1, l__teams__9) == true then
			v11 = v13;
			break;
		end;
	end;
	if v11 then
		v6 = "Team " .. v11.name .. " Wins!";
		local v14 = l__Players__7:GetPlayers();
		local function v15(p5)
			return v11.members[p5.UserId] ~= nil;
		end;
		local v16 = {};
		local v17 = 0;
		for v18, v19 in ipairs(v14) do
			if v15(v19, v18 - 1, v14) == true then
				v17 = v17 + 1;
				v16[v17] = v19;
			end;
		end;
		v8 = v16;
	end;
	if l__queueType__7 and l__Flamework__4.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(l__queueType__7).game == l__GameType__5.GUN_GAME then
		local v20 = v11;
		if v20 ~= nil then
			v20 = v20.members;
		end;
		if v20 then
			local v21 = l__values__8(v20)[1];
			if v21 then
				v6 = v21.name .. " Wins!";
			end;
		end;
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
	local v26 = { v3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 4.012711864406779, 
			DominantAxis = "Height"
		}), v3.createElement("TextLabel", {
			Text = v6, 
			Size = UDim2.fromScale(1, 0.4), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			RichText = true, 
			TextScaled = true, 
			Font = "LuckiestGuy", 
			TextColor3 = Color3.fromRGB(255, 255, 255)
		}) };
	local function v27(p6, p7)
		return v3.createElement(l__PlayerRender__10, {
			Size = UDim2.fromScale(1, 1), 
			SizeConstraint = "RelativeYY", 
			BorderSizePixel = 0, 
			BackgroundTransparency = 1, 
			Player = l__OfflinePlayerUtil__11.getOfflinePlayer(p6)
		}, { v3.createElement("UICorner", {
				CornerRadius = UDim.new(1, 0)
			}) });
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
	v26[#v26 + 1] = v3.createElement(l__Empty__12, v31, v32);
	v24[#v24 + 1] = v3.createElement(l__Empty__12, v25, v26);
	return v3.createFragment(v24);
end;
return {
	VictorySection = v5
};

