
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "FishermanMinigameEndEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2, p3, p4)
	p1.gameOver = p2;
	p1.win = p3;
	p1.timeElapsed = p4;
end;
return {
	FishermanMinigameEndEvent = v1
};

