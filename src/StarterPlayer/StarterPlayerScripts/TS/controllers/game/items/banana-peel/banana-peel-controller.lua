-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "BananaPeelController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "BananaPeelController";
end;
local l__CollectionService__1 = v3.CollectionService;
local l__ReplicatedStorage__2 = v3.ReplicatedStorage;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Zone__4 = v1.import(script, v1.getModule(script, "@rbxts", "zone-plus").src).Zone;
local l__Players__5 = v3.Players;
local l__KnitClient__6 = v2.KnitClient;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__CollectionService__1:GetInstanceAddedSignal("banana_peel"):Connect(v1.async(function(p3)
		local v7 = #l__ReplicatedStorage__2.Assets.Misc.BananaPeel:GetDescendants();
		local u7 = #p3:GetDescendants();
		p3.DescendantAdded:Connect(function()
			u7 = u7 + 1;
		end);
		while u7 < v7 do
			task.wait();		
		end;
		local v8 = u3("Part", {
			Anchored = true, 
			CanCollide = false, 
			CFrame = p3:GetPrimaryPartCFrame(), 
			Transparency = 1, 
			Size = Vector3.new(6, 3, 3), 
			Shape = Enum.PartType.Cylinder, 
			Parent = p3
		});
		local v9 = l__Zone__4.new(v8);
		v9:setAccuracy("Low");
		v9.autoUpdate = false;
		v9.playerEntered:Connect(function(p4)
			if p4 ~= l__Players__5.LocalPlayer then
				return nil;
			end;
			if p4.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Physics then
				l__KnitClient__6.Controllers.TaserController:taseSelf(0.5);
			end;
		end);
		v8.AncestryChanged:Connect(function(p5, p6)
			if p6 == nil then
				v9:destroy();
			end;
		end);
	end));
end;
local v10 = v2.KnitClient.CreateController(v5.new());
return nil;
