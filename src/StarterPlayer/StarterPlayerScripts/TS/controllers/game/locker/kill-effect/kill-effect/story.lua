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
