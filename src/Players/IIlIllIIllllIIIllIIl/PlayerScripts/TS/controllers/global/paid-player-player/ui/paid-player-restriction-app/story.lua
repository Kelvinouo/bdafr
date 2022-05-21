-- Script Hash: ca44a3e811d7a8bfab267c7399cf985a4672dae01201c488a2bd97874abfda243fb4a0ad1b0994309c11abd39eaab289
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CreateRoduxApp__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local u2 = v1.import(script, script.Parent, "paid-player-restriction-core").PaidPlayerRestrictionCore;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	local u4 = l__CreateRoduxApp__1("NonPaidPlayerRestrictionApp", u2, {}, {}, {
		Parent = p1
	});
	return function()
		return u3.unmount(u4);
	end;
end;
