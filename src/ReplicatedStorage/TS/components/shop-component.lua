-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Reflect__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Reflect;
local l__t__3 = v1.import(script, v1.getModule(script, "@rbxts", "t").lib.ts).t;
local l__GameComponent__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameComponent;
local l__Component__5 = v1.import(script, v1.getModule(script, "@flamework", "components").out).Component;
local v6 = setmetatable({}, {
	__tostring = function()
		return "ShopComponent";
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
	return "Generator";
end;
l__Reflect__2.defineMetadata(v6, "identifier", "shared/components/shop-component@ShopComponent");
l__Reflect__2.defineMetadata(v6, "flamework:implements", { "$:flamework@OnStart" });
l__Reflect__2.decorate(v6, "$c:init@Component", l__Component__5, { {
		tag = "Generator", 
		defaults = {
			Id = "", 
			BlockPosition = Vector3.new(), 
			TeamShop = false
		}, 
		attributes = {
			Id = l__t__3.string, 
			BlockPosition = l__t__3.Vector3, 
			TeamShop = l__t__3.boolean
		}, 
		instanceGuard = l__t__3.instanceIsA("Part")
	} });
return {
	default = v6
};
