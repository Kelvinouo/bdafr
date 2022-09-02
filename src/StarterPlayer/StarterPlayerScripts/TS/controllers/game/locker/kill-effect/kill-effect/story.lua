-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ServerStorage__2 = v2.ServerStorage;
local l__Workspace__3 = v2.Workspace;
local u4 = v1.import(script, script.Parent, "effects", "pirateshipattack-kill-effect");
return function(p1)
	local v3 = u1.new();
	local v4 = {};
	local v5 = l__ServerStorage__2.Assets.Villagers.barbarian:Clone();
	v5.Name = "KillEffectCharacter";
	v5.Parent = l__Workspace__3;
	local v6 = u4.new(v4):onKill(v4, v5, v5:GetPrimaryPartCFrame());
	v6:GiveTask(v5);
	v3:GiveTask(v6);
	return function()
		v3:DoCleaning();
	end;
end;
