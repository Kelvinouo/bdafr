-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Reflect__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Reflect;
local l__t__3 = v1.import(script, v1.getModule(script, "@rbxts", "t").lib.ts).t;
local l__GameComponent__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameComponent;
local l__Component__5 = v1.import(script, v1.getModule(script, "@flamework", "components").out).Component;
local v6 = setmetatable({}, {
	__tostring = function()
		return "MapBoundsComponent";
	end, 
	__index = l__GameComponent__4
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
function v6.constructor(p1, ...)
	l__GameComponent__4.constructor(p1, ...);
end;
function v6.onStart(p2)

end;
function v6.getTag(p3)
	return "map-bounds-component";
end;
l__Reflect__2.defineMetadata(v6, "identifier", "shared/map/map-bounds-component@MapBoundsComponent");
l__Reflect__2.defineMetadata(v6, "flamework:implements", { "$:flamework@OnStart" });
l__Reflect__2.decorate(v6, "$c:init@Component", l__Component__5, { {
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
return {
	MapBoundsComponent = v6
};
