-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BaseRelicController__2 = v1.import(script, script.Parent.Parent.Parent, "base-relic-controller").BaseRelicController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "KnightsCodeRelicController";
	end, 
	__index = l__BaseRelicController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local l__RelicType__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-type").RelicType;
function v3.constructor(p1)
	l__BaseRelicController__2.constructor(p1, l__RelicType__1.KNIGHTS_CODE);
	p1.Name = "KnightsCodeRelicController";
end;
function v3.KnitStart(p2)
	l__BaseRelicController__2.KnitStart(p2);
end;
local l__ClientSyncEvents__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Flamework__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
function v3.onActivated(p3)
	p3.relicMaid:GiveTask(l__ClientSyncEvents__2.StartEnchantRepair:connect(function(p4)
		if p4:isCancelled() then
			return nil;
		end;
		l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
			message = "You cannot enchant with " .. p3.relicMeta.displayName .. "."
		});
		p4:setCancelled(true);
	end));
end;
function v3.deactivate(p5)

end;
local v5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
