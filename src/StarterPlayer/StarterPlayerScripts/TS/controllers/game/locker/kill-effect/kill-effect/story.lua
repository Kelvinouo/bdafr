-- Script Hash: 4029b7e2d415c827d06935a113cd5e2e66aafa1a92c7feeca0075ea24fc21f8cf3dd4a8b4c86121dcaae002dbc7eca8d
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__RunService__2 = v2.RunService;
local u3 = v1.import(script, script.Parent, "effects", "glitch-kill-effect");
local l__ServerStorage__4 = v2.ServerStorage;
local l__Workspace__5 = v2.Workspace;
return function(p1)
	local v3 = u1.new();
	task.spawn(function()
		l__RunService__2:Run();
	end);
	local u6 = -1;
	v3:GiveTask(l__RunService__2.RenderStepped:Connect(function()
		if os.clock() - u6 > 8 then
			u6 = math.huge;
			local v4 = {};
			local v5 = l__ServerStorage__4.Assets.Villagers.barbarian:Clone();
			v5.Parent = l__Workspace__5;
			local v6 = u3.new(v4):onKill(v4, v5, v5:GetPrimaryPartCFrame());
			v6:GiveTask(v5);
			v3:GiveTask(v6);
		end;
	end));
	v3:GiveTask(function()
		task.spawn(function()
			l__RunService__2:Stop();
		end);
	end);
	return function()
		v3:DoCleaning();
	end;
end;
