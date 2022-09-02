-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__GreedyBlockHandler__2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).GreedyBlockHandler;
local l__TeamColorHex__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex;
local v4 = {};
local v5 = { l__TeamColorHex__3.orange, l__TeamColorHex__3.purple, l__TeamColorHex__3.lightBlue, l__TeamColorHex__3.yellow, l__TeamColorHex__3.green, l__TeamColorHex__3.pink };
v4[7] = BrickColor.DarkGray().Color;
v4[8] = BrickColor.Gray().Color;
v5[9] = l__TeamColorHex__3.cyan;
v5[10] = l__TeamColorHex__3.purple;
v5[11] = l__TeamColorHex__3.lightBlue;
v4[12] = Color3.fromRGB(139, 69, 19);
v5[13] = l__TeamColorHex__3.green;
v5[14] = l__TeamColorHex__3.red;
v4[15] = Color3.fromRGB(0, 0, 0);
local l__ColorUtil__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
for v6, v7 in pairs(v5) do
	v4[v6] = l__ColorUtil__1.hexColor(v7);
end;
local v8 = setmetatable({}, {
	__tostring = function()
		return "GlassBlockHandler";
	end, 
	__index = l__GreedyBlockHandler__2
});
v8.__index = v8;
function v8.new(...)
	local v9 = setmetatable({}, v8);
	return v9:constructor(...) and v9;
end;
function v8.constructor(p1, ...)
	l__GreedyBlockHandler__2.constructor(p1, ...);
end;
function v8.checkCulling(p2)

end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__BLOCK_SIZE__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
function v8.createNewInstance(p3, p4)
	local v10 = Color3.fromRGB(161, 161, 163);
	if v4[p4] ~= nil then
		v10 = v4[p4];
	end;
	return u2("Part", {
		Name = p3:getBlockType(), 
		Size = Vector3.new(l__BLOCK_SIZE__3, l__BLOCK_SIZE__3, l__BLOCK_SIZE__3), 
		Anchored = true, 
		Material = Enum.Material.Glass, 
		CanCollide = true, 
		Transparency = 0.25, 
		CastShadow = false, 
		Color = v10
	});
end;
return {
	GlassBlockHandler = v8
};
