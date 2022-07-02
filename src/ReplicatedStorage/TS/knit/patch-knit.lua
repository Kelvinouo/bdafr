-- Decompiled with the Synapse X Luau decompiler.

return {
	patchKnitClient = function(p1)
		local l__CreateController__1 = p1.CreateController;
		function p1.CreateController(p2)
			return setmetatable(l__CreateController__1(p2), (getmetatable(p2)));
		end;
	end, 
	patchKnitServer = function(p3)
		local l__CreateService__2 = p3.CreateService;
		function p3.CreateService(p4)
			return setmetatable(l__CreateService__2(p4), (getmetatable(p4)));
		end;
	end
};
