-- Script Hash: ee8038c7ed69f9545434f403df1840b68c26e28137c8b730d69866420d62f11de0b74f090d979f82013a54b58be3ff00
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
local u2 = l__KnitController__2;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "QueueController";
end;
local l__CreateRoduxApp__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__QueueAppWrapper__4 = v1.import(script, script.Parent, "ui", "queue-app").QueueAppWrapper;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__QueueState__6 = v1.import(script, v1.getModule(script, "@easy-games", "lobby").out).QueueState;
local l__SoundManager__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function u1.KnitStart(p2)
	l__CreateRoduxApp__3("queue-status", l__QueueAppWrapper__4, {}, {}, {
		IgnoreGuiInset = true
	});
	l__ClientStore__5.changed:connect(function(p3, p4)
		if p3.Party.queueState ~= p4.Party.queueState and p3.Party.queueState == l__QueueState__6.MATCH_FOUND then
			l__SoundManager__7:playSound(l__GameSound__8.QUEUE_MATCH_FOUND);
		end;
	end);
end;
local l__Players__9 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__Flamework__10 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
function u1.joinQueue(p5, p6)
	if l__ClientStore__5:getState().Party.leader.userId == l__Players__9.LocalPlayer.UserId then
		l__Flamework__10.resolveDependency("@easy-games/lobby:client/controllers/lobby-queue-controller@LobbyQueueController"):joinQueue(p6);
	end;
end;
function u1.leaveQueue(p7)
	l__Flamework__10.resolveDependency("@easy-games/lobby:client/controllers/lobby-queue-controller@LobbyQueueController"):leaveQueue();
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	QueueController = u2
};
return u1;
