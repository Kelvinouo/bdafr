-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "BlockCpsController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "BlockCpsController";
	p1.lastPlaceTimestamp = 0;
end;
local l__BlockEngineClientEvents__1 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out.client["block-engine-client-events"]).BlockEngineClientEvents;
local l__SyncEventPriority__2 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).SyncEventPriority;
local l__CpsConstants__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-constants").CpsConstants;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__BlockEngineClientEvents__1.PlaceBlock:setPriority(l__SyncEventPriority__2.HIGHEST):connect(function(p3)
		if p3:isCancelled() then
			return nil;
		end;
		return nil;
	end);
end;
local v5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
