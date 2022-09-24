-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__RunService__2 = v2.RunService;
local l__ServerStorage__3 = v2.ServerStorage;
local l__Workspace__4 = v2.Workspace;
local u5 = v1.import(script, script.Parent, "effects", "butterfly-kill-effect");
return function(p1)
	local v3 = u1.new();
	task.spawn(function()
		l__RunService__2:Run();
	end);
	local v4 = {};
	local v5 = l__ServerStorage__3.Assets.Villagers.barbarian:Clone();
	v5.PrimaryPart.Anchored = true;
	v5.Name = "KillEffectCharacter";
	v5.Parent = l__Workspace__4;
	local v6 = u5.new(v4):onKill(v4, v5, v5:GetPrimaryPartCFrame());
	v6:GiveTask(v5);
	v3:GiveTask(v6);
	v3:GiveTask(function()
		task.spawn(function()
			l__RunService__2:Stop();
		end);
	end);
	return function()
		v3:DoCleaning();
	end;
end;
