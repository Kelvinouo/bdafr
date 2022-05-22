-- Script Hash: cb27be8c627ca0da614badcb0536cab78957f79162631c04d4b894bb1023dd26cfea3e7954d1f1e3dd87eb6846340160
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Workspace__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
local u2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out.client["client-block-engine"]).IClientBlockEngine.new();
v1.Promise.defer(function()
	l__Workspace__1:WaitForChild("BlockHandlersReady");
	u2:startBlockReplication();
end);
return {
	ClientBlockEngine = u2
};
