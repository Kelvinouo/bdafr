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
local function v6(p1, p2)
	v4[p2] = l__ColorUtil__1.hexColor(p1);
end;
for v7, v8 in pairs(v5) do
	v6(v8, v7, v5);
end;
local v9 = setmetatable({}, {
	__tostring = function()
		return "GlassBlockHandler";
	end, 
	__index = l__GreedyBlockHandler__2
});
v9.__index = v9;
function v9.new(...)
	local v10 = setmetatable({}, v9);
	return v10:constructor(...) and v10;
end;
local u2 = l__GreedyBlockHandler__2;
function v9.constructor(p3, ...)
	u2.constructor(p3, ...);
end;
function v9.checkCulling(p4)

end;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__BLOCK_SIZE__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
function v9.createNewInstance(p5, p6)
	local v11 = Color3.fromRGB(161, 161, 163);
	if v4[p6] ~= nil then
		v11 = v4[p6];
	end;
	return u3("Part", {
		Name = p5:getBlockType(), 
		Size = Vector3.new(l__BLOCK_SIZE__4, l__BLOCK_SIZE__4, l__BLOCK_SIZE__4), 
		Anchored = true, 
		Material = Enum.Material.Glass, 
		CanCollide = true, 
		Transparency = 0.25, 
		CastShadow = false, 
		Color = v11
	});
end;
u2 = {
	GlassBlockHandler = v9
};
return l__GreedyBlockHandler__2;
