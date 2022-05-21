-- Script Hash: d3ff9eb1db9a868165ca16a59c6b6c22b94a4da8c4c5e5ca81194e815a4109452c93bf0c8adb98550713031fb0599850
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Reflect__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Reflect;
local v3 = v1.import(script, v1.getModule(script, "@flamework", "core").out);
local v4 = setmetatable({}, {
	__tostring = function()
		return "VehicleHitboxStroller";
	end
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1)

end;
function v4.onStart(p2)

end;
l__Reflect__2.defineMetadata(v4, "identifier", "shared/strollers/vehicle-hitbox-stroller@VehicleHitboxStroller");
l__Reflect__2.defineMetadata(v4, "flamework:implements", { "$:flamework@OnStart" });
l__Reflect__2.decorate(v4, "$:flamework@Service", v3.Service, { {} });
l__Reflect__2.decorate(v4, "$:flamework@Controller", v3.Controller, { {} });
return {
	VehicleHitboxStroller = v4
};
