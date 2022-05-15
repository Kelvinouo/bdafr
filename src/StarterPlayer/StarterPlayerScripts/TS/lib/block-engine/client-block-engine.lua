
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

