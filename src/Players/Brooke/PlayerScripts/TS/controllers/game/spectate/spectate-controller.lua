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
	local v13 = {};
	local v14 = 0;
	local v15, v16, v17 = ipairs((l__Players__7:GetPlayers()));
	while true do
		local v18, v19 = v15(v16, v17);
		if not v18 then
			break;
		end;
		if v19 ~= l__Players__7.LocalPlayer == true then
			v14 = v14 + 1;
			v13[v14] = v19;
		end;	
	end;
	local v20 = {};
	local v21 = 0;
	for v22, v23 in ipairs(v13) do
		if l__GamePlayerUtil__9.getGamePlayer(v23):isInGame() == true then
			v21 = v21 + 1;
			v20[v21] = v23;
		end;
	end;
	table.sort(v20, function(p12, p13)
		if p12.Team ~= p13.Team then
			if p12.Team == l__Players__7.LocalPlayer.Team then
				return true;
			end;
			if p13.Team == l__Players__7.LocalPlayer.Team then
				return false;
			end;
		end;
		return p12.DisplayName < p13.DisplayName;
	end);
	local v24 = v20;
	local v25 = nil;
	local v26, v27, v28 = ipairs(v24);
	while true do
		local v29, v30 = v26(v27, v28);
		if not v29 then
			break;
		end;
		local v31 = v30.Team;
		if v31 ~= nil then
			v31 = v31.Name;
		end;
		local v32 = l__ClientStore__5:getState().Game.myTeam;
		if v32 ~= nil then
			v32 = v32.name;
		end;
		if v31 == v32 == true then
			v25 = v30;
			break;
		end;	
	end;
	if v25 then
		local v33 = {};
		local v34 = 0;
		local v35, v36, v37 = ipairs(v24);
		while true do
			local v38, v39 = v35(v36, v37);
			if not v38 then
				break;
			end;
			local v40 = v39.Team;
			if v40 ~= nil then
				v40 = v40.Name;
			end;
			local v41 = l__ClientStore__5:getState().Game.myTeam;
			if v41 ~= nil then
				v41 = v41.name;
			end;
			if v40 == v41 == true then
				v34 = v34 + 1;
				v33[v34] = v39;
			end;		
		end;
		v24 = v33;
	end;
	return v24;
end;
function u1.switchSpectateTargets(p14, p15)
	local v42 = p14:getSpectateTargets();
	local l__spectatingPlayer__43 = l__ClientStore__5:getState().Game.spectatingPlayer;
	if l__spectatingPlayer__43 then
		local v44 = l__OfflinePlayerUtil__6.getPlayer(l__spectatingPlayer__43);
	else
		v44 = nil;
	end;
	local v45 = 0;
	if v44 then
		local v46 = (table.find(v42, v44) and 0) - 1;
		if v46 > -1 then
			if p15 == "next" then
				v45 = v46 + 1;
			else
				v45 = v46 - 1;
			end;
		end;
	end;
	print("spec index:", v45);
	if v45 < 0 then
		v45 = #v42 - 1;
	elseif #v42 <= v45 then
		v45 = 0;
	end;
	local v47 = v42;
	if v47 ~= nil then
		v47 = v47[v45 + 1];
	end;
	if v47 then
		local v48 = l__OfflinePlayerUtil__6.getOfflinePlayer(v47);
	else
		v48 = nil;
	end;
	l__ClientStore__5:dispatch({
		type = "GameSetSpectator", 
		spectating = true, 
		spectatingPlayer = v48
	});
end;
local l__UserInputService__10 = v3.UserInputService;
function u1.hookSpectatedPlayer(p16, p17)
	p16.spectatingPlayerMaid:DoCleaning();
	p16.spectating = true;
	p16.spectatingPlayerMaid:GiveTask(function()
		p16.spectating = false;
	end);
	p16.spectatingPlayerMaid:GiveTask(l__Players__7.PlayerRemoving:Connect(function(p18)
		if p17 == p18 then
			p16.spectatingPlayerMaid:DoCleaning();
			local v49 = p16:getSpectateTargets();
			if v49 ~= nil then
				v49 = v49[1];
			end;
			if v49 then
				local v50 = l__OfflinePlayerUtil__6.getOfflinePlayer(v49);
			else
				v50 = nil;
			end;
			l__ClientStore__5:dispatch({
				type = "GameSetSpectator", 
				spectating = true, 
				spectatingPlayer = v50
			});
		end;
	end));
	if p17.Character then
		l__Workspace__8.CurrentCamera.CameraSubject = p17.Character:FindFirstChild("Humanoid");
	end;
	p16.spectatingPlayerMaid:GiveTask(p17.CharacterAdded:Connect(function(p19)
		l__Workspace__8.CurrentCamera.CameraSubject = p19:FindFirstChild("Humanoid");
	end));
	p16.spectatingPlayerMaid:GiveTask(l__UserInputService__10.InputBegan:Connect(function(p20, p21)
		if p21 then
			return nil;
		end;
		if p20.UserInputState == Enum.UserInputState.Begin then
			if p20.UserInputType ~= Enum.UserInputType.MouseButton1 and p20.KeyCode ~= Enum.KeyCode.ButtonR2 then
				if p20.KeyCode == Enum.KeyCode.ButtonL2 then
					p16:switchSpectateTargets("prev");
				end;
				return;
			end;
		else
			return;
		end;
		p16:switchSpectateTargets("next");
	end));
end;
function u1.stopSpectatingPlayer(p22)
	p22.spectatingPlayerMaid:DoCleaning();
	local v51 = l__Players__7.LocalPlayer.Character;
	if v51 ~= nil then
		v51 = v51:FindFirstChild("Humanoid");
	end;
	if v51 then
		l__Workspace__8.CurrentCamera.CameraSubject = v51;
	end;
end;
function u1.isSpectating(p23)
	return p23.spectating;
end;
u2 = l__KnitClient__2.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	SpectateController = u2
};
return u1;
