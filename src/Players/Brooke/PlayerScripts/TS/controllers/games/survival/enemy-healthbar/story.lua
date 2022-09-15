-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__ReplicatedStorage__1 = v2.ReplicatedStorage;
local l__Workspace__2 = v2.Workspace;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__EnemyHealthbar__4 = v1.import(script, script.Parent, "enemy-healthbar").EnemyHealthbar;
return function(p1)
	local v3 = l__ReplicatedStorage__1.Assets.Misc.Penguins.KingPenguin:Clone();
	v3:SetPrimaryPartCFrame(CFrame.new(0, 0, 0));
	v3.Parent = l__Workspace__2;
	local u5 = u3.mount(u3.createElement("BillboardGui", {
		Adornee = v3.PrimaryPart, 
		ExtentsOffsetWorldSpace = Vector3.new(0, 18, 0), 
		Size = UDim2.new(0, 200, 0, 100), 
		MaxDistance = 200
	}, { u3.createElement(l__EnemyHealthbar__4, {
			health = 500, 
			maxHealth = 1000
		}) }), v3.PrimaryPart);
	return function()
		v3:Destroy();
		u3.unmount(u5);
	end;
end;
