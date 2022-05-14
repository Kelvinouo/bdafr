-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__GreedyBlockHandler__2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).GreedyBlockHandler;
local v3 = setmetatable({}, {
	__tostring = function()
		return "StonePlayerBlockHandler";
	end, 
	__index = l__GreedyBlockHandler__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__GreedyBlockHandler__2;
function v3.constructor(p1, ...)
	u1.constructor(p1, ...);
end;
function v3.checkCulling(p2)

end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__BLOCK_SIZE__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
function v3.createNewInstance(p3, p4)
	return u2("Part", {
		Name = p3:getBlockType(), 
		Size = Vector3.new(l__BLOCK_SIZE__3, l__BLOCK_SIZE__3, l__BLOCK_SIZE__3), 
		Anchored = true, 
		Material = Enum.Material.Glass, 
		CanCollide = false, 
		Transparency = 1, 
		CastShadow = false, 
		Color = Color3.fromRGB(161, 161, 163)
	});
end;
u1 = {
	StonePlayerBlockHandler = v3
};
return l__GreedyBlockHandler__2;
