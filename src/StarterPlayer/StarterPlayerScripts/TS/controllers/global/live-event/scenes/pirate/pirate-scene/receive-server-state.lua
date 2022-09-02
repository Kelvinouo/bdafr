-- Decompiled with the Synapse X Luau decompiler.

local v1 = {
	name = "Receive server state", 
	priority = 100, 
	event = "Heartbeat"
};
local l__default__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v1.init(p1)
	l__default__1.Client:GetNamespace("PirateSceneRemotes"):Get("RequestPirateSceneServerState"):CallServerAsync():andThen(function(p2)
		p1:set("hannahModel", p2.hannah);
		p1:set("smokeModel", p2.smoke);
		p1:set("daveyModel", p2.davey);
	end);
	l__default__1.Client:GetNamespace("PirateSceneRemotes"):OnEvent("PirateSceneServerStateChange", function(p3)
		p1:set("hannahModel", p3.hannah);
		p1:set("smokeModel", p3.smoke);
		p1:set("daveyModel", p3.davey);
	end);
end;
function v1.func(p4, p5, p6)

end;
return {
	ReceiveServerStateBehavior = v1
};
