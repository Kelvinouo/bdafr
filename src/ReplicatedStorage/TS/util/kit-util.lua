-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local l__RunService__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).RunService;
local l__KnitServer__2 = v2.KnitServer;
local l__KnitClient__3 = v2.KnitClient;
return {
	getKit = function(p1)
		if l__RunService__1:IsServer() then
			return l__KnitServer__2.Services.KitService:getKit(p1);
		end;
		return l__KnitClient__3.Controllers.KitController:getKit(p1);
	end
};
