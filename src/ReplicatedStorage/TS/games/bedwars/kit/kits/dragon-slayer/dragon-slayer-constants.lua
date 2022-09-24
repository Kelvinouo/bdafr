-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "DragonSlayerConstants";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1)

end;
v1.MAX_STACKS = 3;
v1.STACK_DECAY_SEC = 8;
v1.PUNCH_COOLDOWN_SEC = 10;
v1.PUNCH_SPEED_STUD_PER_SEC = 180;
return {
	DragonSlayerConstants = v1
};
