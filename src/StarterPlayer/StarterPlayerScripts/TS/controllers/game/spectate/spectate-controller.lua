-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "SpectateController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "SpectateController";
	p1.spectatingPlayerMaid = u2.new();
	p1.spectating = false;
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__OfflinePlayerUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local l__Players__6 = v2.Players;
local l__KnitClient__7 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__Workspace__8 = v2.Workspace;
function u1.KnitStart(p2)
	l__default__3.Client:WaitFor("RemoteName"):andThen(function(p3)
		p3:Connect(function(p4)
			if not p4.target then
				p2:switchSpectateTargets("next");
				return;
			end;
			l__ClientStore__4:dispatch({
				type = "GameSetSpectator", 
				spectating = true, 
				spectatingPlayer = l__OfflinePlayerUtil__5.getOfflinePlayer(p4.target)
			});
		end);
	end);
	l__default__3.Client:WaitFor("RemoteName"):andThen(function(p5)
		p5:Connect(function(p6)
			p2:stopSpectatingPlayer();
		end);
	end);
	l__Players__6.LocalPlayer:GetAttributeChangedSignal("Spectator"):Connect(function()
		if l__Players__6.LocalPlayer:GetAttribute("Spectator") ~= true then
			l__ClientStore__4:dispatch({
				type = "GameSetSpectator", 
				spectating = false, 
				spectatingPlayer = nil
			});
		end;
	end);
	l__ClientStore__4.changed:connect(function(p7, p8)
		if p7.Game.spectatingPlayer ~= p8.Game.spectatingPlayer then
			if p7.Game.spectatingPlayer then
				local v6 = l__OfflinePlayerUtil__5.getPlayer(p7.Game.spectatingPlayer);
				if v6 then
					p2:hookSpectatedPlayer(v6);
				end;
			else
				p2:stopSpectatingPlayer();
			end;
		end;
		if p7.Game.spectating ~= p8.Game.spectating and not p7.Game.spectating then
			p2:stopSpectatingPlayer();
		end;
	end);
	l__default__3.Client:OnEvent("RemoteName", function(p9)
		local v7 = l__ClientStore__4:getState();
		if v7.Game.spectating and v7.Game.spectatingPlayer and v7.Game.spectatingPlayer.userId ~= l__Players__6.LocalPlayer.UserId then
			local v8 = l__OfflinePlayerUtil__5.getPlayer(v7.Game.spectatingPlayer);
			local v9 = v8;
			if v9 ~= nil then
				v9 = v9.Character;
			end;
			if v9 == p9.entityInstance then
				local v10 = v8.Team;
				if v10 ~= nil then
					v10 = v10.Name;
				end;
				local v11 = v10;
				if v11 == nil then
					v11 = "";
				end;
				if not l__KnitClient__7.Controllers.BedwarsController:getTeamBed(v11) then
					p2:switchSpectateTargets("next");
				end;
			end;
		end;
	end);
	l__Players__6.LocalPlayer.CharacterAdded:Connect(function(p10)
		if not p2:isSpectating() then
			l__Workspace__8.CurrentCamera.CameraSubject = p10:WaitForChild("Humanoid");
		end;
	end);
