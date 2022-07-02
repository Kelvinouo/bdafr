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
	for v5, v6 in ipairs((p4:GetDescendants())) do
		local v7 = p3:onAccessoryAdded(v6);
	end;
	p4.DescendantAdded:Connect(function(p5)
		return p3:onAccessoryAdded(p5);
	end);
end;
local l__getItemMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function u1.onAccessoryAdded(p6, p7)
	if not p7:IsA("Accessory") then
		return nil;
	end;
	local v8 = l__getItemMeta__3(p7.Name);
	if not v8 or v8.armor then
		return nil;
	end;
	for v9, v10 in ipairs(p7:GetDescendants()) do
		if v10:IsA("BasePart") then
			table.insert(p6.instances, v10);
		end;
	end;
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	ToolVisibilityController = u2
};
return u1;
