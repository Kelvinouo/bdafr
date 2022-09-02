-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "JoinQueueInteraction";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
function u1.constructor(p1, ...)
	l__KnitController__3.constructor(p1, ...);
	p1.Name = "JoinQueueInteraction";
end;
local l__Signal__2 = v2.Signal;
local l__KnitClient__3 = v2.KnitClient;
local l__QueueSelectionMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-selection.meta").QueueSelectionMeta;
local l__Flamework__5 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__ClientStore__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__QueueState__7 = v1.import(script, v1.getModule(script, "@easy-games", "lobby").out).QueueState;
function u1.KnitStart(p2)
	local v6 = l__Signal__2.new();
	local v7 = {
		maxActivationDistance = 13, 
		interactionLabel = "Join Queue", 
		instantActivation = true, 
		interactionObjectText = function(p3)
			local v8 = p3:GetAttribute("QueueSelectionMenu");
			if v8 ~= 0 and v8 == v8 and v8 ~= "" and v8 then
				return l__QueueSelectionMeta__4[p3.Name].title;
			end;
			return l__Flamework__5.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(p3.Name).title;
		end, 
		interactionTag = "InteractionJoinQueue"
	};
	function v7.onInteracted(p4)
		if p4:GetAttribute("QueueSelectionMenu") == true then
			p2:openQueueSelectionMenu(p4.Name);
			return;
		end;
		print("Attempting to join queue: " .. p4.Name);
		p2:joinQueue(p4.Name);
	end;
	function v7.shouldMakeInteraction(p5)
		local v9 = p5:GetAttribute("QueueSelectionMenu");
		if v9 ~= 0 and v9 == v9 and v9 ~= "" and v9 then
			return true;
		end;
		local v10 = l__Flamework__5.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(p5.Name);
		if v10.disabled == nil then
			return true;
		end;
		return not v10.disabled;
	end;
	v7.onVisibilityStateChanged = v6;
	l__KnitClient__3.Controllers.InteractionRegistryController:RegisterInteraction(v7);
	l__ClientStore__6.changed:connect(function(p6, p7)
		local l__queueState__11 = p6.Party.queueState;
		if l__queueState__11 == p7.Party.queueState then
			return nil;
		end;
		print("Queue state updated, updating interactions");
		v6:Fire(l__queueState__11 == l__QueueState__7.NONE);
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
u1 = l__KnitClient__3.CreateController;
u1 = u1(u1.new());
return {
	JoinQueueInteraction = u1
};
