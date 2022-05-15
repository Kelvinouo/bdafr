
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Reflect__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Reflect;
local v3 = setmetatable({}, {
	__tostring = function()
		return "VehicleHitboxStroller";
	end
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p1)

end;
function v3.onStart(p2)

end;
l__Reflect__2.defineMetadata(v3, "identifier", "shared/strollers/vehicle-hitbox-stroller@VehicleHitboxStroller");
l__Reflect__2.defineMetadata(v3, "flamework:isExternal", false);
l__Reflect__2.defineMetadata(v3, "flamework:implements", { "$:flamework@OnStart" });
l__Reflect__2.defineMetadata(v3, "flamework:decorators", { "$:flamework@Service", "$:flamework@Controller" });
l__Reflect__2.defineMetadata(v3, "flamework:decorators.$:flamework@Service", {
	type = "Service"
});
l__Reflect__2.defineMetadata(v3, "flamework:decorators.$:flamework@Controller", {
	type = "Controller"
});
return {
	VehicleHitboxStroller = v3
};

