-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "SpectateController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = l__KnitController__4;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "SpectateController";
	p1.spectatingPlayerMaid = u3.new();
	p1.spectating = false;
end;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__OfflinePlayerUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local l__Players__7 = v3.Players;
local l__Workspace__8 = v3.Workspace;
function u1.KnitStart(p2)
	l__default__4.Client:WaitFor("RemoteName"):andThen(function(p3)
		p3:Connect(function(p4)
			if not p4.target then
				p2:switchSpectateTargets("next");
				return;
			end;
			l__ClientStore__5:dispatch({
				type = "GameSetSpectator", 
				spectating = true, 
				spectatingPlayer = l__OfflinePlayerUtil__6.getOfflinePlayer(p4.target)
			});
		end);
	end);
	l__default__4.Client:WaitFor("RemoteName"):andThen(function(p5)
		p5:Connect(function(p6)
			p2:stopSpectatingPlayer();
		end);
	end);
	l__Players__7.LocalPlayer:GetAttributeChangedSignal("Spectator"):Connect(function()
		if l__Players__7.LocalPlayer:GetAttribute("Spectator") ~= true then
			l__ClientStore__5:dispatch({
				type = "GameSetSpectator", 
				spectating = false, 
				spectatingPlayer = nil
			});
		end;
	end);
	l__ClientStore__5.changed:connect(function(p7, p8)
		if p7.Game.spectatingPlayer ~= p8.Game.spectatingPlayer then
			if p7.Game.spectatingPlayer then
				local v7 = l__OfflinePlayerUtil__6.getPlayer(p7.Game.spectatingPlayer);
				if v7 then
					p2:hookSpectatedPlayer(v7);
				end;
			else
				p2:stopSpectatingPlayer();
			end;
		end;
		if p7.Game.spectating ~= p8.Game.spectating and not p7.Game.spectating then
			p2:stopSpectatingPlayer();
		end;
	end);
	l__default__4.Client:OnEvent("RemoteName", function(p9)
		local v8 = l__ClientStore__5:getState();
		if v8.Game.spectating and v8.Game.spectatingPlayer and v8.Game.spectatingPlayer.userId ~= l__Players__7.LocalPlayer.UserId then
			local v9 = l__OfflinePlayerUtil__6.getPlayer(v8.Game.spectatingPlayer);
			local v10 = v9;
			if v10 ~= nil then
				v10 = v10.Character;
			end;
			if v10 == p9.entityInstance then
				local v11 = v9.Team;
				if v11 ~= nil then
					v11 = v11.Name;
				end;
				local v12 = v11;
				if v12 == nil then
					v12 = "";
				end;
				if not l__KnitClient__2.Controllers.BedwarsController:getTeamBed(v12) then
					p2:switchSpectateTargets("next");
				end;
			end;
		end;
	end);
	l__Players__7.LocalPlayer.CharacterAdded:Connect(function(p10)
		if not p2:isSpectating() then
			l__Workspace__8.CurrentCamera.CameraSubject = p10:WaitForChild("Humanoid");
		end;
	end);
end;
local l__GamePlayerUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
function u1.getSpectateTargets(p11)
	local v13 = l__Players__7:GetPlayers();
	local function v14(p12)
		return p12 ~= l__Players__7.LocalPlayer;
	end;
	local v15 = {};
	local v16 = 0;
	for v17, v18 in ipairs(v13) do
		if v14(v18, v17 - 1, v13) == true then
			v16 = v16 + 1;
			v15[v16] = v18;
		end;
	end;
	local function v19(p13)
		return l__GamePlayerUtil__9.getGamePlayer(p13):isInGame();
	end;
	local v20 = {};
	local v21 = 0;
	for v22, v23 in ipairs(v15) do
		if v19(v23, v22 - 1, v15) == true then
			v21 = v21 + 1;
			v20[v21] = v23;
		end;
	end;
	table.sort(v20, function(p14, p15)
		if p14.Team ~= p15.Team then
			if p14.Team == l__Players__7.LocalPlayer.Team then
				return true;
			end;
			if p15.Team == l__Players__7.LocalPlayer.Team then
				return false;
			end;
		end;
		return p14.DisplayName < p15.DisplayName;
	end);
	local v24 = v20;
	local function v25(p16)
		local v26 = p16.Team;
		if v26 ~= nil then
			v26 = v26.Name;
		end;
		local v27 = l__ClientStore__5:getState().Game.myTeam;
		if v27 ~= nil then
			v27 = v27.name;
		end;
		return v26 == v27;
	end;
	local v28 = nil;
	for v29, v30 in ipairs(v24) do
		if v25(v30, v29 - 1, v24) == true then
			v28 = v30;
			break;
		end;
	end;
	if v28 then
		local function v31(p17)
			local v32 = p17.Team;
			if v32 ~= nil then
				v32 = v32.Name;
			end;
			local v33 = l__ClientStore__5:getState().Game.myTeam;
			if v33 ~= nil then
				v33 = v33.name;
			end;
			return v32 == v33;
		end;
		local v34 = {};
		local v35 = 0;
		for v36, v37 in ipairs(v24) do
			if v31(v37, v36 - 1, v24) == true then
				v35 = v35 + 1;
				v34[v35] = v37;
			end;
		end;
		v24 = v34;
	end;
	return v24;
