-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "ThemedEventController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "ThemedEventController";
	p1.remotes = l__default__1.Client:GetNamespace("ThemedEvent");
end;
local l__ClientStore__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	p2.remotes:OnEvent("SendThemedEventStats", function(p3)
		l__ClientStore__2:dispatch({
			type = "SetPteCollectables", 
			personalCollectables = p3
		});
	end);
end;
local l__CreateRoduxApp__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__ThemedEventBoardApp__4 = v1.import(script, script.Parent, "ui", "themed-event-board-app").ThemedEventBoardApp;
local l__ThemedEventType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "themed-event", "themed-event-types").ThemedEventType;
function v3.mountEventBoard(p4, p5)
	l__CreateRoduxApp__3("ThemedEventBoardApp", l__ThemedEventBoardApp__4, {
		EventType = l__ThemedEventType__5.EASTER_2022
	}, {}, {
		Parent = p5
	});
end;
local v5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
