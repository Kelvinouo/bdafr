-- Script Hash: b7af983f48992454f4eceab7a0a273a4d64dc522dbf0971d1c113f1427e104b7805f179f34d411f9eff0d8a446d3a868
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local l__KnitClient__3 = v2.KnitClient;
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "JoinQueueInteraction";
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
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "JoinQueueInteraction";
end;
local l__Signal__3 = v2.Signal;
local l__QueueSelectionMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-selection.meta").QueueSelectionMeta;
local l__Flamework__5 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__ClientStore__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__QueueState__7 = v1.import(script, v1.getModule(script, "@easy-games", "lobby").out).QueueState;
function u1.KnitStart(p2)
	local v7 = l__Signal__3.new();
	local v8 = {
		maxActivationDistance = 13, 
		interactionLabel = "Join Queue", 
		instantActivation = true, 
		interactionObjectText = function(p3)
			local v9 = p3:GetAttribute("QueueSelectionMenu");
			if v9 ~= 0 and v9 == v9 and v9 ~= "" and v9 then
				return l__QueueSelectionMeta__4[p3.Name].title;
			end;
			return l__Flamework__5.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(p3.Name).title;
		end, 
		interactionTag = "InteractionJoinQueue"
	};
	function v8.onInteracted(p4)
		local v10 = p4:GetAttribute("QueueSelectionMenu");
		if v10 ~= 0 and v10 == v10 and v10 ~= "" and v10 then
			p2:openQueueSelectionMenu(p4.Name);
			return;
		end;
		print("Attempting to join queue: " .. p4.Name);
		p2:joinQueue(p4.Name);
	end;
	function v8.shouldMakeInteraction(p5)
		local v11 = p5:GetAttribute("QueueSelectionMenu");
		if v11 ~= 0 and v11 == v11 and v11 ~= "" and v11 then
			return true;
		end;
		local v12 = l__Flamework__5.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(p5.Name);
		if v12.disabled == nil then
			return true;
		end;
		return not v12.disabled;
	end;
	v8.onVisibilityStateChanged = v7;
	l__KnitClient__3.Controllers.InteractionRegistryController:RegisterInteraction(v8);
	l__ClientStore__6.changed:connect(function(p6, p7)
		local l__queueState__13 = p6.Party.queueState;
		if l__queueState__13 == p7.Party.queueState then
			return nil;
		end;
		print("Queue state updated, updating interactions");
		v7:Fire(l__queueState__13 == l__QueueState__7.NONE);
	end);
end;
function u1.joinQueue(p8, p9)
	l__Flamework__5.resolveDependency("@easy-games/lobby:client/controllers/lobby-queue-controller@LobbyQueueController"):joinQueue(p9);
end;
local l__BedwarsAppIds__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
function u1.openQueueSelectionMenu(p10, p11)
	l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__8.QUEUE_SELECTION, {
		QueueSelectionType = p11
	});
end;
u2 = l__KnitClient__3.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	JoinQueueInteraction = u2
};
return u1;