end;
function u1.switchSpectateTargets(p18, p19)
	local v38 = p18:getSpectateTargets();
	local l__spectatingPlayer__39 = l__ClientStore__5:getState().Game.spectatingPlayer;
	if l__spectatingPlayer__39 then
		local v40 = l__OfflinePlayerUtil__6.getPlayer(l__spectatingPlayer__39);
	else
		v40 = nil;
	end;
	local v41 = 0;
	if v40 then
		local v42 = (table.find(v38, v40) and 0) - 1;
		if v42 > -1 then
			if p19 == "next" then
				v41 = v42 + 1;
			else
				v41 = v42 - 1;
			end;
		end;
	end;
	print("spec index:", v41);
	if v41 < 0 then
		v41 = #v38 - 1;
	elseif #v38 <= v41 then
		v41 = 0;
	end;
	local v43 = v38;
	if v43 ~= nil then
		v43 = v43[v41 + 1];
	end;
	if v43 then
		local v44 = l__OfflinePlayerUtil__6.getOfflinePlayer(v43);
	else
		v44 = nil;
	end;
	l__ClientStore__5:dispatch({
		type = "GameSetSpectator", 
		spectating = true, 
		spectatingPlayer = v44
	});
end;
local l__UserInputService__10 = v3.UserInputService;
function u1.hookSpectatedPlayer(p20, p21)
	p20.spectatingPlayerMaid:DoCleaning();
	p20.spectating = true;
	p20.spectatingPlayerMaid:GiveTask(function()
		p20.spectating = false;
	end);
	p20.spectatingPlayerMaid:GiveTask(l__Players__7.PlayerRemoving:Connect(function(p22)
		if p21 == p22 then
			p20.spectatingPlayerMaid:DoCleaning();
			local v45 = p20:getSpectateTargets();
			if v45 ~= nil then
				v45 = v45[1];
			end;
			if v45 then
				local v46 = l__OfflinePlayerUtil__6.getOfflinePlayer(v45);
			else
				v46 = nil;
			end;
			l__ClientStore__5:dispatch({
				type = "GameSetSpectator", 
				spectating = true, 
				spectatingPlayer = v46
			});
		end;
	end));
	if p21.Character then
		l__Workspace__8.CurrentCamera.CameraSubject = p21.Character:FindFirstChild("Humanoid");
	end;
	p20.spectatingPlayerMaid:GiveTask(p21.CharacterAdded:Connect(function(p23)
		l__Workspace__8.CurrentCamera.CameraSubject = p23:FindFirstChild("Humanoid");
	end));
	p20.spectatingPlayerMaid:GiveTask(l__UserInputService__10.InputBegan:Connect(function(p24, p25)
		if p25 then
			return nil;
		end;
		if p24.UserInputState == Enum.UserInputState.Begin then
			if p24.UserInputType ~= Enum.UserInputType.MouseButton1 and p24.KeyCode ~= Enum.KeyCode.ButtonR2 then
				if p24.KeyCode == Enum.KeyCode.ButtonL2 then
					p20:switchSpectateTargets("prev");
				end;
				return;
			end;
		else
			return;
		end;
		p20:switchSpectateTargets("next");
	end));
end;
function u1.stopSpectatingPlayer(p26)
	p26.spectatingPlayerMaid:DoCleaning();
	local v47 = l__Players__7.LocalPlayer.Character;
	if v47 ~= nil then
		v47 = v47:FindFirstChild("Humanoid");
	end;
	if v47 then
		l__Workspace__8.CurrentCamera.CameraSubject = v47;
	end;
end;
function u1.isSpectating(p27)
	return p27.spectating;
end;
u2 = l__KnitClient__2.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	SpectateController = u2
};
return u1;
