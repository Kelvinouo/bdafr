-- Script Hash: 5638b885c902fe1c57da06db3bd2be9bd96e488209ad8a185feacf9a46385b9ec3cbe9080af554b97a643ad2b664242a
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "MidnightConstants";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1)

end;
v1.MIDNIGHT_DURATION = 12;
return {
	MidnightConstants = v1
};
