-- Script Hash: 61cd5745e0b100b928f9ee5a3c9cef4eb4ade04246b43a3e8f038651c2cfe3745ebc2d84b8a7bec55a3e62e5280719b0
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "PaintShotgunConstants";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1)

end;
v1.COOLDOWN = 0.55;
return {
	PaintShotgunConstants = v1
};
