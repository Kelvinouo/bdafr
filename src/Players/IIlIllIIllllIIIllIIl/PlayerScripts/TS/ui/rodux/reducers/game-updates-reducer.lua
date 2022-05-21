-- Script Hash: 422c1e7d93b3ee266b47e91fb5693b38d42884d7580e8b61dd862166629f8f222f8d9ec5e0c2ff783ce7599e1c0e49f5
-- Decompiled with the Synapse X Luau decompiler.

local u1 = {
	updates = {}, 
	newestKit = nil
};
return {
	GameUpdatesReducer = function(p1, p2)
		if p1 == nil then
			p1 = u1;
		end;
		local v1 = {};
		for v2, v3 in pairs(p1) do
			v1[v2] = v3;
		end;
		if p2.type == "GameUpdatesSetAll" then
			v1.updates = p2.updates;
			v1.newestKit = p2.newestKit;
			v1.newestKitBG = p2.newestKitBG;
		end;
		return v1;
	end
};
