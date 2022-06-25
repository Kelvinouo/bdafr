-- Script Hash: 46e85b17c37303c746f1e45b43e19490ad8a9068a990fae525822c9c9b0a3c64a4af1ed433da5c5569b8582e09a6c054
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__RunService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).RunService;
return function(p1)
	local v2 = u1.new();
	v2:GiveTask(l__RunService__2.RenderStepped:Connect(function()
		if os.clock() - -1 > 8 then

		end;
	end));
	return function()
		v2:DoCleaning();
	end;
end;
