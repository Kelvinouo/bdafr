-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "ConnectController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local l__PlaceUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function u1.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "ConnectController";
	if l__PlaceUtil__2.isGameServer() then
		l__default__3.Client:WaitFor("RemoteName"):expect():Connect(function(p2)
			l__ClientStore__4:dispatch({
				type = "GameSetMatchState", 
				matchState = p2.matchState
			});
			if p2.startTime ~= nil then
				l__ClientStore__4:dispatch({
					type = "GameSetStartTime", 
					startTime = p2.startTime
				});
			end;
			if p2.customMatch ~= nil then
				l__ClientStore__4:dispatch({
					type = "SetCustomMatchData", 
					customMatch = p2.customMatch
				});
			end;
		end);
		l__default__3.Client:WaitFor("RemoteName"):expect():Connect(function(p3)
			l__ClientStore__4:dispatch({
				type = "GameSetQueueType", 
				queueType = p3.queueType
			});
		end);
	end;
end;
local l__TeleportService__5 = v2.TeleportService;
local l__RunService__6 = v2.RunService;
local l__getConfig__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config").getConfig;
local l__QueueType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local l__Players__9 = v2.Players;
local l__HttpService__10 = v2.HttpService;
local l__StudioQueueType__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").StudioQueueType;
function u1.KnitStart(p4)
	v1.Promise.retry(v1.async(function()
		return v1.await(l__default__3.Client:WaitFor("RemoteName"));
	end), 50):andThen(function(p5)
		local v6 = l__TeleportService__5:GetLocalPlayerTeleportData();
		if v6 then
			p5:SendToServer(v6);
			return;
		end;
		if (l__RunService__6:IsStudio() or l__getConfig__7("Game")) and l__PlaceUtil__2.isGameServer() then
			if l__getConfig__7("CustomMatch") then
				p5:SendToServer({
					customMatch = {
						selectedMap = "Autumn_to2", 
						queueType = l__QueueType__8.BEDWARS_TO2, 
						hostUserId = l__Players__9.LocalPlayer.UserId, 
						joinCode = "ABCD", 
						accessCode = ""
					}, 
					customMatchHash = "a"
				});
				return;
			end;
			if l__getConfig__7("SimulateLateJoin") and l__Players__9.LocalPlayer.Name == "Player2" then
				wait(5);
			end;
			p5:SendToServer({
				match = {
					matchId = l__HttpService__10:GenerateGUID(false), 
					queueType = l__StudioQueueType__11, 
					teamLeaderUserId = l__Players__9.LocalPlayer.UserId
				}
			});
		end;
	end);
	v1.Promise.retry(v1.async(function()
		return v1.await(l__default__3.Client:WaitFor("RemoteName"));
	end), 50):andThen(function(p6)
		p6:SendToServer();
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	ConnectController = u1
};
