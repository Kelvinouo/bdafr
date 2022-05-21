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
