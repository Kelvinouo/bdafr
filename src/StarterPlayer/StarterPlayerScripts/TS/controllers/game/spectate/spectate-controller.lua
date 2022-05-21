-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitClient__3 = v2.KnitClient;
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "SpectateController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
local u1 = v6;
function u1.new(...)
	local v7 = setmetatable({}, u1);
	return v7:constructor(...) and v7;
end;
local u2 = l__KnitController__5;
local l__Maid__3 = v2.Maid;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "SpectateController";
	p1.spectatingPlayerMaid = l__Maid__3.new();
	p1.spectating = false;
end;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__OfflinePlayerUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local l__Players__7 = v4.Players;
local l__Workspace__8 = v4.Workspace;
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
				local v8 = l__OfflinePlayerUtil__6.getPlayer(p7.Game.spectatingPlayer);
				if v8 then
					p2:hookSpectatedPlayer(v8);
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
		local v9 = l__ClientStore__5:getState();
		if v9.Game.spectating and v9.Game.spectatingPlayer and v9.Game.spectatingPlayer.userId ~= l__Players__7.LocalPlayer.UserId then
			local v10 = l__OfflinePlayerUtil__6.getPlayer(v9.Game.spectatingPlayer);
			local v11 = v10;
			if v11 ~= nil then
				v11 = v11.Character;
			end;
			if v11 == p9.entityInstance then
				local v12 = v10.Team;
				if v12 ~= nil then
					v12 = v12.Name;
				end;
				local v13 = v12;
				if v13 == nil then
					v13 = "";
				end;
				if not l__KnitClient__3.Controllers.BedwarsController:getTeamBed(v13) then
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
	local v14 = l__Players__7:GetPlayers();
	local function v15(p12)
		return p12 ~= l__Players__7.LocalPlayer;
	end;
	local v16 = {};
	local v17 = 0;
	for v18, v19 in ipairs(v14) do
		if v15(v19, v18 - 1, v14) == true then
			v17 = v17 + 1;
			v16[v17] = v19;
		end;
	end;
	local function v20(p13)
		return l__GamePlayerUtil__9.getGamePlayer(p13):isInGame();
	end;
	local v21 = {};
	local v22 = 0;
	for v23, v24 in ipairs(v16) do
		if v20(v24, v23 - 1, v16) == true then
			v22 = v22 + 1;
			v21[v22] = v24;
		end;
	end;
	table.sort(v21, function(p14, p15)
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
	local v25 = v21;
	local function v26(p16)
		local v27 = p16.Team;
		if v27 ~= nil then
			v27 = v27.Name;
		end;
		local v28 = l__ClientStore__5:getState().Game.myTeam;
		if v28 ~= nil then
			v28 = v28.name;
		end;
		return v27 == v28;
	end;
	local v29 = nil;
	for v30, v31 in ipairs(v25) do
		if v26(v31, v30 - 1, v25) == true then
			v29 = v31;
			break;
		end;
	end;
	if v29 then
		local function v32(p17)
			local v33 = p17.Team;
			if v33 ~= nil then
				v33 = v33.Name;
			end;
			local v34 = l__ClientStore__5:getState().Game.myTeam;
			if v34 ~= nil then
				v34 = v34.name;
			end;
			return v33 == v34;
		end;
		local v35 = {};
		local v36 = 0;
		for v37, v38 in ipairs(v25) do
			if v32(v38, v37 - 1, v25) == true then
				v36 = v36 + 1;
				v35[v36] = v38;
			end;
		end;
		v25 = v35;
	end;
	return v25;
end;
function u1.switchSpectateTargets(p18, p19)
	local v39 = p18:getSpectateTargets();
	local l__spectatingPlayer__40 = l__ClientStore__5:getState().Game.spectatingPlayer;
	if l__spectatingPlayer__40 then
		local v41 = l__OfflinePlayerUtil__6.getPlayer(l__spectatingPlayer__40);
	else
		v41 = nil;
	end;
	local v42 = 0;
	if v41 then
		local v43 = (table.find(v39, v41) and 0) - 1;
		if v43 > -1 then
			if p19 == "next" then
				v42 = v43 + 1;
			else
				v42 = v43 - 1;
			end;
		end;
	end;
	print("spec index:", v42);
	if v42 < 0 then
		v42 = #v39 - 1;
	elseif #v39 <= v42 then
		v42 = 0;
	end;
	local v44 = v39;
	if v44 ~= nil then
		v44 = v44[v42 + 1];
	end;
	if v44 then
		local v45 = l__OfflinePlayerUtil__6.getOfflinePlayer(v44);
	else
		v45 = nil;
	end;
	l__ClientStore__5:dispatch({
		type = "GameSetSpectator", 
		spectating = true, 
		spectatingPlayer = v45
	});
end;
local l__UserInputService__10 = v4.UserInputService;
function u1.hookSpectatedPlayer(p20, p21)
	p20.spectatingPlayerMaid:DoCleaning();
	p20.spectating = true;
	p20.spectatingPlayerMaid:GiveTask(function()
		p20.spectating = false;
	end);
	p20.spectatingPlayerMaid:GiveTask(l__Players__7.PlayerRemoving:Connect(function(p22)
		if p21 == p22 then
			p20.spectatingPlayerMaid:DoCleaning();
			local v46 = p20:getSpectateTargets();
			if v46 ~= nil then
				v46 = v46[1];
			end;
			if v46 then
				local v47 = l__OfflinePlayerUtil__6.getOfflinePlayer(v46);
			else
				v47 = nil;
			end;
			l__ClientStore__5:dispatch({
				type = "GameSetSpectator", 
				spectating = true, 
				spectatingPlayer = v47
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
	local v48 = l__Players__7.LocalPlayer.Character;
	if v48 ~= nil then
		v48 = v48:FindFirstChild("Humanoid");
	end;
	if v48 then
		l__Workspace__8.CurrentCamera.CameraSubject = v48;
	end;
end;
function u1.isSpectating(p27)
	return p27.spectating;
end;
u2 = l__KnitClient__3.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	SpectateController = u2
};
return u1;
