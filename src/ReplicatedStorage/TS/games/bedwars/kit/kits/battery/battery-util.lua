-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "BatteryUtil";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1)

end;
v1.OVERLOAD_DURATION_SEC = 6;
v1.BATTERY_BLUE = Color3.fromRGB(95, 112, 207);
v1.BATTERY_RED = Color3.fromRGB(172, 68, 76);
v1.OVERLOAD_SPEED_MULT = 1.3;
v1.OVERLOAD_DAMAGE_BOOST = 0.2;
v1.BATTERY_SHIELD = 15;
v1.BATTERY_DROP_COOLDOWN_SEC = 1;
v1.BATTERY_ACTIVATION_TIME_SEC = 0.75;
v1.BATTERY_LIFETIME_SEC = 30;
return {
	BatteryUtil = v1
};
