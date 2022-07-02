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
local u1 = l__KnitController__2;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "BlockCpsController";
	p1.lastPlaceTimestamp = 0;
end;
local l__BlockEngineClientEvents__2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out.client["block-engine-client-events"]).BlockEngineClientEvents;
local l__SyncEventPriority__3 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).SyncEventPriority;
local l__CpsConstants__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-constants").CpsConstants;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__BlockEngineClientEvents__2.PlaceBlock:setPriority(l__SyncEventPriority__3.HIGHEST):connect(function(p3)
		if p3:isCancelled() then
			return nil;
		end;
		return nil;
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