end;
local l__GamePlayerUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
function u1.getSpectateTargets(p11)
	local v12 = {};
	local v13 = 0;
	local v14, v15, v16 = ipairs((l__Players__6:GetPlayers()));
	while true do
		v14(v15, v16);
		if not v14 then
			break;
		end;
		if v15 ~= l__Players__6.LocalPlayer == true then
			v13 = v13 + 1;
			v12[v13] = v15;
		end;	
	end;
	local v17 = {};
	local v18 = 0;
	local v19, v20, v21 = ipairs(v12);
	while true do
		v19(v20, v21);
		if not v19 then
			break;
		end;
		v21 = v19;
		if l__GamePlayerUtil__9.getGamePlayer(v20):isInGame() == true then
			v18 = v18 + 1;
			v17[v18] = v20;
		end;	
	end;
	table.sort(v17, function(p12, p13)
		if p12.Team ~= p13.Team then
			if p12.Team == l__Players__6.LocalPlayer.Team then
				return true;
			end;
			if p13.Team == l__Players__6.LocalPlayer.Team then
				return false;
			end;
		end;
		return p12.DisplayName < p13.DisplayName;
	end);
	local v22 = v17;
	local v23 = nil;
	local v24, v25, v26 = ipairs(v22);
	while true do
		v24(v25, v26);
		if not v24 then
			break;
		end;
		local v27 = v25.Team;
		if v27 ~= nil then
			v27 = v27.Name;
		end;
		local v28 = l__ClientStore__4:getState().Game.myTeam;
		if v28 ~= nil then
			v28 = v28.name;
		end;
		if v27 == v28 == true then
			v23 = v25;
			break;
		end;	
	end;
	if v23 then
		local v29 = {};
		local v30 = 0;
		local v31, v32, v33 = ipairs(v22);
		while true do
			v31(v32, v33);
			if not v31 then
				break;
			end;
			local v34 = v32.Team;
			if v34 ~= nil then
				v34 = v34.Name;
			end;
			local v35 = l__ClientStore__4:getState().Game.myTeam;
			if v35 ~= nil then
				v35 = v35.name;
			end;
			if v34 == v35 == true then
				v30 = v30 + 1;
				v29[v30] = v32;
			end;		
		end;
		v22 = v29;
	end;
	return v22;
end;
function u1.switchSpectateTargets(p14, p15)
	local v36 = p14:getSpectateTargets();
	local l__spectatingPlayer__37 = l__ClientStore__4:getState().Game.spectatingPlayer;
	if l__spectatingPlayer__37 then
		local v38 = l__OfflinePlayerUtil__5.getPlayer(l__spectatingPlayer__37);
	else
		v38 = nil;
	end;
	local v39 = 0;
	if v38 then
		local v40 = (table.find(v36, v38) and 0) - 1;
		if v40 > -1 then
			if p15 == "next" then
				v39 = v40 + 1;
			else
				v39 = v40 - 1;
			end;
		end;
	end;
	print("spec index:", v39);
	if v39 < 0 then
		v39 = #v36 - 1;
	elseif #v36 <= v39 then
		v39 = 0;
	end;
	local v41 = v36;
	if v41 ~= nil then
		v41 = v41[v39 + 1];
	end;
	if v41 then
		local v42 = l__OfflinePlayerUtil__5.getOfflinePlayer(v41);
	else
		v42 = nil;
	end;
	l__ClientStore__4:dispatch({
		type = "GameSetSpectator", 
		spectating = true, 
		spectatingPlayer = v42
	});
end;
local l__UserInputService__10 = v2.UserInputService;
function u1.hookSpectatedPlayer(p16, p17)
	p16.spectatingPlayerMaid:DoCleaning();
	p16.spectating = true;
	p16.spectatingPlayerMaid:GiveTask(function()
		p16.spectating = false;
	end);
	p16.spectatingPlayerMaid:GiveTask(l__Players__6.PlayerRemoving:Connect(function(p18)
		if p17 == p18 then
			p16.spectatingPlayerMaid:DoCleaning();
			local v43 = p16:getSpectateTargets();
			if v43 ~= nil then
				v43 = v43[1];
			end;
			if v43 then
				local v44 = l__OfflinePlayerUtil__5.getOfflinePlayer(v43);
			else
				v44 = nil;
			end;
			l__ClientStore__4:dispatch({
				type = "GameSetSpectator", 
				spectating = true, 
				spectatingPlayer = v44
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
	local v45 = l__Players__6.LocalPlayer.Character;
	if v45 ~= nil then
		v45 = v45:FindFirstChild("Humanoid");
	end;
	if v45 then
		l__Workspace__8.CurrentCamera.CameraSubject = v45;
	end;
end;
function u1.isSpectating(p23)
	return p23.spectating;
end;
u1 = l__KnitClient__7.CreateController;
u1 = u1(u1.new());
return {
	SpectateController = u1
};
