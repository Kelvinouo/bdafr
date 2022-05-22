-- Script Hash: 6758d05a74de228e81bb4fe63fec75705c18e1a30817d864daca4683abab619101362b6898c3c9a2a559d9bd043a385f
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "AnnouncementEndEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1)

end;
return {
	AnnouncementEndEvent = v1
};
