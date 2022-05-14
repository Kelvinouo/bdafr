-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out);
local l__BlockHandler__3 = v2.BlockHandler;
local v4 = setmetatable({}, {
	__tostring = function()
		return "CropBlockHandler";
	end, 
	__index = l__BlockHandler__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__BlockHandler__3;
function v4.constructor(p1, ...)
	u1.constructor(p1, ...);
end;
local l__BlockEngine__2 = v2.BlockEngine;
function v4.place(p2, p3, p4, p5)
	local v6 = p2:createNewInstance(p4);
	v6.CFrame = CFrame.new(l__BlockEngine__2:getWorldPosition(p3));
	return v6;
end;
function v4.destroy(p6, p7)
	p7:Destroy();
end;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__BLOCK_SIZE__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local l__Workspace__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
function v4.createNewInstance(p8, p9)
	local v7 = u3("Part", {
		Name = p8:getBlockType(), 
		Size = Vector3.new(l__BLOCK_SIZE__4, l__BLOCK_SIZE__4, l__BLOCK_SIZE__4), 
		CFrame = CFrame.new(Vector3.new(0, 0, 0)), 
		Transparency = 1, 
		Anchored = true, 
		CanCollide = false
	});
	v7.Parent = l__Workspace__5;
	local v8 = u3("Part", {
		Name = "Soil", 
		Size = Vector3.new(l__BLOCK_SIZE__4, 0.2, l__BLOCK_SIZE__4), 
		CFrame = CFrame.new(Vector3.new(0, -1.45, 0)), 
		Material = Enum.Material.Sand, 
		Color = Color3.fromRGB(85, 63, 48), 
		CastShadow = false, 
		Anchored = false, 
		CanCollide = true
	});
	v8.Parent = v7;
	u3("WeldConstraint", {
		Part0 = v8, 
		Part1 = v7, 
		Parent = v8
	});
	v7.Parent = nil;
	return v7;
end;
u1 = {
	CropBlockHandler = v4
};
return l__BlockHandler__3;
