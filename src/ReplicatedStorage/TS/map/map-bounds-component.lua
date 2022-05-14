-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__t__2 = v1.import(script, v1.getModule(script, "@rbxts", "t").lib.ts).t;
local l__Reflect__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Reflect;
local l__GameComponent__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameComponent;
local v5 = setmetatable({}, {
	__tostring = function()
		return "MapBoundsComponent";
	end, 
	__index = l__GameComponent__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__GameComponent__4;
function v5.constructor(p1, ...)
	u1.constructor(p1, ...);
end;
function v5.onStart(p2)
	u1.onStart(p2);
end;
function v5.getTag(p3)
	return "map-bounds-component";
end;
u1 = l__Reflect__3.defineMetadata;
u1(v5, "identifier", "shared/map/map-bounds-component@MapBoundsComponent");
u1 = l__Reflect__3.defineMetadata;
u1(v5, "flamework:isExternal", false);
u1 = l__Reflect__3.defineMetadata;
u1(v5, "flamework:implements", { "$:flamework@OnStart" });
u1 = l__Reflect__3.defineMetadata;
u1(v5, "flamework:decorators", { "$c:init@Component" });
u1 = l__Reflect__3.defineMetadata;
u1(v5, "flamework:decorators.$c:init@Component", {
	type = "Component", 
	tag = "map-bounds-component", 
	defaults = {
		minX = 0, 
		maxX = 0, 
		minY = 0, 
		maxY = 0, 
		minZ = 0, 
		maxZ = 0
	}, 
	attributes = {
		minX = l__t__2.number, 
		maxX = l__t__2.number, 
		minY = l__t__2.number, 
		maxY = l__t__2.number, 
		minZ = l__t__2.number, 
		maxZ = l__t__2.number
	}
});
u1 = {
	MapBoundsComponent = v5
};
return l__GameComponent__4;
