-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "ToolVisibilityController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
local u2 = l__KnitController__2;
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "ToolVisibilityController";
	p1.instances = {};
end;
function u1.KnitStart(p2)

end;
function u1.onCharacterAdded(p3, p4)
	p4:WaitForChild("HumanoidRootPart");
	wait(1);
	local v5 = p4:GetDescendants();
	local function v6(p5)
		return p3:onAccessoryAdded(p5);
	end;
	for v7, v8 in ipairs(v5) do
		v6(v8, v7 - 1, v5);
	end;
	p4.DescendantAdded:Connect(function(p6)
		return p3:onAccessoryAdded(p6);
	end);
end;
local l__getItemMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function u1.onAccessoryAdded(p7, p8)
	if not p8:IsA("Accessory") then
		return nil;
	end;
	local v9 = l__getItemMeta__3(p8.Name);
	if not v9 or v9.armor then
		return nil;
	end;
	for v10, v11 in ipairs(p8:GetDescendants()) do
		if v11:IsA("BasePart") then
			table.insert(p7.instances, v11);
		end;
	end;
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	ToolVisibilityController = u2
};
return u1;
