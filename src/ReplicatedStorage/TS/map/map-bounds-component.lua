-- Script Hash: c1ec710ffa4a86148125ff0f38d2f04f8170619ca34954b52e4f06a77b54619f150311a64dcb30ae81cbb873d069fefa
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Reflect__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Reflect;
local l__t__3 = v1.import(script, v1.getModule(script, "@rbxts", "t").lib.ts).t;
local l__Component__4 = v1.import(script, v1.getModule(script, "@flamework", "components").out).Component;
local l__GameComponent__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameComponent;
local v6 = setmetatable({}, {
	__tostring = function()
		return "MapBoundsComponent";
	end, 
	__index = l__GameComponent__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__GameComponent__5;
function v6.constructor(p1, ...)
	u1.constructor(p1, ...);
end;
function v6.onStart(p2)

end;
function v6.getTag(p3)
	return "map-bounds-component";
end;
u1 = l__Reflect__2.defineMetadata;
u1(v6, "identifier", "shared/map/map-bounds-component@MapBoundsComponent");
u1 = l__Reflect__2.defineMetadata;
u1(v6, "flamework:implements", { "$:flamework@OnStart" });
u1 = l__Reflect__2.decorate;
u1(v6, "$c:init@Component", l__Component__4, { {
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
			minX = l__t__3.number, 
			maxX = l__t__3.number, 
			minY = l__t__3.number, 
			maxY = l__t__3.number, 
			minZ = l__t__3.number, 
			maxZ = l__t__3.number
		}
	} });
u1 = {
	MapBoundsComponent = v6
};
return l__GameComponent__5;
