-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "QueueController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
function u1.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "QueueController";
end;
local l__CreateRoduxApp__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__QueueAppWrapper__3 = v1.import(script, script.Parent, "ui", "queue-app").QueueAppWrapper;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__QueueState__5 = v1.import(script, v1.getModule(script, "@easy-games", "lobby").out).QueueState;
local l__SoundManager__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function u1.KnitStart(p2)
	l__CreateRoduxApp__2("queue-status", l__QueueAppWrapper__3, {}, {}, {
		IgnoreGuiInset = true
	});
	l__ClientStore__4.changed:connect(function(p3, p4)
		if p3.Party.queueState ~= p4.Party.queueState and p3.Party.queueState == l__QueueState__5.MATCH_FOUND then
			l__SoundManager__6:playSound(l__GameSound__7.QUEUE_MATCH_FOUND);
		end;
	end);
end;
local l__Players__8 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__Flamework__9 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
function u1.joinQueue(p5, p6)
	if l__ClientStore__4:getState().Party.leader.userId == l__Players__8.LocalPlayer.UserId then
		l__Flamework__9.resolveDependency("@easy-games/lobby:client/controllers/lobby-queue-controller@LobbyQueueController"):joinQueue(p6);
	end;
end;
function u1.leaveQueue(p7)
	l__Flamework__9.resolveDependency("@easy-games/lobby:client/controllers/lobby-queue-controller@LobbyQueueController"):leaveQueue();
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	QueueController = u1
};
