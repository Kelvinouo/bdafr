-- Script Hash: bbacdfcb886fe2483f67bea64ead9d3290732d7b47bf7151bafa8a4bd52eb86bdad99e8c2f41e077925b446faa59828e
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "LobbyQueueController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local u2 = l__KnitController__3;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "LobbyQueueController";
end;
local l__CollectionTagAdded__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ClientStore__6 = v1.import(script, script.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__QueueState__7 = v1.import(script, v1.getModule(script, "@easy-games", "lobby").out).QueueState;
local l__Flamework__8 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__KnitClient__9 = v2.KnitClient;
function u1.KnitStart(p2)
	l__CollectionTagAdded__3("lobby-queue-npc", function(p3)
		local v6 = p3:GetAttribute("QueueTitle");
		local v7 = {
			ObjectText = "Join Queue"
		};
		local v8 = v6;
		if v8 == nil then
			v8 = "Missing Title";
		end;
		v7.ActionText = v8;
		v7.MaxActivationDistance = 20;
		v7.KeyboardKeyCode = Enum.KeyCode.F;
		v7.HoldDuration = l__Theme__4.promptHoldDuration;
		v7.RequiresLineOfSight = false;
		v7.Parent = p3;
		local l__Name__10 = p3.Name;
		u5("ProximityPrompt", v7).Triggered:Connect(function(p4)
			if l__ClientStore__6:getState().Party.queueState == l__QueueState__7.NONE then
				l__KnitClient__9.Controllers.QueueController:joinQueue(l__Name__10);
				return;
			end;
			l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
				message = "You are already in another queue. Leave to join " .. tostring(v6) .. "."
			});
			return nil;
		end);
	end);
end;
u2 = v2.KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	LobbyQueueController = u2
};
return u1;
