-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
v3.Lighting:WaitForChild("Atmosphere").Density = 0.3;
if v3.RunService:IsClient() then
	v2("BoolValue", {
		Name = "BlockHandlersReady", 
		Value = true, 
		Parent = v3.Workspace
	});
end;
return true;
