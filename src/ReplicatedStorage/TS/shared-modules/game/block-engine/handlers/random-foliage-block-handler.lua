-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__PrefabBlockHandler__2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).PrefabBlockHandler;
local v3 = setmetatable({}, {
	__tostring = function()
		return "RandomFoliageBlockHandler";
	end, 
	__index = l__PrefabBlockHandler__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p1, p2, p3, p4, p5)
	l__PrefabBlockHandler__2.constructor(p1, p2, p3, p4, nil);
	p1.blockOptions = p5;
end;
local l__RandomUtil__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).RandomUtil;
local l__ReplicatedStorage__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ReplicatedStorage;
function v3.createNewInstance(p6, p7)
	local v5 = l__ReplicatedStorage__2.Assets.Blocks:WaitForChild((l__RandomUtil__1.fromList(unpack(p6.blockOptions)))):WaitForChild("Root"):Clone();
	v5.Name = p6:getBlockType();
	return v5;
end;
function v3.place(p8, p9, p10, p11)
	return l__PrefabBlockHandler__2.place(p8, p9, p10, {
		yRot = math.random() * 2 * math.pi
	});
end;
return {
	RandomFoliageBlockHandler = v3
};
