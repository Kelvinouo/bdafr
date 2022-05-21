-- Script Hash: 6162dc2dd5cb8111af74b26c0976ee123cc8d554bc31b9a40c1bf0c5587fff6cf83104655271381554bff64383aa6469
-- Decompiled with the Synapse X Luau decompiler.

local function u1(p1)
	return function(p2)
		return setmetatable(p1(p2), (getmetatable(p2)));
	end;
end;
return {
	patchKnitClient = function(p3)
		p3.CreateController = u1(p3.CreateController);
	end, 
	patchKnitServer = function(p4)
		p4.CreateService = u1(p4.CreateService);
	end
};
