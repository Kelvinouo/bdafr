-- Decompiled with the Synapse X Luau decompiler.

return {
	RemoteHashUtil = {
		prepareHashVector3 = function(p1)
			local v1 = tostring(p1.X) .. "," .. tostring(p1.Y) .. "," .. tostring(p1.Z);
			local u1 = {};
			for v2, v3 in ipairs({ string.byte(v1, 1, #v1) }) do
				table.insert(u1, v3);
			end;
			return u1;
		end
	}
};
