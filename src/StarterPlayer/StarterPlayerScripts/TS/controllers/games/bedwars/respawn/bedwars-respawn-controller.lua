
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__Workspace__3 = v2.Workspace;
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "BedwarsRespawnController";
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
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "BedwarsRespawnController";
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__4 = v2.Players;
local l__GamePlayerUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local l__CurrentCamera__6 = l__Workspace__3.CurrentCamera;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__RespawnTimerWrapper__8 = v1.import(script, script.Parent, "ui", "respawn-timer").RespawnTimerWrapper;
local l__WatchCharacter__9 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
function u1.KnitStart(p2)
	l__default__3.Client:OnEvent("RemoteName", function(p3)
		if p3.entityInstance == l__Players__4.LocalPlayer.Character then
			if l__GamePlayerUtil__5.getGamePlayer(l__Players__4.LocalPlayer):isSpectator() then
				return nil;
			end;
			local v7 = l__Players__4:GetPlayerFromCharacter(p3.fromEntity);
			local v8 = v7;
			if v8 ~= nil then
				v8 = v8.Character;
				if v8 ~= nil then
					v8 = v8:FindFirstChildOfClass("Humanoid");
				end;
			end;
			if v8 then
				l__CurrentCamera__6.CameraSubject = v8;
			else
				local l__RespawnView__9 = l__Workspace__3:FindFirstChild("RespawnView");
				if l__RespawnView__9 then
					l__CurrentCamera__6.CameraSubject = l__RespawnView__9;
				end;
			end;
			p2.respawnTree = u7.mount(u7.createElement(l__RespawnTimerWrapper__8, {
				RespawnDuration = p3.respawnDuration, 
				KilledByPlayer = v7, 
				DamageType = p3.damageType
			}), l__Players__4.LocalPlayer:WaitForChild("PlayerGui"));
		end;
	end);
	l__Players__4.LocalPlayer:GetAttributeChangedSignal("Spectator"):Connect(function()
		if l__GamePlayerUtil__5.getGamePlayer(l__Players__4.LocalPlayer):isSpectator() and p2.respawnTree then
			u7.unmount(p2.respawnTree);
		end;
	end);
	l__WatchCharacter__9(function(p4, p5)
		if p4 == l__Players__4.LocalPlayer and p2.respawnTree then
			u7.unmount(p2.respawnTree);
		end;
	end);
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	BedwarsRespawnController = u2
};
return u1;

